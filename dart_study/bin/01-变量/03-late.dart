/*
  被 late 修饰的变量
    现在不赋值
    将来会赋值
    用之前如果没赋值的话, 会直接报错
    
  ⚠️ 注意：
    late 不是默认值，而是延迟初始化
*/
void main(List<String> args) {
  // 创建一个类对象
  var c1 = Color(10, 20, 30);
  print(c1.count); // 60

  // 避免无意义的提前计算
  late String data = heavyCompute();
  print('此时data还没有计算');
  // 直到我们使用了data变量的时候, 才开始计算
  print(data);
}

class Color {
  final int r, g, b;
  // 一般来说被final修饰的属性必须赋值, 否则会报错
  // 但是我们可以使用late来延迟初始化
  late final int count;

  Color(this.r, this.g, this.b) {
    count = r + g + b;
  }
}

String heavyCompute() {
  print('计算中...');
  return '结果';
}
