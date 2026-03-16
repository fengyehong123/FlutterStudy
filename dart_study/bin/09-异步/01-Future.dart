import 'dart:io';

void main(List<String> args) {
  // method1();
  // method2();
  // method3();
  // method4();
  // method5();
  method6();
}

void method1() {
  print('阻塞开始');

  // 🙄阻塞3秒钟, 整个程序卡3秒, UI / 事件全部停住(Flutter 里这是大忌)
  sleep(Duration(seconds: 3));
  print('阻塞结束');
}

/*
  🔷Future<T> = 将来某一刻会得到一个 T
      Future<int> → 将来得到一个 int
      Future<void> → 将来完成，但没有返回值
*/
void method2() async {
  // 定义一个耗时函数, 2秒之后获取到数据
  Future<String> fetchData() {
    // 🔷Future.delayed() 延时
    return Future.delayed(Duration(seconds: 2), () => '数据来了');
  }

  // 获取数据, 但如果2秒之后执行的操作还需要耗时的话
  // 不断使用then就会陷入回调地狱的情况
  fetchData().then((value) {
    print(value);
  });

  print('==============================');
  // async + await 解决回调地狱问题
  var data = await fetchData();
  print(data);
}

void method3() async {
  // 🔷只关心完成, 并不关心返回值
  Future<void> saveData() async {
    // 耗时1秒的任务
    await Future.delayed(Duration(seconds: 1));
    print('保存完成');
  }

  await saveData();
}

void method4() async {
  // 定义3个耗时任务
  Future<void> task1() async {
    await Future.delayed(Duration(seconds: 1));
    print('task1完成');
  }

  Future<void> task2() async {
    await Future.delayed(Duration(seconds: 2));
    print('task2完成');
  }

  Future<void> task3() async {
    await Future.delayed(Duration(seconds: 3));
    print('task3完成');
  }

  // 🔷Future.wait() 并发执行3个耗时任务, 全部完成之后再继续
  await Future.wait([task1(), task2(), task3()]);
  print('task1 到 task3的任务全部完成...');
}

void method5() {
  print('1');

  Future(() => print('2'));
  Future.microtask(() => print('3'));

  print('4');
  /*
    打印顺序依次为
      1
      4
      3
      2
    microtask 永远比 Future 先执行
  */
}

void method6() async {
  Future<int> getNumber() {
    if (3 > 2) {
      return Future.delayed(Duration(seconds: 2), () => 100);
    }
    // 当返回值可能需要耗时也可能不需要耗时的时候, Future.value() 会排上用场
    return Future.value(42);
  }

  var num = await getNumber();
  print(num);
}
