import 'package:shared/shared.dart';

class GiftWallApi {
  /// 礼物图鉴主页数据 uid:用户uid，type:{send:赠送，receive:收集,空：默认}
  static Future<GiftHandbookHomeRsp> getGiftWallHome(int uid,
      {String? type}) async {
    String url = '${System.domain}go/yy/gift-handbook/home';
    Map<String, String> params = {'uid': '$uid', 'typ': type ?? ''};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return GiftHandbookHomeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftHandbookHomeRsp(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,礼物list
  static Future<GiftHandbookGiftListRsp> getGiftList(
      int uid, String type, String seriesType, String sortType, String isasc,
      {int page = 0, int pageSize = 0, int giftId = 0}) async {
    String url = '${System.domain}go/yy/gift-handbook/giftList';
    Map<String, String> params = {
      'uid': '$uid',
      'typ': type,
      'series_type': seriesType,
      'sort_type': sortType,
      'isasc': isasc,
      'page': '$page',
      'page_size': '$pageSize',
      'gift_id': '$giftId'
    };
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return GiftHandbookGiftListRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftHandbookGiftListRsp(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,礼物觉醒 type:{send:赠送，receive:收集}}
  static Future<GiftBookAwakeRsp> awakeGift(int giftId, String type,
      {String? isGetEffectUrl, int rid = 0}) async {
    String url = '${System.domain}go/yy/gift-handbook/awake';
    Map<String, String> params = {
      'gift_id': '$giftId',
      'typ': type,
      'rid': '$rid'
    };
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return GiftBookAwakeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftBookAwakeRsp(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,觉醒任务
  static Future<AwakeTaskRsp> getAwakeTask(
      int uid, String type, String seriesType) async {
    String url = '${System.domain}go/yy/gift-handbook/awakeTask';
    Map<String, String> params = {
      'uid': '$uid',
      'typ': type,
      'series_type': seriesType
    };
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return AwakeTaskRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return AwakeTaskRsp(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,领取升级奖励
  static Future<NormalNull> getSingleAward(
      String type, String seriesType, int level) async {
    String url = '${System.domain}go/yy/gift-handbook/takeAwakeReward';
    Map<String, String> params = {
      'typ': type,
      'series_type': seriesType,
      'level': "$level"
    };
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,一键领取所有奖励
  static Future<NormalNull> getAwardsAll() async {
    String url = '${System.domain}go/yy/gift-handbook/takeAllAwakeReward';
    Map<String, String> params = {};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,获取24小时热门房间rid
  static Future<LightJumpRsp> getHotRoom() async {
    String url = '${System.domain}go/yy/gift-handbook/lightJump';
    Map<String, String> params = {};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return LightJumpRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return LightJumpRsp(msg: e.toString(), success: false);
    }
  }

  static Future<LightScoreHomeRsp> getLightPoints() async {
    String url = '${System.domain}go/yy/gift-handbook/lightScoreHome';
    Map<String, String> params = {};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return LightScoreHomeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return LightScoreHomeRsp(msg: e.toString(), success: false);
    }
  }

  /// 获取点亮积分榜单
  static Future<LightScoreRankRsp> getLightPointsRank() async {
    String url = '${System.domain}go/yy/gift-handbook/lightScoreRank';
    Map<String, String> params = {};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return LightScoreRankRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return LightScoreRankRsp(msg: e.toString(), success: false);
    }
  }

  /// 礼物图鉴,擦除点亮人
  static Future<NormalNull> eraseLighter(String type, int giftId) async {
    String url = '${System.domain}go/yy/gift-handbook/eraser';
    Map<String, String> params = {"typ": type, "gid": "$giftId"};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 获取神豪家榜单
  static Future<WealthyCollectorRankRsp> getGiverRank(
      String sid, String seriesType) async {
    String url = '${System.domain}go/yy/gift-handbook/wealthyCollectorRank';
    Map<String, String> params = {'sid': sid, 'typ': seriesType};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return WealthyCollectorRankRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return WealthyCollectorRankRsp(msg: e.toString(), success: false);
    }
  }
}
