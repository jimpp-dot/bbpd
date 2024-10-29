import 'package:shared/shared.dart';

import 'atmosphere_model.dart';

class AtmosphereRepo {
  /// 获取房间氛围列表
  static Future<AtmosphereResp> atmosphereList(int rid) async {
    String url = '${System.domain}option/atmosphereList';
    var post = <String, String>{
      'rid': '$rid',
    };
    try {
      XhrResponse response = await Xhr.postJson(url, post);
      if (response.error != null) {
        Log.d(response.error.toString());
        return AtmosphereResp(msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return AtmosphereResp(msg: res['msg'], success: false);
      }
      try {
        AtmosphereResp resp =
            AtmosphereResp.fromJson(res as Map<String, dynamic>);
        if (resp.isValid()) {
          return resp;
        }
        return AtmosphereResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      } catch (e) {
        Log.d("atmosphereList and e msg = ${e.toString()}");
        return AtmosphereResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return AtmosphereResp(
          msg: R.array('xhr_error_type_array')[10], success: false);
    }
  }

  static Future<BaseResponse> setAtmosphere(
      int rid, int atmosphereId, int useBg, int useMusic) async {
    String url = '${System.domain}option/setAtmosphere';
    var params = <String, String>{
      'rid': '$rid',
      'id': '$atmosphereId',
      'is_use_bg': '$useBg',
      'is_use_music': '$useMusic',
    };
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(
          success: false, msg: R.array('xhr_error_type_array')[10]);
    }
  }

  static Future<BaseResponse> closeAtmosphere(int rid) async {
    String url = '${System.domain}option/closeAtmosphere';
    var params = <String, String>{
      'rid': '$rid',
      'is_use_bg': '0',
      'is_use_music': '0',
    };
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(
          success: false, msg: R.array('xhr_error_type_array')[10]);
    }
  }
}
