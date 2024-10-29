import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 通用loading框
class CommonLoading {
  static Future<void> show(
      {String? status,
      Widget? indicator,
      EasyLoadingMaskType? maskType,
      bool? dismissOnTap}) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..backgroundColor = R.color.secondBgColor
      ..indicatorColor = R.color.mainBrandColor
      ..textColor = R.color.secondTextColor;

    return EasyLoading.show(
        status: status,
        indicator: indicator,
        maskType: maskType,
        dismissOnTap: dismissOnTap);
  }

  static Future<void> dismiss({bool animation = true}) {
    return EasyLoading.dismiss(animation: animation);
  }
}
