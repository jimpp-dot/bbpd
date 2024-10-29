// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/wolfAudioPlayUtil.dart';
import 'package:were_wolf/wolf_manager.dart';

class WolfSourceUtil {
  static const GAME_WOLF_ZIP_FILE_MD5 = 'game.wolf.zip.file.md5';

  static final Map<String, String> wolfVoice = {};
  static bool isDownloading = false;
  static List playVoiceNum = [];

  ///
  ///初始化资源
  ///1.获取远程的资源路径和md5
  ///2.如果本地存在资源文件,比对本地文件的md5和远程的md5,如果相同,则代表是同一个文件,则不需要重新下载;否则重新下载zip包
  ///3.解压zip包(每次解压删除旧文件夹)
  ///4.解析解压文件夹的关键文件并返回解析内容(map)
  ///
  static Future<Map> initWolfSource() async {
    if ((wolfVoice.isEmpty) && !isDownloading) {
      Log.d('initWolfSource wolfVoice need init');
      isDownloading = true;
      try {
        WolfSourceEntity? ws = await _getWolfSource();
        if (ws != null) {
          String? url = ws.source_url;
          String checkMd5 = ws.source_md5;
//        url = 'http://localhost:8080/test/wolf_voice.zip'; //本地数据测试
//        checkMd5 = '0ef812dc5a432b252e7cf82b7b9c0ef6'; //本地数据测试

          String filePath = await _getWolfZipFile();
          String fileName = '$checkMd5.zip';
          String? localFileUrl = await _downLoadResource(url,
              checkMd5: checkMd5, filePath: filePath, fileName: fileName);
          if (localFileUrl != null) {
            DateTime startTime = DateTime.now();
            String zipFilePath = localFileUrl;
            String zipFileDirPath1 = filePath;
            String zipFileDirPath2 = checkMd5;
            String? localFileDir =
                await _unzipFile(zipFilePath, zipFileDirPath1, zipFileDirPath2);
            Log.d(
                'initWolfSource _unzipFile totalTime=${DateTime.now().difference(startTime).inMilliseconds}');
            if (localFileDir != null) {
              String unZipFileDir = '$localFileDir/${ws.source_path}';
              String mainFileName = 'main.json';
              await _parseRes(unZipFileDir, mainFileName);
            }
          }
        }
      } catch (e) {}
      isDownloading = false;
    }
    return wolfVoice;
  }

  ///业务方法
  static String? getVoicePath(String? key) {
    String? voicePath;
    if (wolfVoice.isNotEmpty) {
      if (key != null && key.isNotEmpty) {
        voicePath = wolfVoice[key];
      }
    }
    return voicePath;
  }

  static bool canplayVoice(String key) {
    return !playVoiceNum.contains(key);
  }

  ///
  /// 业务方法
  /// 根据key
  ///
  static void playVoice(String key, {Function? onComplete}) {
    if (!playVoiceNum.contains(key)) {
      playVoiceNum.add(key);
    }
    String? voicePath = getVoicePath(key);
    Log.d("playVoice voicePath=$voicePath");
    if (voicePath != null && voicePath.isNotEmpty) {
      WolfAudioPlayUtil.instance().playAudio(voicePath, onComplete: onComplete);
    }
  }

  static void stopVoice() {
    WolfAudioPlayUtil.instance().stop();
  }

  static void playSpeakVoice(int position,
      {required bool dealSpeak, required bool selfSpeak}) {
    if (dealSpeak) {
      if (selfSpeak) {
        // playVoice('wolf_last_words_${position}_tips', onComplete: (){
        //   playVoice('wolf_start_desc_tips');
        // });
        AudioPlayHelper.instance().playAudio("wolf_desc.mp3");
      } else {
        // playVoice('wolf_last_words_${position}_tips');
      }
    } else {
      if (selfSpeak) {
        // playVoice('wolf_desc_${position}_tips', onComplete: (){
        //   playVoice('wolf_start_desc_tips');
        // });
        AudioPlayHelper.instance().playAudio('wolf_desc.mp3',
            path: 'packages/were_wolf/assets/sound/');
      } else {
        // playVoice('wolf_desc_${position}_tips');
      }
    }
  }

