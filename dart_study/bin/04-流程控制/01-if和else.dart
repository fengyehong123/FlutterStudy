void main(List<String> args) {
  int score = 85;

  // 🔷简单的if判断
  if (score >= 90) {
    print('优秀');
  } else if (score >= 60) {
    print('及格'); // 及格
  } else {
    print('不及格');
  }

  // 🔷三目运算符
  print("打印的结果是: ${score >= 90 ? '值比90大' : '值没有90大'}"); // 打印的结果是: 值没有90大
}
