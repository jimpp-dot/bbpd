import 'package:shared/shared.dart';

class ChatUnionGroupRepo {
  static Future<UnionOnlineRsp> getUnionGroupConfig(int groupId) async {
    try {
      String url = "${System.domain}go/hisong/union/online";
      Map<String, String> params = {
        'group_id': '$groupId',
      };
      XhrResponse response = await Xhr.get(url,
          queryParameters: params, pb: true, throwOnError: false);
      if (response.error != null) {
        return UnionOnlineRsp(msg: response.error.toString(), success: false);
      }
      UnionOnlineRsp result = UnionOnlineRsp.fromBuffer(response.bodyBytes);
      return result;
    } catch (e) {
      return UnionOnlineRsp(msg: e.toString(), success: false);
    }
  }
}
