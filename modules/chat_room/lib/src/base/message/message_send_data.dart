import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'dart:convert';

class MessageSendData {
  static String msgExtraJsonEncode(ChatRoomData room,
      {int? isGuess, Map<String, dynamic>? extra}) {
    return json.encode(msgExtra(room, isGuess: isGuess, extra: extra));
  }

  static Map<String, dynamic> msgExtra(ChatRoomData room,
      {int? isGuess = 0, Map<String, dynamic>? extra}) {
    Map<String, dynamic> result = {
      'vip': Session.vip,
      'vip_new': Session.vipNew,
      'title': Session.title,
      'title_new': Session.titleNew,
      'defends': room.defend,
      'is_guess': isGuess,
      'position': room.positionForCurrentUser?.position ?? -1,
      'is_live': room.config?.types == RoomTypes.Live ? 1 : 0,
      'live_uid': room.createor?.uid ?? 0,
      'live_label': room.config?.liveDataV3?.fansLabel ?? '',
      'master_uid': room.positions.first.uid,
      'push_message_tag':
          room.isMic, // 此字短发给服务端使用，用于公屏消息 走socket推送（麦上） 还是 oss切片拉取（麦下）
    };

    if (extra != null) {
      extra.forEach((key, value) {
        result[key] = value;
      });
    }

    Log.d('msgExtra $result');
    return result;
  }
}
