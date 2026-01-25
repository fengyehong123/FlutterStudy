void main() {

  // 写类型的方式
  List<int> list1 = [1, 2, 3];
  // dart会自动推导类型, 不必非要写
  var list2 = [1, 2, 3];
  print(list1);  // [1, 2, 3]
  print(list2);  // [1, 2, 3]

  Map<String, int> map1 = {
    'a': 1,
    'b': 2,
  };
  final map2 = {
    'a': 1,
    'b': 2,
  };
  print(map1);  // {a: 1, b: 2}
  print(map2);  // {a: 1, b: 2}
}