import 'dart:convert';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';
import 'package:chat_room/src/protobuf/generated/accompany.tacit.pb.dart';

/// @Author wangyang
/// @Description
/// @Date 2022/9/15
class AccompanyTacitUtil {
  ///alpha环境下，会连续推送两条问答消息，服务端暂未找到原因
  ///暂时通过uuid去重解决
  static String? lastMessageUUID;

  ///默契问答消息 因为使用了新的消息协议，需要转成MessageContent用来展示
  static MessageContent? parse(AccompanyTacit tacitData) {
    ///观众视角不展示此消息
    var userList = tacitData.tacit.include;
    if (!userList.contains(Session.uid)) {
      return null;
    }

    Map user = {};
    Map extra = {};
    try {
      if (tacitData.extra.isNotEmpty) {
        Log.d('AccompanyTacitUtil,tacitData.extra=${tacitData.extra}');
        Map map = json.decode(tacitData.extra);

        ///用户信息都放在extra里面
        user = extra = map;
      }
    } catch (e) {
      Log.d(e);
    }
    Log.d('AccompanyTacitUtil,uuid=${extra['uuid']}');
    if (lastMessageUUID == extra['uuid']) {
      return null;
    }
    lastMessageUUID = extra['uuid'];
    int messageId = DateTime.now().microsecondsSinceEpoch;
    MessageContent message = MessageContent.from(
        tacitData.content, extra, user, messageId,
        type: MessageType.AccompanyTacit);

    ///特有的消息数据放在expData里
    message.expData = tacitData;
    return message;
  }

  ///根据当前用户找到在麦上的对方的uid
  static int getTargetUid(ChatRoomData room) {
    if (room.config != null && room.config?.configExpendData is AccompanyData) {
      AccompanyData data = room.config?.configExpendData as AccompanyData;
      if (!data.truthEnable) {
        //跟真心话入口展示逻辑一致，直接复用
        return -1;
      }
    }
    RoomPosition? curPosition = room.positionForCurrentUser;
    if (curPosition == null || curPosition.uid <= 0) {
      return -1;
    }
    RoomPosition? targetPosition;
    for (int i = 0; i < room.positions.length; i++) {
      if (room.positions[i].uid != curPosition.uid) {
        targetPosition = room.positions[i];
        break;
      }
    }
    if (targetPosition == null || targetPosition.uid <= 0) {
      return -1;
    }

    return targetPosition.uid;
  }
}
