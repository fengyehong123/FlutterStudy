void main(List<String> args) {
  method1();
  method2();
  method3();
}

void method1() {
  var a = 10;
  var b = 3;

  print(a + b); // 13
  print(a - b); // 7
  print(a * b); // 30

  // ⚠️ 一定是 double
  print(a / b); // 3.333...
  // 整除（向下取整）
  print(a ~/ b); // 3
  // 获取余数
  print(a % b); // 1

  var x = 5;
  // 先用再加
  print(x++); // 5
  print(x); // 6
  // 先加再用
  print(++x); // 7
}

void method2() {
  // 比较运算符
  print(3 == 3); // true
  print(3 != 4); // true
  print(5 > 3); // true
  print(5 >= 5); // true
  print(2 < 1); // false

  // ⚠️ Dart 中没有 === , identical() 可用于比较是否是同一个对象
  print(identical(1, 1));
}

void method3() {
  bool a = true;
  bool b = false;

  // 逻辑运算符
  print(a && b); // false
  // ignore: dead_code
  print(a || b); // true
  print(!a); // false
}
