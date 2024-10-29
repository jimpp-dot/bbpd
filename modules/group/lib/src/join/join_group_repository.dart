import 'package:shared/shared.dart';
import 'package:shared/model/fans_group_model.dart';

/// 加入团数据仓库
class JoinGroupRepository {
  static const debug = false;

  /// 加载入团信息
  static Future<FansGroupInfo?> loadGroupFromNetwork(int groupId) async {
    try {
      String url = '${System.domain}/kolfans/groupPopup?kfg_id=$groupId';
      if (debug) Log.d('JoinGroupRepository#loadTabFromNetwork, url: $url');
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      DataRsp resp = DataRsp<FansGroupInfo>.fromXhrResponse(response,
          (object) => FansGroupInfo.fromJson(object as Map<String, dynamic>));
      if ((resp.success ?? false) && resp.data is FansGroupInfo) {
        return resp.data;
      }
      return null;
    } catch (e) {
      if (debug) Log.d('JoinGroupRepository#loadTabFromNetwork, e: $e');
      return null;
    }
  }
}
