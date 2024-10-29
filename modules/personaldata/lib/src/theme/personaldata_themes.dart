import 'package:shared/shared.dart';
import 'package:personaldata/src/theme/personaldata_theme_colors.dart';
import 'package:personaldata/src/theme/personaldata_theme_dark_colors.dart';

class PersonaldataR extends R {
  static final PersonaldataThemeColors _theme = PersonaldataThemeColors();
  static final PersonaldataThemeDarkColors _darkTheme =
      PersonaldataThemeDarkColors();

  /// 支持暗黑模式的页面
  static PersonaldataThemeColors get colors {
    if (darkMode) {
      return _darkTheme;
    }
    return _theme;
  }

  /// 直接使用浅色模式下的色值
  static PersonaldataThemeColors get color {
    return _theme;
  }

  /// 直接使用暗黑模式下的色值
  static PersonaldataThemeColors get dColor {
    return _darkTheme;
  }
}
