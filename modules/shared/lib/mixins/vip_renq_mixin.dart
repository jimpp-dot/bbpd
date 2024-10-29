mixin VipRenqMixin {
  int getVipRenQiIcon(int level) {
    if (level == 0) {
      return 1;
    } else if (0 < level && level <= 4) {
      return 1;
    } else if (4 < level && level <= 14) {
      return 2;
    } else if (14 < level && level <= 24) {
      return 3;
    } else if (24 < level && level <= 39) {
      return 4;
    } else if (39 < level && level <= 100) {
      return 5;
    } else {
      return 1;
    }
  }
}
