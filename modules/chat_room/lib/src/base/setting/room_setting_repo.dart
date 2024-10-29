import 'package:shared/shared.dart';

class RoomSettingRepo {
  /// 皮队友 房间设置
  static Future<NormalNull?> mateRoomOption(int rid, String type) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/mate/room/option/setting',
        {
          'rid': '$rid',
          'type': type,
        },
        pb: true,
      );
      NormalNull result = NormalNull.fromBuffer(response.bodyBytes);
      Fluttertoast.showToast(msg: '设置成功', gravity: ToastGravity.CENTER);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
    return null;
  }

  /// 皮队友 房间收藏/取消
  static Future<NormalNull?> mateRoomCollectOption(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/mate/room/option/collect',
        {
          'rid': '$rid',
        },
        pb: true,
        throwOnError: true,
      );
      NormalNull result = NormalNull.fromBuffer(response.bodyBytes);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
    return null;
  }

  /// 主app 房间收藏/取消
  /// rid:房间ID
  /// op:操作1收藏，0取消收藏
  static Future<NormalNull?> favoriteRoomOption(int rid, int op) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/room/collect',
        {
          'rid': '$rid',
          'op': '$op',
        },
        pb: true,
        throwOnError: true,
      );
      NormalNull result = NormalNull.fromBuffer(response.bodyBytes);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
    return null;
  }
}
