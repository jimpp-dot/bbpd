import 'package:shared/shared.dart';

class BonusUtil {
  static String getMoneyStr(int money) {
    return '${(money % MoneyConfig.multiple == 0) ? (money ~/ MoneyConfig.multiple) : (money / MoneyConfig.multiple)}';
  }
}
