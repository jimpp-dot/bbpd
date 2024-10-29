import 'package:shared/shared.dart';
import 'package:chat_room/src/base/punish/voice/punish_voice.dart';
import 'package:commonrtc_api/commonrtc_api.dart';

/// 房间惩罚-特殊背景音
class PunishBGMVoice extends IVoicePunish {
  bool _isLastPlaying = false;
  final String _musicUrl;
  final int _soundId;

  PunishBGMVoice(super.room, String musicUrl)
      : _musicUrl = Util.getRemoteImgUrl(musicUrl),
        _soundId = musicUrl.hashCode;

  RtcEngine? get _rtcBizEngine => room.rtcController.engine;

  @override
  void apply(bool isSpeaking) async {
    if (isSpeaking) {
      if (!_isLastPlaying) {
        _play();
      }
    } else {
      _rtcBizEngine?.stopEffect(_soundId);
    }
    _isLastPlaying = isSpeaking;
  }

  @override
  void reset() {
    _isLastPlaying = false;
    _rtcBizEngine?.stopEffect(_soundId);
  }

  /// 播放捣乱音
  void _play() async {
    Log.w(tag: "RoomPunishManager", 'PunishTrickVoice _play');
    _rtcBizEngine?.stopEffect(_soundId);
    _rtcBizEngine?.playEffect(soundId: _soundId, filePath: _musicUrl);
  }
}
