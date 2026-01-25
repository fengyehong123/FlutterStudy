// dart:convert 库, 提供 JSON 和 UTF-8 转换器, 以及创建其他转换器
import 'dart:convert';

var scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null}
];

void main() {

  // json字符串
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';
  // json字符串转换为对象
  var listData = jsonDecode(jsonString);
  print(listData is List);

  // list转换为json字符串
  var jsonText = jsonEncode(scores);
  print(jsonText);
}