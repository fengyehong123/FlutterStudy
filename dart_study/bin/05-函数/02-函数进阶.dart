void main(List<String> args) {
  print(sum1(1, 2)); // 3
  print(sum2(1, 2)); // 3
  print(sum3(1, 2)); // 3

  test1();
  test2();
}

// 🔷普通的函数
int sum1(int a, int b) {
  return a + b;
}

// 🔷箭头函数的写法1
int sum2(int a, int b) => a + b;

// 🔷箭头函数的写法2
var sum3 = (int a, int b) => a + b;

// 🔷参数可以作为参数进行传递, 最好把参数和返回值也一并写上
void doWork(int Function(int, int) task) {
  // 🔷函数参数当做回调函数使用
  var result = task(99, 10);
  print(result); // 109
}

void test1() {
  // 🔷函数可赋值给一个变量
  var f = sum1;
  doWork(f);
}

// 🔷函数支持返回一个函数, Dart是支持函数式编程的
Function makeAdder(int x) {
  return (int y) => x + y;
}

Function makeNewFunc(String msg) {
  String getHelloMsg(int age) {
    return "你好, 我来自$msg, 我今年$age岁了";
  }

  return getHelloMsg;
}

void test2() {
  Function func1 = makeAdder(10);
  var result = func1(20);
  print(result);

  Function func2 = makeNewFunc('宇宙');
  var msg = func2(100);
  print(msg); // 你好, 我来自宇宙, 我今年100岁了
}
