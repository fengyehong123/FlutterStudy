void main() {
  
  // nullable String（可以为 null）
  String? name;
  // 使用 ?. 安全访问
  // ignore: dead_code
  print(name?.length);  // null

  // 给它赋值
  name = "Dart 3";
  // ignore: invalid_null_aware_operator
  print(name?.length);  // 6
}
