import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

abstract class AbsRoomModel<T> extends ValueNotifier<T> {
  ChatRoomData? room;
  AbsRoomMsgHandler? msgHandler;
  bool mounted = false;
  bool loading = false;
  bool hasInit = false;

  AbsRoomModel(T value) : super(value) {
    mounted = true;
  }

  void init(ChatRoomData room) {
    this.room = room;
    msgHandler = createMsgHandler(this, room);

    loadData();
  }

  void loadData();

  AbsRoomMsgHandler createMsgHandler(AbsRoomModel model, ChatRoomData room);

  void clean() {
    msgHandler?.dispose();
    msgHandler = null;
  }

  @override
  void dispose() {
    clean();
    mounted = false;

    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!mounted) return;
    super.notifyListeners();
  }
}
