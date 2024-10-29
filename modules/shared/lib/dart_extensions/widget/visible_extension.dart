import 'package:flutter/cupertino.dart';

extension VisibleExtension on Widget {
  Widget visible({bool show = false}) => Visibility(
        visible: show,
        child: this,
      );

  Widget toVisible({bool show = false}) => Visibility(
        visible: show,
        child: this,
      );
}
