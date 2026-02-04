// dart:convert 库, 提供 JSON 和 UTF-8 转换器, 以及创建其他转换器
import 'dart:convert';

void main() {
  method1();
  method2();
  method3();
}

void method1() {
  // json字符串
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';
  // json字符串转换为对象
  List<dynamic> listData = jsonDecode(jsonString);
  for (var item in listData) {
    print(item['score']);
    // 40
    // 80
  }

  // json字符串
  String jsonStr = '{"name":"Tom","age":18}';
  // 转换为map
  Map<String, dynamic> map = jsonDecode(jsonStr);

  print(map['name']); // Tom
  print(map['age']); // 18
}

void method2() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null},
  ];

  // list转换为json字符串
  String jsonText = jsonEncode(scores);
  print(jsonText);
}

// 定义一个对象
class User {
  // 类的属性
  final String name;
  final int age;

  // 构造方法
  User({required this.name, required this.age});

  // JSON -> 对象
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'] ?? '', age: json['age']);
  }
  // 对象 -> JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

void method3() {
  // 定义json字符串
  String jsonStr = '{"name":"Tom","age":18}';

  // json字符串转换为Map对象
  Map<String, dynamic> map = jsonDecode(jsonStr);
  // map对象转换为类对象
  User user = User.fromJson(map);
  print(user.name); // Tom

  // 类对象转换为json
  var json = user.toJson();
  print(json); // {name: Tom, age: 18}
}
