void main(List<String> args) {
  method1();
  method2();
  method3();
  method4();
}

// 🔷定义一个最基础的枚举类
enum Color { red, green, blue }

void method1() {
  // 实例化一个枚举类对象
  Color color = Color.red;

  print(color); // Color.red
  // 🔷枚举类名称
  print(color.name); // red
  // ignore: unnecessary_type_check
  print(color.name is String); // true
  // 🔷枚举类的声明顺序, 从0开始
  print(color.index); // 0

  // 🔷遍历枚举
  for (var v in Color.values) {
    print('${v.index} -> ${v.name}');
    /*
      0 -> red  
      1 -> green
      2 -> blue
    */
  }
}

// 🔷Dart 的枚举可以像类一样拥有字段和方法。
enum Status {
  success(200, '成功'),
  error(500, '错误'),
  forbidden(403, '禁止访问');

  final int code;
  final String message;

  const Status(this.code, this.message);

  // 🔷根据code查询对应的枚举类
  static Status fromCode(int code) {
    return Status.values.firstWhere(
      (s) => s.code == code,
      orElse: () => throw Exception('未知状态码: $code'),
    );
  }

  // 🔷枚举类转换为List<Map>
  static List<Map> enumToListMap() {
    return Status.values.map((s) {
      return {'code': s.code, 'message': s.message};
    }).toList();
  }

  // 🔷枚举类的属性转换为List
  static List<String> getMsgList() {
    List<String> messageList = Status.values.map((s) => s.message).toList();
    return messageList;
  }

  // 🔷枚举类转换为Map
  static Map<int, String> enumToMap() {
    // 创建map的快捷写法
    final statusMap = {
      for (var enumItem in Status.values) enumItem.code: enumItem.message,
    };
    return statusMap;
  }
}

void method2() {
  // 打印枚举值
  print(Status.success.code); // 200
  print(Status.error.message); // 错误

  // 遍历枚举值
  for (Status status in Status.values) {
    print('${status.name} -> ${status.code} -> ${status.message}');
    /*
      success -> 200 -> 成功
      error -> 500 -> 错误
      forbidden -> 403 -> 禁止访问
    */
  }

  // 根据code查询对应的枚举对象
  Status item = Status.fromCode(500);
  print(item.message); // 错误

  print(Status.enumToListMap());
  // [{code: 200, message: 成功}, {code: 500, message: 错误}, {code: 403, message: 禁止访问}]
  print(Status.enumToMap());
  // {200: 成功, 500: 错误, 403: 禁止访问}
  print(Status.getMsgList());
  // [成功, 错误, 禁止访问]
}

// 定义一个抽象类
abstract class Labeled {
  String get label;
}

// 🔷定义一个枚举来实现抽象类
enum Gender implements Labeled {
  male,
  female;

  @override
  String get label => this == male ? '男' : '女';
}

void method3() {
  print(Gender.male.label); // 男
}

void method4() {
  // 枚举类配合switch 表达式使用
  String getStatusText(Status s) => switch (s) {
    Status.success => '请求成功',
    Status.error => '服务器错误',
    Status.forbidden => '无权限',
  };

  // 根据枚举类获取对应的值
  String result = getStatusText(Status.error);
  print(result); // 服务器错误
}
