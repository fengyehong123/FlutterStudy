void main(List<String> args) {
  method1();
  method2();
  method3();
}

// 1️⃣创建Set
void method1() {
  
  // 创建一个Set
  var set1 = {1, 2, 3};
  print(set1);
  Set<String> set2 = {'a', 'b', 'c'};
  print(set2);

  // 创建一个空Set
  // 💥注意：这是一个空Map
  var map = {};
  // ignore: unnecessary_type_check
  print(map is Map);

  // 这才是空Set
  var set3 = <int>{};
  print(set3);

  // 空Set
  Set<int> set4 = {};
  print(set4);
}

// 2️⃣常用的api
void method2() {

  // 定义一个list
  var list = [1, 2, 2, 3, 3];

  // list 转换 set 去重
  var set1 = list.toSet();
  print(set1);  // {1, 2, 3}

  // 添加数据
  set1.add(10);
  set1.addAll({10, 20, 30});
  print(set1);  // {1, 2, 3, 10, 20, 30}

  // 删除元素
  set1.remove(1);
  set1.removeAll([2, 3]);
  print(set1);  // {10, 20, 30}

  // 判断元素是否存在
  if (set1.contains(4)) {
    print("4这个元素存在");
  } else {
    print("4这个元素并不存在");  // 4这个元素并不存在
  }

  print(set1.length);  // 3
  print(set1.isEmpty);  // false
  print(set1.isNotEmpty);  // true

  // 这样写会报错
  // print(set1[0]);
  
  // set没有办法通过下标获取元素, 必须先转换为List然后才能获取
  print(set1.toList()[0]);
}

// 3️⃣集合运算
void method3() {

  // 定义2个集合
  var a = {1, 2, 3};
  var b = {3, 4, 5};

  // 并集
  print(a.union(b));  // {1, 2, 3, 4, 5}
  // 交集
  print(a.intersection(b));  // {3}
  // 差集
  print(a.difference(b));  // {1, 2}
}

// 4️⃣遍历
void method4() {

  var set1 = {1, 2, 3};

  // for in 遍历
  for (var item in set1) {
    print(item);
  }

  // forEach 遍历
  set1.forEach(print);
}