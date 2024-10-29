import 'package:shared/shared.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../../protobuf/generated/online_list.pb.dart';

class MultiTabMsgRepo {
  /// 获取当前房间的公屏tab信息
  static Future<DrainagePreviewData?> getRoomMsgTab(int rid) async {
    try {
      String url = '${System.domain}go/room/drainage/preview';
      Map<String, String> body = {
        'rid': '$rid',
      };
      XhrResponse response =
          await Xhr.post(url, body, pb: true, throwOnError: true);
      ResDrainagePreview res =
          ResDrainagePreview.fromBuffer(response.bodyBytes);
      if (res.success == true) {
        return res.data;
      }
    } catch (e) {
      Log.d('getRoomMsgTab, error: $e');
      return null;
    }

    return null;
  }

  /// rid:当前Tab的rid
  /// targetRid：即将去的房间（邀请去的房间）
  /// op：操作类型（RoomDrainageOperation）
  /// uids：仅在op为3（RoomDrainageChooseInvite）时，需要传选中的uid列表，其余场景传[]
  static Future<ResDrainageOperate> relateRoomOption(
    int rid,
    int targetRid,
    int op, {
    List<int> uids = const [],
  }) async {
    try {
      String url = '${System.domain}go/room/drainage/operate';
      Map<String, String> body = {
        'rid': '$rid',
        'target_rid': '$targetRid',
        'uids': uids.join(','),
        'operate': '$op',
      };
      XhrResponse response =
          await Xhr.post(url, body, pb: true, throwOnError: true);
      return ResDrainageOperate.fromBuffer(response.bodyBytes);
    } catch (e) {
      Log.d('relateRoomOption, error: $e');
      return ResDrainageOperate(success: false, message: e.toString());
    }
  }

  /// 邀请大房用户进小房
  /// rid: 大房rid
  /// targetRid: 小房rid
  /// word: 搜索文案
  static Future<ResDrainageRoomOnlineList> getRoomOnlineList(
      int rid, int targetRid, String word) async {
    String url = '${System.domain}go/yy/room/drainageOnline';

    Map<String, String> body = {
      'rid': '$rid',
      'target_rid': '$targetRid',
      if (!Util.isStringEmpty(word, trim: true)) 'word': word
    };
    try {
      XhrResponse response = await Xhr.post(url, body, pb: true);
      return ResDrainageRoomOnlineList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResDrainageRoomOnlineList(msg: e.toString(), success: false);
    }
  }
}
