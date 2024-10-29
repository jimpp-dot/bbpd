import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/music_model.dart';

class MusicUtil {
  MusicUtil._();

  /// 我的音乐
  /// kugou
  static Future<List<Music>> getMyMusics() async {
    List<Music> data = [];
    try {
      String sql = "select * from $musicTable order by dateline desc";
      List<Map<String, dynamic>> res =
          await LocalStorage.db?.rawQuery(sql) ?? [];
      for (var item in res) {
        Music music = Music.fromJson(item);
        if (!Util.containTrie(music.name)) {
          data.add(music);
        }
      }
    } catch (e) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        library: 'MusicUtil',
      ));
    }

    return data;
  }

  static Future<Music?> insertMusic(Music data, String path) async {
    try {
      int now = DateTime.now().millisecondsSinceEpoch;
      int r = await LocalStorage.db?.insert(
            musicTable,
            {
              'id': data.id,
              'type': data.type,
              'name': data.name,
              'path': path,
              'dateline': now,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          ) ??
          0;
      if (r <= 0) return null;

      return Music(data.id, data.type, data.name, path, now);
    } catch (e) {
      Log.d('insertMusic:${data.name} failed: ${e.toString()} ');
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        library: 'MusicUtil',
      ));
      return null;
    }
  }

  /// 获取 zego music
  static Future<List<Music>> getMyZegoMusics() async {
    List<Music> data = [];
    try {
      String sql = "select * from $zegoV2MusicTable order by dateline desc";
      List<Map<String, dynamic>> res =
          await LocalStorage.db?.rawQuery(sql) ?? [];
      for (var item in res) {
        Music music = Music.fromZego(item);
        data.add(music);
      }
    } catch (e) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        library: 'MusicUtil',
      ));
    }

    return data;
  }

  static Future<Music?> insertZegoMusic(Music data) async {
    try {
      int now = DateTime.now().millisecondsSinceEpoch;
      int r = await LocalStorage.db?.insert(
            zegoV2MusicTable,
            {
              'id': data.id,
              'type': data.type,
              'name': data.name,
              'dateline': now,
              'author': data.author,
              'musicId': data.musicId,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          ) ??
          0;
      if (r <= 0) return null;

      Music result = data.copy();
      result.dateline = now;
      return result;
    } catch (e) {
      Log.d('insertMusic:${data.name} failed: ${e.toString()} ');
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        library: 'MusicUtil',
      ));
      return null;
    }
  }
}
