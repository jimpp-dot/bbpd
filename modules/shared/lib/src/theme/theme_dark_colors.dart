import 'package:flutter/material.dart';
import 'theme_colors.dart';

/// 注意：加Color前慎重，避免颜色值膨胀、重复！
class ThemeDarkColors extends ThemeColors {
  ThemeDarkColors() {
    statusBarTheme = Brightness.dark;

    /// ----------  快乐星球UI的新色值  ----------
    /// 文本
    mainTextColor = Colors.white; // 主标题：黑/白 90%
    secondTextColor = Colors.white.withOpacity(0.7); // 文案：黑/白 70%
    second2TextColor = Colors.white.withOpacity(0.8);
    thirdTextColor = Colors.white.withOpacity(0.7);
    brightTextColor = Colors.black; // 按钮文本颜色
    reversedTextColor = const Color(0xE6000000); // 主标题：白/黑 90%
    tagTextColor = const Color(0xFF6CFFFF);
    tagTextV2Color = const Color(0xFFB86DFF);
    highlightColor = tagTextColor;
    soundTextColor = const Color(0xFFFFFFFF); // 声音简介
    tipsTextColor = const Color(0x80FFFFFF); // 提示文案颜色

    ///背景
    mainBgColor = const Color(0xFF17151D); // 主背景颜色
    homeBgColor = const Color(0xFF17151D); // 首页背景颜色
    homeSecondBgColor = const Color(0xFF17151D); // 二级页背景颜色
    homeSecondModuleBgColor = const Color(0xFF17151D); // 二级页模块背景颜色
    moduleBgColor = const Color(0x14FFFFFF); // 模块背景颜色
    brightBgColor = const Color(0x527D2EE6); // 高亮背景颜色
    bubbleBgColor = const Color(0xFF372F75); // 气泡颜色
    minorBgColor = const Color(0xFF221B5B); // 次要背景颜色
    balanceBgColor = const Color(0xFF221B5B); //钱包背景色
    tagBgColor = const Color(0x0F6CFFFF); // 标签背景
    dialogBgColor = const Color(0xFF262629); // 标签背景
    userVipBgColor = const Color(0xFF17151D); //用户vip背景色
    popMenuBgColor = const Color(0xFF16181C); //menu背景颜色
    /// 导航栏
    homeSearchBgColor = const Color(0x0FFFFFFF); // 首页搜索Bar背景颜色
    bottomBarColor = const Color(0xFF16181C); // 导航栏颜色
    appBarColor = const Color(0xFF080A31); // AppBar背景色

    /// 边框
    symbolBorderColor = const Color(0xFF221B5B); // 派对边框颜色
    subTabBorderColor = const Color(0xFF221B5B); // 首页二级Tab边框颜色
    chargeBorderColor = const Color(0xFF6CFFFF); // 充值选中态边框色
    soundBorderColor = const Color(0x1AFFFFFF); // 声音简介边框

    /// 光标颜色
    custorInputColor = const Color(0xFF5AFFF0); // 声音简介边框

    ///分割线
    dividerColor = const Color(0x14FFFFFF); //分割线：黑/白 8%
    dividerColorBold = const Color(0xFF060721); // 设置页大分割线

    /// 渐变

    mainBrandGradientColors = const [
      Color(0xFFDDFF43),
      Color(0xFF51CE85)
    ]; // 按钮渐变色
    secondBrandGradientColors = const [Color(0xFFDDFF43), Color(0xFF51CE85)];
    darkGradientColors = const [Color(0xFFDDFF43), Color(0xFF51CE85)];
    tagGradientColors = const [
      Color(0x3399FFBC),
      Color(0x3326C4FF),
      Color(0x33926AFF)
    ];
    textGradientColors = [const Color(0xFFF0A672), const Color(0xFFF0D7C1)];

    darkGradientColorsDisable = [
      const Color(0xFF51CE85).withOpacity(0.5),
      const Color(0xFFDDFF43).withOpacity(0.5)
    ];

    ///其它
    locationColor = const Color(0xFFFFFFFF).withOpacity(0.5); // 定位颜色
    mallTopTipBgColor = const Color(0xFF6CFFFF).withOpacity(0.1); // 商城顶部tip背景
    mallTopModuleBgColor = const Color(0xFF27216C); // 商城top模块背景
    mallItemBgColor = const Color(0xFF221B5B); // 商城item背景

    maleGradientColors = const [Color(0xFFBDDFFF), Color(0xFFBDDFFF)]; //男生标签
    femaleGradientColors = const [Color(0xFFF7C6E4), Color(0xFFF7C6E4)]; //女生标签

    /// ----------  以前老色值  ----------
    secondBgColor = Colors.white.withOpacity(0.07); // 二级背景颜色
    thirdBgColor = const Color(0xFF2d2476); // 三级背景颜色
    cursorColor = const Color(0xFF5AFFF0); // 游标颜色
    checkSelectedColor = const Color(0xFFD642E1); // 选中颜色
    checkUnSelectedColor = const Color(0xFFE7E7F4); // 未中颜色
    listItemBg = [
      Colors.white.withOpacity(0.07),
      Colors.white.withOpacity(0.07)
    ];
    listItemBgWithTransparent = [Colors.transparent, Colors.transparent];
  }
}
