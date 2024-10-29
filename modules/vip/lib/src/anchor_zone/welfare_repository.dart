import 'package:shared/shared.dart';
import 'package:vip/src/anchor_zone/welfare_model.dart';

/// 主播专题-福利、任务等数据仓库
class WelfareRepository {
  /// 日志debug开关
  static const debug = false;

  /// 从网络获取，主播专题-福利、任务，所需要的数据
  static Future<WelfareInfo?> loadWelfareFromNetwork(int groupId) async {
    try {
      String url = '${System.domain}kolfans/welfare?kfg_id=$groupId';
      if (debug) Log.d('WelfareRepository#loadFromNetwork, url: $url');
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (debug)
        Log.d('WelfareRepository#loadFromNetwork, response: $response');
      DataRsp resp = DataRsp<WelfareInfo>.fromXhrResponse(response,
          (object) => WelfareInfo.fromJson(object as Map<String, dynamic>?));
      if (resp.success == true && resp.data is WelfareInfo) {
        return resp.data;
      }
      return null;
    } catch (e) {
      if (debug) Log.d('WelfareRepository#loadFromNetwork, e: $e');
      return null;
    }
  }

  /// 退出粉丝团
  static Future<DataRsp> quitGroup(int groupId) async {
    try {
      String url = '${System.domain}kolfans/quitGroup';
      Map<String, String> params = {'kfg_id': '$groupId'};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      if (debug)
        Log.d('WelfareRepository#loadFromNetwork, response: $response');
      DataRsp resp = DataRsp<String?>.fromXhrResponse(
          response, (object) => Util.parseStr(object));
      return resp;
    } catch (e) {
      if (debug) Log.d('WelfareRepository#quitGroup, e: $e');
      return DataRsp<String>(success: false, msg: e.toString(), data: '');
    }
  }
}
