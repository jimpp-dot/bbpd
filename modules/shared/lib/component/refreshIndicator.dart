import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorFactory {
  static RefreshIndicator of({
    Key? key,
    required Widget child,
    double displacement = 40.0,
    required RefreshCallback onRefresh,
    Color? color,
    Color? backgroundColor,
    ScrollNotificationPredicate notificationPredicate =
        defaultScrollNotificationPredicate,
  }) {
    return RefreshIndicator(
      key: key,
      displacement: displacement,
      onRefresh: onRefresh,
      color: color ?? R.color.mainBrandColor,
      backgroundColor: backgroundColor ?? R.color.mainBgColor,
      notificationPredicate: notificationPredicate,
      child: child,
    );
  }
}
