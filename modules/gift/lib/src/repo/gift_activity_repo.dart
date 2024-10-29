import 'package:shared/shared.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';

class GiftPackCenterRepo {
  static String get basePath => '${System.domain}go/yy/giftpack';

  ///获取觉醒
  static Future<AutoWakeInfoRsp> getawakeInfo(int giftId) async {
    String url = 'go/yy/gift-handbook/autoWakeInfo';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'gid': '$giftId'}, pb: true, throwOnError: true);
      return AutoWakeInfoRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return AutoWakeInfoRsp(msg: e.toString(), success: false);
    }
  }

  ///获取礼包中心Tab
  static Future<ResGiftPackCenterTabs> getCenterTab() async {
    String url = '$basePath/centerTab?version=1';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResGiftPackCenterTabs.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackCenterTabs(msg: e.toString(), success: false);
    }
  }

  ///获取每日充值礼包详情
  static Future<ResGiftPackDailyConfig> getGiftPackDailyConfig() async {
    String url = '$basePath/daily';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResGiftPackDailyConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackDailyConfig(msg: e.toString(), success: false);
    }
  }

  /// 获取往期祈福记录
  static Future<ResGiftPackPrayHistory> getPrayHistory() async {
    String url = '$basePath/prayHistory';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResGiftPackPrayHistory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackPrayHistory(msg: e.toString(), success: false);
    }
  }

  /// 获取奖券记录
  static Future<ResGiftPackCouponLog> getCouponRecords() async {
    String url = '$basePath/couponLog';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResGiftPackCouponLog.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackCouponLog(msg: e.toString(), success: false);
    }
  }

  /// 获取我的祈福记录
  static Future<ResGiftPackPrayHistory> getMyPrayHistory() async {
    String url = '$basePath/myPrayHistory';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResGiftPackPrayHistory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackPrayHistory(msg: e.toString(), success: false);
    }
  }

  /// 获取祈福奖励
  static Future<ResGiftPackGetPrayAward> getPrayAward(int id) async {
    String url = '$basePath/prayAward';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'id': '$id',
          },
          pb: true,
          throwOnError: false);
      return ResGiftPackGetPrayAward.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackGetPrayAward(msg: e.toString(), success: false);
    }
  }

  ///打开宝箱
  static Future<ResGiftPackOpen> openDailyGiftPack(
      String type, int count) async {
    String url = '$basePath/open';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'type': type,
            'count': '$count',
          },
          pb: true,
          throwOnError: false);
      return ResGiftPackOpen.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftPackOpen(msg: e.toString(), success: false);
    }
  }
}
