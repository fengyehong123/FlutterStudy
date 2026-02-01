void main(List<String> args) {
  method1();
  method2();
  method3('');
  method4();
}

/*
  在 Dart2 时代, 如果想要返回多个值的话, 必须使用 class 或者 map
  【Records】 是 Dart3 引入的一个非常重要的特性
    Records = 不用定义类，就能返回 / 传递多个值的【轻量数据结构】

  Record 本质上是：
    一个「固定结构 + 固定类型 + 不可变」的值组合
*/
void method1() {
  // 🔷创建一个最基础的Records
  var r1 = (1, 'hello', true);
  // 🔷带类型的Records
  (int, String, bool) r2 = (1, 'hello', true);

  // 🔷通过位置来访问元素
  //    💥注意：Records 的 位置字段是 $1, $2, $3
  //            并不是[0]
  print(r1.$1); // 1
  print(r1.$2); // hello
  print(r1.$3); // true
  print(r2); // (1, hello, true)

  // 👍带命名的Records(推荐)
  var user1 = (id: 1, name: 'Tom', isVip: true);
  // 带命名和类型的Records
  ({int id, String name, bool isVip}) user2 = (id: 1, name: 'Tom', isVip: true);

  // 使用了命名字段之后, 就可以使用名称来访问 Records 了
  print(user1.id); // 1
  print(user1.name); // Tom
  print(user1.isVip); // true
  print(user2); // (id: 1, isVip: true, name: Tom)
}

void method2() {
  // 🔷对Records进行位置解构
  var (a, b) = (10, 20);
  print(a); // 10
  print(b); // 20

  // 🔷对Records进行命名解构
  var (:code, :message) = (code: 200, message: 'OK');
  print(code); // 200
  print(message); // OK
}

void method3(String info) {
  // 🔷定义一个校验函数
  ({bool ok, String? error}) validate(String input) {
    if (input.isEmpty) {
      return (ok: false, error: '不能为空');
    }
    return (ok: true, error: null);
  }

  // 对指定内容进行校验
  var (:ok, :error) = validate(info);
  if (!ok) {
    print(error); // 不能为空
  }
}

void method4() {
  // Records 是「不可变」的
  var r = (a: 1, b: 2);
  print(r); // (a: 1, b: 2)

  // ❌ 下面这种写法是不允许的
  // r.a = 10;

  // 如果需要重新赋值的话, 只能通过下面这种对 Records 整体重新赋值的方法
  r = (a: 10, b: r.b);
  print(r); // (a: 10, b: 2)
}
