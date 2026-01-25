void main(List<String> args) {
  
  // 🔷推荐使用 var 来声明变量
  // name1 的类型会被推断为String
  var name1 = '张三';
  print(name1);

  // 如果对象不限定为单个类型，可以指定为 对象类型 或 动态类型
  dynamic name2 = 'Bob';
  name2 = 110;
  print(name2);

  // 显示声明类型
  String name3 = '李四';
  print(name3);

  // 默认值
  // 未初始化的变量默认值是 null。即使变量是数字 类型默认值也是 null，因为在 Dart 中一切都是对象，数字类型 也不例外。
}