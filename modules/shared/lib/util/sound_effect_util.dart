import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:path/path.dart';

/// @Author wangyang
/// @Description 创意音效工具类
/// @Date 2022/6/8
class SoundEffectUtil {
  static const String SCENE_TYPE_LIKE = 'like';
  static const String SCENE_TYPE_LIKE_CANCEL = 'like_cancel';
  static const String SCENE_TYPE_MATCH = 'match';
  static Map soundConfig = {};

  static init() async {
    _initSoundConfig();
    _preloadSoundFiles();
  }

  ///根据场景和性别 播放对应的音效
  static playSound(String sceneType, int sex) async {
    if (soundConfig[sceneType] is! Map) {
      Log.d('SoundEffectUtil no soundConfig for sceneType:$sceneType');
      return;
    }
    Log.d('SoundEffectUtil playSound [$sceneType][$sex]');
    //如果对方是男性或者女性，则在（男性/女性+不限性别）的音效列表中随机取
    //如果对方性别未指定，则在不限性别的音效列表中随机取
    var soundList1;
    if (sex == 1 || sex == 2) {
      soundList1 = soundConfig[sceneType]['$sex'];
    } else {
      soundList1 = [];
    }
    var soundList2 = soundConfig[sceneType]['0'];
    var soundList = [];
    if (soundList1 != null && soundList1 is List && soundList1.isNotEmpty) {
      soundList.addAll(soundList1);
    }
    if (soundList2 != null && soundList2 is List && soundList2.isNotEmpty) {
      soundList.addAll(soundList2);
    }
    if (soundList.isNotEmpty) {
      //随机选择一个播放
      int index = Random().nextInt(soundList.length);
      var sound = soundList[index];
      if (sound is Map) {
        int durationInSecond = Util.parseInt(sound['duration']);
        bool isLocalFileExist =
            await _isFileDownload(Util.notNullStr(sound['url']));
        String url = isLocalFileExist
            ? _getFilePathByUrl(Util.notNullStr(sound['url']))
            : Util.notNullStr(sound['url']);
        // Log.d('SoundEffectUtil [$sceneType][$sex] isLocalFileExist=$isLocalFileExist  url=$url');
        AudioPlay.instance()
            .play(url, durationInSecond, isLocal: isLocalFileExist);
      }
    } else {
      Log.d('SoundEffectUtil [$sceneType][$sex]  soundList isEmpty');
    }
  }

  static _initSoundConfig() {
    soundConfig = {};
    String json = AppConfig.getConfig(AppConfig.sound_effect);

    if (json.isEmpty) {
      Log.d('SoundEffectUtil json is empty');
      return;
    }
    Map config = jsonDecode(json);
    config.forEach((sceneType, value) {
      if (value is Map) {
        soundConfig[sceneType] = {};
        value.forEach((sex, soundInfoList) {
          if (soundInfoList is List) {
            soundConfig[sceneType][sex] = soundInfoList;
          }
        });
      }
    });
  }

  static _preloadSoundFiles() async {
    soundConfig.forEach((sceneType, value) {
      if (value is Map) {
        value.keys.forEach((sex) async {
          if (value[sex] != null && value[sex] is List) {
            List soundList = value[sex] as List;
            Log.d(
                'SoundEffectUtil preload [$sceneType][$sex]: ${soundList.length}');
            for (var sound in soundList) {
              if (sound is Map) {
                await _downloadFileIfNeed(sound['url']);
              }
            }
          }
        });
      }
    });
  }

  static _downloadFileIfNeed(String url) async {
    if (url.isEmpty) {
      return;
    }
    bool isDownloaded = await _isFileDownload(url);
    Log.d('SoundEffectUtil _downloadFileIfNeed isDownloaded=$isDownloaded');
    if (!isDownloaded) {
      String filePath = _getFilePathByUrl(url);
      Log.d('SoundEffectUtil start download,url=$url path=$filePath');
      await DownloadManager.download(url, filePath);
      bool success = await _isFileDownload(url);
      Log.d('SoundEffectUtil downloadFile success=$success');
    }
  }

  static _isFileDownload(String url) async {
    String filePath = _getFilePathByUrl(url);
    File file = File(filePath);
    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size > 0) {
        return true;
      }
    }
    return false;
  }

  static _getFilePathByUrl(String url) {
    if (Util.isStringEmpty(url)) {
      return null;
    }

    String baseDir = _getDownloadDirPath();
    String fileSuffix = '';
    int index = url.lastIndexOf('.');
    if (index < url.length) {
      fileSuffix = url.substring(index);
    }
    String fileName = Util.md5Encryption(url) + fileSuffix;
    return join(baseDir, fileName);
  }

  static _getDownloadDirPath() {
    return join(Constant.documentsDirectory.path, 'soundEffect');
  }
}
