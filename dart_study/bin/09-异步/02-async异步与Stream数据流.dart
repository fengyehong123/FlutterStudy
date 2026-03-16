/*
  用到异步数据流的场景
    1. 倒计时 / 定时器
    2. WebSocket
    3. 文件监听
    4. 用户输入
    5. 数据持续变化
*/
import 'dart:async';

void main(List<String> args) {
  // method1();
  method2();
}

void method1() async {
  // 定义一个生成stream流的函数
  Stream<int> createStream() async* {
    for (int i = 1; i <= 3; i++) {
      await Future.delayed(Duration(seconds: 1));
      // Future(只能 return 一次)
      // 但是 Stream 可以 yield 多次
      // 每一个yield向 Stream 里 推送一条数据
      yield i;
    }
  }

  // 监听异步数据流, 监听到就打印
  Stream<int> streamResponse = createStream();
  streamResponse.listen(
    // 获取到数据时
    (value) {
      print(value);
    },
    // 发生错误时
    onError: (e) => print(e),
    // 任务结束时
    onDone: () => print('结束'),
  );

  // 更加推荐下面这种同步代码的风格
  await for (var value in createStream()) {
    // 每秒生成一个stream流, 然后就打印在此处
    print(value);
  }
}

void method2() async {
  // 创建Stream流的控制对象
  final controller = StreamController<int>();
  // 手动推送数据
  controller.add(1);
  controller.add(2);
  controller.addError('出错');
  controller.close();

  // 打印异步数据流
  await for (var value in controller.stream) {
    print(value);
  }
}
