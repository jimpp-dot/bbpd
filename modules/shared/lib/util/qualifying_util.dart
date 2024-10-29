class QualifyingUtil {
  static String getSegmentTitle(String name, int level) {
    String result = name;
    if (level > 0) {
      result += '・$level';
    }
    return result;
  }

  static String getWinRate(int win, int draw, int fail) {
    int total = win + draw + fail;
    if (total > 0) {
      double rate = win * 100 / total;

      /// 保留一位小数，加入正则 去除 无效的0
      return '${rate.toStringAsFixed(1).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), '')}%';
    }
    return '-';
  }
}
