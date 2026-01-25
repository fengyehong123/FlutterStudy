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

void main() {
  print(getInfo1(1));
  print(getInfo2(99));
}