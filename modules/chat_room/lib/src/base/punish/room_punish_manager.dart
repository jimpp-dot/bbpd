import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/punish/voice/punish_bgm_voice.dart';
import 'package:chat_room/src/base/punish/voice/punish_change_voice.dart';
import 'package:chat_room/src/base/punish/voice/punish_trick_voice.dart';
import 'package:chat_room/src/base/punish/voice/punish_voice.dart';

import 'model/punish_beans.dart';

/// 房间语音惩罚管理
class RoomPunishManager {
  final ChatRoomData room;

  /// 上一次speaking状态
  bool _isLastSpeaking = false;

  /// 声音惩罚
  IVoicePunish? _voicePunish;
  UserPunish? _voicePunishConfig;

  RoomPunishManager(this.room);

  void init() {
    room.addListener(RoomConstant.Event_Local_Punish_Refresh, _onPunishChange);
    room.speakers.addListener(_onSpeakingChanged);
  }

  void dispose() {
    room.removeListener(
        RoomConstant.Event_Local_Punish_Refresh, _onPunishChange);
    room.speakers.removeListener(_onSpeakingChanged);
    _voicePunish?.reset();
    _voicePunish = null;
    _voicePunishConfig = null;
    _isLastSpeaking = false;
  }

  /// 用户惩罚改变
  _onPunishChange(String type, dynamic data) {
    Log.d('RoomPunishManager._onPunishChange, type: $type, data: $data');
    if (data == null) {
      // 传null过来就取消声音惩罚
      _voicePunish?.reset();
      _voicePunish = null;
      _voicePunishConfig = null;
      _isLastSpeaking = false;
      return;
    }
    if (data is! UserPunish) return;
    UserPunish newPunishConfig = data;
    if (newPunishConfig.uid != Session.uid) return;
    if (_voicePunishConfig?.id != newPunishConfig.id ||
        _voicePunishConfig?.type != newPunishConfig.type ||
        _voicePunishConfig?.content != newPunishConfig.content) {
      _voicePunishConfig = newPunishConfig;
      _voicePunish?.reset();
      _voicePunish = null;
      if (_voicePunishConfig != null) {
        _voicePunish = _createVoicePunish(_voicePunishConfig);
      }
    }
  }

  /// 当前用户speaking状态改变
  _onSpeakingChanged() {
    if (_voicePunish == null) return;
    bool isSpeaking = room.isSpeaker(Session.uid);
    _isLastSpeaking = isSpeaking;
    _voicePunish!.apply(_isLastSpeaking);
  }

  /// 构建语音惩罚项
  IVoicePunish? _createVoicePunish(UserPunish? punish) {
    switch (punish?.type) {
      case SystemPunishType.naughty:
        return PunishTrickVoice(room, punish!.content);
      case SystemPunishType.special:
        return PunishBGMVoice(room, punish!.content);
      case SystemPunishType.funny:
        return PunishChangeVoice(room, punish!.content);
      default:
        Log.w(
            tag: "RoomPunishManager",
            'Not support punish type: ${punish?.type.toString()}');
    }
    return null;
  }
}
