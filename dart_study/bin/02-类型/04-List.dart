void main(List<String> args) {
  method1();
  method2();
  method3();
  method4();
  method5();
  method6();
}

// 1️⃣创建生成一个List
void method1() {
  // 带类型创建
  List<int> list1 = [1, 2, 3];
  print(list1);

  // 稍微简写
  var list2 = <int>[1, 2, 3];
  print(list2);

  // 进一步简写
  var list3 = [1, 2, 3];
  print(list3);

  // 创建一个空的List, 由于没有元素, 也没有指定类型, dart无法推断出类型
  // 所以此时的类型为 List<dynamic>
  var list4 = [];
  print(list4);

  // 创建一个空的list, 并指定类型
  List<int> list5 = [];
  print(list5);

  // 🔷生成一个list
  var list6 = List.generate(5, (i) => i * i);
  print(list6); // [0, 1, 4, 9, 16]

  // 🔷List填充
  var list7 = List.filled(3, '---');
  print(list7); // [---, ---, ---]

  // 💥需要注意引用类型陷阱💥
  var list8 = List.filled(3, []);
  // 明明只想向第一个list元素添加数据, 因为引用类型的原因, 导致其他所有list元素都被添加了元素
  list8[0].add(1);
  print(list8); // [[1], [1], [1]]

  // 下面才是正确的使用方式
  var list9 = List.generate(3, (_) => []);
  list9[0].add(1);
  print(list9); // [[1], [], []]

  // 创建不可变的list
  const list10 = [1, 2, 3];
  try {
    list10.add(4);
  } catch (e) {
    print("元素添加失败..."); // 元素添加失败...
  }

  // 🔷------------------- List + if / for -------------------
  var isVip = true;

  // 带“控制流”的 List 字面量（Collection literals with control flow）
  // Dart 2.3+ 引入
  var list11 = [
    // 向list中插入一个元素
    10,
    // 当满足某个条件的时候，向数组中插入元素
    if (isVip) 2,
    // 通过循环向数组中插入元素
    for (var i = 3; i <= 5; i++) i,
  ];
  print(list11); // [10, 2, 3, 4, 5]

  var list12 = [
    // ignore: dead_code
    if (isVip) 'VIP' else 'Normal',
  ];
  print(list12); // [VIP]

  // if 或 for 后面必须是元素, 不能是语句
  var list13 = [
    // 判断元素1
    for (var i = 1; i <= 10; i++)
      if (i.isEven) i,
    // 判断元素2
    // 使用 .isNotEmpty 来代替 .length > 0 ，语义效果更好
    if (list11.isNotEmpty) 100,
  ];
  print(list13); // [2, 4, 6, 8, 10, 100]
}

// 2️⃣常用的属性
void method2() {
  List<String> list1 = ['a', 'b', 'c'];

  print(list1.length); // 3
  print(list1.first); // a
  print(list1.last); // c
  print(list1.isEmpty); // false
  print(list1.isNotEmpty); // true
}

// 3️⃣增删改
void method3() {
  List<int> list1 = [1, 2, 3];

  list1.add(4);
  print(list1); // [1, 2, 3, 4]

  // 插入多个元素
  list1.addAll([5, 6]);
  print(list1); // [1, 2, 3, 4, 5, 6]

  // 向下标位置为1的地方插入一个值为99的元素
  list1.insert(1, 99);
  print(list1); // [1, 99, 2, 3, 4, 5, 6]

  // 移除元素值为1的元素, 如果有多个相同的元素, 只移除第一个
  list1.remove(1);
  print(list1); // [99, 2, 3, 4, 5, 6]

  // 移除下标为0的元素
  list1.removeAt(0);
  print(list1); // [2, 3, 4, 5, 6]

  // 清空整个数组
  list1.clear();
}

// 4️⃣遍历
void method4() {
  List<int> list1 = [1, 2, 3];

  // 普通的for循环
  for (var i = 0; i < list1.length; i++) {
    print(list1[i]);
  }

  // for-in循环
  for (int item in list1) {
    print(item);
  }

  // forEach循环
  list1.forEach(print);
}

// 5️⃣函数式api
void method5() {
  var list = [1, 2, 3];

  // map 映射
  var squares = list.map((item) => item * item).toList();
  print(squares); // [1, 4, 9]

  // 过滤
  var evens = list.where((e) => e.isEven).toList();
  print(evens); // [2]

  // 判断, 只要有一个元素 > 2 , 就是true
  print(list.any((e) => e > 2)); // true
  // 每一个元素都 > 2 , 就是true
  print(list.every((e) => e > 2)); // false

  print(list.reduce((a, b) => a + b)); // 6

  // 创建一个动态的List
  List<dynamic> listDynamic = [1, '你好', 3, '世界'];
  // 将List中的字符串类型的数据给过滤出来
  var strList = listDynamic.whereType<String>().toList();
  print(strList);  // [你好, 世界]
}

// 6️⃣排序与拷贝
void method6() {
  var list = [2, 3, 1];

  // 升序排序
  list.sort();
  print(list); // [1, 2, 3]

  // 降序排序
  list.sort((a, b) => b.compareTo(a));
  print(list); // [3, 2, 1]

  // 深拷贝
  // 方式1
  var list1 = List.from(list);
  // 即使原数组增添元素, 也不会影响到拷贝之后的新数组
  list.add(4);
  print(list1); // [3, 2, 1]

  // 方式2
  var list2 = [...list];
  print(list2); // [3, 2, 1, 4]
}

// 7️⃣其他
void method7() {
  // .join() 方法
  print(['a', 'b', 'c'].join(','));
}
