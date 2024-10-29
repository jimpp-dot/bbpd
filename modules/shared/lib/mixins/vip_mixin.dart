import '../util/log/log.dart';

mixin VipMixin {
  int getVipLevelIcon(int level) {
    if (level == 0) {
      return 1;
    }
    if (0 < level && level <= 5) {
      return 1;
    } else if (5 < level && level <= 10) {
      return 2;
    } else if (10 < level && level <= 15) {
      return 3;
    } else if (10 < level && level <= 20) {
      return 4;
    } else if (20 < level && level <= 30) {
      return 5;
    } else if (30 < level && level <= 40) {
      return 6;
    } else if (40 < level && level <= 60) {
      return 7;
    } else if (60 < level && level <= 100) {
      return 8;
    } else {
      return 0;
    }
  }
}
