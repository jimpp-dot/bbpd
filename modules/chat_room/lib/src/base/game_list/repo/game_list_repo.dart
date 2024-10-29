import 'package:shared/shared.dart';

import '../model/pb/generated/common_gameplaylist.pb.dart';

class GameListRepo {
  ///获取玩法列表
  static Future<RespGamePlayListAll> getAll(int rid) async {
    String url = '${System.domain}go/room/gameplaylist/allGameList?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return RespGamePlayListAll.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGamePlayListAll(message: e.toString(), success: false);
    }
  }

  ///切换玩法上下线状态
  static Future<NormalNull> gameSwitch(int rid, int gid, int enable) async {
    String url = '${System.domain}go/room/gameplaylist/gameSwitch';
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'rid': '$rid', 'gid': '$gid', 'enable': '$enable'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> select(int rid, int gid) async {
    String url = '${System.domain}go/room/gameplaylist/select';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'gid': '$gid'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
