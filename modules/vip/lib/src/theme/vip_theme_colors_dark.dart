import 'dart:ui';

import 'package:vip/src/theme/vip_theme_colors.dart';

class VipThemeColorsDark extends VipThemeColors {
  VipThemeColorsDark() {
    tabSelected = [
      const Color(0xFF99FFBC).withOpacity(0.24),
      const Color(0xFF26C4FF).withOpacity(0.24),
      const Color(0xFF926AFF).withOpacity(0.24)
    ];
    mallItemBgColor = const Color(0xFF221B5B); // 商城item背景
    disabledColor = [const Color(0xFF928B9C), const Color(0xFFA8A6AB)];
  }
}
