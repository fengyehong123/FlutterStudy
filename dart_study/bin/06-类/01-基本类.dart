void main(List<String> args) {
  method1();
  method2();
}

// 定义一个类
class Person {
  // 普通成员变量
  final String name;
  final int age;
  // 🔷私有成员, Dart 没有 private / protected / public 关键字
  //    私有成员只在 同一个文件（library） 中可见
  double _money = 0;
  // 🔷相当于计算属性
  String get nameInfo => "我的名字是$name";
  // 🔷静态成员变量
  static const address = '地球';

  // 🔷构造方法
  Person(this.name, this.age);

  // 🔷获取私有成员变量
  double get money => _money;
  // 🔷设置私有成员变量
  void setMoney(double money) {
    _money += money;
  }

  // 🔷有参数没有返回值
  void sayHello(String msg) {
    print('Hello, I am $name, $age years old, 我想说的话是:$msg');
  }

  // 🔷有参数有返回值
  String getInfo(String msg) {
    return "返回值为:$msg";
  }

  // 🔷静态方法
  static String getAddress() {
    return "地址:地球";
  }
}

void method1() {
  var person = Person('张三', 100);
  print(person.name); // 张三
  print(person.age); // 100
  print(person.nameInfo); // 我的名字是张三
  print(Person.address); // 地球

  // 设置私有属性值
  person.setMoney(1000);
  // 获取私有属性值
  print(person._money); // 1000.0
  print(person.money); // 1000.0

  // 调用方法
  person.sayHello("你好"); // Hello, I am 张三, 100 years old, 我想说的话是:你好
  print(person.getInfo("世界")); // 返回值为:世界
  print(Person.getAddress()); // 地址:地球
}

class Color1 {
  final int r, g, b;
  final int count;

  // 构造函数, 在初始化类的时候, 给count属性赋值
  // 因为使用了const, 所以无法在这种构造函数中写表达式
  const Color1(this.r, this.g, this.b) : count = r + g + 209;
}

class Color2 {
  final int r, g, b;
  // 使用final作用的字段必须要初始化, 否则编译错误
  // 但是使用了 late 关键字之后, 就可以延迟初始化
  late final int count;

  // 使用普通的构造函数
  Color2(this.r, this.g, this.b) {
    // 通过构造函数给这个属性赋值
    count = r + g + b;
  }
}

class Color3 {
  int? r, g, b;
}

void method2() {
  // 创建2个类对象
  const c1 = Color1(255, 0, 0);
  const c2 = Color1(255, 0, 0);

  // Flutter 中使用 const，减少 rebuild
  print(identical(c1, c2)); // true
  print(c1.count); // 464

  var cx = Color2(255, 3, 2);
  print(cx.count);  // 260

  var c3 = Color3()
    ..b = 10
    ..g = 20
    ..r = 30;
  print(c3.b); // 10
}
