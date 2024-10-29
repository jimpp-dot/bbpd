import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';

class GuessGiftRepo {
  /// 礼物猜猜乐首页
  static Future<ApiGuessGiftPreferencesResponse> getGuessGiftPreferences(
      int rid) async {
    String url = '${System.domain}go/room/guessgift/preferences';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': '$rid'});
      return ApiGuessGiftPreferencesResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiGuessGiftPreferencesResponse(
          success: false, message: e.toString());
    }
  }

  /// 礼物猜猜乐 榜单
  static Future<ApiGuessGiftRankResponse> getGuessGiftRank(int page) async {
    String url = '${System.domain}go/room/guessgift/rank';
    try {
      XhrResponse response = await Xhr.postPb(url, {'page': '$page'});
      return ApiGuessGiftRankResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiGuessGiftRankResponse(success: false, message: e.toString());
    }
  }

  /// 礼物猜猜乐 下单
  static Future<NormalNull> orderGuessGift(
      int rid, int receiveUid, int money, String params) async {
    String url = '${System.domain}go/room/guessgift/order';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'receiver': '$receiveUid',
        'payMoney': '$money',
        'params': params
      });
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 礼物猜猜乐 收礼
  static Future<NormalNull> receiveGuessGift(
      int? rid, int guessId, int boxId) async {
    String url = '${System.domain}go/room/guessgift/receive';
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'rid': '$rid', 'guessId': '$guessId', 'boxId': '$boxId'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
