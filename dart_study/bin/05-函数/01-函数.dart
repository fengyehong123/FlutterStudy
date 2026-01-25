// 定义一个函数, 返回2个值
(double, String) givemeSomeDoubles1() {
  return (4.5, 'Hey');
}

// 给返回的值命名
({double point, String greeting}) givemeSomeDoubles2() {
  return (
    point: 4.5,
    greeting: 'Hey'
  );
}

void main() {

  // 通过元素下标来获取值
  final values = givemeSomeDoubles1();
  print(values.$1);  // 4.5
  print(values.$2);  // Hey
  print("----------------------------");

  // 类似于js的解构
  final (point, greeting) = givemeSomeDoubles1();
  print(point);
  print(greeting);
  print("----------------------------");

  // 通过名称来获取返回值
  final result = givemeSomeDoubles2();
  print(result.point);
  print(result.greeting);
}