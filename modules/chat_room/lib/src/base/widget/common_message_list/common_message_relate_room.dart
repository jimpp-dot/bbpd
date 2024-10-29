import 'package:shared/shared.dart';

/// 关联房间信息
class CommonMessageRelateRoom {
  int type = 0;

  /// type=1,大房间(商业厅) type=2小房间(靓号引流房)
  List<OriginRoomData> rooms = [];
  int pullMsgInterval = 5;

  /// 关联房间公屏轮询间隔时间

  CommonMessageRelateRoom.fromJson(Map? data) {
    if (data != null) {
      type = Util.parseInt(data['type']);
      if (data['drainage_room'] != null && data['drainage_room'] is List) {
        rooms = (data['drainage_room'] as List)
            .map((e) {
              return OriginRoomData.fromJson(e as Map<String, dynamic>);
            })
            .cast<OriginRoomData>()
            .toList();
      }
      int time = Util.parseInt(data['pull_msg_interval']);
      if (time > 5) {
        /// 最小间隔为5s
        pullMsgInterval = time;
      }
    }
  }
}

class OriginRoomData {
  int rid = 0;
  String name = '';

  OriginRoomData.fromJson(Map? data) {
    if (data != null) {
      rid = Util.parseInt(data['rid']);
      name = Util.notNullStr(data['name']);
    }
  }
}
