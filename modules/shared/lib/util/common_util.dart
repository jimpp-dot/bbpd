import 'dart:math';

randomGen(min, max) {
  //nextInt 方法生成一个从 0（包括）到 max（不包括）的非负随机整数
  var x = Random().nextInt(max) + min;

  //如果您不想返回整数，只需删除 floor() 方法
  return x.floor();
}
