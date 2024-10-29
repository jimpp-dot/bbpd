import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

const int _year = 86400 * 365;
const int _month = 86400 * 30;
const int _week = 86400 * 7;
const int _day = 86400;
const int _hour = 3600;
const int _min = 60;

class Utility {
  static const List<double> titleWidth = [37.0, 38.5, 40.5, 42.5, 47.5];
  static const List<Size> titleBigLayout = [
    Size(42.5, 43.0),
    Size(57.0, 48.0),
    Size(57.0, 50.5),
    Size(66.0, 58.0),
    Size(75.0, 60.0),
  ];
  static const List<double> titleNewWidth = [37.0, 37.0, 37.0, 38.5, 38.5, 40.5, 40.5, 42.5, 47.5];
  static const List<Size> titleNewBigLayout = [
    Size(42.5, 43.0),
    Size(42.5, 43.0),
    Size(42.5, 43.0),
    Size(57.0, 48.0),
    Size(57.0, 48.0),
    Size(57.0, 50.5),
    Size(57.0, 50.5),
    Size(66.0, 58.0),
    Size(75.0, 60.0),
  ];

  static List<String> get weekNames => R.array('base_week_day_array');

  static String getMessageDiff(int time) {
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));
    if (targetTime.isAfter(today)) {
      return '${targetTime.hour}:${targetTime.minute < 10 ? '0' : ''}${targetTime.minute}';
    } else if (targetTime.isAfter(yesterday)) {
      return '${K.base_yesterday} ${targetTime.hour}:${targetTime.minute < 10 ? '0' : ''}${targetTime.minute}';
    } else {
      return targetTime.toyyyyMMddHHmm();
    }
  }

  static bool isMobile(String phone, {String? areaCode = '86'}) {
    if (areaCode == '86') {
      return phone.isNotEmpty && RegExp("^(13|14|15|16|17|18|19)\\d{9}\$").hasMatch(phone);
    } else {
      return phone.isNotEmpty && phone.length >= 6 && phone.length <= 11;
    }
  }

  static bool isEmail(String email) {
    return email.isNotEmpty && RegExp("^[-a-zA-Z0-9_.]+@([0-9A-Za-z_][0-9A-Za-z-]+.)+[A-Za-z]{2,8}\$").hasMatch(email);
  }

  static bool isVerifyCode(String code) {
    return code.length == 4 && RegExp(r'^[0-9]+$').hasMatch(code);
  }

  static String uidToString(String uid) {
    String result = '';
    while (uid.isNotEmpty) {
      if (result.isNotEmpty) {
        result = '$result·${uid.substring(0, 3)}';
      } else {
        result = result + uid.substring(0, 3);
      }
      uid = uid.substring(3);
    }

    return result;
  }

  /// 检验时间 是否 当前时间 之前 单位：秒；
  /// overOneDay 是否 当前时间前一天 之前
  static bool checkBeforeDateNow(int time, {bool overOneDay = false}) {
    int nowTime = DateTime.now().secondsSinceEpoch;
    int result = overOneDay ? 24 * 60 * 60 : 0;
    return nowTime - time > result;
  }

  static bool isToday(DateTime dateTime) {
    DateTime now = DateTime.now();
    return now.year == dateTime.year && now.month == dateTime.month && now.day == dateTime.day;
  }

  static String getDateDiff(int time) {
    int now = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
    int diff = now - time;
    if (diff <= 0) {
      return K.base_just_now;
    } else if (diff < _min) {
      return '$diff${K.seconds_ago}';
    } else if (diff < _hour) {
      int min = diff ~/ _min;
      return '$min${K.minutes_ago}';
    } else if (diff < _day) {
      int hour = diff ~/ _hour;
      return '$hour${K.hour_ago}';
    } else if (diff < _week) {
      int day = diff ~/ _day;
      return '$day${K.day_ago}';
    } else if (diff < _month) {
      int week = diff ~/ _week;
      return '$week${K.week_ago}';
    } else if (diff < _year) {
      int month = diff ~/ _month;
      return '$month${K.month_ago}';
    } else if (diff < _year * 10) {
      int year = diff ~/ _year;
      return '$year${K.year_ago}';
    } else {
      return K.early_ago;
    }
  }

  static int getToday() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day, 0, 0, 0);

    return today.millisecondsSinceEpoch.toInt() ~/ 1000;
  }

  static const int Minute = 60;
  static const int Hour = 3600;
  static const int Day = 86400;

  static String formatDateToDay(int time) {
    var formatter = DateFormat('yyyy-MM-dd');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  static DateTime parseDate(String time, {String format = 'yyyy-MM-dd'}) {
    var formatter = DateFormat(format);

    return formatter.parse(time);
  }

  static String formatDateToDayFromDateTime(DateTime time) {
    var formatter = DateFormat('yyyy-MM-dd');

    return formatter.format(time);
  }

  static String formatDateToDayAndChinese(DateTime time) {
    var formatter = DateFormat('yyyy年MM月dd日');

    return formatter.format(time);
  }

  static String formatDateToMonthDayAndChinese(int time) {
    var formatter = DateFormat('MM月dd日');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  static String formatDateToHourAndMin(int time) {
    var formatter = DateFormat('HH:mm');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  /// 参数单位为秒
  static String formatDate(int time) {
    var formatter = DateFormat('yyyy-MM-dd HH:mm');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  static String formatDateV1(int time) {
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  static String formatDateV2(int time) {
    var formatter = DateFormat('MM-dd HH:mm');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  /// 参数单位为秒
  static String formatDateV3(int time) {
    int now = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
    int diff = now - time;

    if (diff < _year) {
      var formatter = DateFormat('MM-dd HH:mm');
      return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
    } else {
      var formatter = DateFormat('yyyy-MM-dd HH:mm');
      return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
    }
  }

  static String formatDateMonthDay(int time) {
    var formatter = DateFormat('MM-dd');

    return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  /// 判断两日期是不是同一周
  /// 星期是按周日到周六
  static bool isSameWeek(int time1, int time2) {
    int weekDay = DateTime.fromMillisecondsSinceEpoch(time2).weekday;
    int startTime = time2 - weekDay * 3600 * 24 * 1000; // 本周开始时间
    int endTime = time2 + (7 - weekDay) * 3600 * 24 * 1000; //本周结束时间
    if (time1 >= startTime && time1 <= endTime) {
      return true;
    } else {
      return false;
    }
  }

  /// 判断两日期是不是同一天
  static bool isSameDay(int time1, int time2) {
    int year1 = DateTime.fromMillisecondsSinceEpoch(time1).year;
    int month1 = DateTime.fromMillisecondsSinceEpoch(time1).month;
    int day1 = DateTime.fromMillisecondsSinceEpoch(time1).day;
    int year2 = DateTime.fromMillisecondsSinceEpoch(time2).year;
    int month2 = DateTime.fromMillisecondsSinceEpoch(time2).month;
    int day2 = DateTime.fromMillisecondsSinceEpoch(time2).day;
    return (year1 == year2 && month1 == month2 && day1 == day2);
  }

  static String formatDateDis(int time) {
    var formatter = DateFormat('MM-dd');

    int now = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;

    int diff = now - time;
    if (diff < Minute) {
      return K.base_just_now;
    } else if (diff < Hour) {
      return Util.parseInt(diff ~/ Minute).toString() + K.minutes_ago;
    } else if (diff < Day) {
      return Util.parseInt(diff ~/ Hour).toString() + K.hour_ago;
    } else if (diff < 2 * Day) {
      return K.one_day_ago;
    } else if (diff < 7 * Day) {
      return K.two_days_ago;
    } else {
      return formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
    }
  }

  static String formatBytes(int bytes, {int decimals = 1, String space = ''}) {
    if (bytes <= 0) return '0${space}B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (Math.log(bytes) / Math.log(1024)).floor();
    return ((bytes / Math.pow(1024, i)).toStringAsFixed(decimals)) + space + suffixes[i];
  }

  static int getLastOrderTime() {
    DateTime now = DateTime.now();
    DateTime time = DateTime(now.year, now.month, now.day, now.hour, ((now.minute ~/ 15).toInt() + 1) * 15, 0);

    if ((time.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch) < 15 * 60 * 1000) {
      return time.millisecondsSinceEpoch.toInt() ~/ 1000 + 15 * 60;
    }

    return time.millisecondsSinceEpoch.toInt() ~/ 1000;
  }

  /// xx天xx小时xx分钟
  static String formatLeftTime(int time) {
    int now = DateTime.now().secondsSinceEpoch;
    if (time < now) {
      return '';
    } else {
      String result = '';
      int diff = time - now;
      int day = (diff / _day).floor();
      int hour = (diff % _day / _hour).floor();
      int minute = (diff % _day % _hour / _min).floor();
      if (day > 0) {
        result += '$day${K.base_day}';
      }
      if (hour > 0) {
        result += '$hour${K.base_hour}';
      }
      if (minute > 0) {
        result += '$minute${K.base_minute}';
      }
      return result;
    }
  }

  /// xx天xx小时xx分钟
  static String formatDurationTime(int duration) {
    if (duration < 0) {
      return '';
    } else {
      String result = '';
      int day = (duration / _day).floor();
      int hour = (duration % _day / _hour).floor();
      int minute = (duration % _day % _hour / _min).floor();
      if (day > 0) {
        result += '$day${K.base_day}';
      }
      if (hour > 0) {
        result += '$hour${K.base_hour}';
      }
      if (minute > 0) {
        result += '$minute${K.base_minute}';
      }
      return result;
    }
  }

  static String formatOrderTime(int time) {
    var formatter = DateFormat('HH:mm');
    var str = formatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));

    var diff = ((time - getToday())) / 86400;
    Log.d('diff~~~$diff');
    if (diff > 0) {
      if (diff < 1) {
        return K.base_today + str;
      } else if (diff < 2) {
        return K.base_tomorrow + str;
      } else if (diff < 3) {
        return K.day_after_tomorrow + str;
      }
    }

    var nFormatter = DateFormat('yyyy-MM-dd HH:mm');
    return nFormatter.format(DateTime.fromMicrosecondsSinceEpoch(time * 1000000));
  }

  /// 单位是秒
  static Map<String, int> timeDistance(int diff) {
    if (diff <= 0) {
      return {'day': 0, 'hour': 0, 'min': 1};
    }

    Map<String, int> map = {};
    map['day'] = (diff / _day).floor();
    map['hour'] = (diff % _day / _hour).floor();
    map['min'] = (diff % _day % _hour / _min).floor();
    return map;
  }

  static Map<String, int> timeDistanceV2(int diff) {
    if (diff <= 0) {
      return {'hour': 0, 'min': 0, 'sec': 0};
    }

    Map<String, int> map = {};
    map['hour'] = (diff / _hour).floor();
    map['min'] = (diff % _hour / _min).floor();
    map['sec'] = (diff % _hour % _min).floor();
    return map;
  }

  /// 单位是秒
  static Map<String, int> timeDistanceV3(int diff) {
    if (diff <= 0) {
      return {'day': 0, 'hour': 0, 'min': 0, 'sec': 0};
    }

    Map<String, int> map = {};
    map['day'] = (diff / _day).floor();
    map['hour'] = (diff % _day / _hour).floor();
    map['min'] = (diff % _day % _hour / _min).floor();
    map['sec'] = (diff % _day % _hour % _min).floor();
    return map;
  }

  static int getRoundOnline(int onlineNum, int real, String types) {
    return onlineNum + (real / 2000).round();
  }

  static String formatTimeClock(int time) {
    int min = 0;
    int sec = 0;
    int hour = 0;
    min = (time ~/ 60).toInt();
    sec = (time % 60).toInt();
    hour = (min ~/ 60).toInt();
    min = (min % 60).toInt();

    String res = '';
    if (hour > 0) {
      res = '$hour:';
    }
    if (min < 10) res += '0';
    res = '$res$min:';

    if (sec < 10) res += '0';
    res = res + sec.toString();

    return res;
  }

  static String formatTimeClockByWave(int time) {
    int min = 0;
    int sec = 0;
    int hour = 0;
    min = (time ~/ 60).toInt();
    sec = (time % 60).toInt();
    hour = (min ~/ 60).toInt();
    min = (min % 60).toInt();

    if (hour == 0 && min == 0) {
      return "$sec S";
    }
    String res = '';
    if (hour > 0) {
      if (hour < 10) res += '0';
      res = '$res$hour:';
    }
    if (min < 10) res += '0';
    res = '$res$min:';
    if (sec < 10) res += '0';
    res = res + sec.toString();
    return res;
  }

  /// 最多4位显示
  static String formatTimeClockFour(int time) {
    int min = 0;
    int sec = 0;
    int hour = 0;
    min = (time ~/ 60).toInt();
    sec = (time % 60).toInt();
    hour = (min ~/ 60).toInt();
    min = (min % 60).toInt();

    String res = '';
    if (hour > 0) {
      res = '$hour:';
    }
    if (min < 10) res += '0';
    res = res + min.toString() + (hour > 0 ? '' : ':');

    if (hour > 0) return res;

    if (sec < 10) res += '0';
    res = res + sec.toString();

    return res;
  }

  static String formatTimeClockAll(int time) {
    int min = 0;
    int sec = 0;
    int hour = 0;
    min = (time ~/ 60).toInt();
    sec = (time % 60).toInt();
    hour = (min ~/ 60).toInt();
    min = (min % 60).toInt();

    StringBuffer res = StringBuffer();
    if (hour < 10) res.write('0');
    res.write('$hour:');

    if (min < 10) res.write('0');
    res.write('$min:');

    if (sec < 10) res.write('0');
    res.write(sec.toString());

    return res.toString();
  }

  static String formatTimeDHMS(int time) {
    int day = 0;
    int min = 0;
    int sec = 0;
    int hour = 0;
    if (time > 0) {
      day = time ~/ (24 * 3600);
      time %= 24 * 3600;
      sec = time % 60;
      min = time ~/ 60;
      hour = min ~/ 60;
      min = min % 60;
    }

    StringBuffer res = StringBuffer();
    if (day < 10) res.write('0');
    res.write('$day:');

    if (hour < 10) res.write('0');
    res.write('$hour:');

    if (min < 10) res.write('0');
    res.write('$min:');

    if (sec < 10) res.write('0');
    res.write(sec.toString());

    return res.toString();
  }

  static String formatAudioTime(int time) {
    int min = time ~/ 60;
    int sec = time % 60;

    String res = '';
    if (min > 0) {
      res += '$min:';
    }

    res = res + sec.toString();

    return res;
  }

  static String formatImageUrl(String? url, {String? suffix}) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http')) {
      if (suffix != null && suffix.isNotEmpty && !url.contains(suffix)) {
        return '$url$suffix';
      }
      return url;
    }
    String rurl = '${System.imageDomain}$url';
    if (suffix != null && suffix.isNotEmpty) {
      return '$rurl$suffix';
    }

    return rurl;
  }

  static PageViewParams parseReactNative(String url) {
    String page;
    Map<String, String> query = {};
    List<String> res = url.split("?");
    page = res[0].toLowerCase();
    if (res.length > 1) {
      String args = res[1];
      try {
        query = Uri.splitQueryString(args);
      } on ArgumentError catch (_) {
        // do nothing
      }
    }
    return PageViewParams(page, query);
  }

  static pushReq(BuildContext context, [String? msg]) async {
    msg ??= K.notify_you_when_receive;
    bool? ok = await SharedAppPlugin.areNotificationEnabled();
    Log.d("Permissions push $ok");
    if (ok == false) {
      String key = "ios.message.purview";
      int last = Config.getInt(key, 0);
      int now = DateTime.now().millisecondsSinceEpoch;
      // 一天提醒一次
      if (now - last > 24 * 60 * 60 * 1000) {
        Config.set(key, now.toString());
        bool r = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                title: K.base_notify_yes,
                content: msg,
                negativeButton: NegativeButton(
                    text: K.base_no_notify,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }),
                positiveButton: PositiveButton(
                    text: K.confirm,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              );
            });
        if (r == true) {
          SharedAppPlugin.openNotificationSettings();
        }
      }
    }
  }

  static int getVipColor(int vip, [bool isChatRoom = true]) {
    int color;
    if (vip >= 61) {
      color = isChatRoom ? 0xFFFFE735 : 0xFFFFE735;
    } else if (vip >= 41) {
      color = isChatRoom ? 0xFFFBB859 : 0xFFFBB859;
    } else if (vip >= 31) {
      color = isChatRoom ? 0xFFFF955A : 0xFFFF955A;
    } else if (vip >= 21) {
      color = isChatRoom ? 0xFFFC72E1 : 0xFFFC72E1;
    } else if (vip >= 16) {
      color = isChatRoom ? 0xFFA26DF6 : 0xFFA26DF6;
    } else if (vip >= 11) {
      color = isChatRoom ? 0xFF878EFE : 0xFF878EFE;
    } else if (vip >= 6) {
      color = isChatRoom ? 0xFF59D1F4 : 0xFF59D1F4;
    } else if (vip >= 1) {
      color = isChatRoom ? 0xFF4CD9C4 : 0xFF4CD9C4;
    } else {
      color = isChatRoom ? Colors.white.withOpacity(0.4).value : R.color.mainTextColor.value;
    }

    return color;
  }

  static int getGlobalRoomColor(int? vip) {
    if (vip == null) return 0xFFFFFFFF;
    int color;

    if (vip >= 61) {
      color = 0xFFF9FF16;
    } else if (vip >= 41) {
      color = 0xFFF9FF16;
    } else if (vip >= 31) {
      color = 0xFFF1691D;
    } else if (vip >= 21) {
      color = 0xFFFE54DC;
    } else if (vip >= 16) {
      color = 0xFFA26DF6;
    } else if (vip >= 11) {
      color = 0xFF878EFE;
    } else if (vip >= 6) {
      color = 0xFF1E9EC4;
    } else if (vip >= 1) {
      color = 0xFF25A592;
    } else {
      color = 0xFFFFFFFF;
    }

    return color;
  }

  static String formatPhone(String? areaCode, String phone) {
    if (areaCode == null || areaCode.isEmpty) {
      return phone;
    } else {
      return '＋$areaCode $phone';
    }
  }

  /// 拆分 带区号的phone
  static Map<String, String> splitPhone(String rawPhone) {
    List<String> res = rawPhone.split('-');
    if (res.length < 2) {
      return {'phone': rawPhone};
    } else {
      return {'area': res[0], 'phone': res[1]};
    }
  }

  static double getIconWidth(type, couponType) {
    switch (type) {
      case 'exp':
        return 50;
      case 'box':
        return 75;
      case 'header':
        return 70;
      case 'mounts':
        return 70;
      case 'title':
        return 80;
      case 'defend':
        return 75;
      case 'gift':
        return 80;
      case 'key':
        return 60;
      case 'radio-defend':
        return 60;
      case 'coupon':
        return 70;
      case 'bubble':
        // 聊天气泡
        return 70;
      default:
        return 60;
    }
  }

  static double getIconHeight(type, couponType) {
    switch (type) {
      case 'exp':
        return 50;
      case 'box':
        return 75;
      case 'header':
        return 70;
      case 'mounts':
        return 70;
      case 'title':
        return 80;
      case 'defend':
        return 75;
      case 'gift':
        return 80;
      case 'key':
        return 60;
      case 'radio-defend':
        return 60;
      case 'coupon':
        return 70;
      case 'bubble':
        // 聊天气泡
        return 70;
      default:
        return 60;
    }
  }

  // 兼容新旧两种方案,当needVerifyNew < 0时，启用老方案
  static bool isNeedVerify(int? needVerify, int? needVerifyNew) {
    if (needVerifyNew == null && needVerify == null) {
      return false;
    }

    if (needVerifyNew == null) {
      if (needVerify! >= 1 && needVerify <= 3) {
        return true;
      }
      return false;
    }

    needVerify ??= 0;

    /// 2023.2.2 新增 needVerifyNew=7 走 人脸识别（新）
    if (needVerifyNew >= 1 && needVerifyNew <= 7) {
      return true;
    } else if (needVerifyNew == 0) {
      return false;
    } else if (needVerifyNew < 0 && needVerify >= 1 && needVerify <= 3) {
      return true;
    }

    return false;
  }

  static String? navigateToUrl(BuildContext context, String page, Map<String, String> args) {
    Log.d('navigateToUrl page:$page, args:${args.toString()}');
    String pageUrl = '/$page';
    switch (page) {
      case 'webview':
        if (args['source'] == null || args['source'] is! String) {
          return null;
        }
        String? title = args.containsKey('title') ? args['title'] : K.base_web;
        String url = args['source']!;
        BaseWebviewScreen.show(context, url: url, title: title);
        break;
      case 'userchat':
        if (args['type'] != null && args['targetId'] != null && (args['type'] == 'private' || args['type'] == 'group')) {
          String title = args['title'] ?? '';
          IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(
            context,
            type: Util.notNullStr(args['type']),
            targetId: Util.parseInt(args['targetId']),
            title: title,
          );
        }
        break;
      case 'chatroomdisplay':
      case 'chatoom':
      case 'room':
        if (Util.parseInt(args['rid']) > 0) {
          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, Util.parseInt(args['rid']));
        }
        break;
      case 'about':
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openAboutScreen(context);
        break;
      case 'vip':
        IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.show(context);
        break;
      case 'help':
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openHelpScreen(context);
        break;
      case 'balance':
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openBalanceScreen(context);
        break;
      case 'banner':
        IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
        mainManager.openBannerScreen(context);
        break;
      case 'profile':
        int uid = Util.parseInt(args['uid']);
        if (uid > 0) {
          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, uid);
        }
        break;

      case 'limited_charge_pack': // 限时礼包
        IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        manager.showLimitPackageDialog(context);
        break;
      case 'vip_welfare':
        IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Vip);
        break;
      case 'popularity_welfare':
        IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Popularity);
        break;
      case 'moment_tag':
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        manager.openTagListScreenScreen(context, title: Util.notNullStr(args["tagName"]), tagId: Util.parseInt(args["tagId"]));
        break;
      case 'accost_config':
        IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        manager.openAccostConfigPage(context);
        break;
      case 'accost_photo':
        IProfileManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
        manager.openGsPhotoPage(context);
        break;
      case 'auto_reply':
        IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        manager.openAutoReplyConfigPage(context);
        break;
      case 'week_star':
        IRankManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        manager.openGiftWeekRankPage(context, Util.parseInt(args['rid']));
        break;
      case 'club_detail':
        IMomentManager mgr = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        mgr.openClubDetailScreen(context, Util.parseInt(args['clubId']));
        break;
      case 'room_rank':

        /// 直播房间banner周星榜入口跳转：room_rank?rid=200055579&charmType=activity&tabType=week_star
        if (args.containsKey('rid') && args.containsKey('charmType') && args.containsKey('tabType')) {
          IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
          int rid = Util.parseInt(args['rid']);
          String charmType = Util.notNullStr(args['charmType']);
          String tabType = Util.notNullStr(args['tabType']);
          rankManager.showRoomRankMainTabScreen(context, rid: rid, charmType: charmType, tabType: tabType);
        }
        break;
      case 'heart_race_rank':

        /// 心跳竞速：排行榜
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openHeartRaceRank(context);
        break;
      case 'select_defend':
        IPersonalDataManager? manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager?.openUserDefendBuyShowModalBottomSheet(context, uid: Util.parseInt(args['uid']));
        break;
      case 'room_gift_panel':
        IRoomManager? manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager?.openRoomGiftPanel(context, defaultTab: Util.parseStr(args['tab']), targetUid: Util.parseInt(args['uid']));
        break;
      case 'general_gift_panel':
        String? type = Util.parseStr(args['type']);
        String? tab = Util.parseStr(args['tab']);
        int uid = Util.parseInt(args['uid']);
        int giftId = Util.parseInt(args['gid']);
        if (type == 'im') {
          IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showPrivateGiftPanel(System.context, uid: uid, defaultId: giftId, defaultTab: parseDisplayPage(tab));
        } else {
          IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openRoomGiftPanel(context, defaultTab: tab, targetUid: uid, defaultGiftId: giftId);
        }
        break;
      case 'room_vindicate':
        IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openVindicateActivityBottomSheetPage(context, Util.parseInt(args['uid']), from: Util.parseInt(args['from'], 0));
        break;
      case 'confess':
        IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openVindicateActivityBottomSheetPage(context, 0);
        break;
      case 'profile_accompany_house_tab':

        /// 跳转个人主页，tab切换到陪伴小屋
        IPersonalDataManager? manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager?.openImageScreen(System.context, Util.parseInt(args['uid']),
            initialScrollToTabBar: true, initialTab: ImageScreenTabType.accompany_house);
        break;
      case 'create_room':

        /// 创房入口
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openInitOperateDisplay(context);
        break;
      case 'activity_center':

        /// 活动中心
        BannerScreen.show(context, from: Util.parseStr(args['from']));
        break;
      case 'room_join_mic_panel':

        /// 房间弹出上座底部弹窗面板
        bool isBoss = Util.parseBool(args['boss']);
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openMicUpWaitListBottomPanel(System.context, isBoss: isBoss);
        break;
      case 'gift_panel':

        /// 打开礼物面板,适配全场景
        int uid = Util.parseInt(args['uid'], 0);
        int giftId = Util.parseInt(args['gift_id'], 0);
        String tabStr = Util.parseStr(args['tab']) ?? 'gift';
        final tab0 = stringToEnum<DisplayPage>(tabStr, enumValues: DisplayPage.values);
        String scene = Util.parseStr(args['scene']) ?? 'room_public';
        final giftScene = stringToEnum<GiftScene>(scene, enumValues: GiftScene.values);
        IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        manager.showGifPanel(
          System.context,
          uid: uid,
          defaultId: giftId,
          defaultTab: tab0 ?? DisplayPage.gift,
          giftScene: giftScene,
        );
        break;
      case "room_banner_panel":

        /// 打开房间活动Banner
        eventCenter.emit(EventConstant.EventOpenRoomBannerPanel, args);
        break;
      case 'toast':
        String msg = Util.parseStr(args['message']) ?? '';
        Fluttertoast.showCenter(msg: msg);
        break;

      default:
        Log.d('can not find page:$page');
        pageUrl = '';
        break;
    }
    return pageUrl;
  }

  /// 常用数字的显示，点赞数等
  /// <0:''
  /// 0:0
  /// 1-999:展示整数
  /// 1,000-99,999: 展示1k- 99.9k
  /// 100,000-999,999 展示100k - 999k
  /// 1,100,000 - 99,999,999 展示1.1m- 99.9m
  /// 100,000,000 - 999,999,999 展示100m- 999m
  static String formatNum(int num, {int decimals = 1, String space = ''}) {
    if (num < 0) return '';
    if (num == 0) {
      return '0';
    }
    const suffixes = ['', 'k', 'm', 'b'];
    var i = (Math.log(num) / Math.log(1000)).floor();
    if (i >= suffixes.length) {
      i = suffixes.length - 1;
    }
    var num0 = (num / Math.pow(1000, i)).toStringAsFixed(decimals);
    if (num0.endsWith('0')) {
      num0 = num0.substring(0, num0.length - 2);
    }
    return num0 + space + suffixes[i];
  }

  /// 评论的时间规则
  // 1分钟内：刚刚
  // 1小时内：xx分钟前
  // 大于等于1小时:hh-mm
  // 超过今日:昨天 hh-mm
  // 超过昨日，只显示月日不显示小时分钟:mm-dd
  // 超过今年，只显示年月日:yy-mm-dd
  static String formatDateDisComment(int time) {
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime thisYear = DateTime(now.year);

    int nowTime = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
    int diff = nowTime - time;
    if (targetTime.isBefore(thisYear)) {
      ///超过今年，只显示年月日:yy-mm-dd
      return formatDateToDay(time);
    } else if (targetTime.isBefore(yesterday)) {
      /// 超过昨日，只显示月日不显示小时分钟:mm-dd
      return formatDateMonthDay(time);
    } else if (targetTime.isBefore(today)) {
      /// 超过今日:昨天 hh-mm
      return '${K.base_yesterday} ${formatDateToHourAndMin(time)}';
    } else if (diff >= Hour) {
      /// 大于等于1小时:hh-mm
      return formatDateToHourAndMin(time);
    } else if (diff < Minute) {
      /// 不足一分钟:刚刚
      return K.base_just_now;
    } else {
      /// 1小时内：xx分钟前
      return Util.parseInt(diff ~/ Minute).toString() + K.minutes_ago;
    }
  }
}

