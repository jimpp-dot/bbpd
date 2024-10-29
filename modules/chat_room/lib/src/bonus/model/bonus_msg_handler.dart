import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';

class BonusMsgHandler {
  final BonusModel model;

  BonusMsgHandler(this.model) {
    _registerMsg();
  }

  List<String> get msgList => [BonusMsg.refresh];

  void _registerMsg() {
    model.room.addListeners(msgList, _handMsg);
  }

  void _unregisterMsg() {
    model.room.removeListeners(msgList, _handMsg);
  }

  void _handMsg(String name, dynamic data) {
    if (data is! Map) return;
    Log.d('BonusMsgHandler._handMsg, name: $name, data: $data');

    Map json = data;
    BonusData? oldData = model.value;
    BonusData bonusData = BonusData(oldData?.count ?? 0, oldData?.curBonus);
    if (json.containsKey('count')) {
      bonusData.count = Util.parseInt(json['count'], 0);
    }

    if (json.containsKey('packet')) {
      dynamic bonusJson = json['packet'];
      if (bonusJson is Map && bonusJson.isNotEmpty) {
        bonusData.curBonus =
            BonusInfo.fromJson(bonusJson as Map<String, dynamic>);
      } else {
        bonusData.curBonus = null;
      }
    }

    model.value = bonusData;
  }

  void dispose() {
    _unregisterMsg();
  }
}

class BonusMsg {
  static const String refresh =
      '${RoomConstant.Event_Prefix}room.packet.refresh'; //房间红包刷新
}
