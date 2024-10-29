import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class AudioPlayHelper {
  static AudioPlayHelper? _instance;

  static AudioPlayHelper instance() {
    return _instance ??= AudioPlayHelper();
  }

  AudioPlayer? _sound;
  StreamSubscription? _audioPlayerStateSubscription;

  /// 播放asset目录下的音乐文件
  /// 根据本地文件路径,播放音频  播放完成/播放错误/播放停止均释放
  Future<void> playAudio(String fileName,
      {String path = "assets/sound/", bool loop = false}) async {
    try {
      File file = File(join(Constant.temporaryDirectory.path, fileName));
      if (await file.exists() == false) {
        ByteData bytes = await otaResourceBundle.load(path + fileName);
        await file.writeAsBytes(bytes.buffer.asUint8List());
      }
      await playAudioWithFilePath(file.path, loop: loop);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  /// 播放绝对路径的音乐文件
  Future<void> playAudioWithFilePath(String fileName,
      {bool loop = false}) async {
    if (fileName.isEmpty) {
      Log.e('fileName can not null or empty');
      return;
    }
    try {
      if (_sound == null) {
        _sound = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
        _audioPlayerStateSubscription = _sound!.onPlayerStateChanged.listen(
          (s) async {
            Log.d(s);
            if (s == PlayerState.completed) {
              //播放完成
              if (loop == true) {
                await _sound!.play(DeviceFileSource(fileName));
              } else {
                await closeSound();
              }
            } else if (s == PlayerState.stopped) {
              //播放错误或者播放停止
              if (loop == true) {
                await _sound!.play(DeviceFileSource(fileName));
              } else {
                await closeSound();
              }
            }
          },
        );
      }
      await _sound!.play(DeviceFileSource(fileName));
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  Future<void> closeSound() async {
    if (_sound != null && _audioPlayerStateSubscription != null) {
      await _audioPlayerStateSubscription?.cancel();
      _audioPlayerStateSubscription = null;
      await _sound!.stop();
      _sound = null;
    }
  }

  Future<void> pause() async {
    if (_sound != null) {
      await _sound!.pause();
    }
  }
}
