void main(List<String> args) {
  log('你好'); // 你好
  print(add(10, 20)); // 30

  printInfo('张三'); // name=张三, age=18
  printInfo('张三', 100); // name=张三, age=100

  createUser(name: 'Tom', age: 18); // name=Tom, age=18
  createUser(age: 20); // name=null, age=20
  createUser(); // name=null, age=0

  login(username: '贾飞天', password: '123456'); // login: 贾飞天 / 123456
}

// 🔷有参数, 没有返回值的函数
void log(String msg) {
  print(msg);
}

// 🔷有参数, 有返回值的函数
int add(int a, int b) {
  return a + b;
}

// 🔷可选位置参数
// ❗ 可选参数一定要能为 null，或者有默认值
void printInfo(String name, [int? age]) {
  print('name=$name, age=${age ?? 18}');
}

// 🔷可选命名参数{} 调用的时候必须写参数名
void createUser({String? name, int age = 0}) {
  print('name=$name, age=$age');
}

// 🔷必填命名参数 required → 不传会直接编译报错
void login({required String username, required String password}) {
  print('login: $username / $password');
}
