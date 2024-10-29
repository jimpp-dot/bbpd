import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_msg_handler.dart';
import 'package:chat_room/src/bonus/model/bonus_repo.dart';

class BonusModel extends ValueNotifier<BonusData?> {
  late ChatRoomData room;
  BonusConfig? config;
  late BonusMsgHandler msgHandler;

  BonusModel() : super(null);

  void init(ChatRoomData roomData) {
    room = roomData;
    msgHandler = BonusMsgHandler(this);
    loadData(room.rid);
  }

  void loadData(int rid) {
    BonusRepo.getRoomBonus(rid).then((rsp) {
      if (rsp.success == true) value = rsp.data;
    });
  }

  void notify() {
    notifyListeners();
  }

  void clean() {
    msgHandler.dispose();
  }
}
