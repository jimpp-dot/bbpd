import 'package:shared/shared.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';

/// 礼物周星榜Api
class GiftWeekApi {
  /// 礼物周星榜配置
  /// [rid] 房间id,目前榜单入口只有房间内，不传房间id,则房间大人物相关数据为空
  /// [rankType] 排行类型 ，1.主播榜，2.平台周星，3.房间大人物，默认1
  static Future<GiftRankConfigRes> requestGiftWeekConfig(
      {int? rid, int rankType = 1}) async {
    try {
      String url = '${System.domain}go/mate/gift/rankConfig';
      final response = await Xhr.get(url,
          headers: Xhr.globalHeaders,
          queryParameters: {
            if (rid != null) 'rid': '$rid',
            'rank_type': '$rankType',
          },
          pb: true);
      return GiftRankConfigRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftRankConfigRes(msg: e.toString(), success: false);
    }
  }

  /// 单个礼物下的排行数据
  /// [rid] 房间id,目前榜单入口只有房间内，不传房间id,则房间大人物相关数据为空
  /// [rankType] 排行类型 ，1.主播榜，2.平台周星，3.房间大人物，默认1
  /// [duration] 1.本周，2.上周
  /// [giftId] 礼物id
  static Future<GiftRankListRes> requestGiftRankData({
    int? rid,
    int rankType = 1,
    int duration = 1,
    required int giftId,
  }) async {
    try {
      String url = '${System.domain}go/mate/gift/rank';
      final response = await Xhr.get(url,
          headers: Xhr.globalHeaders,
          queryParameters: {
            if (rid != null) 'rid': '$rid',
            'rank_type': '$rankType',
            'duration': duration,
            'gift_id': giftId,
          },
          pb: true);
      return GiftRankListRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftRankListRes(msg: e.toString(), success: false);
    }
  }
}
