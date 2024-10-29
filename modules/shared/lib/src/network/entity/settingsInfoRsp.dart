import 'package:shared/shared.dart';

class SettingsInfoRsp {
  late bool success;
  late SettingsInfoData data;

  SettingsInfoRsp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = SettingsInfoData.fromJson(json['data']);
  }
}

class SettingsInfoData {
  bool showMsgSetting = false;
  bool enableStrangerMsg = false;
  int pushWakeupChat = 0;
  bool nearbyInvisible = false;
  bool addressBookInvisible = false;
  bool enableRecommend = false;
  bool enableRoomRecommend = false;

  SettingsInfoData.fromJson(Map<String, dynamic> data) {
    if (data['stranger_msg_show'] != null) {
      showMsgSetting = Util.parseInt(data['stranger_msg_show']) > 0;
    }
    if (data['stranger_msg'] != null) {
      enableStrangerMsg = Util.parseInt(data['stranger_msg']) <= 0;
    }

    if (data['push_wakeup_chat'] != null) {
      pushWakeupChat = Util.parseInt(data['push_wakeup_chat']);
    }

    if (data['show_room_recommend'] != null) {
      enableRoomRecommend = Util.parseBool(data['show_room_recommend']);
    }

    if (data['nearby_invisible'] != null) {
      nearbyInvisible = Util.parseInt(data['nearby_invisible']) > 0;
    }

    if (data['addr_book_invisible'] != null) {
      addressBookInvisible = Util.parseInt(data['addr_book_invisible']) > 0;
    }

    if (data['open_recommend'] != null) {
      enableRecommend = Util.parseInt(data['open_recommend']) > 0;
    }
  }
}