  static void playNightAction(WolfPositionData? positionData) {
    playVoiceNum.clear();
    if (positionData?.isDead ?? true) {
      playVoice('wolf_night_tips', onComplete: () {
        playVoice('wolf_night_bg');
      });
      return;
    }
    switch (positionData?.role) {
      case WolfRole.Werewolf:
        playVoice("wolf_night_tips");
        break;
      case WolfRole.Seer:
        playVoice("wolf_night_tips");
        break;
      case WolfRole.Witch:
        playVoice('wolf_night_tips', onComplete: () {
          playVoice('wolf_night_bg');
        });
        break;
      case WolfRole.Guard:
        playVoice("wolf_night_tips");
        break;
      case WolfRole.Hunter:
        playVoice('wolf_night_tips', onComplete: () {
          playVoice('wolf_night_bg');
        });
        break;
      case WolfRole.Popular:
        playVoice('wolf_night_tips', onComplete: () {
          playVoice('wolf_night_bg');
        });
        break;
      default:
        playVoice('wolf_night_tips', onComplete: () {
          playVoice('wolf_night_bg');
        });
    }
  }

  static void playPublishRoleVoice(WolfRole? role) {
    if (role == null) {
      return;
    }
    switch (role) {
      case WolfRole.Werewolf:
        WolfSourceUtil.playVoice("wolf_publish_role_wolf_tips");
        break;
      case WolfRole.Seer:
        WolfSourceUtil.playVoice("wolf_publish_role_seer_tips");
        break;
      case WolfRole.Witch:
        WolfSourceUtil.playVoice("wolf_publish_role_witch_tips");
        break;
      case WolfRole.Guard:
        WolfSourceUtil.playVoice("wolf_publish_role_guard_tips");
        break;
      case WolfRole.Hunter:
        WolfSourceUtil.playVoice("wolf_publish_role_hunter_tips");
        break;
      case WolfRole.Popular:
        WolfSourceUtil.playVoice("wolf_publish_role_popular_tips");
        break;
      default:
        WolfSourceUtil.playVoice("wolf_publish_role_popular_tips");
    }
  }

