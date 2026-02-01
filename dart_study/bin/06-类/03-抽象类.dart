void main(List<String> args) {
  // 这里使用了多态
  Shape circle = Circle(10);
  printArea(circle); // 314.0

  Shape rectangle = Rectangle(10, 20);
  printArea(rectangle); // 200.0

  // 创建一个数组
  List<Shape> shapeList = [Circle(10), Rectangle(10, 20)];
  for (Shape shape in shapeList) {
    print(shape.area);
  }
}

/*
  🔷定义一个抽象类
    1. 不能 new Shape()
    2. 可以有抽象方法
    3. 可以有普通方法
*/
abstract class Shape {
  double get area;

  // 父类的方法
  String getInfo1() {
    return '你好';
  }

  String getInfo2() {
    return '你好';
  }
}

// 定义一个类实现抽象类
// 圆形
class Circle extends Shape {
  final double r;

  Circle(this.r);

  // 子类重写父类的属性
  // 三角形有自己的面积计算方法
  @override
  double get area => 3.14 * r * r;

  // 子类重写父类的方法
  @override
  String getInfo2() {
    return '子类, getInfo2()';
  }
}

// 长方形
class Rectangle extends Shape {
  final double w, h;
  Rectangle(this.w, this.h);

  // 长方形有自己的面积计算方法
  @override
  double get area => w * h;
}

// 打印图形的面积
void printArea(Shape shape) {
  print(shape.area);
}
