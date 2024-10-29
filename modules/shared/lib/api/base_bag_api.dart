import 'package:shared/k.dart';

import '../shared.dart';

/// 背包相关接口
class BaseBagApi {
  /// 赠送礼物api
  static Future<bool> onSendGift(
      int id, int num, int targetId, String name) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}commodity/present",
        {
          'id': id.toString(),
          'num': '$num',
          'targetId': '$targetId',
        },
        throwOnError: true,
      );

      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        Fluttertoast.showToast(
            msg: '${K.base_have_give_to_friend}$name×️$num',
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 对好友使用守护api
  static Future<bool> onUseDefend(
      int id, int num, int targetId, String name) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}commodity/useDefend",
        {
          'cid': id.toString(),
          'num': '$num',
          'to_uid': '$targetId',
        },
        throwOnError: true,
      );

      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        Fluttertoast.showToast(
            msg: '${K.base_have_give_to_friend}$name×️$num',
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 使用装饰类物品，第一次使用时调用该方法，使用的过的商品再次穿戴调用[_onHeaderOn]
  static Future<bool> onHeaderUse(int id, String name,
      {int num = 1, String? type}) async {
    bool success = false;
    if (type == 'dummy_pretty') {
      return BaseBagApi.onMateWearOp(id, name, 1, type: type);
    }

    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}commodity/use", {'id': '$id', 'num': '$num'},
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        if (name.contains(K.nobility_experience_card)) {
          Fluttertoast.showToast(
              msg: K.base_experience_card + name, gravity: ToastGravity.CENTER);
        } else {
          Fluttertoast.showToast(
              msg: K.base_header_on, gravity: ToastGravity.CENTER);
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 穿戴装饰物品（头像框、聊天汽包、主页装扮、进场动效等）
  /// [type] 物品类型
  static Future<bool> onHeaderOn(int id, String name, {String? type}) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}commodity/dress/on", {'id': '$id'},
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        Fluttertoast.showToast(
            msg: K.base_header_on, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 取消穿戴装饰物品（头像框、聊天汽包、主页装扮、进场动效等）
  static Future<bool> onHeaderOff(int id, String name, {String? type}) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}commodity/dress/off", {'id': '$id'},
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        Fluttertoast.showToast(
            msg: K.base_header_off([name]), gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 皮队友物品穿戴，取消穿戴接口
  /// [op] 1 穿戴; 2 取消穿戴
  static Future<bool> onMateWearOp(int id, String name, int op,
      {String? type}) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postPb(
        "${System.domain}go/mate/commodity/wearOp",
        {
          'id': '$id',
          'op': '$op',
          if (!Util.isNullOrEmpty(type)) 'type': type!,
        },
        throwOnError: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (rsp.success) {
        success = true;
        Fluttertoast.showToast(
            msg: op == 1 ? K.base_header_on : K.base_header_off([name]),
            gravity: ToastGravity.CENTER);
        if (op == 1) {
          Tracker.instance.track(TrackEvent.item_use_success, properties: {
            'uid': Session.uid,
            'item_name': name,
            'item_type': type,
          });
        }
      } else {
        if (rsp.msg.isNotEmpty) {
          Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }

  /// 赠送物品
  /// [id] 物品id
  /// [type] 物品类型
  /// [targetUid] 赠送uid
  static Future<bool> onMateCommoditySend(
      int id, String type, int num, int targetUid, String name) async {
    bool success = false;
    try {
      XhrResponse response = await Xhr.postPb(
        "${System.domain}go/mate/commodity/present",
        {
          'id': '$id',
          'type': type,
          'num': '$num',
          'target_uid': '$targetUid',
        },
        throwOnError: true,
      );

      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (rsp.success) {
        success = true;
        Fluttertoast.showToast(
            msg: '${K.base_have_give_to_friend}$name×️$num',
            gravity: ToastGravity.CENTER);
        Tracker.instance.track(TrackEvent.item_send_success, properties: {
          'uid': Session.uid,
          'item_name': name,
          'receive_uid': targetUid,
          'item_type': type,
        });
      } else {
        if (rsp.msg.isNotEmpty) {
          Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return Future.value(success);
  }
}
