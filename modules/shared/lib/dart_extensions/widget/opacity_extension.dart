import 'package:flutter/cupertino.dart';

extension OpacityExtension on Widget {
  Opacity setOpacity({required double opacity}) => Opacity(
        opacity: opacity,
        child: this,
      );
}
