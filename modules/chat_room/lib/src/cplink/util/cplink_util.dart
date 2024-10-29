import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart';
import 'package:chat_room/chat_room.dart';

class CpLinkUtil {
  static const CPLINK_VAP_DIR = "cplink_vap";
  static const FILE_SUFFIX = ".mp4";

  static Future<bool> cacheGiftWithTry(String url, int size) async {
    for (int i = 0; i < 3; i++) {
      bool r = await _cacheVap(url, size);
      if (r == true) return true;
    }
    return false;
  }

  static Future<bool> _cacheVap(String url, int size) async {
    String baseDir = getVapSubDirPath();
    await Directory(baseDir).create(recursive: true);
    String filePath = getVapFilePathByUrl(url);
    File file = File(filePath);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == size) {
        return true;
      }
      await file.delete();
    }

    await _downloadVap(size, url, file);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == size) {
        return true;
      }
      await file.delete();
    }
    return false;
  }

  static Future _downloadVap(int size, String url, File file) async {
    if (size < 1 * 1000000) {
      // 小于1MB直接下载
      try {
        await DownloadManager.download(url, file.path);
      } catch (e) {
        Log.d('_downloadGift, DownloadManager.download error: $e');
      }
    } else {
      // 大于1MB并发下载以提高速度
      try {
        await DownloadManager.downloadWithChunks(url, file.path, size: size);
      } catch (e) {
        Log.d('_downloadGift, DownloadManager.downloadWithChunks error: $e');
      }
    }
  }

  static String getVapFilePathByUrl(String url) {
    String baseDir = getVapSubDirPath();
    String fileName = _md5(url) + FILE_SUFFIX;
    return join(baseDir, fileName);
  }

  static String getVapSubDirPath() {
    return join(Constant.documentsDirectory.path, CPLINK_VAP_DIR);
  }

  static String _md5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  /// 是否是主持人
  static bool isHost(ChatRoomData? room) {
    if (room == null) return false;
    try {
      return room.positions.first.uid == Session.uid;
    } catch (e) {
      Log.d(e);
      return false;
    }
  }
}
