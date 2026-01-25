import 'dart:math';

/*
  在 Dart 里，所有数字类型都继承自 num
  Object
  └── num
      ├── int
      └── double
      └── BigInt   ← 注意：不是 int 的子类

  ⚠️ Dart 没有 float / long / short 这些类型。
  | 类型    说明
  | num     抽象父类（int + double 的父类）
  | int     整数
  | double  浮点数（小数）
*/
void main(List<String> args) {

  // 小整数, 用int
  int a = 10;
  int b = -3;
  int c = 0;
  print(a);
  print(b);
  print(c);

  // 超大整数, 使用BigInt
  BigInt bigNum1 = BigInt.parse('999999999999999999999999');
  print(bigNum1);

  // 小整数如果要和大整数计算的话, 需要先转换为大整数
  BigInt bigNum2 = BigInt.from(2);
  print(bigNum1 + bigNum2);  // 1000000000000000000000001

  // 定义两个浮点数
  double x = 3.14;
  double y = 1.0;
  // 浮点数不精确（和 Java / JS 一样）
  print(x + y);  // 4.140000000000001

  method1();
  method2();
  method3();
  method4();
}

// 1️⃣ 判断类型
void method1() {

  // 定义一个 num类型的变量(int 和 double的父类)
  num x = 10;

  // 判断变量的类型
  if (x is int) {
    print('int');  // int
  } else if (x is double) {
    print('double');
  }
}

// 2️⃣ 类型转换
void method2() {

  // int 转换为 double 类型
  int a = 10;
  double b = a.toDouble();
  print(b);  // 10.0

  // double 转换为 int 类型, 会直接去除小数部分
  double c = 3.7;
  int d = c.toInt();
  print(d);  // 3
}

// 3️⃣ 字符串 ↔ 数字
void method3() {

  // 字符串转int
  print(int.parse('123'));  // 123
  // 安全写法（避免异常）
  print(int.tryParse('abc'));  // null

  // 字符串转double
  print(double.parse('3.14'));  // 3.14
  // 安全写法（避免异常）
  print(double.tryParse('3.14'));  // 3.14

  // 数字转换为字符串
  print(42.toString() == '42');  // true
  print(123.456.toString() == '123.456');  // true
  print(123.456.toStringAsFixed(2) == '123.46');  // true
}

// 4️⃣随机数
void method4() {

  // 随机数对象
  final random = Random();

  // 打印0到9之间的随机数
  print(random.nextInt(10));
  // 0.0 ~ 1.0 之间的随机数
  print(random.nextDouble());

  // 返回两个数的最大值和最小值
  print(max(10, 20));  // 20
  print(min(10, 20));  // 10
}