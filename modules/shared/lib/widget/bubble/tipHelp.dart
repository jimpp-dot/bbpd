//tip辅助类
import 'package:shared/shared.dart';

class TipsHelp {
  static bool flag = false; //是否强制显示气泡
  static int tipShowSeconds = 7; //气泡默认显示时间，单位秒

  static const String _tip = 'killer.tips.show';

  static String _getWholeTipName(String expend) {
    return '$_tip.$expend';
  }

  static bool showTip(String expend) {
    String value = Config.get(_getWholeTipName(expend), "0");
    return flag || value == "0";
  }

  static void setTip(String expend) {
    Config.set(_getWholeTipName(expend), "1");
  }
}
