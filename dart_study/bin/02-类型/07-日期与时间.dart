// 导入时间格式化包
import 'package:intl/intl.dart';

void main(List<String> args) {
  // method1();
  method2();
  // method3();
}

// 1️⃣时间的创建与比较
void method1() {
  // 当前时间
  DateTime now = DateTime.now();
  print(now.year); // 年
  print(now.month); // 月
  print(now.day); // 日
  print(now.hour); // 时
  print(now.minute); // 分
  print(now.second); // 秒
  print(now.millisecond); // 毫秒
  print(now.weekday); // 1~7 (周一=1)

  // 指定年月日
  DateTime dt1 = DateTime(2025, 1, 24);
  DateTime dt2 = DateTime(2025, 1, 24, 14, 30, 0);

  // 时间比较, 早于 和 晚于
  print(dt1.isBefore(dt2)); // true
  print(dt1.isAfter(dt2)); // false

  // 比较2个时间是否相等
  // 💥注意: 不能用 == 来比较
  print(dt1.isAtSameMomentAs(dt2)); // false
}

// 2️⃣时间的转换与计算
void method2() {
  // 当前时间
  DateTime now = DateTime.now();

  // 字符串转换时间
  DateTime dt1 = DateTime.parse("2025-01-24 14:30:00");
  // ISO8601 的字符串也是支持的 📌 带 Z → UTC 时间
  DateTime dt2 = DateTime.parse("2025-01-25T16:40:00Z");

  // 1天之后
  DateTime tomorrow = now.add(Duration(days: 1));
  print(tomorrow); // 2026-01-25 18:45:10.944304
  // 1天之前
  DateTime yesterday = now.subtract(Duration(days: 1));
  print(yesterday); // 2026-01-23 18:45:10.944304
  // 2个小时之后
  DateTime after2Hours = now.add(Duration(hours: 2));
  print(after2Hours); // 2026-01-24 20:45:10.944304

  // 计算2个时间的时间差
  Duration diff = dt2.difference(dt1);
  // 差几天
  print(diff.inDays); // 1
  // 差几小时
  print(diff.inHours); // 35
  // 差几分钟
  print(diff.inMinutes); // 2110

  // 使用 intl库 中的DateFormat格式化对象
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  print(dateFormat.format(now)); // 2026-01-24 19:19:23
}

// 3️⃣毫秒
void method3() {
  int ms = DateTime.now().millisecondsSinceEpoch;
  print(ms); // 1769248209559

  int sec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  print(sec); // 1769248209

  // 时间戳转换为 DateTime
  DateTime dt = DateTime.fromMillisecondsSinceEpoch(ms);
  print(dt); // 2026-01-24 18:56:55.527
  DateTime dtUtc = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
  print(dtUtc); // 2026-01-24 09:56:55.527Z
}