class PageViewParams {
  final String page;
  final Map<String, String> args;

  PageViewParams(this.page, this.args);

  get isRoom {
    return page == 'chatroomdisplay' || page == 'room' || page == 'chatroom';
  }

  String? get url {
    switch (page) {
      case 'webview':
        if (args['source'] == null || args['source'] is! String) {
          return null;
        }
        String? title = args.containsKey('title') ? args['title'] : K.base_web;
        return "/webview/${Uri.encodeComponent(args['source'] ?? '')}/${Uri.encodeComponent(title ?? '')}";

      case 'safari':
        if (args['source'] == null || args['source'] is! String) {
          return null;
        }
        launch(args['source']!, forceSafariVC: true);
        return null;

      case 'userchat':
        if (args['type'] != null && args['targetId'] != null && (args['type'] == 'private' || args['type'] == 'group')) {
          String title = args['title'] ?? '';
          return "/userChat/${args['type']}/${args['targetId']}/${Uri.encodeComponent(title)}";
        }
        return null;

      case 'fleetsetting':
        if (args['groupId'] != null) {
          return "/fleetsetting/${args['groupId']}/browse";
        }
        return null;

      case 'chatroomdisplay':
      case 'chatoom':
      case 'room':
        if (args['rid'] != null) {
          return "/room/${args['rid']}";
        }
        return null;

      case 'about':
      case 'vip':
      case 'help':
      case 'balance':
      case 'profile':
      case 'banner':
      case 'addfriendcard':
        return "/$page";
      case 'vip_welfare':
        return '/vip_welfare';
      case 'popularity_welfare':
        return '/popularity_welfare';
      case 'openmatchresult':
        return '/openmatchresult';
      case 'moment_tag':
        return '/moment_tag';
      default:
        return page;
    }
  }
}
