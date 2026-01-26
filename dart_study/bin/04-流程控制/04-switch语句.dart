void main(List<String> args) {
  print(getInfo1(1)); // one
  print(getInfo2(99)); // other
  method1();
  method2(3);
  method3();
  method4();
}

// 🔷Dart2的写法
String getInfo1(int x) {
  switch (x) {
    case 1:
      return "one";
    default:
      return "other";
  }
}

// 🔷Dart3的写法
String getInfo2(int x) {
  return switch (x) {
    1 => "one",
    _ => "other",
  };
}

void method1() {
  int num = 3;

  // 🔷减少if else 分支
  switch (num) {
    case 1 || 3 || 5:
      print('奇数'); // 奇数
    case 2 || 4 || 6:
      print('偶数');
    default:
      print('其他');
  }
}

void method2(int type) {
  // 🔷switch 表达式
  String typeName = switch (type) {
    1 => '普通用户',
    2 => 'VIP 用户',
    3 => '管理员',
    _ => '未知',
  };
  print(typeName); // 管理员
}

// 定义一个User类
class User {
  final String role;
  final bool active;

  User(this.role, this.active);
}

void method3() {
  // 创建一个Records数据类型, 然后解构
  ({int x, int y}) point = (x: 10, y: 0);

  // 解构对象
  switch (point) {
    case (x: 0, y: 0):
      print('原点');
    case (x: _, y: 0):
      print('X轴'); // X轴
    case (x: 0, y: _):
      print('Y轴');
    default:
      print('普通点');
  }

  // 创建一个switch表达式, 配合解构来直接返回结果
  String getUserType(User user) => switch (user) {
    User(role: 'admin', active: true) => '管理员',
    User(role: 'guest') => '访客',
    _ => '普通用户',
  };

  // 创建一个用户然后获取其类型
  var user = User('admin', true);
  String userType = getUserType(user);
  print(userType); // 管理员
}

// 定义一个Response类
class Response {
  final int code;
  final Map<String, dynamic> data;

  Response(this.code, this.data);
}

void method4() {
  var res = Response(200, {'type': 'vip', 'level': 3});
  // 🔷嵌套解构
  switch (res) {
    // 同时判断code, data中的 type 和 level
    case Response(code: 200, data: {'type': 'vip', 'level': >= 3}):
      print('高级 VIP'); // 高级 VIP
    case Response(code: 200):
      print('普通成功');
    default:
      print('失败');
  }
}
