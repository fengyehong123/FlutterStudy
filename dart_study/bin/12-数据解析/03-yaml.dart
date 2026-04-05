import 'package:yaml/yaml.dart';

void main(List<String> args) {
  method1();
}

void method1() {
  final yamlStr = '''
app:
  name: my_app
  version: 1.0.0

database:
  host: localhost
  port: 3306
''';

  // 加载yaml对象
  final doc = loadYaml(yamlStr);
  print(doc['app']['name']); // my_app
  print(doc['database']['port']); // 3306
}
