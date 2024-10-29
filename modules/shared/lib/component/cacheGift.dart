import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

Future<bool> cacheGiftWithTry(
  int giftId,
  int size, {
  bool isMultiframe = false,
  bool isVap = false,
  bool isUnity = false,
  bool isRive = false,
  String? effect,
  String? voiceUrl,
  int? effectSize, // effectSize私聊觉醒动画的size
  bool isAwake = false, // 是否觉醒
  bool isTest = false,
}) async {
  for (int i = 0; i < 3; i++) {
    bool r = await _cacheGift(
      giftId,
      size,
      isMultiframe: isMultiframe,
      isVap: isVap,
      isUnity: isUnity,
      isRive: isRive,
      effect: effect,
      voiceUrl: voiceUrl,
      effectSize: effectSize,
      isAwake: isAwake,
      isTest: false,
    );
    if (r == true) return true;
  }
  return false;
}

double _giftRatio = 1624.0 / 750.0;

double get giftRatio => _giftRatio;

String get giftSubDir => 'gift_big'; //新版本改为统一只访问gift_big目录

/// 礼物音频文件
String get giftVoiceDir => 'gift_voice';

Archive decodeZip(List<int> bytes) {
  return ZipDecoder().decodeBytes(bytes);
}

File getRiveGiftFile(int giftId, {String? effect}) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  String path = '$giftId.riv';
  File file = File(join(baseDir, path));
  return file;
}

File getMultiframeGiftFile(int giftId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  File file = File(join(baseDir, '$giftId.webp'));
  return file;
}

File getVapGiftFile(int giftId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  String path = '$giftId.mp4';
  File file = File(join(baseDir, path));
  return file;
}

/// 获取觉醒礼物
File getAwakeVapGiftFile(int giftId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  String path = '$giftId.awake.mp4';
  File file = File(join(baseDir, path));
  return file;
}

File getUnityGiftFile(int giftId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  File file = File(join(baseDir, '$giftId'));
  return file;
}

File getGiftVoiceFile(String url) {
  String baseDir = join(Constant.documentsDirectory.path, giftVoiceDir);
  String end = url.split('.').last;
  File file = File(join(baseDir, '${Util.md5Encryption(url)}.$end'));
  return file;
}

Future<bool> _cacheGift(
  int giftId,
  int size, {
  bool isMultiframe = false,
  bool isVap = false,
  bool isUnity = false,
  bool isRive = false,
  String? effect,
  String? voiceUrl,
  int? effectSize,
  bool isAwake = false,
  bool isTest = false,
}) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  Log.d(
      'baseDir:$baseDir isVap:$isVap isUnity:$isUnity isMultiframe:$isMultiframe voiceUrl:$voiceUrl effect:$effect');
  if (!Util.isStringEmpty(voiceUrl)) {
    await cacheGiftVoice(voiceUrl!);
  }
  if (isVap) {
    return await _cacheVapGift(giftId, size,
        effect: effect,
        effectSize: effectSize,
        isAwake: isAwake,
        isTest: isTest);
  } else if (isUnity) {
    return await _cacheUnityGift(giftId, size);
  } else if (isMultiframe) {
    return await _cacheWebpGift(giftId, size);
  } else if (isRive) {
    return _cacheRiveGift(giftId, size);
  } else {
    return await _cacheZipGift(giftId, size);
  }
}

Future<bool> _cacheRiveGift(int giftId, int size) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = getRiveGiftFile(giftId);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('rive file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('rive size error');
    await file.delete();
  }

  String url = "${System.imageDomain}static/$giftSubDir/$giftId.riv";
  await _downloadGift(size, url, file);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('rive file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('rive size error');
    await file.delete();
  }
  return false;
}

Future<bool> _cacheWebpGift(int giftId, int size) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = getMultiframeGiftFile(giftId);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('webp file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('webp size error');
    await file.delete();
  }

  String url = "${System.imageDomain}static/$giftSubDir/$giftId.webp";
  await _downloadGift(size, url, file);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('webp file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('webp size error');
    await file.delete();
  }
  return false;
}

Future<bool> _cacheVapGift(
  int giftId,
  int size, {
  String? effect,
  int? effectSize,
  bool isAwake = false,
  bool isTest = false,
}) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = isAwake ? getAwakeVapGiftFile(giftId) : getVapGiftFile(giftId);

  if (await _isValidFile(file, size,
      effectSize: effectSize, isAwake: isAwake)) {
    return true;
  }

  String url;
  if (Util.validStr(effect)) {
    // 优先使用effect下载，测试时使用原始oss地址，防止资源配置错误时污染代理节点数据
    url = Util.getRemoteImgUrl(effect, useProxy: !isTest);
  } else {
    url = Util.getRemoteImgUrl('static/$giftSubDir/$giftId.mp4',
        useProxy: !isTest);
  }

  await _downloadGift(size, url, file);

  return _isValidFile(file, size, effectSize: effectSize, isAwake: isAwake);
}

