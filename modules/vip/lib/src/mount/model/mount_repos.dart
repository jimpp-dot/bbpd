import 'package:shared/shared.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';

class MountRepos {
  /// 座驾碎片背包
  static Future<ResMountDebrisBag> getMountPiece(int serialId) async {
    String url =
        '${System.domain}go/yy/mount-serial/debrisBag?serial_id=$serialId';
    try {
      XhrResponse response = await Xhr.get(url, throwOnError: true, pb: true);
      return ResMountDebrisBag.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountDebrisBag(msg: e.toString(), success: false);
    }
  }

  /// 碎片兑换
  /// [serialId] 对应的座驾系列id
  /// [type] mount:座驾 debris碎片
  /// [pieceId] 碎片id
  /// [toId] 要兑换的碎片id，如果是兑换座驾，这个字段不需要
  static Future<ResMountExchange> exchange(
      {required int serialId,
      required String type,
      required int pieceId,
      int toId = 0}) async {
    String url = '${System.domain}go/yy/mount-serial/exchange';
    try {
      Map<String, String> params = {
        'serial_id': '$serialId',
        'type': type,
        'id': '$pieceId'
      };
      if (toId > 0) {
        params['to_id'] = '$toId';
      }
      XhrResponse response =
          await Xhr.post(url, params, throwOnError: true, pb: true);
      return ResMountExchange.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountExchange(msg: e.toString(), success: false);
    }
  }

  static Future<ResMountMainPage> myMount(int uid, int serialId) async {
    String url =
        '${System.domain}go/yy/mount-serial/mainPage?uid=$uid&serial_id=$serialId';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResMountMainPage.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountMainPage(success: false, msg: e.toString());
    }
  }

  static Future<ResMountSerialTab> getRankTab() async {
    String url = '${System.domain}go/yy/mount-serial/tab';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResMountSerialTab.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountSerialTab(success: false, msg: e.toString());
    }
  }

  static Future<ResMountSerialRank> getRankList(int serialId) async {
    String url = '${System.domain}go/yy/mount-serial/rank?serial_id=$serialId';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResMountSerialRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountSerialRank(success: false, msg: e.toString());
    }
  }

  /// 请求跳转的schema
  static Future<ResMountSerialJumpRoom> gotoRoom(int serialId) async {
    String url =
        '${System.domain}go/yy/mount-serial/jumpRoom?serial_id=$serialId';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResMountSerialJumpRoom.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMountSerialJumpRoom(success: false, msg: e.toString());
    }
  }

  /// 穿戴、卸下座驾
  static Future<NormalNull> wearMount(int cid, bool wear) async {
    String url = '${System.domain}go/yy/mount-serial/dress';
    try {
      final response = await Xhr.post(
          url, {'cid': '$cid', 'type': wear ? 'on' : 'off'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
