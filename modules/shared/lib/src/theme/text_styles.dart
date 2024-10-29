import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// TextStyle基础类
///
/// fontSize和fontWeight一般无需替换，使用预定义的即可，
/// 改变color的话，可调用[textStyle.copyWith(color: R.color.xxx)]
/// 一般从[_w100],[_w200],[_w300],[_w400]中取值
class TextStyles {
  /// 基础text style
  TextStyle medium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle regular10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle moneyNumStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: R.color.mainTextColor,
    fontFamily: Util.numFontFamily,
    fontStyle: FontStyle.italic,
  );

  TextStyle appBarAction =
      TextStyle(fontSize: 14, color: R.color.mainTextColor);
  TextStyle settingMain = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );
  TextStyle subTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: R.color.secondTextColor,
    fontFamily: Util.fontFamily,
  );
  TextStyle settingTrailing = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: R.color.secondTextColor,
    fontFamily: Util.fontFamily,
  );
  TextStyle settingHotUserBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: R.color.secondTextColor,
    fontFamily: Util.fontFamily,
  );
  TextStyle settingHotUserHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: R.color.secondBgColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle appBarActionHighLight = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: R.color.mainBrandColor);
  TextStyle secondAccentText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: R.color.mainBrandColor);
  TextStyle inputHint = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: R.color.secondBgColor);
  TextStyle bottomBar = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: R.color.mainTextColor);

  TextStyle defaultButtonText = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: Util.fontFamily,
  );
  TextStyle defaultButtonTextUnselected = TextStyle(
    fontSize: 14,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );

  TextStyle title = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: R.color.mainTextColor,
      fontFamily: Util.fontFamily);
  TextStyle subtitle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: R.color.mainTextColor,
      fontFamily: Util.fontFamily);
  TextStyle subhead = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: R.color.mainTextColor,
      fontFamily: Util.fontFamily);
  TextStyle body1 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: R.color.mainTextColor,
      fontFamily: Util.fontFamily);
  TextStyle body2 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: R.color.secondTextColor,
      fontFamily: Util.fontFamily);
  TextStyle button = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: R.color.mainTextColor,
      fontFamily: Util.fontFamily);
  TextStyle caption = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: R.color.thirdTextColor,
      fontFamily: Util.fontFamily);
  TextStyle subCaption = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: R.color.thirdTextColor,
      fontFamily: Util.fontFamily);
  TextStyle trailing = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: R.color.thirdTextColor,
      fontFamily: Util.fontFamily);

  TextStyle operateButtonText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontFamily: Util.fontFamily,
  );
  TextStyle operateButtonTextUnselected = TextStyle(
    fontSize: 12,
    color: R.color.mainTextColor,
    fontFamily: Util.fontFamily,
  );
}
