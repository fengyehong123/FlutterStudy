void main(List<String> args) {
  method1();
  method2();
  method3();
  method4();
}

void method1() {
  // 字符串使用单引号和双引号定义都是可以的
  var str1 = "你好,世界,哈哈";

  // 💥Dart 的「字符串自动拼接」，因此长字符串可以这么写
  var strLong =
      '你好'
      '我好'
      '大家好';
  print(strLong); // 你好我好大家好
  // 如果需要有空格的话, 需要自己手动添加
  var sql =
      'select * '
      'from user '
      'where id = 1;';
  print(sql); // select * from user where id = 1;

  // 是否包含
  print(str1.contains('世界')); // true

  // 是否以指定字符串开头结尾
  print(str1.startsWith('你好')); // true
  print(str1.endsWith('你好')); // false

  // 检查是否为空字符串
  print(''.isEmpty); // true
  print('   '.isNotEmpty); // true

  // 查找一个字符串在另一个字符串中的位置
  print(str1.indexOf('世界')); // 3
}

void method2() {
  var str1 = "你好,世界,哈哈";

  // 字符串截取
  print(str1.substring(3, 5)); // 世界

  // 字符串分割
  List<String> list1 = str1.split(',');
  print(list1); // [你好, 世界, 哈哈]

  // 获取一个字符串的所有字符的集合
  for (String char in 'hello'.split('')) {
    print(char);
    // h
    // e
    // l
    // l
    // o
  }

  var str2 = '4';
  // 向左填充, 填充到4位
  print(str2.padLeft(4, '0')); // 0004
  // 向右填充, 填充到10位
  print(str2.padRight(10, '0')); // 4000000000
}

void method3() {
  // 大小写转换
  print('structured web apps'.toUpperCase()); // STRUCTURED WEB APPS
  print('STRUCTURED WEB APPS'.toLowerCase()); // structured web apps

  // 去除首位空格
  print('  hello  '.trim()); // hello

  // 字符串替换
  var str1 = "hello1 hello2 hello_1";
  // 使用正则进行替换
  // 注意: r 用来标记字符串的内容不做任何转义
  //       如果不使用r的话, 正则表达式字符串就要变为 'hello\\d' 了
  print(str1.replaceAll(RegExp(r'hello\d'), "哈哈"));
}

void method4() {
  // 字符串拼接
  var sb = StringBuffer();
  sb
    ..write('内容1 ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  print(sb.toString());

  // 模板字符串
  var str1 = "你好,世界";
  // 虽然 ${str1} 也可以使用, 但是dart更推荐使用 $str1
  print("打印的内容是 $str1");

  // 使用三个单引号或者三个双引号, 可以创建多行字符串
  var content =
      """
我是一个内容,
我的内容是: $str1
  """;
  print(content);

  // 使用r前缀, 可以构建原始字符串
  var str2 = r'123\n456\n789';
  print(str2); // 123\n456\n789
  // 如果不使用r的话, \n会被转义会换行符
  var str3 = '123\n456\n789';
  print(str3);
}
