import 'dart:ui';

import 'package:shared/shared.dart';

import 'generated/connector_bar.pb.dart';

extension PresentsUserInfoExtension on PresentsUserInfo {
  /// 按钮颜色
  List<Color> get btnColors {
    switch (micStatus) {
      case 2:
        return [const Color(0xFFDBDBDB), const Color(0xFFA3A3A3)];
      case 1:
        return [const Color(0xFFFC5897), const Color(0xFFFF6AFD)];
      default:
        return R.color.mainBrandGradientColors;
    }
  }

  /// 按钮文案
  String get btnText {
    switch (micStatus) {
      case 2:
        return '断连';
      case 1:
        return '连线';
      default:
        return '抱上座';
    }
  }
}
