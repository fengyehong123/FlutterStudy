// 在Dart2时代, 必须使用 class 或者 map
class Pair {
  late int x;
  late int y;
}

// dart3 增加了 Records → 结构化数据，无需 class
var point1 = (x: 10, y: 20);

void main() {
  print(point1.x);
  print(point1.y);
}
