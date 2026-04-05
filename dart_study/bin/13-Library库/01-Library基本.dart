/*
  🔷Dart 中没有像 Java / Python 那样的 module 概念，统一叫：library（库）
    一个 Dart 文件，本身就是一个库【library】
  
  1. 以下划线 _ 开头的，都是私有的（库级别）
  2. 非下划线开头的，就是共有的

  ➡导入的方式
    1. dart:xxx
      官方内置库
    2. package:xxx/xxx.dart
      第三方库, 项目内部库
    3. ./a.dart / ../a.dart
      本地文件（不推荐）
*/
import 'package:dart_study/01-lib_test.dart';
// 🔷如果不同库之前存在同名函数的话, 可以使用 as 取别名
import '00-Librart.dart' as other;
// 🔷可以导入需要的函数
import 'package:dart_study/02-lib_test.dart' show testMethod1, testMethod2;
// 🔷可以排除不需要的函数
import 'package:dart_study/03-lib_test.dart' hide testMethod4, testMethod5;

void main(List<String> args) {
  var msg = '我是一个消息';
  sendMessage(msg); // Hello, 你好我是一个消息
  other.sendMessage(msg); // 哈哈哈, 我是一个消息

  testMethod1();
  testMethod2();
  testMethod6();
}
