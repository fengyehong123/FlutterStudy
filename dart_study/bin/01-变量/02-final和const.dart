// 定义一个类
class Point {

  final int x;
  final int y;

  // const 可以用在 const 构造函数
  const Point(this.x, this.y);
}

/*
  final：只能赋值一次（运行时确定）
    写代码的时候, 值还不知道, 运行的时候可以被赋值一次
  const：编译期常量（编译时就确定）
    写代码的时候, 值就已经确定了, 值已经写死了
*/
void main(List<String> args) {

  // 写代码的时候, 就已经知道str1的值了
  const str1 = "你好";
  print(str1);

  String getInfo() => "世界 ${DateTime.now().millisecondsSinceEpoch}";

  // 下面这样是不可以的, 写代码的时候, 还不知道 info 的值
  // const info = getInfo();

  // 代码运行之后, getInfo函数会把值赋给 info , 然后 info 的值就不可以修改了
  final info = getInfo();
  print(info);

  // 这样是可以的
  final time = DateTime.now();
  print(time);

  // 这样是不可以的
  // const time = DateTime.now();

  // const 会复用对象, const 对象存在 常量池，省内存 + 性能更好
  // 因此 a 和 b 是相等的
  const a = [1, 2];
  const b = [1, 2];
  print(identical(a, b));  // true

  final c = [1, 2];
  final d = [1, 2];
  print(identical(c, d));  // false

  const p1 = Point(1, 2);
  const p2 = Point(1, 2);
  print(identical(p1, p2));  // true
  
  // final 限制的是“变量本身”
  final list1 = [1, 2];
  list1.add(3);
  print(list1);  // [1, 2, 3]

  // const 限制的是“变量 + 对象内容”
  const list2 = [1, 2];
  try {
    list2.add(3);
  } catch (e) {
    // 下面的这样代码会执行
    print("报错了, 无法向const修饰的list插入数据");
  }
}