  ///
  ///获取wolf对应的压缩资源的所在路径和md5值
  ///
  static Future<WolfSourceEntity?> _getWolfSource() async {
    WolfSourceEntity? result;
    WereWolfManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_WERE_WOLF);
    try {
      String url = '${System.domain}roomwolfv2/getSource';
      Map<String, String> params = {
        'type': manager.getTypeLabel(),
        'source_type': 'wolf_voice'
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      if (response.error != null) {
        Fluttertoast.showToast(
            msg: '${response.error}', gravity: ToastGravity.CENTER);
      }

      Map res = response.value();
      if (res['success'] == true) {
        Map data = res['data'];

        result = WolfSourceEntity(
            source_url: '${data['source_url']}',
            source_md5: '${data['source_md5']}',
            source_path: '${data['source_path']}');
      }
    } catch (e) {
      Log.d(e);
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    return result;
  }

  ///
  /// 1.根据指定的url和md5，下载对应的zip资源，返回本地文件路径
  ///
  static Future<String?> _downLoadResource(String? url,
      {String checkMd5 = '',
      String filePath = '',
      String fileName = ''}) async {
    if (checkMd5.isEmpty ||
        url == null ||
        url.isEmpty ||
        !(url.startsWith("http://") || url.startsWith("https://"))) {
      return null;
    }

    if (filePath.isEmpty || fileName.isEmpty) {
      return null;
    }

    Log.d(
        "initWolfSource downLoadResource filePath=$filePath fileName=$fileName url=$url checkMd5=$checkMd5");

    String localFileUrl =
        await Util.downloadFile(url, filePath, fileName, checkMd5: checkMd5);

    return localFileUrl;
  }

  ///
  /// 1.解压指定zip文件到指定文件夹(每次都删除目录重新解压)
  /// 2.返回解压所在文件夹目录地址
  ///
  static Future<String?> _unzipFile(String zipFilePath, String zipFileDirPath1,
      String zipFileDirPath2) async {
    String zipFileDir = '$zipFileDirPath1/$zipFileDirPath2';
    Log.d(
        'initWolfSource _unzipFile zipFilePath=$zipFilePath zipFileDir=$zipFileDir');

    /// 如果存在最终解压文件夹，则返回
    try {
      Directory dir = Directory(zipFileDir);
      if (dir.existsSync()) {
        Config.set(GAME_WOLF_ZIP_FILE_MD5, zipFileDirPath2);
        return zipFileDir;
      }
    } catch (e) {}

    ///该段逻辑需配合init模块删除

    ///解压文件到执行文件夹
    File zipFile = File(zipFilePath);
    if (zipFile.existsSync()) {
      try {
        List<int> bytes = zipFile.readAsBytesSync();
        Archive archive = await compute(decodeZip, bytes);

        for (ArchiveFile file in archive) {
          String filename = file.name;
          if (file.isFile) {
            List<int> data = file.content;
            File('$zipFileDir/$filename')
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          } else {
            Directory('$zipFileDir/$filename').create(recursive: true);
          }
        }

        Config.set(GAME_WOLF_ZIP_FILE_MD5, zipFileDirPath2);
        return zipFileDir;
      } catch (e) {
        _deleteZipFileDir(zipFileDir);
      }
    }
    return null;
  }

  ///
  /// 1.读取解压文件夹的关键文件，并返回对应的map数据
  ///
  static Future<void> _parseRes(
      String? unZipFileDir, String? mainFileName) async {
    if (unZipFileDir == null ||
        unZipFileDir.isEmpty ||
        mainFileName == null ||
        mainFileName.isEmpty) {
      return;
    }
    Log.d(
        'initWolfSource _parseRes unZipFileDir=$unZipFileDir mainFileName=$mainFileName');

    String mainFilePath = '$unZipFileDir/$mainFileName';
    File mainFile = File(mainFilePath);
    Log.d("initWolfSource  _parseRes mainFilePath=$mainFilePath");

    if (mainFile.existsSync()) {
      String content = await mainFile.readAsString();
      Map? realContent = json.decode(content);
      Log.d(
          "initWolfSource  _parseRes realContent.toString()=${realContent.toString()}");

      if (realContent != null) {
        if (realContent.keys.isNotEmpty) {
          wolfVoice.clear();
          for (var key in realContent.keys) {
            Log.d(
                "initWolfSource _parseRes key=$key value=${realContent[key]}");
            wolfVoice[key] = '$unZipFileDir/' + realContent[key];
            Log.d(
                "initWolfSource _parseRes real key=$key value=${wolfVoice[key]}");
          }
          return;
        }
      }
    }
    return;
  }

  static Future<String> _getWolfZipFile() async {
    return await Util.getImageSrc(path: '/wolf/resource');
  }

  static void _deleteZipFileDir(String zipFileDir) {
    try {
      Directory dir = Directory(zipFileDir);
      if (dir.existsSync()) {
        Log.d("initWolfSource _deleteZipFileDir zipFileDir=$zipFileDir");
        dir.delete(recursive: true);
      }
    } catch (e) {}
  }

  static Future<void> initDeleteZipFileDir() async {
    String zipFileDirPath1 = await _getWolfZipFile();
    String? zipFileDirPath2 = Config.get(GAME_WOLF_ZIP_FILE_MD5, '');
    Log.d(
        "initWolfSource initDeleteZipFileDir zipFileDirPath1=$zipFileDirPath1 zipFileDirPath2=$zipFileDirPath2");
    if (zipFileDirPath2.isEmpty) {
      return;
    }
    String zipFileDir = '$zipFileDirPath1/$zipFileDirPath2';
    _deleteZipFileDir(zipFileDir);
  }
}

class WolfSourceEntity {
  String? source_url; //zip资源压缩包的url
  String source_md5; //zip资源压缩包的md5
  String source_path; //zip资源压缩包的名字

  WolfSourceEntity(
      {this.source_url, required this.source_md5, required this.source_path});
}
