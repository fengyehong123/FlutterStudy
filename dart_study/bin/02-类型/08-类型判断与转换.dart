/*
  关键字        用途
  is           判断“是不是某个类型”
  is!          判断“不是某个类型”
  as           强制类型转换
  runtimeType  查看运行时真实类型
*/
void main(List<String> args) {
  method1();
  method2();
  method3();
}

// 1️⃣类型转换
void method1() {
  var x = 10;

  // 🔷使用 is 来判断类型
  // ignore: unnecessary_type_check
  if (x is int) {
    print('x 是 int');
  }

  // is! 用做反向判断
  if (x is! String) {
    print('x 并不是 String 类型');
  }

  // 🔷类型提升, 编译器会为我们自动转换类型
  Object obj = '你好';
  if (obj is String) {
    // 这里 obj 自动变成 String
    print(obj.length); // 2
  }

  if (obj is String) {
    // 自动转换类型
    String str = obj;
    print(str); // 你好
  }
}

// ⚠️重点：Object? / dynamic 的类型判断差异
void method2() {
  // 创建一个动态类型
  dynamic x = 'hi';
  // 编译通过
  print(x.length);

  // 创建一个Object类型的数据
  Object? y = 'hi';
  // 编译期就会报错
  // print(y.length);
  if (y is String) {
    print(y.length);
  }
}

// 3️⃣空判断处理
void method3() {
  // 根据num来获取用户信息的map, 由于可能获取不到值, 所以结果可能为null
  String? getInfo(int num) {
    // 定义一个Map
    var infoMap = {110: '张三', 120: '李四'};
    return infoMap[num];
  }

  String? info = getInfo(10);
  // Dart3 空安全下的类型判断
  // 📌 is 会同时判断：
  //     类型
  //     非 null
  if (info is String) {
    // 这里的 info 一定不为 null
    print(info);
  } else {
    print('结果为null');
  }
}
