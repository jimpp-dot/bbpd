import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';

class AccompanyRepository {
  /// 加载陪伴房额外数据
  static Future<AccompanyExtraData?> load(int rid) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}accompany/getRefreshData', {'rid': '$rid'},
        throwOnError: false, tryNum: 3);
    DataRsp<AccompanyExtraData> dataRsp = DataRsp.fromXhrResponse(xhrResponse,
        (json) => AccompanyExtraData.fromJson(json as Map<String, dynamic>));
    return dataRsp.data;
  }

  /// 设置房间自动上麦
  static Future<bool> setAutoMic(int rid, int autoMic) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}accompany/setAutoMic',
        {'rid': '$rid', 'auto_mic': '$autoMic'},
        throwOnError: false);
    BaseResponse response = BaseResponse.parse(xhrResponse);
    if (!(response.success == true) && response.msg != null) {
      Fluttertoast.showToast(msg: response.msg);
    }
    return response.success;
  }

  /// 发送邀请
  static Future<bool> sendInvite(int rid, String uids) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}accompany/sendInvite',
        {'rid': '$rid', 'invite_uids': uids},
        throwOnError: false);
    BaseResponse response = BaseResponse.parse(xhrResponse);
    // 成功和错误都可能需要提示
    if (response.msg != null && response.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: response.msg);
    } else if (response.success == true) {
      Fluttertoast.showToast(msg: K.room_invite_success);
    }
    return response.success;
  }

  /// 发送邀请
  static Future<bool> cancelInvite(int rid) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}accompany/cancelInvite', {'rid': '$rid'},
        throwOnError: false);
    BaseResponse response = BaseResponse.parse(xhrResponse);
    if (!(response.success == true) && response.msg != null) {
      Fluttertoast.showToast(msg: response.msg);
    }
    return response.success;
  }

  /// 接受邀请
  static Future<bool> acceptInvite(int rid) async {
    XhrResponse xhrResponse = await Xhr.postJson(
        '${System.domain}accompany/acceptInvite', {'rid': '$rid'},
        throwOnError: false);
    BaseResponse response = BaseResponse.parse(xhrResponse);
    if (!(response.success == true) && response.msg != null) {
      Fluttertoast.showToast(msg: response.msg);
    }
    return response.success;
  }
}
