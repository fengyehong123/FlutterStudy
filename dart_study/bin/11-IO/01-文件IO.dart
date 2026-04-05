import 'dart:io';

void main(List<String> args) {
  method1();
}

void method1() async {
  // 🔷创建一个文件对象 → 该文件对象只是一个文件句柄, 并不会立刻读写
  File file = File('test.txt');

  // 🔷判断文件是否存在
  if (await file.exists()) {
    print('文件已经存在');
    return;
  }

  // 🔷通过异步写入文件
  await file.writeAsString('Hello Dart\n');
  // 🔷追加写入
  await file.writeAsString('追加内容\n', mode: FileMode.append);
  print('文件写入完成');
  // 睡眠1秒
  await Future.delayed(Duration(seconds: 1));

  File fileRead = File('test.txt');

  // 🔷直接读取为文本
  var content1 = await fileRead.readAsString();
  print(content1);

  // 🔷按行读取
  var lines = await fileRead.readAsLines();
  lines.forEach(print);

  // 🔷读取为字节
  var bytes = await fileRead.readAsBytes();
  print(
    bytes,
  ); // [72, 101, 108, 108, 111, 32, 68, 97, 114, 116, 10, 232, 191, 189, 229, 138, 160, 229, 134, 133, 229, 174, 185, 10]

  print('文件读取完成');
  await Future.delayed(Duration(seconds: 1));

  // 🔷文件删除
  await file.delete();
  print('文件删除完成');
}
