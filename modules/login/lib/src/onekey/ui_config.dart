import 'dart:io';

import 'package:login/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ui_config.g.dart';

int _colorToInt(Color? color) => color?.value ?? 0;

@JsonSerializable(
    explicitToJson: true, includeIfNull: false, createFactory: false)
class OneKeyLoginUiConfig {
  // 状态栏
  bool lightStatusBar = false; // 状态栏字体是否为白色
  // logo
  double? logoWidth;
  double? logoHeight;
  double? logoOffsetY; // logoY轴偏移量
  // 登录按钮
  String loginBtnText = K.login_onekey_login; // 登录按钮文案

  @JsonKey(toJson: _colorToInt)
  Color loginBtnTextColor = Colors.white; // 登录按钮文案颜色
  int? loginBtnWidth; // 登录按钮宽度
  int? loginBtnHeight; // 登录按钮高度
  // 掩码
  @JsonKey(toJson: _colorToInt)
  Color? numberColor; // 手机号掩码颜色
  int? numberOffsetY; // 掩码Y轴偏移量
  // 其他号码登录登录
  String? changeBtnText; // 其他号码登录文案
  @JsonKey(toJson: _colorToInt)
  Color? changeBtnTextColor; // 切换号码文案颜色
  bool showChangeBtn = true; // 显示切换号码按钮
  // 三方登录
  bool showWXLogin = false; // 显示微信登录
  bool showQQLogin = false; // 显示QQ登录
  bool showAppleLogin = false; // 显示Apple登录
  bool showDouyinLogin = false; // 显示抖音登录

  //隐私栏
  bool setCheckBoxHidden = true; // 设置隐私条款的CheckBox是否隐藏（true：隐藏；false：不隐藏）
  @JsonKey(toJson: _colorToInt)
  Color? privacyColor; // 基础文字颜色
  @JsonKey(toJson: _colorToInt)
  Color? privacyAgreeColor; // 协议颜色
  /// 协议1，[协议名称,协议Url] -- 《用户服务协议》
  String? privacyOneName;
  String? privacyOneUrl;

  /// 协议2，[协议名称,协议Url] -- 《隐私政策》
  String? privacyTwoName;
  String? privacyTwoUrl;

  /// 隐私checkBox是否勾选，默认NO
  bool checkBoxIsChecked = false;

  //手机绑定
  bool isPhoneBind = false;
  String? sloganText;

  String? navMoreText = '';
  bool hideBackBtn = false;
  bool privacyState = false;

  bool hideBackBtnFromSmallAccount = true; // 小号使用

  /// 请使用[OneKeyLoginUiConfig.auto]
  @protected
  @deprecated
  OneKeyLoginUiConfig();

  factory OneKeyLoginUiConfig.auto() {
    return SlpUiConfig()._initPrivacy();
  }

  /// 阿里云号码认证SDK 的自定义ui配置
  Map<String, dynamic> toAliJson() {
    return _$OneKeyLoginUiConfigToJson(this);
  }

  _initPrivacy() {
    privacyOneName = Platform.isIOS
        ? '《${BaseK.K.base_user_service_protcol_2}》'
        : BaseK.K.base_user_service_protcol_2;
    privacyOneUrl = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
    privacyTwoName = Platform.isIOS
        ? '《${BaseK.K.base_privacy_policy_2}》'
        : BaseK.K.base_privacy_policy_2;
    privacyTwoUrl = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
    return this;
  }

  initPlatformShowState() async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> validPlatforms = await loginManager.getValidPlatform();
    for (IThirdPlatform platform in validPlatforms) {
      switch (platform.tag()) {
        case 'wechat':
          showWXLogin = true;
          break;
        case 'qq':
          showQQLogin = true;
          break;
        case 'apple':
          showAppleLogin = Platform.isIOS;
          break;
        case 'douyin':
          showDouyinLogin = false;
          break;
      }
    }
  }
}

/// 快乐星球
class SlpUiConfig extends OneKeyLoginUiConfig {
  @override
  Color? privacyAgreeColor = Colors.black;

  @override
  Color? privacyColor = Colors.black26;
}
