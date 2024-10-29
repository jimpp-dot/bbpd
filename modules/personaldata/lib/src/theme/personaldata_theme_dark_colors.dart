import 'dart:ui';
import 'package:personaldata/src/theme/personaldata_theme_colors.dart';

class PersonaldataThemeDarkColors extends PersonaldataThemeColors {
  PersonaldataThemeDarkColors() {
    infoBgColor = const Color(0x0AFFFFFF); // 学历信息背景字体
    infoColor = const Color(0x57FFFFFF); // 学历信息字体
    tabBarTextColor = const Color(0xE6FFFFFF); // tab上的字体色
    tagAddBgColor = const Color(0xFF6DD3FF); // 标签add背景
    tagBorderColor = const Color(0xFF6DD3FF); // 标签边框
    progressBgColor = const Color(0x29FFFFFF); // 陪伴记进度背景
    secondTextColor = const Color(0x80FFFFFF); // 二级个人信息
    dividerColor = const Color(0x1AFFFFFF); // 声音分割线
    chatBgColor = const Color(0xFF221B5B); // 聊天背景
    giftWallColor = const Color(0x66FFFFFF); // 礼物墙字体
  }
}
