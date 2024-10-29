import 'package:shared/shared.dart';
import 'package:rank/rank.dart';

class RoomListApi {
  static Future<RespGamesRoomTab> goGamesTabList() async {
    String url = '${System.domain}go/games/room/gamesTabList';
    try {
      XhrResponse response = await Xhr.get(
        url,
        pb: true,
      );
      return RespGamesRoomTab.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGamesRoomTab(msg: e.toString(), success: false);
    }
  }

  static Future<RespGamesRoomRecommendList> gamesRoomList(String gamesType,
      {int page = 1}) async {
    String url = '${System.domain}go/games/room/gamesRoomList';
    try {
      Map<String, dynamic> params = {
        'games_type': gamesType,
        'page': page,
      };
      XhrResponse response =
          await Xhr.get(url, pb: true, queryParameters: params);
      return RespGamesRoomRecommendList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGamesRoomRecommendList(msg: e.toString(), success: false);
    }
  }

  static Future<ResponseGamesRoomFriendList> goGamesFriendList() async {
    String url = '${System.domain}go/games/room/gamesFriendList';
    try {
      XhrResponse response = await Xhr.get(
        url,
        pb: true,
      );
      return ResponseGamesRoomFriendList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResponseGamesRoomFriendList(msg: e.toString(), success: false);
    }
  }
}
