import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:path/path.dart';

class ZegoMusicUtil {
  ZegoMusicUtil._();

  static const String lyricPath = 'zego_v2_lyric';
  static final Map<String, Completer<bool>> _downloadingList = {};

  static String getLyricPath() {
    return join(Constant.documentsDirectory.path, lyricPath);
  }

  static Directory getLyricDirectory() {
    String baseDir = getLyricPath();
    return Directory(baseDir);
  }

  static File getLyricLrcFile(String songId) {
    String path = getLyricLrcPath(songId);
    return File(path);
  }

  static String getLyricLrcPath(String songId) {
    if (songId.isEmpty) {
      return "";
    }

    String baseDir = getLyricPath();
    String fileName = 'zego_v2_$songId.lrc';

    return join(baseDir, fileName);
  }

  static Future<bool> isLyricDownload(String songId) async {
    String result = await getLyricString(songId);
    return result.isNotEmpty;
  }

  static Future<bool> _saveKrc(String songId, String krc) async {
    await HiveUtil.put<String>(lyricPath, krc, key: songId);
    return true;

    // Directory baseDirectory = getLyricDirectory();
    // await baseDirectory.create(recursive: true);
    // File file = getLyricLrcFile(songId);
    //
    // if (await file.exists()) {
    //   FileStat stat = await file.stat();
    //   if (stat.size > 0) {
    //     return true;
    //   }
    // }
    // try {
    //   await file.writeAsString(krc);
    //   return true;
    // } catch (e) {
    //   Log.d('_saveKrc...$e');
    //   return false;
    // }
  }

  static Future<bool> saveLyricJsonString(String songId, String krc) async {
    if (krc.isEmpty) return false;

    await _saveKrc(songId, krc);

    return true;
  }

  /// 获取歌词json字符串
  static Future<String> getLyricString(String songId) async {
    String? lrc =
        await HiveUtil.get<String>(ZegoMusicUtil.lyricPath, key: songId);
    if (lrc != null && lrc.isNotEmpty) {
      return lrc;
    }

    return '';
  }

  static Future<List<Lyric>> loadLyric(String songId, String url) async {
    List<Lyric> lyrics = [];

    String lrc = await getLyricString(songId);
    if (lrc.isNotEmpty) {
      lyrics = _parseLyric(lrc);
    }

    if (lyrics.isEmpty) {
      bool lyricDownload = await downloadLyricWithUrl(songId, url);
      if (lyricDownload) {
        String lyricString = getLyricLrcFile(songId).readAsStringSync();
        lyrics = _parseLyric(lyricString);
      }
    }

    return lyrics;
  }

  /// 下载歌词
  static Future<bool> downloadLyricWithUrl(String songId, String url) async {
    if (Util.isStringEmpty(url)) return false;

    if (_downloadingList.containsKey(songId)) {
      return _downloadingList[songId]!.future;
    }

    Completer<bool> completer = Completer<bool>();
    _downloadingList.putIfAbsent(songId, () => completer);

    Directory baseDirectory = getLyricDirectory();
    await baseDirectory.create(recursive: true);

    bool downloadSuccess = false;
    File file = getLyricLrcFile(songId);
    bool isLrc = url.contains('.lrc');

    if (await file.exists()) {
      // 最好做下MD5校验 但是做不了
      downloadSuccess = true;
    }

    if (!downloadSuccess && isLrc) {
      try {
        await DownloadManager.download(url, getLyricLrcPath(songId));
      } catch (e) {
        Log.d(e);
      }

      if (await getLyricLrcFile(songId).exists()) {
        downloadSuccess = true;
      }
    }

    _downloadingList.remove(songId);
    completer.complete(downloadSuccess);

    return completer.future;
  }

  static List<Lyric> _parseLyric(String lrc) {
    List<Lyric> lyrics = [];
    try {
      Map result = jsonDecode(lrc);
      lyrics = Util.parseList(
          result['lines'], (e) => Lyric.fromJson(Map<String, dynamic>.from(e)));
    } catch (e) {
      Log.d('loadLyric error :$e');
    }
    return lyrics;
  }
}
