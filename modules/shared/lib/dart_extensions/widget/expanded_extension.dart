import 'package:flutter/cupertino.dart';

extension ExpandedExtension on Widget {
  Expanded expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  Expanded toExpanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );
}
