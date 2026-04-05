import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  metho1();
  metho2();
}

void metho1() async {
  // 构造Uri对象, Dart不允许直接用String当URL
  final url = Uri.parse('https://api.github.com/users/fengyehong123');
  // 发送网络请求, 获取响应
  final response = await http.get(
    url,
    headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
          'AppleWebKit/537.36 (KHTML, like Gecko) '
          'Chrome/120.0.0.0 Safari/537.36',
      'Accept': 'application/json, text/plain, */*',
      'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
  );

  if (response.statusCode != 200) {
    print('请求失败: ${response.statusCode}');
    return;
  }
  // 打印获取到的json字符串
  print(response.body);

  // 转成 Map
  final data = jsonDecode(response.body);
  print(data['login']); // fengyehong123
}

void metho2() async {
  Future<void> postData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // 发送Post请求
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': 'Hello',
        'body': 'Dart is awesome',
        'userId': 1,
      }),
    );

    print(response.statusCode); // 201
    print(response.body);
    /*
      {
        "title": "Hello",
        "body": "Dart is awesome",
        "userId": 1,
        "id": 101
      }
    */
  }

  await postData();
}
