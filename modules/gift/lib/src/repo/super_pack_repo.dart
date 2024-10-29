import 'package:shared/shared.dart';
import 'package:gift/src/model/super_pack_beans.dart';

class SuperPackRepo {
  static Future<SuperPackResp> getSuperPacks() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}rechargepackage/detail?uid=${Session.uid}",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return SuperPackResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return SuperPackResp(msg: res['msg'], success: false);
      }
      try {
        SuperPackResp responseData = SuperPackResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("getSuperPacks and e msg = ${e.toString()}");

        return SuperPackResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SuperPackResp(msg: e.toString(), success: false);
    }
  }
}
