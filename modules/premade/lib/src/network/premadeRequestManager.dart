import 'package:shared/shared.dart';
import 'package:shared/util/response_utils.dart';
import 'package:premade/src/model/BatchMatchConfig.dart';

import '../premadeFloatWindow.dart';

class PremadeRequestManager {
  static Future<DataRsp?> stopMatch(String uid,
      {String topCategory = '', String rid = ''}) async {
    PremadeFloatingWindow.reset();
    try {
      String url = "${System.domain}match/stop";
      Map<String, String> params = {
        'uid': uid,
        'rid': rid,
        'top_category': topCategory
      };
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      return DataRsp.fromXhrResponse(response, (json) => json);
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future<DataRsp<BatchMatchConfig>> loadBatchMatchConfig() async {
    String url = '${System.domain}party/batch-match/config';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      DataRsp<BatchMatchConfig> resp =
          DataRsp<BatchMatchConfig>.fromXhrResponse(
              response, (object) => BatchMatchConfig.fromMap(object as Map));
      return resp;
    } catch (e) {
      return ResponseUtils.buildErrorDataRsp<BatchMatchConfig>(e);
    }
  }

  static Future<DataRsp<bool>> cancelMatch(String type) async {
    DataRsp<bool> result = DataRsp(success: false);
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}party/batch-match/stop?type=$type',
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        result.success = true;
        result.data = true;
      } else if (res['msg'] != null) {
        result.msg = res['msg'];
      }
    } catch (e) {
      result.msg = e.toString();
    }
    return result;
  }
}