Future<bool> _isValidFile(
  File file,
  int size, {
  int? effectSize = 0,
  bool isAwake = false,
}) async {
  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('file real size ${stat.size}, config size $size');
    if (isAwake && stat.size == effectSize) {
      // 私聊觉醒动效的size
      return true;
    }
    if (stat.size == size) {
      return true;
    }
    Log.d('file size error');
    try {
      await file.delete();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
  return false;
}

Future<bool> _cacheZipGift(int giftId, int size) async {
  String url = "${System.imageDomain}static/$giftSubDir/$giftId.zip";
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  String giftDir = join(baseDir, giftId.toString());
  Directory directory = await Directory(baseDir).create(recursive: true);
  File file = File(join(directory.path, "$giftId.zip"));

  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }

  try {
    var start = DateTime.now();
    await _downloadGift(size, url, file);
    var end = DateTime.now();
    Duration duration = end.difference(start);
    Log.d('cacheGift.download duration(ms): ${duration.inMilliseconds}');

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == size) {
        Directory directory = await Directory(giftDir).create(recursive: true);
        //开始解压
        var start = DateTime.now();
        List<int> bytes = file.readAsBytesSync();
        var end = DateTime.now();
        Duration duration = end.difference(start);
        Log.d('cacheGift.read duration(ms): ${duration.inMilliseconds}');
        // Decode the Zip file
        //				Archive archive = new ZipDecoder().decodeBytes(bytes);
        Archive archive = await compute(decodeZip, bytes);
        var end1 = DateTime.now();
        duration = end1.difference(end);
        Log.d('cacheGift.decodeZip duration(ms): ${duration.inMilliseconds}');

        for (ArchiveFile file in archive) {
          String name = file.name;
          if (file.isFile) {
            List<int> data = file.content;
            File(join(directory.path, name))
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          } else {
            Directory(join(directory.path, name)).create(recursive: true);
          }
        }
        var end2 = DateTime.now();
        duration = end2.difference(end1);
        Log.d('cacheGift.write duration(ms): ${duration.inMilliseconds}');
        return true;
      }
      await file.delete();
    }
  } catch (e, s) {
    Log.e(e, stackTrace: s);
  }
  return false;
}

Future<bool> cacheGiftVoice(String url) async {
  String baseDir = join(Constant.documentsDirectory.path, giftVoiceDir);
  await Directory(baseDir).create(recursive: true);
  File file = getGiftVoiceFile(url);

  if (await file.exists()) {
    Log.d('cacheGiftVoice exist');
    return true;
  }

  await DownloadManager.download(url, file.path);

  if (await file.exists()) {
    Log.d('cacheGiftVoice download');
    return true;
  }
  return false;
}

Future<bool> hasCacheUnityGift(int giftId, int size) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = getUnityGiftFile(giftId);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }
  return false;
}

Future<bool> _cacheUnityGift(int giftId, int size) async {
  if (await hasCacheUnityGift(giftId, size)) {
    return true;
  }
  File file = getUnityGiftFile(giftId);
  String url = "${System.imageDomain}/static/$giftSubDir/android/$giftId";
  if (Platform.isIOS) {
    url = "${System.imageDomain}/static/$giftSubDir/ios/$giftId";
  }
  await _downloadGift(size, url, file);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('unity file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('unity size error');
    await file.delete();
  }
  return false;
}

Future _downloadGift(int size, String url, File file) async {
  Log.d('_downloadGift, url: $url');
  AssetDataLog.instance
      ?.add(AssetDataInfo(url: url, type: AssetDataType.animation));
  if (size < 1 * 1000000) {
    // 小于1MB直接下载
    try {
      await DownloadManager.download(url, file.path);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  } else {
    // 大于1MB并发下载以提高速度
    try {
      await DownloadManager.downloadWithChunks(url, file.path, size: size);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
}

Future<bool> cacheCpMatchBg(String url, int size) async {
  File file = await getCpMatchFile(url);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }

  await _downloadGift(size, url, file);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }
  return false;
}

Future<File> getCpMatchFile(String url) async {
  String baseDir = join(Constant.documentsDirectory.path, 'cp_match');
  await Directory(baseDir).create(recursive: true);
  String key = _md5(url);
  File file = File(join(baseDir, key));
  return file;
}

Future<bool> cacheMagicGiftWebp(int giftId, int size) async {
  String url = '${System.imageDomain}static/$giftSubDir/$giftId.m.webp';
  File file = getMagicGiftWebpFile(giftId);
  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }
  await _downloadGift(size, url, file);
  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    }
    await file.delete();
  }
  return false;
}

File getMagicGiftWebpFile(int giftId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  File file = File(join(baseDir, '$giftId.m.webp'));
  return file;
}

String _md5(String data) {
  var content = const Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes).toLowerCase();
}
