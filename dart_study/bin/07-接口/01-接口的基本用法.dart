/*
  🔷Dart 没有 interface 关键字，class 天生就是接口

  ⚠️接口方法的强制规则 
    implements = 100% 实现

  💥implements了接口之后就必须：
    1. 实现接口里的所有方法
    2. 实现 所有 getter / setter
    3. 即使接口里有默认实现，也要重写 ❗
*/
void main(List<String> args) {
  method1();
  method2();
}

// 🔷定义一个抽象类
abstract class Animal1 {
  // 接口属性（getter）
  int get age;
  // 接口方法（抽象）
  void speak();
}

abstract class Animal2 {
  // 接口方法（抽象）
  void eat() {
    print('Animal吃饭');
  }
}

// 定义Dog类实现了 Animal1 和 Animal2 接口
class Dog implements Animal1, Animal2 {
  @override
  int get age => 3;

  @override
  void speak() {
    print('汪汪');
  }

  // 即使接口中有默认方法实现, 也需要重写
  // 不重写的话, 不会报错, 但是编译器会有警告
  @override
  void eat() {
    print('Dog吃饭');
  }
}

void method1() {
  final dog = Dog();
  dog.speak();
  dog.eat();
}

// 定义一个图形的接口
abstract class Shape {
  double area();
}

// 定义一个圆形类实现图形接口
class Circle implements Shape {
  final double r;
  Circle(this.r);

  @override
  double area() => 3.14 * r * r;
}

// 定义一个长方形实现图形接口
class Rectangle implements Shape {
  final double w, h;
  Rectangle(this.w, this.h);

  @override
  double area() => w * h;
}

// 定义一个打印图形的面积的方法
void printArea(Shape shape) {
  print(shape.area());
}

void method2() {
  // 在这里就用到了多态
  List<Shape> shapeList = [Circle(3), Rectangle(3, 4)];
  shapeList.forEach(printArea);
  // 28.259999999999998
  // 12.0
}
