import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 加载loading
mixin LoadingDialogMixin<T extends StatefulWidget> on State<T> {
  void showLoading({String? message}) async {
    await CommonLoading.show(status: message);
  }

  void hideLoading() {
    CommonLoading.dismiss();
  }
}
