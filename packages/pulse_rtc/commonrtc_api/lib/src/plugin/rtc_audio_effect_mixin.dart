import 'dart:io';

import '../util/log.dart';
import '../util/rtc_utils.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import '../rtc_base_engine.dart';
import '../rtc_context.dart';

mixin RtcAudioEffectMixin on RtcBaseEngine {
  static int _defaultSoundId(String filePath) {
    return RtcUtils.md5Int(filePath);
  }

  /// 获取Asset目录下的文件拷贝到缓存目录的地址
  Future<String?> getAssetTemporaryPath(String assetFilePath) async {
    try {
      String fileName = basename(assetFilePath);
      var tempDir = await RtcContext.temporaryDirectory;
      File file = File(join(tempDir.path, fileName));
      if (await file.exists() == false) {
        ByteData bytes = await rootBundle.load(assetFilePath);
        await file.writeAsBytes(bytes.buffer.asUint8List());
      }
      if (!file.existsSync()) {
        return null;
      }
      return file.path;
    } catch (e) {
      rtcLog('getAssetTemporaryPath catch exception->$e');
      return null;
    }
  }

  Future<void> playAssetEffectFile(
    String assetFilePath, {
    int soundId = 0,
    int loopCount = 0,
    double pitch = 1,
    double pan = 0,
    double gain = 100,
    int publish = 0,
  }) async {
    var filePath = await getAssetTemporaryPath(assetFilePath);
    if (filePath != null) {
      if (soundId == 0) {
        soundId = _defaultSoundId(assetFilePath);
      }
      await playEffect(
        soundId: soundId,
        filePath: filePath,
        loopCount: loopCount,
        pitch: pitch,
        pan: pan,
        gain: gain,
        publish: publish,
      );
    }
  }

  Future<void> preloadAssetEffect(String assetFilePath, {int soundId = 0}) async {
    var filePath = await getAssetTemporaryPath(assetFilePath);
    if (filePath != null) {
      if (soundId == 0) {
        soundId = _defaultSoundId(assetFilePath);
      }
      await preloadEffect(soundId, filePath);
    }
  }

  Future<void> unloadAssetEffect(String assetFilePath, {int soundId = 0}) async {
    if (soundId == 0) {
      soundId = _defaultSoundId(assetFilePath);
    }
    return await unloadEffect(soundId);
  }
}
