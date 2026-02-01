void main(List<String> args) {
  var dog = Dog();
  dog.eat();
}

// 定义一个动物类
class Animal1 {
  void eat() {
    print('Animal的eat方法');
  }

  void sleep() {
    print('Animal的sleep方法');
  }
}

// 定义一个Dog类继承Animal类
// 🔷Dart只支持单继承
class Dog extends Animal1 {
  // 子类重写父类的eat方法
  @override
  void eat() {
    // 子类调用父类中的方法
    super.eat();
    print('狗吃骨头...');
  }

  // 子类自己的方法
  void bark() {
    print('犬吠...');
  }
}

class Animal2 {
  final String name;
  // 父类的构造函数
  Animal2(this.name);
}

class Pig extends Animal2 {
  // 子类构造函数 必须先调用父类构造函数
  // 下面这种写法是老式写法
  // ignore: use_super_parameters
  Pig(String name) : super(name);
}

class Cat extends Animal2 {
  // 🔷从 Dart 2.17+ 支持的简单写法
  Cat(super.name);
}
