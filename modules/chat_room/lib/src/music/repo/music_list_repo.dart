import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';

/// 播放列表
class MusicListRepo {
  /// 加载音乐列表
  static Future<MusicListResp> loadMusicList(int rid) async {
    var url = '${System.domain}roommusic/list';
    var response = await Xhr.getJson(url, params: {'rid': rid, 'version': 1});

    if (response.error != null) {
      return MusicListResp(msg: response.error.toString(), success: false);
    }

    Map res = response.value();
    if (!(res['success'] ?? false)) {
      return MusicListResp(msg: res['msg'], success: false);
    }
    try {
      var responseData = MusicListResp.fromJson(Map<String, dynamic>.from(res));
      return responseData;
    } catch (e) {
      return MusicListResp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<BaseResponse> musicOption(int rid, MusicOption option,
      {int sid = 0, String mode = '', int position = 0}) async {
    var url = '${System.domain}roommusic/option';
    var response = await Xhr.postJson(url, {
      'rid': '$rid',
      'type': option.getApiValue(),
      'sid': '$sid',
      'playmode': mode,
      'position': '$position',
    });
    return BaseResponse.parse(response);
  }

  /// 添加音乐
  /// [type] 歌曲类型，1.本地歌曲 2.外链歌曲
  /// [name] 歌曲名称
  /// [resourcePath] 资源的路径
  /// [uniqueId] 歌曲的唯一标识
  /// [extra] type为2时，需要该参数json格式
  static Future<BaseResponse> musicAdd({
    required int rid,
    required int type,
    required String name,
    required String resourcePath,
    required String uniqueId,
  }) async {
    var url = '${System.domain}roommusic/songAdd';
    var response = await Xhr.postJson(url, {
      'rid': '$rid',
      'type': '$type',
      'name': name,
      'resource_path': resourcePath,
      'unique_id': uniqueId,
    });
    return BaseResponse.parse(response);
  }

  /// 删除歌曲
  /// params -> [{“sid”:1,"uid":105002368}]
  static Future<BaseResponse> deleteSong(
      int rid, List<DeleteSongReq> list) async {
    var url = '${System.domain}roommusic/songDelete';
    var response = await Xhr.postJson(url, {
      'rid': '$rid',
      'params': jsonEncode(list),
    });
    return BaseResponse.parse(response);
  }

  /// 置顶歌曲
  static Future<BaseResponse> upSong(int rid, int sid, int fromUid) async {
    var url = '${System.domain}roommusic/songUp';
    var response = await Xhr.postJson(url, {
      'rid': '$rid',
      'sid': '$sid',
      'from_uid': '$fromUid',
    });
    return BaseResponse.parse(response);
  }
}
