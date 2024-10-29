import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

SharedPreferences? _prefs;

class BBConfigKey {
  static const String needShowSuperMeActivity =
      'needShowSuperMeActivity'; //是否需要展示superMe联名活动
  static const String lastTimeShowBindSafePhoneAlert =
      'lastTimeShowBindSafePhoneAlert'; //上次弹绑定安全手机号的时间
  static const String needShowSayHiBottom =
      'needShowSayHiBottom'; //是否注册完已弹出过打招呼匹配
  static const String hasShowContactsRedDot = 'hasShowContactsRedDot'; //通讯录首次提示
  static const String hasShowPrivacyAgreement =
      'hasShowPrivacyAgreement'; //隐私协议首次弹出
  static const String hasShowAuthDialog = 'hasShowAuthDialog'; //开启任务赚钱弹窗弹出
  static const String hasShowTaskRedDot = 'hasShowTaskRedDot'; //任务首次展示红点
  static const String hasRequestIosASAToken = 'hasRequestIosASAToken'; //申请token
  static const String loginAgreeUserLicense = 'login.agree.userlicense';

  /// Last Upload Log Timestamp
  static const String lastUploadLogTime = 'lastUploadLogTime';

  static String hasShowNoticeFansToday() {
    int today = Utility.getToday();
    return 'hasShowNoticeToday_$today';
  } //进入房间今天是否有显示通知粉丝弹窗

  static String hasShowCompleteInfoToday() {
    int today = Utility.getToday();
    return 'hasShowCompleteInfoToday_$today';
  } //今天是否显示了完善性别生日信息弹窗弹窗

  static String hasShowNoticeStartRecruitToday() {
    int today = Utility.getToday();
    return 'hasShowNoticeStartRecruit_$today';
  } //今天是否显示了开启征召提示弹窗

  static String hasShowTransInviteToday() {
    int today = Utility.getToday();
    return 'hasShowTransInviteToday_$today';
  } //今天是否显示了新转邀请弹窗

  static String hasShowTransInviteID(int id) {
    return 'hasShowTransInviteID_$id';
  } //新转邀请弹窗广告id 一个广告最多显示三次

  static String hasShowStarAgentJoinMicDialogToday() {
    int today = Utility.getToday();
    return 'hasShowStarAgentJoinMicDialogToay_$today';
  } //网赚新秀厅今天是否显示了排麦弹框

  /// 是否展示过地铁推广扫码承接弹窗
  static String hasShowMetroInviteRoom() {
    return 'hasShowMetroInviteRoom';
  }
}

class Config {
  Config._();

  static Future<bool> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    return true;
  }

  static String get(String key, [String defaultValue = '']) {
    String? res = _prefs?.getString(key);
    if (res == null) return defaultValue;
    return res;
  }

  static int getInt(String key, [int defaultValue = 0]) {
    String? val = _prefs?.getString(key);
    if (val == null) return defaultValue;
    try {
      return Util.parseInt(val);
    } catch (e) {
      return defaultValue;
    }
  }

  static Future<bool> set(String key, String? value) {
    if (value == null) return Future.value(false);
    return _prefs?.setString(key, value) ?? Future.value(false);
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs?.setBool(key, value) ?? Future.value(false);
  }

  static bool getBool(String key, [bool defaultValue = false]) {
    bool? value = _prefs?.getBool(key);
    if (value == null) return Util.parseBool(defaultValue);
    return value;
  }

  static delete(String key) {
    _prefs?.remove(key);
  }
}
