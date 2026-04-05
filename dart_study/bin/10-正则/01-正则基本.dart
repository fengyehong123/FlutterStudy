void main(List<String> args) {
  method1();
  method2();
  method3();
}

void method1() {
  // 创建一个正则对象
  // r 用来将字符串当做原始字符串处理, 避免 \ 被当做转义字符
  var reg = RegExp(r'\d+');

  // .hasMatch() 查看是否匹配
  print(reg.hasMatch('abc123')); // true
  print(reg.hasMatch('abc')); // false

  // .firstMatch() 第一次匹配
  var match = reg.firstMatch('abc123def456');
  // .group(0) 整个匹配的结果
  print(match?.group(0)); // 123

  // 🔷.allMatches() 返回所有的匹配
  var matches = reg.allMatches('abc123def456');
  for (var m in matches) {
    print(m.group(0));
    // 123
    // 456
  }
}

void method2() {
  // .replaceAll() 替换 → 将数字替换为 *
  var result = '手机号: 13812345678'.replaceAll(RegExp(r'\d'), '*');
  print(result); // 手机号：***********

  // .split() 根据正则分割
  var list = 'apple,banana;orange|pear'.split(RegExp(r'[,;|]'));
  print(list);
}

void method3() {
  // 普通的分组
  var reg1 = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
  var matches = reg1.allMatches('2025-01-30');

  for (var match in matches) {
    // .group(0) → 整个匹配的结果
    print(match.group(0)); // 2025-01-30
    // .group(1) → 匹配到的第1组内容
    print(match.group(1)); // 2025
    // .group(2) → 匹配到的第2组内容
    print(match.group(2)); // 01
    print(match.group(3)); // 30
  }

  // 命名分组 → 提高代码可读性
  var reg2 = RegExp(r'(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})');
  var match = reg2.firstMatch('2026-10-25');

  print(match?.namedGroup('year')); // 2026
  print(match?.namedGroup('month')); // 10
  print(match?.namedGroup('day')); // 25
}

void method4() {
  // caseSensitive → 是否区分大小写
  // multiLine → ^ $ 作用于每一行
  RegExp(r'hello', caseSensitive: false, multiLine: true);
}

void method5() {
  var text = 'a1b22c333';
  // 提取所有数字并转成 List<int>
  var nums = RegExp(
    r'\d+',
  ).allMatches(text).map((m) => int.parse(m.group(0)!)).toList();
  print(nums); // [1, 22, 333]

  // 校验是否为手机号码
  bool isPhoneNumber(String s) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(s);
  }

  print(isPhoneNumber('13812345678')); // true
}
