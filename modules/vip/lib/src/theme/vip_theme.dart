import 'package:shared/shared.dart';
import 'package:vip/src/theme/vip_theme_colors.dart';
import 'package:vip/src/theme/vip_theme_colors_dark.dart';

class VipTheme extends R {
  static final VipThemeColors _theme = VipThemeColors();
  static final VipThemeColorsDark _darkTheme = VipThemeColorsDark();

  static VipThemeColors get colors {
    if (darkMode) {
      return _darkTheme;
    }
    return _theme;
  }
}
