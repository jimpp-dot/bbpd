import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/src/onekey/login.dart';

import 'login_sheet.dart';

class EasyLogin {
  static bool _isLogined = false;
  static bool _canPhoneAuth = false;
  static int lastShowTime = 0;

  /// 展示快捷登录sheet
  static Future show({
    required BuildContext context,
    bool isBarrierDismissible = true,
  }) async {
    if (DateTime.now().millisecondsSinceEpoch - lastShowTime < 700) {
      return;
    }
    lastShowTime = DateTime.now().millisecondsSinceEpoch;

    await _checkEnvAvailable();

    await displayModalBottomSheet(
        context: context,
        isBarrierDismissible: isBarrierDismissible,
        builder: (BuildContext context) {
          return LoginSheet(
            context: context,
            canPhoneAuth: _canPhoneAuth,
            onItemClick: (int index) {
              _isLogined = true;
            },
            isBarrierDismissible: isBarrierDismissible,
          );
        });
  }

  static Future _checkEnvAvailable() async {
    /// 海外版不支持 本机号码认证
    if (Util.isLocale) {
      return false;
    }
    // 判断当前手机是否支持本机号码认证
    _canPhoneAuth = await OneKeyLogin.checkEnvAvailable();
  }
}
