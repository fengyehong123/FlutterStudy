void main() {
  // 🔷通过元素下标来获取值
  final values = givemeSomeDoubles1();
  print(values.$1); // 4.5
  print(values.$2); // Hey
  print("----------------------------");

  // 🔷通过位置进行解构
  final (value1, value2) = givemeSomeDoubles1();
  print(value1); // 4.5
  print(value2); // Hey
  print("----------------------------");

  // 🔷通过名称来获取返回值
  final result = givemeSomeDoubles2();
  print(result.point); // 4.5
  print(result.greeting); // Hey
  print("----------------------------");

  // 🔷通过名称进行解构, 位置无所谓
  final (:greeting, :point) = givemeSomeDoubles2();
  print(greeting); // Hey
  print(point); // 4.5
}

/*
  在 Dart 3 之前：
    🙄一个函数 只能 return 一个值
  如果想返回多个值，只能：
    1. 定义一个 class
    2. 用 Map
    3. 用 List（不安全）
  
  👍Dart3开始支持了Record
    Record（记录）→ 一个【轻量级、不可变、强类型】的数据组合
*/

// 定义一个函数, 返回2个值
(double, String) givemeSomeDoubles1() {
  // 返回一个 Record
  // 第 1 个元素是 double
  // 第 2 个元素是 String
  // 顺序非常重要
  return (4.5, 'Hey');
}

// ⭐使用命名 Record , 给Record命名, 顺序不重要, 名称才重要
// ✅更加推荐使用这种写法
({double point, String greeting}) givemeSomeDoubles2() {
  return (point: 4.5, greeting: 'Hey');
}
