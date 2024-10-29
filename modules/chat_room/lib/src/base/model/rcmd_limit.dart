import 'package:shared/shared.dart';

/// 用于判断新用户是否展示快捷打招呼，赠送小心心，棒棒糖等
class RcmdLimit {
  int hi;
  int heart;
  int lollipop;

  RcmdLimit.fromJson(Map json)
      : hi = Util.parseInt(json['hi']),
        heart = Util.parseInt(json['hi']),
        lollipop = Util.parseInt(json['hi']);
}
