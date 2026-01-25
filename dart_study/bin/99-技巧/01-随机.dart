import 'dart:math';

// 1️⃣安全随机字符串（Token / 验证码）
String secureRandomString(int length) {

  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = Random.secure();

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rand.nextInt(chars.length)),
    )
  );
}

// 2️⃣生成安全数字
String secureCode(int length) {

  final rand = Random.secure();
  return List.generate(length, (_) => rand.nextInt(10)).join();
}

// 3️⃣生成 UUID（安全版）
String uuidV4() {

  final rand = Random.secure();
  final bytes = List.generate(16, (_) => rand.nextInt(256));

  // version 4
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  // variant
  bytes[8] = (bytes[8] & 0x3f) | 0x80;

  String hex(int n) => n.toRadixString(16).padLeft(2, '0');

  final s = bytes.map(hex).join();

  return '${s.substring(0, 8)}-'
         '${s.substring(8, 12)}-'
         '${s.substring(12, 16)}-'
         '${s.substring(16, 20)}-'
         '${s.substring(20)}';
}

void main(List<String> args) {
  
  // 安全随机字符串
  print(secureRandomString(32));
  // 生成安全数字
  print(secureCode(6));
  // UUID
  print(uuidV4());
}