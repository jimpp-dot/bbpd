import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/src/base/room_music_control.dart';

import '../player/rtc_music_player.dart';
import 'atmosphere_repo.dart';
import 'atmosphere_widget.dart';

/// 房间氛围逻辑层
class RoomAtmosphereManager {
  // 为了接口调用频次限制
  static bool _disPlayedSheet = false;

  /// 打开房间氛围面板
  static displaySheet(BuildContext context, int rid) async {
    _disPlayedSheet = true;
    await displayModalBottomSheet(
      context: context,
      maxHeightRatio: 587 / 812,
      builder: (BuildContext context) {
        return AtmospherePanel(rid);
      },
    );
  }

  /// 房间氛围音乐是否在播放(播放/暂停)
  static bool isPlayMusic() {
    return !RtcAudioPlayer.instance.isRelease &&
        RtcAudioPlayer.instance.musicScene == MusicScene.atmosphere;
  }

  /// 房间氛围音乐是否正在播放
  static bool isPlayingMusic() {
    return RtcAudioPlayer.instance.isPlaying &&
        RtcAudioPlayer.instance.musicScene == MusicScene.atmosphere;
  }

  /// 后端关闭房间氛围，此api会刷新socket，增加限制
  static apiCloseAtmosphere(int rid) {
    if (_disPlayedSheet) {
      AtmosphereRepo.closeAtmosphere(rid);
      _disPlayedSheet = false;
    }
  }
}
