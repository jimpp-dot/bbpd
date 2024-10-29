import 'package:flutter/cupertino.dart';

extension WidgetCommonExtension on Widget {
  Widget? showIf(bool condition) {
    if (condition) {
      return this;
    }
    return null;
  }
}
