class TimeUtil {
  /// 获取当天时间
  static DateTime nowDayTime({int hour = 0, int minute = 0, int second = 0}) {
    DateTime nowTime = DateTime.now();
    return DateTime(
        nowTime.year, nowTime.month, nowTime.day, hour, minute, second);
  }

  /// 获取当前小时时间
  static DateTime nowHourTime({int minute = 0, int second = 0}) {
    DateTime nowTime = DateTime.now();
    return DateTime(
        nowTime.year, nowTime.month, nowTime.day, nowTime.hour, minute, second);
  }

  /// 格式化倒计时文本
  static String timerText(int seconds) {
    if (seconds <= 0) return '00:00';
    return '${_formatNum(seconds ~/ 60)}:${_formatNum(seconds % 60)}';
  }

  /// 格式化倒计时文本 HH:mm:ss
  static String formateTimeHms(int time) {
    if (time <= 0) return '00:00';
    int hour = time ~/ (60 * 60);
    int minute = (time - hour * 60 * 60) ~/ 60;
    int second = time % 60;
    return '${_formatNum(hour)}:${_formatNum(minute)}:${_formatNum(second)}';
  }

  /// 格式化数字,不足两位前面补0
  static String _formatNum(int num) {
    return num.toString().padLeft(2, '0');
  }
}
