import 'package:flutter/cupertino.dart';

extension FlexibleExtension on Widget {
  Flexible flexible({int flex = 1}) => Flexible(
        flex: flex,
        child: this,
      );
}
