import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';

import '../../../k.dart';

class StartPartyService {
  static Future<int> start({
    required BuildContext context,
    required String partyType,
    String? refer,
    bool noPartyType = false,
  }) async {
    if (noPartyType) {
      IPremadeManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PREMADE);
      manager.openPremadeGameScreen(context, type: partyType);
      Tracker.instance.track(TrackEvent.join_party,
          properties: {'party_type': partyType, 'room_type': ''});

      return 1;
    }

    CommonLoading.show(status: R.string('login_loading'));
    DataRsp<CreatePartyInfo> resp =
        await PartyCreateRepo.getCreatePartyInfo(partyType);
    CreatePartyInfo? matchInfo;
    if (resp.success) {
      matchInfo = resp.data;
    }
    CommonLoading.dismiss();
    if (matchInfo == null) return 0;

    IPremadeManager premadeManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    bool intercpt = await premadeManager.checkMatchAndIntercept();
    if (intercpt) return 0;

    String roomType = '';
    if (matchInfo.roomList.isNotEmpty) {
      roomType = matchInfo.roomList.first.roomType;
    }
    if (matchInfo.roomList.length > 1) {
      String? type;
      if (partyType == 'guess') {
        IDrawGuessManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_DRAW_GUESS);
        type = await manager.showChooseGuessModePanel(context);
      } else {
        type = await _chooseRoomType(matchInfo, partyType);
      }
      if (type == null) return 0;

      roomType = type;
    }

    /// matchInfo.matchStyle = 1;
    IPremadeManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    manager.openPremadeGameScreen(System.context, type: roomType);
    Tracker.instance.track(TrackEvent.join_party,
        properties: {'party_type': partyType, 'room_type': roomType});

    return 1;
  }

  static Future<String?> _chooseRoomType(
      CreatePartyInfo info, String partyType) async {
    List<RoomType> roomList = info.roomList;

    List<SheetItem> res = [];
    for (int i = 0; i < roomList.length; i++) {
      res.add(SheetItem(roomList[i].show, roomList[i].roomType));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: System.context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return null;
    }

    String? key = result.value?.key;

    /// 狼人需要特殊处理
    if (partyType == 'wolf_all') {
      RoomType roomType =
          info.roomList.firstWhere((element) => element.roomType == key);
      if (roomType.lock) {
        await _wolfGameValidation(roomType);
        return null;
      }
    }

    return key;
  }

  static Future _wolfGameValidation(RoomType roomType) async {
    bool? result = await showDialog(
      context: System.context,
      builder: (context) {
        return ConfirmDialog(
          title: K.room_answer_or_leve5_lock,
          negativeButton: NegativeButton(
            text: K.cancel,
          ),
          positiveButton: PositiveButton(
            text: K.room_go_answer,
          ),
        );
      },
    );
    if (result == true) {
      int mode = _getTestMode(roomType.roomType);
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.showWolfTestScreen(System.context, mode: mode);
    }
  }

  static int _getTestMode(String type) {
    switch (type) {
      case IWereWolfManager.WOLF9:
      case IWereWolfManager.NEWWOLF9:
        return 1;
      case IWereWolfManager.WOLF12:
        return 3;
    }
    return 1;
  }
}
