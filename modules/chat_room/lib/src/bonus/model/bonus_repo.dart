import 'package:shared/shared.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';

class BonusRepo {
  static const String path = 'room/packet';

  ///获取房间红包数据
  static Future<DataRsp<BonusData>> getRoomBonus(int rid) async {
    String url = '${System.domain}go/$path/data?rid=$rid';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<BonusData>.fromXhrResponse(response,
          (object) => BonusData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<BonusData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///获取全局红包配置
  static Future<DataRsp<BonusConfig>> getBonusConfig(int rid) async {
    String url = '${System.domain}$path/setting?rid=$rid&version=1';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<BonusConfig>.fromXhrResponse(response,
          (object) => BonusConfig.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<BonusConfig>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///获取红包预览数据
  static Future<DataRsp<BonusPreview>> getBonusPreview(
      int bonusId, int rid) async {
    String url = '${System.domain}$path/info?id=$bonusId&rid=$rid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<BonusPreview>.fromXhrResponse(response,
          (object) => BonusPreview.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<BonusPreview>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///获取抢红包数据
  static Future<DataRsp<BonusResult>> getBonusResult(
      int bonusId, int rid) async {
    String url = '${System.domain}$path/result?id=$bonusId&rid=$rid&version=1';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<BonusResult>.fromXhrResponse(response,
          (object) => BonusResult.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<BonusResult>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///抢红包
  static Future<BaseResponse> grab(int bonusId, int rid) async {
    String url = '${System.domain}$path/grab';
    int publicIp = await DeviceInfo.getPublicIP(false);
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'id': '$bonusId', 'rid': '$rid', 'ip': publicIp.toString()},
          throwOnError: false);

      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///上报口令事件
  static Future<BaseResponse> reportSign(
      int bonusId, int rid, String sign) async {
    String url = '${System.domain}$path/sign';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'id': '$bonusId', 'rid': '$rid', 'sign': sign},
          throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///发红包参数校验
  static Future<BaseResponse> check({
    required int rid,
    required int money,
    required int num,
    required BonusType type,
    BonusConditionType? conditionType,
    required String sign,
  }) async {
    String url = '${System.domain}$path/check';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': '$rid',
            'money': '$money',
            'num': '$num',
            'type': describeEnum(type),
            'cond': describeEnum(conditionType ?? BonusConditionType.none),
            if (conditionType == BonusConditionType.sign) 'sign': sign,
            'version': '1',
          },
          throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
