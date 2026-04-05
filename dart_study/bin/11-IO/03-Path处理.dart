import 'package:path/path.dart' as p;

void main(List<String> args) {
  method1();
}

void method1() {
  // 路径拼接
  String path = p.join('data', 'logs', 'a.txt');
  print(path); // data\logs\a.txt

  // 从路径中获取带后缀的文件名
  print(p.basename(path)); // a.txt

  // 获取不带后缀的文件名
  print(p.basenameWithoutExtension(path)); // a

  // 去除扩展名
  print(p.withoutExtension(path)); // data\logs\a

  // 获取扩展名
  print(p.extension(path)); // .txt

  // 获取文件夹路径
  print(p.dirname(path)); // data\logs

  // 判断是否是绝对路径
  print(p.isAbsolute(path)); // false
  print(p.isAbsolute('c:\\a.txt')); // true

  // 获取分隔符
  print(p.separator);
}
