import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// Extension on the [Color] class to provide additional functionality.
extension ColumExtension on Column {
  toExpanded() {
    return Expanded(
      child: this,
    );
  }
}
