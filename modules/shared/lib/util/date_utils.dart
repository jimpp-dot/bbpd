import 'package:intl/intl.dart';

/// 日期工具类
class DateUtils {
  /// private constructor
  DateUtils._();

  static const String format1 = 'yyyyMMdd';

  /// 六十进制
  static const int hex = 60;

  /// 秒（单位：毫秒）
  static const int secondInMilliseconds = 1000;

  /// 分钟（单位：毫秒）
  static const int minuteInMilliseconds = hex * 1000;

  /// 小时（单位：毫秒）
  static const int hourInMilliseconds = hex * minuteInMilliseconds;

  /// 天（单位：毫秒）
  static const int dayInMilliseconds = 24 * hourInMilliseconds;

  /// 当前时间（毫秒）
  static int get nowSinceEpoch => DateTime.now().millisecondsSinceEpoch;

  /// 格式化时间
  /// [timestamp]要格式化的时间
  /// [pattern]时间格式，如 yyyy年MM月dd日 HH:mm
  static String format(int timestamp, String pattern) {
    return DateFormat(pattern)
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  /// 以"00:00"的格式显示时间
  ///
  /// [second] 秒
  static String showMinuteSecond(int second) {
    if (second < hex) {
      return second < 10 ? '00:0$second' : '00:$second';
    }
    StringBuffer sb = StringBuffer();
    int minute = (second / DateUtils.hex).floor();
    sb.write(minute < 10 ? '0$minute' : '$minute');
    sb.write(':');
    int second0 = second % DateUtils.hex;
    sb.write(second0 < 10 ? '0$second0' : '$second0');
    return sb.toString();
  }

  static String formatDuration(int seconds) {
    if (seconds < 0) {
      seconds = 0;
    }
    int minutes = seconds ~/ 60;
    int hours = seconds ~/ (60 * 60);
    int days = seconds ~/ (24 * 60 * 60);

    if (days > 0) {
      return '$days天';
    } else if (hours > 0) {
      return '$hours小时';
    } else if (minutes > 0) {
      return '$minutes分钟';
    } else {
      return '$seconds秒';
    }
  }
}
