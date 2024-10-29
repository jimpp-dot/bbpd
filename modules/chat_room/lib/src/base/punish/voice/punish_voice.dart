import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

/// 声音类惩罚基类
abstract class IVoicePunish {
  final ChatRoomData room;

  IVoicePunish(this.room);

  /// 应用惩罚效果
  void apply(bool isSpeaking);

  /// 重置惩罚效果，惩罚消失时调用
  void reset();

  bool isSpeaking() {
    return room.isSpeaker(Session.uid);
  }
}
