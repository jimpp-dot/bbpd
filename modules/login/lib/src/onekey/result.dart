import 'dart:io';

import 'package:shared/shared.dart';
import 'package:login/src/onekey/login.dart';

/// 一键登录授权结果
class OneKeyLoginResult {
  Map<String, dynamic>? source;
  int code = -1; //返回码
  String? message; //描述
  int innerCode = -1; //内层返回码
  String? innerDesc; //内层事件描述
  String? token; //token
  bool? isChecked;

  /// 隐私政策checkbox勾选状态

  OneKeyLoginResult({
    this.code = -1,
    this.message,
    this.innerCode = -1,
    this.innerDesc,
    this.token,
  });

  OneKeyLoginResult.fromJson(Map<String, dynamic> json) {
    source = json;
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      if (Platform.isAndroid) {
        code = Util.parseInt(json['code']);
        message = json['msg'];
      } else {
        code = Util.parseInt(json['resultCode']);
        message = json['msg'];
        isChecked = Util.parseBool(json['isChecked']);
      }
      token = json['token'];
    }
  }

  bool get success {
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      return code == 600000 || code == 600001;
    } else {
      return false;
    }
  }

  bool get cancel {
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      return code == 700000;
    } else {
      return false;
    }
  }

  /// 隐私政策checkbox点击
  bool get privacyCheckBoxClick {
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      return code == 700003;
    }
    return false;
  }

  bool get shouldSwitch {
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      return code == 700001;
    } else {
      return false;
    }
  }

  //导航栏右侧按钮点击事件
  bool get navMoreViewClick {
    if (OneKeyLogin.vendor == OneKeyLoginVendor.ali) {
      return code == 800000;
    } else {
      return false;
    }
  }

  /// 自定义第三方登录
  static const int code_switch_wechat = 111; // 点击微信登录
  static const int code_switch_qq = 222; // 点击QQ登录
  static const int code_switch_apple = 333; // 点击Apple登录
  static const int code_switch_xiaomi = 444; // 点击小米登录
  static const int code_switch_douyin = 555; // 点击抖音登录

  bool get switchWechatLogin => code == code_switch_wechat;

  bool get switchQQLogin => code == code_switch_qq;

  bool get switchAppleLogin => code == code_switch_apple;

  bool get switchXiaomiLogin => code == code_switch_xiaomi;

  bool get switchDouyinLogin => code == code_switch_douyin;

  /// 自动选择对应的message
  String getMessage() =>
      (OneKeyLogin.vendor == OneKeyLoginVendor.ali
          ? message
          : innerDesc ?? message) ??
      '';

  @override
  String toString() {
    return source.toString();
  }
}
