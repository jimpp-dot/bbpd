// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OneKeyLoginUiConfigToJson(OneKeyLoginUiConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lightStatusBar', instance.lightStatusBar);
  writeNotNull('logoWidth', instance.logoWidth);
  writeNotNull('logoHeight', instance.logoHeight);
  writeNotNull('logoOffsetY', instance.logoOffsetY);
  writeNotNull('loginBtnText', instance.loginBtnText);
  writeNotNull('loginBtnTextColor', _colorToInt(instance.loginBtnTextColor));
  writeNotNull('loginBtnWidth', instance.loginBtnWidth);
  writeNotNull('loginBtnHeight', instance.loginBtnHeight);
  writeNotNull('numberColor', _colorToInt(instance.numberColor));
  writeNotNull('numberOffsetY', instance.numberOffsetY);
  writeNotNull('changeBtnText', instance.changeBtnText);
  writeNotNull('changeBtnTextColor', _colorToInt(instance.changeBtnTextColor));
  writeNotNull('showChangeBtn', instance.showChangeBtn);
  writeNotNull('showWXLogin', instance.showWXLogin);
  writeNotNull('showQQLogin', instance.showQQLogin);
  writeNotNull('showAppleLogin', instance.showAppleLogin);
  writeNotNull('showDouyinLogin', instance.showDouyinLogin);
  writeNotNull('setCheckBoxHidden', instance.setCheckBoxHidden);
  writeNotNull('privacyColor', _colorToInt(instance.privacyColor));
  writeNotNull('privacyAgreeColor', _colorToInt(instance.privacyAgreeColor));
  writeNotNull('isPhoneBind', instance.isPhoneBind);
  writeNotNull('sloganText', instance.sloganText);
  writeNotNull('navMoreText', instance.navMoreText);
  writeNotNull('hideBackBtn', instance.hideBackBtn);
  writeNotNull('privacyState', instance.privacyState);
  writeNotNull(
      'hideBackBtnFromSmallAccount', instance.hideBackBtnFromSmallAccount);
  writeNotNull('checkBoxIsChecked', instance.checkBoxIsChecked);
  writeNotNull('privacyOneName', instance.privacyOneName);
  writeNotNull('privacyOneUrl', instance.privacyOneUrl);
  writeNotNull('privacyTwoName', instance.privacyTwoName);
  writeNotNull('privacyTwoUrl', instance.privacyTwoUrl);
  return val;
}
