// 不带下划线就是共有的方法, 外部可以使用
void sendMessage(String msg) {
  String info = _sendMessage(msg);
  print('Hello, $info');
}

// 下划线开头的就是私有方法, 外部无法使用
String _sendMessage(String msg) {
  return '你好$msg';
}
