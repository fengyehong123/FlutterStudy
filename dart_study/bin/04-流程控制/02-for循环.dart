void main(List<String> args) {
  // 🔷最普通的for循环
  for (int i = 0; i < 3; i++) {
    print(i);
  }

  // 🔷for in循环
  const list = [10, 20, 30];
  for (var item in list) {
    if (item == 10) {
      continue;
    } else if (item == 30) {
      break;
    }
    print(item);
  }

  // 🔷函数式写法的forEach
  // 不能用 break / continue
  list.forEach(print);
}
