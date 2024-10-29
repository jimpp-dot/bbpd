import 'package:certificate/assets.dart';
import 'package:shared/shared.dart';
import 'package:certificate/a.dart';

class CertifyRepository {
  static Future<AgreeGodLicenseRsp> agreeGodLicense(int version,
      {int confirm = 0}) async {
    String url = "${System.domain}certify/agreeGodLicense?v=1";
    Map<String, String> params = {'version': '$version', 'confirm': '$confirm'};
    AgreeGodLicenseRsp rsp;
    Log.d('url===>>' + url);
    Log.d('url===>>$params' );
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map data = response.value();
      Log.d('url===>>' + data.toString());
      rsp = AgreeGodLicenseRsp.fromJson(data);

      if (rsp.success != true &&
          rsp.error != AgreeGodLicenseRsp.ERROR_TYPE_REQUEST_CONFIRM &&
          rsp.msg != null) {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    } catch (e) {
      rsp = AgreeGodLicenseRsp(success: false, msg: e.toString());
      Log.d('Request $url with error: ${e.toString()}');
      Fluttertoast.toastException(exp: e);
    }
    return rsp;
  }

  static Future<Map> getCertifyDemoInfo() async {
    String url = '${System.domain}category/getUploadedVideoNum?cid=0&video=0';
    Map res = {};
    try {
      XhrResponse? response = await Xhr.getJson(url, throwOnError: true);
      res = response.value();
      if (!res.containsKey('error_demos')) {
        res['errorDemos'] = _getCertifyErrorDemos();
      }
    } catch (e) {
      Log.d('Request $url with error: ${e.toString()}');
      Fluttertoast.toastException(exp: e);
    }
    return res;
  }

  static List<Map> _getCertifyErrorDemos() {
    int i = 1;
    List<Map> mapList = [];
    for (String desc in A.cer_error_demos) {
      mapList.add({
        'icon': Assets.certificate$error_demo_error_demox_webp(i),
        'desc': desc
      });
      i++;
    }
    return mapList;
  }
}

class AgreeGodLicenseRsp {
  static const String ERROR_TYPE_REQUEST_CONFIRM = 'request_confirm';

  final bool success;
  final String? error;
  final String? msg;

  AgreeGodLicenseRsp({this.success = false, this.error, this.msg});

  AgreeGodLicenseRsp.fromJson(Map json)
      : success = Util.parseBool(json['success']),
        error = json['error'],
        msg = json['msg'];
}
