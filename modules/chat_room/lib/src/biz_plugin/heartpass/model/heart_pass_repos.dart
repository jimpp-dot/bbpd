import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/heartpass/controller/heart_pass_move_controller.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 心动闯关接口
class HeartPassRepos {
  /// 开启闯关插件
  static Future<bool> create(int rid) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}rooms/lucky/create', {'rid': '$rid'});
    BaseResponse baseResponse = BaseResponse.parse(xhrResponse);
    if (!(baseResponse.success == true) &&
        baseResponse.msg != null &&
        baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 关闭闯关插件
  static Future<bool> close(int rid) async {
    XhrResponse xhrResponse = await Xhr.postPb(
        '${System.domain}go/room/lucky/close', {'rid': '$rid'});
    ResLucky baseResponse = ResLucky.fromBuffer(xhrResponse.bodyBytes);
    if (!baseResponse.success && baseResponse.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 闯关基本信息
  static Future<ResLuckyBaseData?> baseInfo(int rid) async {
    XhrResponse xhrResponse =
        await Xhr.postPb('${System.domain}go/room/lucky/base', {
      'rid': '$rid',
    });
    if (xhrResponse.bodyBytes.isEmpty) return null;
    ResLuckyBase dataRsp = ResLuckyBase.fromBuffer(xhrResponse.bodyBytes);
    return dataRsp.data;
  }

  /// 开始闯关
  static Future<bool> start(int rid) async {
    XhrResponse xhrResponse = await Xhr.postPb(
        '${System.domain}go/room/lucky/start', {'rid': '$rid'});
    ResLucky baseResponse = ResLucky.fromBuffer(xhrResponse.bodyBytes);
    if (!baseResponse.success && baseResponse.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 移动关卡
  static Future<bool> move(int rid, HeartPassMoveRecord record) async {
    XhrResponse xhrResponse =
        await Xhr.postPb('${System.domain}go/room/lucky/moveUser', {
      'rid': '$rid',
      'position': '${record.position}',
      'move_type': record.isBoss ? 'breaker' : 'hurdle',
      'direction': record.toLeft == true ? 'left' : 'right',
      'step': '${record.step}'
    });
    ResLucky baseResponse = ResLucky.fromBuffer(xhrResponse.bodyBytes);
    if (!baseResponse.success && baseResponse.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 结束闯关
  static Future<bool> end(int rid) async {
    XhrResponse xhrResponse =
        await Xhr.postPb('${System.domain}go/room/lucky/end', {'rid': '$rid'});
    ResLucky baseResponse = ResLucky.fromBuffer(xhrResponse.bodyBytes);
    if (!baseResponse.success && baseResponse.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 获取游戏规则
  static Future<String> gameRule(int rid) async {
    XhrResponse xhrResponse = await Xhr.postPb(
        '${System.domain}go/room/lucky/ruleInfo', {'rid': '$rid'});
    ResLuckyRule dataRsp = ResLuckyRule.fromBuffer(xhrResponse.bodyBytes);
    if (!dataRsp.success && dataRsp.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: dataRsp.msg);
    }
    return dataRsp.data;
  }

  /// 编辑游戏规则
  static Future<bool> editGameRule(int rid, String content) async {
    XhrResponse xhrResponse = await Xhr.postPb(
        '${System.domain}go/room/lucky/saveRule',
        {'rid': '$rid', 'content': content});
    BaseResponse baseResponse = BaseResponse.parse(xhrResponse);
    if (!(baseResponse.success == true) &&
        baseResponse.msg != null &&
        baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    } else {
      Fluttertoast.showToast(msg: K.room_heart_pass_edit_success);
    }
    return baseResponse.success;
  }
}
