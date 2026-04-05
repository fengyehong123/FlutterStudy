// https://www.dartcn.com/guides/libraries/library-tour#uri
void main(List<String> args) {
  method1();
  method2();
  method3();
}

void method1() {
  // 构造一个Uri对象
  var uri1 = Uri(
    scheme: 'http',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag',
    // 查询参数
    queryParameters: {'id': '10', 'active': 'true'},
  );
  print(uri1.toString()); // http://example.org/foo/bar?id=10&active=true#frag

  print(uri1.scheme); // http
  print(uri1.host); // example.org
  print(uri1.path); // /foo/bar
  print(uri1.fragment); // frag
  print(uri1.queryParameters); // {id: 10, active: true}
  print(uri1.origin); // http://example.org

  // 将字符串地址解析为Uri对象
  var uri2 = Uri.parse('http://example.org/foo/bar?id=10&active=true#frag');
  print(uri2.queryParameters); // {id: 10, active: true}
}

void method2() {
  var uri1 = 'http://example.org/api?foo=some message&query=你好';
  print(
    // uri编码
    Uri.encodeFull(uri1),
  ); // http://example.org/api?foo=some%20message&query=%E4%BD%A0%E5%A5%BD

  // uri解码
  var uri2 = Uri.decodeFull(Uri.encodeFull(uri1));
  print(uri2); // http://example.org/api?foo=some message&query=你好
}

void method3() {
  var uri = 'http://example.org/api?foo=some message&query=你好';

  var encoded = Uri.encodeComponent(uri);
  print(
    encoded,
  ); // http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message%26query%3D%E4%BD%A0%E5%A5%BD

  var decoded = Uri.decodeComponent(encoded);
  print(decoded); // http://example.org/api?foo=some message&query=你好
}
