import 'package:flutter/material.dart';
import 'package:chat_room/src/chatRoomData.dart';

///房间业务消息处理
abstract class AbsRoomMsgHandler {
  ChangeNotifier model;
  ChatRoomData? room;

  AbsRoomMsgHandler(this.model, this.room) {
    _registerMsg();
  }

  List<String> get msgList;

  void _registerMsg() {
    room?.addListeners(msgList, handleMsg);
  }

  void _unregisterMsg() {
    room?.removeListeners(msgList, handleMsg);
  }

  void handleMsg(String name, dynamic data);

  void dispose() => _unregisterMsg();
}
