import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/live.pb.dart';

class LiveRepository {
  static Future<ResKnightRankList> getKnightRankData(int rid, int page) async {
    String url = '${System.domain}go/yy/knight/rank';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'page': '$page'}, pb: true);
      return ResKnightRankList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightRankList(msg: e.toString(), success: false);
    }
  }

  static Future<ResKnightConfigList> getKnightConfigData(
      int rid, int uid) async {
    String url = '${System.domain}go/yy/knight/config';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'uid': '$uid'}, pb: true);
      return ResKnightConfigList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightConfigList(msg: e.toString(), success: false);
    }
  }

  static Future<ResKnightMine> getKnightMineData(int rid, int uid) async {
    String url = '${System.domain}go/yy/knight/mine';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'master_uid': '$uid'}, pb: true);
      return ResKnightMine.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightMine(msg: e.toString(), success: false);
    }
  }

  static Future<ResLiveConfig> getLiveConfig(int rid, int liveUid) async {
    String url = '${System.domain}go/yy/live/config';

    Map<String, String> post = {
      'rid': '$rid',
      'live_uid': '$liveUid',
    };
    try {
      XhrResponse response = await Xhr.post(url, post, pb: true);
      ResLiveConfig data = ResLiveConfig.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResLiveConfig(msg: e.toString(), success: false);
    }
  }

  static Future<ResLiveTagTab> getTalentAnchorRankTabList() async {
    String url = '${System.domain}go/yy/live/tagTab';

    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResLiveTagTab.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResLiveTagTab(msg: e.toString(), success: false);
    }
  }

  static Future<ResLiveTagRoomList> getTalentAnchorRankList(
      {required int type, required int nextId}) async {
    String url = '${System.domain}go/yy/live/tagRoomList';

    Map<String, String> post = {
      'id': '$type',
      'next_id': '$nextId',
    };
    try {
      XhrResponse response = await Xhr.post(url, post, pb: true);
      return ResLiveTagRoomList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResLiveTagRoomList(msg: e.toString(), success: false);
    }
  }
}
