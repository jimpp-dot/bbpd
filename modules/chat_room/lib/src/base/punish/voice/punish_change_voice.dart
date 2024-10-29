import 'package:shared/shared.dart';
import 'package:chat_room/src/base/punish/voice/punish_voice.dart';

/// 房间惩罚-搞怪变声器
class PunishChangeVoice extends IVoicePunish {
  final int inflexion;
  bool _apply = false;

  PunishChangeVoice(super.room, String inflexionStr)
      : inflexion = Util.parseInt(inflexionStr);

  @override
  void apply(bool isSpeaking) async {
    if (!_apply && inflexion != room.inflexion) {
      await room.setVoiceEffect(inflexion);
      _apply = true;
    }
  }

  @override
  void reset() async {
    // 恢复房间设置的变音
    await room.setVoiceEffect(room.inflexion);
  }
}
