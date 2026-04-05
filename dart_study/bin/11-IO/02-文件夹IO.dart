import 'dart:io';

void main(List<String> args) {
  method1();
}

void method1() async {
  // 创建一个文件夹对象
  Directory dir = Directory('logs');

  // 判断文件夹对象是否存在
  if (await dir.exists()) {
    print("文件夹已经存在...");
    return;
  }

  // 创建文件夹(递归创建)
  await dir.create(recursive: true);
  print('文件夹创建完毕');

  // 睡眠1秒
  await Future.delayed(Duration(seconds: 1));

  // 删除文件夹
  await dir.delete();
  print('文件夹删除完毕...');

  // 创建文件夹对象
  var currentDir = Directory(r'.\dart_study\bin\01-变量');
  if (!await currentDir.exists()) {
    print("指定的文件夹并不存在...");
    return;
  }

  // 文件夹遍历
  await for (FileSystemEntity entity in currentDir.list()) {
    // 若是文件的话
    if (entity is File) {
      print('文件名称为:${entity.path}');
    }
  }

  // 获取当前文件夹
  final dir1 = Directory.current;
  print(dir1.path); // E:\My_Project\FlutterStudy
}
