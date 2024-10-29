import 'package:shared/shared.dart';

class ProfileData {
  static const String _isLaunchAfterFirstRegisterKey =
      'isLaunchAfterFirstRegister';

  static String sex = '0';
  static String birthDay = '';
  static String nickName = '';
  static String icon = '';
  static String inviteCode = '';

  static void reset() {
    sex = "0";
    birthDay = "";
    nickName = "";
    icon = "";
    inviteCode = "";
  }

//首次注册成功后的运行（同一个设备退出登录再注册也不算首次）
  static bool get isLaunchAfterFirstRegister {
    return Config.getBool(_isLaunchAfterFirstRegisterKey, false);
  }

  static void markLaunchAfterFirstRegisterIfNeeded() {
    var value = Config.getBool(_isLaunchAfterFirstRegisterKey);
    if (value == false) {
      Config.setBool(_isLaunchAfterFirstRegisterKey, true);
    }
  }

  static void checkLaunchAfterFirstRegister() {
    if (isLaunchAfterFirstRegister) {
      Config.setBool(_isLaunchAfterFirstRegisterKey, false);
    }
  }
}
