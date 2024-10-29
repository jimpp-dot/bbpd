import 'package:gift/k.dart';

import 'package:shared/shared.dart';

import 'model/pb/generated/auction_tip.pb.dart';
import 'model/pb/generated/group_list.pb.dart';

class GiftApi {
  static Future<ResRocketAssemblyGift> getRocketAssemblyGift(int rid) async {
    XhrResponse response = await Xhr.get("${System.domain}go/yy/gift/assembly",
        queryParameters: {'rid': '$rid'}, pb: true);
    try {
      ResRocketAssemblyGift data =
          ResRocketAssemblyGift.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResRocketAssemblyGift(msg: e.toString(), success: false);
    }
  }

  /// 检测敏感词
  static Future<NormalNull> checkWords(String text) async {
    String url = '${System.domain}go/yy/roombirthday/checkwords';
    NormalNull resp;
    try {
      XhrResponse response = await Xhr.post(url, {'words': text}, pb: true);
      resp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = NormalNull(msg: e.toString(), success: false);
    }
    if (!resp.success) {
      Fluttertoast.showToast(
          msg: K.gift_blessing_words_tips, gravity: ToastGravity.CENTER);
    }
    return resp;
  }

  /// 拍卖 送欧气 说明
  static Future<ApiAuctionOchResponse> getAuctionBlessDesc(int rid) async {
    String url = '${System.domain}go/room/auction/och';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': '$rid'});
      return ApiAuctionOchResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiAuctionOchResponse(message: e.toString(), success: false);
    }
  }

  /// 标签礼物
  static Future<ResGiftImpressionDetail> getcTagGiftsInfo(
      int giftId, int reciverId) async {
    String url = '${System.domain}go/yy/gift/impressionDetail';
    try {
      XhrResponse response = await Xhr.get(url,
          pb: true, queryParameters: {'gift_id': giftId, 'uid': reciverId});
      return ResGiftImpressionDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftImpressionDetail(success: false, msg: e.toString());
    }
  }

  ///标签礼物排行榜
  static Future<ResGiftImpressionRank> getcTagGiftRank(int tagId) async {
    String url = '${System.domain}go/yy/gift/impressionRank';
    try {
      XhrResponse response =
          await Xhr.get(url, pb: true, queryParameters: {'tag_id': tagId});
      return ResGiftImpressionRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftImpressionRank(success: false, msg: e.toString());
    }
  }

  ///道具体验卡 - 使用
  static Future<NormalNull> useExpcard(int cid, int rid, {int num = 1}) async {
    String url = '${System.domain}go/room/expcard/use';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'cid': '$cid', 'rid': '$rid', 'num': '$num'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  ///道具体验卡 - 校验
  static Future<ApiExpCardCheckResponse> checkExpcard(int cid, int rid,
      {int num = 1}) async {
    String url = '${System.domain}go/room/expcard/check';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'cid': '$cid', 'rid': '$rid', 'num': '$num'});
      return ApiExpCardCheckResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiExpCardCheckResponse(success: false, message: e.toString());
    }
  }

  /// 礼物组合配置详情
  ///
  /// ## 参数
  /// - [rid]：房间ID
  /// - [combineId]：礼物组合ID
  ///
  /// ## 返回值
  /// 返回礼物组合配置详情模型
  static Future<ResGiftCombineDetail> giftCombineDetail(
      int rid, int combineId) async {
    try {
      XhrResponse response = await Xhr.postPb('go/yy/gift/combineDetail',
          {'rid': '$rid', 'combine_id': '$combineId'});
      return ResGiftCombineDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftCombineDetail(success: false, msg: e.toString());
    }
  }

  /// 印象标记礼物
  static Future<ResGiftImpressionDetail> getImpressionTagGiftsInfo(
      int reciverId) async {
    String url = '${System.domain}go/yy/gift/impressionDetail';
    try {
      XhrResponse response = await Xhr.get(url,
          pb: true, queryParameters: {'uid': reciverId, 'v': 2});
      return ResGiftImpressionDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftImpressionDetail(success: false, msg: e.toString());
    }
  }

  /// 涂鸦礼物列表
  static Future<ResGraffitiGift> getGraffitiGiftList() async {
    String url = '${System.domain}go/yy/gift/graffitiGift';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResGraffitiGift.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGraffitiGift(success: false, msg: e.toString());
    }
  }
}
