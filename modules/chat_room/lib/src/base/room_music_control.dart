import 'package:shared/shared.dart';

import '../../k.dart';
import 'atmosphere/atmosphere_manager.dart';
import 'background_music/music_controller.dart';
import 'player/rtc_music_player.dart';

/// 房间内不同音频播放交互逻辑
class RoomMusicControl {
  /// 互斥的音频播放业务
  static var musicCheckList = <MusicScene>[
    MusicScene.atmosphere,
    MusicScene.backgroundMusic
  ];

  /// 检测当前是否可以播放音频，该功能与房间背景音乐互斥，开启房间背景音乐或房间氛围时，
  /// 先检测是否已开启另一项功能，若已开启，则提示用户进行关闭后再使用当前功能
  /// 请先关闭xx功能再使用xx功能
  static bool canMusicPlay(MusicScene selfType) {
    bool retVal = true;
    for (var type in musicCheckList) {
      if (type == selfType) {
        continue;
      }
      switch (type) {
        case MusicScene.atmosphere:
          var playing = RoomAtmosphereManager.isPlayMusic();
          retVal = !playing;
          if (playing) {
            var self = getMusicSceneText(selfType);
            Fluttertoast.showCenter(
                msg: K.room_music_mutually([K.room_atmosphere, self]));
          }
          break;
        case MusicScene.backgroundMusic:
          var playing = MusicController.isPlaying;
          retVal = !playing;
          if (playing) {
            var self = getMusicSceneText(selfType);
            Fluttertoast.showCenter(
                msg: K.room_music_mutually([K.room_bg_music, self]));
          }
          break;
        default:
          break;
      }
    }
    return retVal;
  }

  static String getMusicSceneText(MusicScene type) {
    switch (type) {
      case MusicScene.atmosphere:
        return K.room_atmosphere;
      case MusicScene.backgroundMusic:
        return K.room_bg_music;
      default:
        return '';
    }
  }

  // 用户下麦关闭音频
  static closeMusic() {
    RtcAudioPlayer.instance.stopPlay();
    MusicController.stopPlay();
  }
}

enum MusicScene {
  atmosphere, // 房间氛围
  backgroundMusic, // 背景音乐
  musicRoom, // 音乐房
}
