import 'package:csv/csv.dart';

void main(List<String> args) {
  method1();
  method2();
}

class User {
  final String name;
  final int age;
  final String city;

  User(this.name, this.age, this.city);

  @override
  String toString() => '$name ($age) - $city';
}

void method1() {
  final csvData = '''
name,age,city
Tom,18,Tokyo
Jack,20,Osaka
''';

  // csv数据转换为List
  // Dart 解析 CSV 时，一定要注意行结束符
  final rows = const CsvToListConverter(eol: '\n').convert(csvData);
  print(rows); // [[name, age, city], [Tom, 18, Tokyo], [Jack, 20, Osaka]]

  final usersInfo = rows
      // 跳过表头
      .skip(1)
      // 转换为User对象
      .map((e) => User(e[0], e[1], e[2]))
      // 转换为List
      .toList();
  print(usersInfo); // [Tom (18) - Tokyo, Jack (20) - Osaka]
}

void method2() {
  final data = [
    ['name', 'age'],
    ['Tom', 18],
    ['Jack', 20],
  ];

  // list转换为csv数据
  final csv = const ListToCsvConverter().convert(data);
  print(csv);
}
