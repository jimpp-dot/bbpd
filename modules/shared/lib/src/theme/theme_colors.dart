import 'package:flutter/material.dart';

/// 注意：加Color前慎重，避免颜色值膨胀、重复！
class ThemeColors {
  Brightness statusBarTheme = Brightness.dark;

  /// ----------  快乐星球UI的新色值  ---------- 5AFFF0
  Color mainBrandColor = const Color(0xFFC1FF25); // 品牌颜色

  /// 文本
  Color mainTextColor = Colors.white; // 主标题：黑/白 90%
  Color secondTextColor = Colors.white.withOpacity(0.7); // 文案：黑/白 70%
  Color second2TextColor = Colors.white.withOpacity(0.8);
  Color thirdTextColor = Colors.white.withOpacity(0.7); // 弱文案：黑/白 70%
  Color brightTextColor = Colors.black; // 按钮文本颜色：白/黑
  Color reversedTextColor = const Color(0xE6FFFFFF); // 主标题：白/黑 90%
  Color tagTextColor = const Color(0xFF98C4F8);
  Color tagTextV2Color = const Color(0xFFB86DFF);
  Color highlightColor = const Color(0xFF926AFF); // 文本中强调的颜色
  Color soundTextColor = const Color(0xFF7D2EE6); // 声音简介
  Color tipsTextColor = const Color(0x80000000); // 提示文案颜色

  ///背景
  Color mainBgColor = const Color(0xFF17151D); // 主背景颜色
  Color homeBgColor = const Color(0xFF17151D); // 首页背景颜色
  Color homeSecondBgColor = const Color(0xFF17151D); // 二级页背景颜色
  Color homeSecondModuleBgColor = const Color(0xFF17151D); // 二级页模块背景颜色
  Color moduleBgColor = const Color(0x0A22524D); // 模块背景颜色 -> VIP等级
  Color brightBgColor = const Color(0x1F7D2EE6); // 高亮背景颜色
  Color bubbleBgColor = const Color(0xFFFFFFFF); // 气泡颜色
  Color minorBgColor = const Color(0xFFEDEFF4); // 次要背景颜色
  Color balanceBgColor = const Color(0x0F7D2EE6); //钱包背景色 6%
  Color tagBgColor = const Color(0xFFD642E1); // 标签背景
  Color dialogBgColor = const Color(0xFF262629); // 标签背景
  Color userVipBgColor = const Color(0xFF17151D); //用户vip背景色
  Color popMenuBgColor = const Color(0xFF16181C); //menu背景颜色

  /// 导航栏
  Color homeSearchBgColor = const Color(0x99FFFFFF); // 首页搜索Bar背景颜色
  Color bottomBarColor = const Color(0xFF16181C); // 导航栏颜色
  Color appBarColor = const Color(0xFFB2F3FD); // AppBar背景色

  /// 边框
  Color symbolBorderColor = const Color(0xFFEAEAFF); // 派对边框颜色
  Color subTabBorderColor = const Color(0xCCFFFFFF); // 首页二级Tab边框颜色
  Color chargeBorderColor = const Color(0xFF7D2EE6); // 充值选中态边框色
  Color soundBorderColor = const Color(0x1A313131); // 声音简介边框

  ///分割线
  Color dividerColor = const Color(0x14000000); // 分割线：黑/白 8%
  Color dividerColorBold = const Color(0xFFEDEDFF); // 设置页大分割线

  ///渐变
  List<Color> mainBrandGradientColors = const [Color(0xFFDDFF43), Color(0xFF51CE85)]; // 按钮渐变色
  List<Color> secondBrandGradientColors = const [Color(0xFFDDFF43), Color(0xFF51CE85)];
  List<Color> darkGradientColors = const [Color(0xFFDDFF43), Color(0xFF51CE85)];
  List<Color> translateGradientColors = const [Colors.transparent, Colors.transparent];

  List<Color> darkGradientColorsDisable = [const Color(0xFFD5D8E0).withOpacity(0.5), const Color(0xFFE4E7EE).withOpacity(0.5)];

  List<Color> companyGradientColors = const [Color(0xFFF89EE7), Color(0xFF5BE9FF)]; // 陪伴记进度渐变
  List<Color> tagGradientColors = const [Color(0xFFE1EAFF), Color(0xFFE9F5FB)];
  List<Color> textGradientColors = [const Color(0xFFF06D11), const Color(0xFFF0A662)];

  /// 其它
  Color thirdBrightColor = const Color(0xFFFF5F7D); // 红点亮色
  Color mallTopTipBgColor = const Color(0xFF7D2EE6).withOpacity(0.1); // 商城顶部tip背景
  Color mallTopModuleBgColor = const Color(0xFFFFFFFF); // 商城top模块背景
  Color mallItemBgColor = const Color(0xFFFFFFFF); // 商城item背景
  Color locationColor = const Color(0xFF666666).withOpacity(0.5); // 定位颜色

  /// ----------  以前老色值  ----------
  Color unionRankText1 = Colors.white;
  Color unionRankText2 = Colors.white;
  Color secondBgColor = const Color(0xFF0B0224).withOpacity(0.07); // 二级背景颜色
  Color thirdBgColor = const Color(0xFFE6E6E6); // 三级背景颜色
  Color fourthBgColor = const Color(0x147D2EE6); // 四级背景颜色
  Color secondaryBrandColor = const Color(0xFFFF4981); // 辅助品牌色
  Color fourthBrightColor = const Color(0xFFFD7B08);
  Color fiveBrightColor = const Color(0xFF2EFECE);

  /// Switch开关
  Color switchActiveColor = const Color(0xFF926AFF); // 主题色
  Color switchInActiveColor = const Color(0xFFE6E6E6);

  /// 光标颜色
  Color custorInputColor = const Color(0xFF5AFFF0); // 声音简介边框

  /// 男女标签
  List<Color> maleGradientColors = const [Color(0xFFBDDFFF), Color(0xFFBDDFFF)]; //男生标签
  List<Color> femaleGradientColors = const [Color(0xFFF7C6E4), Color(0xFFF7C6E4)]; //女生标签

  Color cursorColor = const Color(0xFF5AFFF0); // 游标颜色
  Color checkSelectedColor = const Color(0xFFC1FF25); // 选中颜色
  Color checkUnSelectedColor = const Color(0xFFE7E7F4); // 未中颜色
  List<Color> darkLoginBtnGradientColors = const [Color(0xFFD642E1), Color(0xFF7764E0)];
  List<Color> darkLoginBtnGradientColorsWithDisable = [const Color(0xFFD642E1).withOpacity(0.5), const Color(0xFF7764E0).withOpacity(0.5)];

  List<Color> listItemBg = [Colors.white.withOpacity(0.07), Colors.white.withOpacity(0.07)];

  List<Color> listItemBgWithTransparent = [Colors.transparent, Colors.transparent];

  static Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF818181).withOpacity(0.2),
      Color(0xFFA6A6A6).withOpacity(0.2),
    ],
  );
}
