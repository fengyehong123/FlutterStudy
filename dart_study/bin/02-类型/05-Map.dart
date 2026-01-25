void main(List<String> args) {
  method1();
  method2();
  method3();
  method4();
  method5();
  method6();
}

// 1️⃣创建Map
void method1() {
  // 明确标明类型的map
  Map<String, int> map1 = {'a': 1, 'b': 2};
  print(map1);

  // 自动推断类型的map
  var map2 = {'a': 1, 'b': 2};
  print(map2);

  // 构造函数的方式创建
  var map3 = <String, String>{};
  map3['name'] = '张三';
  map3['city'] = '北京';
  print(map3);

  // 创建一个空的map, 注意空map的话, 会把类型指定为 → Map<dynamic, dynamic>
  var map4_1 = {};
  print(map4_1);

  // 创建空map的话, 推荐指定类型
  Map<String, int> map4_2 = {};
  print(map4_2);

  // Dart 3 引入了 Record 类型，可以将多个值组合起来
  // 可以将 Record 类型 当做Map的key来使用
  Map<(String, int), String> scores = {('Tom', 1): 'A', ('Jack', 2): 'B'};
  print(scores); // {(Tom, 1): A, (Jack, 2): B}
}

// 2️⃣Map的增删改查
void method2() {
  var userMap = {'name': '小明', 'age': 18};

  // ------------ 查询 ------------
  print(userMap['name']); // 小明
  print(userMap['age']); // 18
  // 使用不存在的key, 结果会是null, 并不会报错
  print(userMap['不存在的key']); // null

  // ------------ 添加和修改 ------------
  userMap['age'] = 20;
  userMap['gender'] = '男';

  // ------------ 删除 ------------
  userMap.remove('age');

  // 判断 key 是否存在
  print(userMap.containsKey('name')); // true
  print(userMap.containsValue('小明')); // true
}

// 3️⃣Map的遍历
void method3() {
  // 定义一个map
  var userMap = {'name': '小明', 'age': 18};

  // 使用 .forEach() 进行遍历
  userMap.forEach((key, value) {
    print('$key = $value');
    // name = 小明
    // age = 18
  });

  // 使用 for in 进行遍历
  for (var entry in userMap.entries) {
    print('${entry.key} -> ${entry.value}');
  }

  // 只遍历map中的key
  for (var key in userMap.keys) {
    print(key);
  }

  // 只遍历map中的value
  for (var value in userMap.values) {
    print(value);
  }
}

// 4️⃣Map中的语法糖
void method4() {
  var isVipFlag = true;

  // if 配合 map使用
  var map1 = {
    'name': 'Tom',
    // 只有当flag为true的时候, 才会有 vip 这个项目
    if (isVipFlag) 'vip': true,
  };
  print(map1); // {name: Tom, vip: true}

  // for 配合 map 动态生成
  var map2 = {for (int i = 1; i <= 3; i++) i: i * i};
  print(map2); // {1: 1, 2: 4, 3: 9}

  // map的合并, 扩展运算符
  var base = {'a': 1, 'c': 10};
  var map3 = {...base, 'b': 2};
  print(map3); // {a: 1, c: 10, b: 2}
}

// 5️⃣Map中的常用方法
void method5() {
  var userMap = {'name': '小明', 'age': 18};

  // 获取map的所有的 key value entries
  print(userMap.keys.toList()); // [name, age]
  print(userMap.values.toList()); // [小明, 18]
  print(userMap.entries.toList()); // [MapEntry(name: 小明), MapEntry(age: 18)]

  var priceMap1 = {'price1': 20, 'price2': 18, 'price3': 30};

  // map的转换
  var priceMap2 = priceMap1.map((key, value) {
    return MapEntry(key, value * 10);
  });
  print(priceMap2); // {price1: 200, price2: 180}

  // 过滤, 得到的结果是一个MapEntry的可迭代对象
  var filtered = priceMap1.entries
      .where((e) => e.value > 18)
      .map((e) => MapEntry(e.key, e.value));
  print(filtered);

  // MapEntry的可迭代对象转换为Map
  var priceMap3 = Map.fromEntries(filtered);
  print(priceMap3);

  // 当key不存在的时候才添加
  priceMap3.putIfAbsent("price4", () => 50);
}

void method6() {
  // 创建一个空map
  Map<String, int>? scores;

  // 不会报错
  // ignore: dead_code
  print(scores?['Tom']); // null

  // ignore: dead_code
  var age = scores?['age'] ?? 0;
  print(age); // 0

  // 对map进行解构
  var data = {'id': 42, 'name': 'Alice'};
  if (data case {'id': var idValue, 'name': var nameValue}) {
    print(idValue); // 42
    print(nameValue); // Alice
  }
}
