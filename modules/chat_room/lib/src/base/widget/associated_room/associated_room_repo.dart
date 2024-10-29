import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';

class AssociatedRoomRepo {
  /// 获取关联房间列表
  static Future<RoomChildrenRoomListRsp> getAssociatedRoomList(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/plugin/childrenRoomList',
        pb: true,
        throwOnError: true,
        queryParameters: {'parent_rid': rid.toString()},
      );
      return RoomChildrenRoomListRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RoomChildrenRoomListRsp(success: false, msg: e.toString());
    }
  }

  /// 请求推送指定房间
  static Future<NormalNull> sendPushAssociateRoom(
      {required int parentRid, required int id}) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/plugin/noticeChildRoom',
        pb: true,
        throwOnError: true,
        queryParameters: {
          'parent_rid': parentRid.toString(),
          'id': id.toString(),
        },
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
