import 'package:shared/shared.dart';
import 'package:chat/src/model/service_feedback_data.dart';

class ChatServiceRepo {
  /// 获取用户客服满意评价标签和是否已留言
  static Future<ServiceFeedbackRsp> getServiceEvaluateData(
      String? sid, String? uuid) async {
    if (sid == null || uuid == null)
      return ServiceFeedbackRsp(
          msg: R.array('xhr_error_type_array')[6], success: false);

    try {
      String url = "${System.domain}auto/checkEvaluate";
      XhrResponse response = await Xhr.postJson(url, {'sid': sid, 'uuid': uuid},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return ServiceFeedbackRsp(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return ServiceFeedbackRsp(msg: res['msg'], success: false);
      }
      try {
        ServiceFeedbackRsp responseData = ServiceFeedbackRsp.fromJson(res);
        return responseData;
      } catch (e) {
        return ServiceFeedbackRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return ServiceFeedbackRsp(msg: e.toString(), success: false);
    }
  }

  /// 提交用户评价标签
  static Future<BaseResponse> submitServiceTag(
      String? uuid, String? sid, String? tag) async {
    if (uuid == null || sid == null || tag == null) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }

    String url = '${System.domain}auto/evaluate';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'uuid': uuid, 'sid': sid, 'tag': tag});
      return BaseResponse.parse(response);
    } catch (e) {
      Log.e(e);
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 提交用户留言
  static Future<BaseResponse> submitServiceComment(
      String? uuid, String? sid, List<String>? imgs, String? desc) async {
    if (uuid == null || sid == null || (imgs == null && desc == null)) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }

    String url = '${System.domain}auto/leaveMessage';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'uuid': uuid,
          'sid': sid,
          if (imgs!.isNotEmpty) 'imgs': imgs.join(','),
          if (desc!.isNotEmpty) 'desc': desc,
        },
      );
      return BaseResponse.parse(response);
    } catch (e) {
      Log.e(e);
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
