import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import '../model/music_model.dart';
import 'base_music_search_repo.dart';

class KugouMusicSearchRepo with BaseMusicSearchRepo {
  static const String hotUrl =
      "http://m.kugou.com/rank/info?rankid=8888&page=1&json=true";
  static const String searchUrl =
      "http://mobilecdn.kugou.com/api/v3/search/song?format=jsonp&page=1&pagesize=30&showtype=1";

  @override
  bool get filterSensitive => true;

  /// 热搜数据加载
  @override
  Future<List<Music>> loadHotSearch() async {
    List<Music> result = [];

    try {
      XhrResponse response = await Xhr.get(hotUrl,
          headers: {'referer': 'http://m.kugou.com/search/index'},
          throwOnError: true);
      String body = response.response.toString();
      Map res = json.decode(body);
      if (res['songs'] == null ||
          res['songs'] is! Map ||
          res['songs']['list'] == null ||
          res['songs']['list'] is! List) {
        Log.d('_loadHotSearch, hot res:$res');
      } else {
        List data = res['songs']['list'] ?? [];
        for (var value in data) {
          Map res = value;
          if (!Util.containTrie(res['filename'])) {
            Music music = Music(
              Util.parseInt(res['album_audio_id']),
              Music.kugou,
              res['filename'] ?? '',
              '',
              0,
              hash: res['hash'] ?? '',
            );
            result.add(music);
          }
        }
      }
    } catch (e) {
      Log.d('_loadHotSearch error');
      Log.d(e);
    }

    return result;
  }

  @override
  Future<List<Music>> searchMusic(String word) async {
    List<Music> result = [];
    String url = '$searchUrl&keyword=${Uri.encodeComponent(word)}';
    try {
      XhrResponse response = await Xhr.get(url,
          headers: {'referer': 'http://m.kugou.com/search/index'},
          throwOnError: true);
      String body = response.response.toString();
      String text = body.substring(1, body.length - 1);
      Map res = json.decode(text);
      if (res['data'] == null ||
          res['data'] is! Map ||
          res['data']['info'] == null ||
          res['data']['info'] is! List) {
        Log.d('MusicSearchScreen, res:$res');
        Fluttertoast.showToast(msg: K.room_request_error_retry);
      } else {
        List data = res['data']['info'] ?? [];
        for (var value in data) {
          Map res = value;
          if (!musicContainTrie(res['singername'], res['songname'])) {
            Music music = Music(
              Util.parseInt(res['album_audio_id']),
              Music.kugou,
              res['singername'] + ' - ' + res['songname'],
              '',
              0,
              hash: res['hash'] ?? '',
              author: res['singername'] ?? '',
            );
            result.add(music);
          }
        }
      }
    } catch (e) {
      Log.d(e);
      Fluttertoast.showToast(msg: K.room_request_error_retry);
    }

    return result;
  }
}
