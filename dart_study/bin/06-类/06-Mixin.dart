/*
  🔷Mixin 是什么？
    1. Mixin = 把一组“能力 / 行为【按需】混入到类里
    2. Dart 只能单继承，但我想复用多份行为代码

  🔷Mixin模式的使用场景
    1. 一个功能被多个无关类使用
    2. 不想引入复杂继承
    3. 功能是【能力型】【横切关注点】
*/
void main(List<String> args) {
  method1();
  method2();
  method3();
  method4();
}

// 🔷定义一个基础的mixin
mixin Flyable {
  void fly() {
    print('飞翔的能力');
  }
}

// 再定义一个mixin
mixin Swimmable {
  void swim() => print('游泳的能力');
}

/*
  🔷定义一个类, 使用 mixin, mixin是可以混入多个的
    Bird 不是继承 Flyable
    而是 把 Flyable 的方法【拷贝进来】
*/
class Bird with Flyable, Swimmable {
  void eat() {
    print('鸟吃东西...');
  }
}

void method1() {
  final bird = Bird();
  bird.fly(); // 飞翔的能力
  bird.swim(); // 游泳的能力
  bird.eat(); // 鸟吃东西...
}

// 打印日志的能力
mixin Logger {
  void log(String msg) {
    print('[LOG] $msg');
  }
}

// 发送邮件的能力
mixin SendMail {
  void sendMail(String mail) {
    print('[Send Mail] $mail');
  }
}

// 🔷给 UserService 类增强能力
class UserService with Logger, SendMail {
  void login() {
    log('用户登录');
    sendMail('1355XX@163.com');
  }
}

void method2() {
  final userService = UserService();
  userService.login();
}

// 检查是否是管理员
mixin AdminCheck {
  bool get isAdmin;

  void checkAdmin() {
    if (!isAdmin) {
      throw Exception('无权限');
    }
    print('是管理员');
  }
}

class User with AdminCheck {
  @override
  bool isAdmin;

  User(this.isAdmin);
}

void method3() {
  final user = User(true);
  user.checkAdmin(); // 是管理员
}

// 定义一个普通的类
class Animal {
  int age = 100;
}

// 🔷给minxin加约束, 要求使用mixin的类必须要继承 Animal 类
mixin AgePrinter on Animal {
  void printAge() {
    print('age = $age');
  }
}

// 没有继承Animal类, 直接使用 AgePrinter 的mixin的话是会报错的
// class Cat with AgePrinter {}

class Dog extends Animal with AgePrinter {
  void printDogInfo() {
    print('Dog的printDogInfo方法启动了...');
  }
}

void method4() {
  final dog = Dog();
  dog.printAge(); // age = 100
  dog.printDogInfo(); // Dog的printDogInfo方法启动了...
}
