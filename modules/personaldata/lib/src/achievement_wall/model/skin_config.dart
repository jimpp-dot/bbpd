import 'package:flutter/cupertino.dart';
import 'package:personaldata/assets.dart';

class SkinItem {
  ///皮肤id
  int skinId;

  /// 主题色
  Color textColor;

  ///勋章列表背景色
  Color bgColor;

  ///主页背景色
  Color mainColor;

  /// 主题渐变色
  Gradient gradient;

  /// 入口背景渐变
  Gradient entranceGradient;

  /// 主页背景
  String bg;

  /// (成就勋章)
  String text;

  /// 入口logo
  String entranceLogo;

  SkinItem(
      this.skinId,
      this.textColor,
      this.bgColor,
      this.mainColor,
      this.gradient,
      this.entranceGradient,
      this.bg,
      this.text,
      this.entranceLogo);
}

class SkinConfig {
  static int? _previewId;

  static void setPreviewId(int id) {
    if (id < 0 || id > configs.length) {
      return;
    }
    _previewId = id;
  }

  static get previewId => _previewId;

  static void resetSkin() {
    _previewId = null;
  }

  static List<SkinItem> get configs => [
        SkinItem(
            0,
            const Color(0xFFCCBCBC),
            const Color(0xFF2E2E45),
            const Color(0xFF1D1D2B),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFD5C9C9),
                  Color(0xFFF9EFEC),
                  Color(0xFFCCBCBC),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xFF25253D), Color(0xFF46445C)]),
            Assets.personaldata$achievement_wall_level_skin_0_webp,
            Assets.personaldata$achievement_wall_level_text_0_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_0_webp),
        SkinItem(
            1,
            const Color(0xFFD9A99E),
            const Color(0xFF452F31),
            const Color(0xFF2C1E1F),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFE6C8C1),
                  Color(0xFFFADED7),
                  Color(0xFFD9A99E),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xFF3D2729), Color(0xFF5C3B3C)]),
            Assets.personaldata$achievement_wall_level_skin_1_webp,
            Assets.personaldata$achievement_wall_level_text_1_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_1_webp),
        SkinItem(
            2,
            const Color(0xFFAFCED5),
            const Color(0xFF2B3A4D),
            const Color(0xFF1C2632),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFB4D9E0),
                  Color(0xFFE0F9FE),
                  Color(0xFFAFCED5),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFF222F3D),
                  Color(0xFF455366),
                ]),
            Assets.personaldata$achievement_wall_level_skin_2_webp,
            Assets.personaldata$achievement_wall_level_text_2_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_2_webp),
        SkinItem(
            3,
            const Color(0xFFEBD89A),
            const Color(0xFF422816),
            const Color(0xFF28180D),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFEBDEB3),
                  Color(0xFFFAF1D2),
                  Color(0xFFEBD89A),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFF52311B),
                  Color(0xFF755A3F),
                ]),
            Assets.personaldata$achievement_wall_level_skin_3_webp,
            Assets.personaldata$achievement_wall_level_text_3_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_3_webp),
        SkinItem(
            4,
            const Color(0xFFA7C5F2),
            const Color(0xFF172945),
            const Color(0xFF0F1A2C),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFB5D1FA),
                  Color(0xFFE0ECFE),
                  Color(0xFFA7C5F2),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFF0E2652),
                  Color(0xFF1F3E8F),
                ]),
            Assets.personaldata$achievement_wall_level_skin_4_webp,
            Assets.personaldata$achievement_wall_level_text_4_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_4_webp),
        SkinItem(
            5,
            const Color(0xFFF1C48D),
            const Color(0xFF2F2140),
            const Color(0xFF1B1325),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFFADEB5),
                  Color(0xFFFEF0D5),
                  Color(0xFFF1C48D),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xFF391D52), Color(0xFF5F386B)]),
            Assets.personaldata$achievement_wall_level_skin_5_webp,
            Assets.personaldata$achievement_wall_level_text_5_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_5_webp),
        SkinItem(
            6,
            const Color(0xFFF1A88D),
            const Color(0xFF30211D),
            const Color(0xFF160F0D),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFFACCB5),
                  Color(0xFFFEE5D5),
                  Color(0xFFF1A88D),
                ]),
            const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xFF4D291C), Color(0xFF6B4327)]),
            Assets.personaldata$achievement_wall_level_skin_6_webp,
            Assets.personaldata$achievement_wall_level_text_6_webp,
            Assets.personaldata$achievement_wall_level_entrance_lcon_6_webp),
      ];
}
