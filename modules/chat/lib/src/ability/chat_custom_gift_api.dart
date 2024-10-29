import 'package:shared/shared.dart';

class CustomGiftAPI {
  static String get basePath => '${System.domain}go/yy/cloud';

  ///获取自定义礼物列表
  static Future<ResCloudCustomGiftList> getCustomGiftList() async {
    String url = '$basePath/customGiftList';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResCloudCustomGiftList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCloudCustomGiftList(msg: e.toString(), success: false);
    }
  }

  ///保存自定义礼物
  static Future<NormalNull> saveCustomGift(int giftId) async {
    String url = '$basePath/saveCustomGift';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'gift_id': '$giftId',
          },
          pb: true,
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
