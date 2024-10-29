import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:shared/shared.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'util.dart';

class GameConfig {
  String url;
  int orientation;
  String version;

  GameConfig({
    required this.url,
    required this.orientation,
    required this.version,
  });
}

typedef OnResReady = void Function();
typedef OnResDownload = void Function(int count, int total);
typedef OnResError = void Function(Exception e);

class DownloadException implements Exception {
  final String message;

  const DownloadException([this.message = ""]);
}

class UnzipException implements Exception {
  final String message;

  const UnzipException([this.message = ""]);
}

class GameResourceManager {
  static const String VERSION = 'version';
  static const String ZIP_PATH = 'zipPath';
  static const String RES_PATH = 'resPath';

  /// 存储所有的游戏配置信息
  /// key为房型/游戏类型
  static final Map<String, GameConfig> gameConfigs = {};

  static const String cacheResRootDirName = 'room_game';

  Database? _db;
  late StoreRef<String, Map<String, Object?>> _store;

  final GameConfig gameConfig;
  late String md5Key;

  String? gameUrl;

  CancelToken? _cancelToken;

  GameResourceManager(this.gameConfig) {
    md5Key = md5.convert(utf8.encode(gameConfig.url)).toString();
  }

  /// 通过接口同步游戏信息
  static Future<void> sync() async {
    Map map = await AppConfig.sync(type: [AppConfig.room_game]);
    if (map.containsKey(AppConfig.room_game)) {
      Map values = map[AppConfig.room_game];
      gameConfigs.clear();
      values.forEach((key, value) {
        final gameConfig = GameConfig(
          url: value['url'],
          orientation: Util.parseInt(value['orientation']),
          version: value['version'].toString(),
        );
        gameConfigs[key] = gameConfig;
      });
    }
  }

  /// 清除所有缓存
  static void clearCache() async {
    String cachePath =
        p.join((await getTemporaryDirectory()).path, cacheResRootDirName);
    Directory cacheDir = Directory(cachePath);
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  /// 初始化db
  Future<void> init() async {
    if (_db == null) {
      String dbPath = p.join(
          (await getTemporaryDirectory()).path, cacheResRootDirName, 'game.db');
      _db = await databaseFactoryIo.openDatabase(dbPath);
      _store = stringMapStoreFactory.store();
    }
  }

  Future<void> prepare({
    required OnResReady onResReady,
    required OnResDownload onResDownload,
    required OnResError onResError,
  }) async {
    if (await checkLocalResource() && gameUrl != null) {
      onResReady();
      return;
    } else {
      try {
        await download(onResDownload);
      } catch (e) {
        onResError(DownloadException(e.toString()));
        return;
      }
      try {
        await unzip();
      } catch (e) {
        onResError(UnzipException(e.toString()));
        return;
      }
      _cancelToken = null;
      onResReady();
      return;
    }
  }

  /// 检查本地资源
  Future<bool> checkLocalResource() async {
    if (_db == null) {
      await init();
    }

    RecordRef record = _store.record(md5Key);
    if (!(await record.exists(_db!))) {
      return false;
    }
    Map<String, Object?>? map = await record.get(_db!);
    if (map != null) {
      String? version = map[VERSION] as String?;
      String? zipPath = map[ZIP_PATH] as String?;
      String? resPath = map[RES_PATH] as String?;
      File? zipFile;
      Directory? resDir;
      if (zipPath != null) {
        zipFile = File(zipPath);
      }
      if (resPath != null) {
        resDir = Directory(resPath);
      }

      if (version == null) {
        // 不存在历史版本
      } else if (version != gameConfig.version) {
        // 存在历史版本
        if (zipFile != null && zipFile.existsSync()) {
          zipFile.delete(recursive: true);
        }
        if (resDir != null && resDir.existsSync()) {
          resDir.delete(recursive: true);
        }
      } else {
        // 版本一致
        // 资源文件不存在的话，返回false
        if (zipFile == null || !zipFile.existsSync()) {
          return false;
        }
        if (resDir == null || !resDir.existsSync()) {
          return false;
        }

        return _findIndexHtml(resDir);
      }
    }
    return false;
  }

  /// 下载资源
  Future<void> download(OnResDownload onResDownload) async {
    String zipPath = p.join((await getTemporaryDirectory()).path,
        cacheResRootDirName, '$md5Key.zip');
    var dio = Dio();
    Log.d('game zip url: ${Util.getRemoteImgUrl(gameConfig.url)}');
    try {
      _cancelToken = CancelToken();
      var response = await dio.download(
        Util.getRemoteImgUrl(gameConfig.url),
        zipPath,
        onReceiveProgress: (count, total) => onResDownload(count, total),
        cancelToken: _cancelToken,
      );
      File zipFile = File(zipPath);
      if (response.statusCode == 200 &&
          zipFile.existsSync() &&
          zipFile.lengthSync() > 0) {
        await _store.record(md5Key).put(_db!, {ZIP_PATH: zipPath});
      }
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }

  void cancelDownload() {
    Log.d('game download cancel:$_cancelToken');
    _cancelToken?.cancel('download cancel');
  }

  /// 解压资源
  Future<void> unzip() async {
    try {
      RecordRef record = _store.record(md5Key);
      Map<String, Object?>? map = await record.get(_db!);
      String zipPath = map![ZIP_PATH] as String;
      String outPath = p.join(
          (await getTemporaryDirectory()).path, cacheResRootDirName, md5Key);
      await compute(decodeZipFile, [zipPath, outPath]);

      // extractFileToDisk(zipPath, outPath);
      if (_findIndexHtml(Directory(outPath))) {
        await record
            .update(_db!, {RES_PATH: outPath, VERSION: gameConfig.version});
      }
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }

  static decodeZipFile(List<String> paths) {
    Log.d('game decodeZipFile');
    extractFileToDisk(paths[0], paths[1]);
  }

  bool _findIndexHtml(Directory directory) {
    var subs = directory.listSync();
    if (subs.isEmpty) {
      return false;
    }
    if (subs.any((e) => e is File && e.path.endsWith('index.html'))) {
      gameUrl = p.join(directory.absolute.path, 'index.html');
    } else {
      FileSystemEntity dir = subs.firstWhere((e) => e is Directory);
      assert(dir is Directory && dir.listSync().isNotEmpty);
      gameUrl = p.join(dir.absolute.path, 'index.html');
    }
    return true;
  }

  /// 获取游戏内某个资源的全路径
  String? getFullResPath(String path) {
    if (gameUrl == null) return null;
    String resPath = '';
    if (isGameOnlineDev) {
      resPath = p.join(gameUrl!, path);
    } else {
      resPath = p.normalize(p.join(gameUrl!, '..', path));
    }
    return resPath;
  }
}
