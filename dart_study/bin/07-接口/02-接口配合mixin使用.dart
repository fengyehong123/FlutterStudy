/*
  🔷为什么要「接口 + mixin」一起用？
    ❌ 只用 extends（继承）
      1. 单继承
      2. 类层级会爆炸（BaseA → BaseB → BaseC…）

    ❌ 只用 implements（接口）
      1. 每个类都要重写一堆相同代码
      2. 又累又丑

    ✅ 接口 + mixin
      1. 接口保证 结构一致
      2. mixin 负责 代码复用
      3. 没有继承层级污染
    
    ✅ 推荐用 接口 + mixin：
      1. 框架 / 中间层 / Service
      2. 多能力组合
      3. 行为可插拔
      4. Flutter 中的 Controller / State / Repository

    ❌ 不推荐：
      1. 纯数据模型
      2. 一次性 demo
      3. 逻辑极简单的类
*/
void main(List<String> args) {
  method1();
}

// 定义接口
abstract class Loggable {
  void log(String msg);
}

abstract class Cacheable {
  void save();
}

// 定义mixin实现接口
mixin ConsoleLog implements Loggable {
  @override
  void log(String msg) {
    print('[LOG] $msg');
  }
}

mixin MemoryCache implements Cacheable {
  @override
  void save() {
    print('保存到内存');
  }
}

// 定义class使用mixin
class UserService with ConsoleLog, MemoryCache {}

void method1() {
  var userService = UserService();
  userService.log('你好'); // [LOG] 你好
  userService.save(); // 保存到内存
}
