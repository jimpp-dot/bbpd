import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// Extension on the [Color] class to provide additional functionality.
extension RowExtension on Row {
  toExpanded() {
    return Expanded(
      child: this,
    );
  }
}
