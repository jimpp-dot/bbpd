import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

import 'data/talent_repo.dart';

class TalentModule {
  /// 判断用户是否是3区间内主播
  /// true 为前3后3，可自由上麦，false 不是前3后3，需要排麦
  /// [toastError] 是否显示错误消息
  static Future<bool> isQueueAnchor(int rid, {bool? toastError}) async {
    var resp = await TalentRepo.isQueueAnchor(rid);
    if (resp.success == true) {
      return resp.data ?? true;
    } else {
      if (toastError == true && resp.msg != null) {
        Fluttertoast.showToast(msg: resp.msg);
      }
      return false;
    }
  }

  /// 当前有正在表演者的人
  /// [errVal]异常情况下返回值
  static bool hasPerformerUser(ChatRoomData? room, {bool errVal = false}) {
    if (room == null) return errVal;
    RoomPosition? pos = Util.getListElementSafely(room.positions, 0);
    if (pos == null) {
      return errVal;
    }
    return pos.uid > 0;
  }
}
