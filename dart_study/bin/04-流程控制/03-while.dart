void main(List<String> args) {
  // 🔷普通的for循环
  int i = 0;
  while (i < 3) {
    print(i);
    i++;
  }

  // 🔷至少执行一次的 do…while
  int j = 0;
  do {
    print(j);
    j++;
  } while (j < 3);
}
