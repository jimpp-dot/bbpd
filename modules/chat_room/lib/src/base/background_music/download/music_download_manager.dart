import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/music/music_room_helper.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

import '../model/music_model.dart';
import '../util/music_util.dart';

enum MusicDownloadState {
  no,
  downloading,
  downloaded,
}

typedef OnDownloadValueChanged = Function(Music music);
typedef OnDownloadError = Function(int id);

class DownloadManger {
  static DownloadManger? _instance;

  static DownloadManger instance() {
    _instance ??= DownloadManger();
    return _instance!;
  }

  final Map<int, Download> _data = {};

  Map<int, Download> get data => _data;

  bool exists(int id) {
    return _data.containsKey(id);
  }

  Download add(Music data, OnDownloadError onError,
      OnDownloadValueChanged onSuccess, ChatRoomData room) {
    int id = data.id;
    if (_data.containsKey(id)) {
      return _data[id]!;
    } else {
      Download download = Download(
        data,
        onError: onError,
        onSuccess: onSuccess,
        room: room,
      );
      _data[id] = download;
      return download;
    }
  }

  void delete(int id) {
    if (_data.containsKey(id)) {
      _data.remove(id);
    }
  }
}

class Download {
  final Music data;
  final OnDownloadError? onError;
  final OnDownloadValueChanged? onSuccess;
  final ChatRoomData room;

  String _ext = 'mp3';

  Download(this.data, {this.onError, this.onSuccess, required this.room}) {
    if (Music.kugou == data.type) {
      _requestUrl();
    } else {
      Log.d("dio.download error type not support");
    }
  }

  _requestUrl() async {
    String url =
        'http://m.kugou.com/app/i/getSongInfo.php?cmd=playInfo&hash=${data.hash}&from=mkugou';
    String refer = 'http://m.kugou.com/search/index';
    try {
      XhrResponse response = await Xhr.get(
        url,
        headers: {
          'referer': refer,
          'User-Agent':
              'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Mobile Safari/537.36',
        },
        throwOnError: true,
      );
      Map res = json.decode(Util.notNullStr(response.response));
      if (res['url'] == null || res['url'].toString().isEmpty) {
        Log.d(res);
        if (onError != null) onError!(data.id);
      } else {
        _ext = 'm4a';
        String url = res['url'] ?? '';
        _init(url);
      }
    } catch (e) {
      Log.d(e);
      if (onError != null) onError!(data.id);
    }
  }

  _init(String url) async {
    Log.d('Download init');

    /// 音乐房直接把下载地址同步到服务器
    if (room.isMusicRoom == true) {
      bool res = await MusicRoomHelper.syncMusic2Server(
        rid: room.rid,
        path: url,
        name: data.name,
        uniId: data.id,
        type: PLAY_LIST_TYPE_REMOTE,
      );
      if (res) {
        if (onSuccess != null) {
          onSuccess!(data);
        }
      } else {}

      return;
    }
    Directory dir =
        Directory(path.join(Constant.documentsDirectory.path, "music"));
    await dir.create(recursive: true);
    File file = File(path.join(dir.path, '${data.id}.$_ext'));
    File temp = File(path.join(dir.path, '${data.id}.$_ext.tmp'));

    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };
    try {
      await dio.download(url, temp.path,
          onReceiveProgress: (int received, int total) {
        Log.d("download $received / $total");
      });

      await temp.rename(file.path);
      Music? music = await MusicUtil.insertMusic(data, file.path);
      if (music == null) {
        if (onError != null) onError!(data.id);
        return false;
      }

      Log.d("dio.download ok ${music.id}");

      if (onSuccess != null) {
        onSuccess!(music);
      }
      return true;
    } catch (e) {
      Log.d("dio.download error");
      Log.d(e);
    }
    if (onError != null) onError!(data.id);
    return false;
  }
}
