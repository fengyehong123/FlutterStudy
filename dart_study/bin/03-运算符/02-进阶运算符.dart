void main(List<String> args) {
  method1();
  method2();
}

// 根据num来获取用户信息的map, 由于可能获取不到值, 所以结果可能为null
String? getInfo(int num) {
  // 定义一个Map
  var infoMap = {110: '张三', 120: '李四'};
  return infoMap[num];
}

void method1() {
  // 🔷表示返回值有可能为null
  String? info1 = getInfo(10);
  // 🔷当空的时候才赋值
  info1 ??= "默认值1";
  print(info1); // 默认值1

  // 当空的时候才赋值
  String info2 = getInfo(10) ?? "默认值2";
  print(info2); // 默认值2

  String? info3 = getInfo(10);
  // 🔷?. 空安全访问
  print(info3?.length);

  String? info4 = getInfo(110);
  // 🔷此处的 ! 表示非空断言, 如果info4真的为null的情况下, 程序会崩溃
  print(info4!.length);
}

// 定义一个类
class User {
  String? name;
  int? age;
  int? tel;

  void sayHi() {
    print("你好, 我的名字叫$name, 我今年$age岁了, 我的电话号码是: ${tel ?? 110120}");
  }
}

void method2() {
  var age = 18;
  // 🔷三目运算符
  var result = age >= 18 ? "成年" : "未成年";
  print(result);

  // 🔷级联运算符 ⭐Dart 特有
  var sb = StringBuffer()
    ..write("Hello")
    ..write(" ")
    ..write("World");
  print(sb.toString());

  // 实例化一个对象并且添加属性并且调用方法
  var user = User()
    ..name = "张三"
    ..age = 18
    ..sayHi(); // 你好, 我的名字叫张三,我今年18岁了, 我的电话号码是: 110120
  print(user.name); // 张三
}
