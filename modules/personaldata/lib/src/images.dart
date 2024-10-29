import 'package:shared/shared.dart';
import 'package:flutter/widgets.dart';

class Images {
  static Widget img(String path,
      {double width = 0,
      double height = 0,
      Color? color,
      BoxFit? fit,
      String package = ComponentManager.MANAGER_PERSONALDATA}) {
    if (path.endsWith('svg')) {
      return SvgPicture.asset(R.imagePath(path, package: package),
          width: width, height: height, color: color, fit: fit ?? BoxFit.fill);
    } else {
      return Image.asset(
        R.imagePath(path, package: package),
        width: width,
        height: height,
        color: color,
        fit: fit,
      );
    }
  }
}
