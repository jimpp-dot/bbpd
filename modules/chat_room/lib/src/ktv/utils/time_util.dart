class KtvTimeUtil {
  static int now() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String hhmmss(int milliSecs) {
    Duration duration = Duration(milliseconds: milliSecs);
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  static String mmss(int? milliSecs) {
    if (milliSecs == null) return '';
    String hhmmssStr = hhmmss(milliSecs);
    return hhmmssStr.substring(3);
  }

  static String getMusicNum(int num) {
    String result = num.toString();
    if (num > 1000) {
      result = (num / 1000).toStringAsFixed(3);
      result = "${result.substring(0, result.indexOf('.') + 2)}k";
    }
    return result;
  }
}
