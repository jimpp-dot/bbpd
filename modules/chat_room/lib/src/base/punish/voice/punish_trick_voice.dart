import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'punish_voice.dart';

/// 捣乱背景音：讲话时间歇性的随机插入动物的叫声（如身边好像有只猪在一直叫）
class PunishTrickVoice extends IVoicePunish {
  final String _musicUrl;
  final int _soundId;

  int? _startRecordTime; // 初始化说话时间
  int _totalRecordTime = 0; // 累计说话时长
  Timer? _speakerTimer;
  bool _isLastSpeaking = false;

  RtcEngine? get _rtcBizEngine =>
      ChatRoomData.getInstance()?.rtcController.engine;

  PunishTrickVoice(super.room, String musicUrl)
      : _musicUrl = Util.getRemoteImgUrl(musicUrl),
        _soundId = musicUrl.hashCode;

  @override
  void apply(bool isSpeaking) async {
    Log.w(
        tag: "RoomPunishManager",
        'PunishTrickVoice apply isSpeaking: $isSpeaking');
    if (isSpeaking) {
      if (_isLastSpeaking) return;
      _speakerTimer?.cancel();
      _speakerTimer = Timer.periodic(const Duration(seconds: 1), _play);
    } else {
      _rtcBizEngine?.stopEffect(_soundId);
      _startRecordTime = null;
      _speakerTimer?.cancel();
    }
    _isLastSpeaking = isSpeaking;
  }

  @override
  void reset() {
    Log.w(tag: "RoomPunishManager", 'PunishTrickVoice reset');
    _speakerTimer?.cancel();
    _startRecordTime = null;
    _totalRecordTime = 0;
    _isLastSpeaking = false;
    _rtcBizEngine?.stopEffect(_soundId);
  }

  /// 判断是否符合播捣乱音
  /// 说话时间，每隔5秒播一次
  bool _check() {
    if (!isSpeaking()) {
      reset();
      return false;
    }
    int lastRecordTime = _totalRecordTime;
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (_startRecordTime != null && _startRecordTime! > 0) {
      _totalRecordTime += (nowTime - _startRecordTime!) ~/ 1000;
    }
    _startRecordTime = nowTime;
    bool canPlay =
        lastRecordTime != _totalRecordTime && (_totalRecordTime % 5 == 0);
    Log.w(
        tag: "RoomPunishManager",
        'PunishTrickVoice _check _totalRecordTime: $_totalRecordTime canPlay: $canPlay');
    return canPlay;
  }

  /// 播放捣乱音
  void _play(Timer timer) async {
    if (!_check()) {
      return;
    }
    Log.w(tag: "RoomPunishManager", 'PunishTrickVoice _play');
    _rtcBizEngine?.stopEffect(_soundId);
    _rtcBizEngine?.playEffect(soundId: _soundId, filePath: _musicUrl);
  }
}
