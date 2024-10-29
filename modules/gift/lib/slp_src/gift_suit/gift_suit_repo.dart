import 'package:shared/shared.dart';
import 'package:gift/slp_src/gift_suit/pb/generated/gift_suit.pb.dart';
import 'package:gift/slp_src/gift_suit/pb/generated/room_gift_suit.pb.dart';

class GiftSuitRepo {
  static Future<GetSuitInfoResp> rewardPanel(int giftId) async {
    try {
      String url = '${System.domain}go/yy/giftSuit/getSuitInfo?gift_id=$giftId';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      GetSuitInfoResp res = GetSuitInfoResp.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return GetSuitInfoResp(success: false, msg: e.toString());
    }
  }

  static Future<GetRoomFrameListResp> roomSettingPanel(int rid) async {
    try {
      String url =
          '${System.domain}go/room/roomGiftSuit/getRoomFrameList?rid=$rid';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      GetRoomFrameListResp res =
          GetRoomFrameListResp.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return GetRoomFrameListResp(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> setRoomFrame(int rid, int showId) async {
    String url = '${System.domain}go/room/roomGiftSuit/setRoomFrame';
    try {
      final response = await Xhr.post(url, {'rid': '$rid', 'showId': '$showId'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> cancelRoomFrame(int rid, int showType) async {
    String url = '${System.domain}go/room/roomGiftSuit/cancelRoomFrame';
    try {
      final response = await Xhr.post(
          url, {'rid': '$rid', 'showType': '$showType'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
