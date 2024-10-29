class CpHeartUtil {
  static int _getHatLevelForCpHeart(int package) {
    if (package >= 10 * 100 && package < 100 * 100) {
      return 1;
    } else if (package >= 100 * 100 && package < 520 * 100) {
      return 2;
    } else if (package >= 520 * 100) {
      return 3;
    } else {
      return 0;
    }
  }

  static int _getHatLevelForCpLove(int package) {
    if (package > 0 && package < 2100) {
      return 1;
    } else if (package >= 2100 && package < 52000) {
      return 2;
    } else if (package >= 52000) {
      return 3;
    } else {
      return 0;
    }
  }

  static int getHatLevel(int package, bool cpHeart) {
    return cpHeart
        ? _getHatLevelForCpHeart(package)
        : _getHatLevelForCpLove(package);
  }

  static bool isWoman(int position) {
    return position == 1 || position == 2 || position == 5 || position == 6;
  }
}
