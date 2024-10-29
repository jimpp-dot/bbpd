import 'package:shared/shared.dart';
import 'package:settings/src/model/account_info_model.dart';
import 'package:settings/src/model/pb/generated/help.pb.dart';

import 'pb/generated/general_setting.pb.dart';
import 'pb/generated/law.pb.dart';

class SettingRepository {
  ///
  /// 加入公会
  ///
  static Future<bool> brokerJoin(int? bid) async {
    if (bid == null || bid == 0) {
      return false;
    }

    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}broker/join?version=1", {'bid': bid.toString()},
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        Log.d('join union succeeded.');
        Fluttertoast.showToast(msg: res['data'], gravity: ToastGravity.CENTER);
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Log.d(e);
    }

    return false;
  }

  ///账号信息
  static Future<DataRsp<AccountUserInfo>> getAccountInfo() async {
    String url = "${System.domain}account/setinfo?v=9";
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<AccountUserInfo>.fromXhrResponse(response,
          (object) => AccountUserInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<AccountUserInfo>(msg: '$e', success: false);
    }
  }

  ///关于我们
  static Future<DataRsp<AboutInfo>> getAboutInfo() async {
    String url = "${System.domain}account/getMix";
    try {
      XhrResponse response = await Xhr.getJson(url);
      Map<String, dynamic> map = {
        'data': response.value(),
        'success': response.value()['success']
      };
      return DataRsp<AboutInfo>.fromJson(map, (json) {
        Map<String, dynamic> jsonMap = json as Map<String, dynamic>;
        return AboutInfo.fromJson(jsonMap);
      });
    } catch (e) {
      return DataRsp<AboutInfo>(msg: '$e', success: false);
    }
  }

  static Future<String> getUuid(int uid) async {
    String url = '${System.domain}official/token?uid=$uid';
    try {
      int publicIp = await DeviceInfo.getPublicIP(false);
      XhrResponse response =
          await Xhr.postJson(url, {'ip': publicIp.toString()});
      if (response.error != null) {
        return '';
      }
      Map res = response.response as Map;
      if (res['success'] == false ||
          res['data'] == null ||
          res['data'] is! String) {
        return '';
      }

      return res['data'];
    } catch (e) {
      Log.d('$e');
    }

    return '';
  }

  static Future<ResRecommendDesc> getRecommendDesc() async {
    String url = '${System.domain}go/yy/config/recommendDesc';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResRecommendDesc.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRecommendDesc(msg: e.toString(), success: false);
    }
  }

  static Future<ResGetGeneralSetting> getGeneralSetting() async {
    String url = '${System.domain}go/yy/account/getGeneralSetting';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResGetGeneralSetting.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGetGeneralSetting(msg: e.toString(), success: false);
    }
  }

  /// 通用设置
  /// on  设置选项 0代表关闭关闭特效【开启特效】，1代表开启关闭特效【关闭特效】
  /// setting_type  需要设置的设置类型 0代表礼物特效
  static Future<NormalNull> setGeneralSetting(int settingType, int on) async {
    String url = '${System.domain}go/yy/account/setGeneralSetting';
    try {
      XhrResponse response = await Xhr.post(
          url, {'setting_type': settingType.toString(), 'on': on.toString()},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<ResHelpList> getHelpList() async {
    String url = '${System.domain}go/yy/help/list';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResHelpList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHelpList(msg: e.toString(), success: false);
    }
  }
}
