import 'package:shared/shared.dart';

class Dimensions {
  double defaultScreenMarginLeft = 18.0;
  double defaultScreenMarginRight = 18.0;
  double bottomBarHeight = 60;
  double bottomBarMarginBottom = 14;
  double get cardVerticalGap {
    return Util.width > 375 ? 12 : 10;
  }
}
