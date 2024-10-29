import 'package:shared/shared.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';

class MusicRoomRepo {
  /// 获取音乐房信息
  static Future<MusicRoomInfoResp> getMusicRoomInfo(int rid) async {
    String url = '${System.domain}roommusic/data?rid=$rid';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: false,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return MusicRoomInfoResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return MusicRoomInfoResp(msg: res['msg'], success: false);
      }
      try {
        MusicRoomInfoResp responseData =
            MusicRoomInfoResp.fromJson(Map<String, dynamic>.from(res));
        return responseData;
      } catch (e) {
        return MusicRoomInfoResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MusicRoomInfoResp(msg: e.toString(), success: false);
    }
  }

  /// 获取音乐房主题列表
  static Future<MusicRoomThemeDataRepo> getRoomThemeList(int rid) async {
    String url = '${System.domain}roommusic/roomThemeList?rid=$rid';

    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return MusicRoomThemeDataRepo(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return MusicRoomThemeDataRepo(msg: res['msg'], success: false);
      }
      try {
        MusicRoomThemeDataRepo responseData =
            MusicRoomThemeDataRepo.fromJson(res['data']);
        return responseData;
      } catch (e) {
        return MusicRoomThemeDataRepo(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MusicRoomThemeDataRepo(msg: e.toString(), success: false);
    }
  }

  /// 音乐房选择房间主题
  static Future<BaseResponse> roomMusicSelectTheme(
      int rid, String theme) async {
    String url = '${System.domain}roommusic/selectTheme';
    try {
      Map<String, String> params = {'rid': '$rid', 'theme_name': theme};

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
