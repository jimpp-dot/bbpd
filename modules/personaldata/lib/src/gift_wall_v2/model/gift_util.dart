import '../../../assets.dart';

class GiftUtil {
  static String getGiftBgInDialog(int type, bool long) {
    String bg = long
        ? Assets.personaldata$gift_wall_gift_bg_dialog_pz_long_webp
        : Assets.personaldata$gift_wall_gift_bg_dialog_pz_webp;
    switch (type) {
      case 1:
        bg = long
            ? Assets.personaldata$gift_wall_gift_bg_dialog_pz_long_webp
            : Assets.personaldata$gift_wall_gift_bg_dialog_pz_webp;
        break;
      case 2:
        bg = long
            ? Assets.personaldata$gift_wall_gift_bg_dialog_hh_long_webp
            : Assets.personaldata$gift_wall_gift_bg_dialog_hh_webp;
        break;
      case 3:
        bg = long
            ? Assets.personaldata$gift_wall_gift_bg_dialog_cq_long_webp
            : Assets.personaldata$gift_wall_gift_bg_dialog_cq_webp;
        break;
      case 4:
        bg = long
            ? Assets.personaldata$gift_wall_gift_bg_dialog_sj_long_webp
            : Assets.personaldata$gift_wall_gift_bg_dialog_sj_webp;
        break;
    }
    return bg;
  }

  static String getGiftBgMain(int type) {
    String bg = Assets.personaldata$gift_wall_gift_bg_main_pz_webp;
    switch (type) {
      case 1:
        bg = Assets.personaldata$gift_wall_gift_bg_main_pz_webp;
        break;
      case 2:
        bg = Assets.personaldata$gift_wall_gift_bg_main_hh_webp;
        break;
      case 3:
        bg = Assets.personaldata$gift_wall_gift_bg_main_cq_webp;
        break;
      case 4:
        bg = Assets.personaldata$gift_wall_gift_bg_main_sj_webp;
        break;
    }
    return bg;
  }

  static String getBtnBg(int type) {
    String bg = Assets.personaldata$gift_wall_gift_bg_btn_bg_pz_webp;
    switch (type) {
      case 1:
        bg = Assets.personaldata$gift_wall_gift_bg_btn_bg_pz_webp;
        break;
      case 2:
        bg = Assets.personaldata$gift_wall_gift_bg_btn_bg_hh_webp;
        break;
      case 3:
        bg = Assets.personaldata$gift_wall_gift_bg_btn_bg_cq_webp;
        break;
      case 4:
        bg = Assets.personaldata$gift_wall_gift_bg_btn_bg_sj_webp;
        break;
    }
    return bg;
  }
}
