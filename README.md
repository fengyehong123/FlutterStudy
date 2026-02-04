# 🔷环境配置
1. 下载Flutter的SDK
`https://docs.flutter.dev/install/archive`

2. 配置环境变量
`flutter_windows_3.38.2-stable\flutter\bin`

3. VS Code安装插件
`Flutter` 和 `Code Runner`

# 🔷Dart SDK
Dart SDK = Dart 语言的运行与开发环境

包含内容：
+ Dart 编译器
+ Dart VM
+ dart 命令
+ 核心库（io / async / collection 等）

📌 用途：
+ 写命令行工具
+ 写纯 Dart 程序
+ 给 Flutter 提供“语言支持”

💥 注意:
只装 Dart SDK 并不能写 Flutter，Dart 只是语言，Flutter 才是 UI 框架

# 🔷Flutter SDK
Flutter SDK = UI 框架 + 工具链 + Dart SDK

除了 Dart，它还包含：
+ Flutter Framework（Widget、渲染、动画）
+ Flutter Engine（Skia、文本、GPU）
+ 平台工具（Android / iOS / Windows / macOS）
+ flutter 命令
+ 内置 Dart SDK

📌 用途：
+ 开发 App（Android / iOS）
+ 桌面应用（Windows / macOS / Linux）
+ Web 应用

# 🔷版本查看
```bash
flutter --version
dart --version
```

# 🔷创建Dart工程
```bash
# 创建dart项目
dart create dart_demo
# 移动到项目目录中
cd dart_demo

# 安装依赖包
dart pub add intl
# 在项目中使用依赖包 
import 'package:intl/intl.dart';
```
```bash
# 在pubspec.yaml中添加对应的依赖包
dependencies:
  path: ^1.9.0
  intl: ^0.20.2
  csv: ^5.0.2
  yaml: ^3.1.2

# 然后执行安装命令
dart pub get
# 或者
flutter pub get
```
**其中**`pubspec.yaml`是依赖管理核心文件
可以在`analysis_options.yaml`文件中设置不需要检查的语法规则

# 学习资料
https://www.dartcn.com/guides/libraries/library-tour
https://www.dartcn.com/guides/libraries/library-tour#dartasync---%E5%BC%82%E6%AD%A5%E7%BC%96%E7%A8%8B
https://www.dartcn.com/samples/
[Flutter の描画の仕組みを理解する](https://zenn.dev/seya/articles/f7ebcd8335eee7)