import 'package:shared/shared.dart';

class ResourceManager {
  static const String bgMainDialog = 'static/zodiac/bg_main_dialog.webp';
  static const String bgResultDialog = 'static/zodiac/bg_result_dialog.webp';

  static String? animLight;
  static String? animSelect;

  static Future<void> precache() async {
    CachedImageManager.preCache(
        System.context, Util.getRemoteImgUrl(bgMainDialog));
    CachedImageManager.preCache(
        System.context, Util.getRemoteImgUrl(bgResultDialog));

    animLight = await cacheUrlWithTry(
        Util.getRemoteImgUrl('static/zodiac/anim_light_shining.webp'), 0,
        subDir: 'zodiac');
    animSelect = await cacheUrlWithTry(
        Util.getRemoteImgUrl('static/zodiac/anim_head.webp'), 0,
        subDir: 'zodiac');
  }
}
