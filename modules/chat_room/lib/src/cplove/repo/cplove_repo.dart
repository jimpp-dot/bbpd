import 'package:shared/shared.dart';

class CpLoveRepo {
  /// 设置冠名位
  static Future<NormalNull> setNamingUser(int rid, int uid, bool add) async {
    String url = '${System.domain}go/yy/roomcp/setNaming';

    Map<String, String> map = {
      'op': add ? 'add' : 'clear',
      'uid': '$uid',
      'rid': '$rid'
    };

    XhrResponse response = await Xhr.post(url, map, pb: true);

    try {
      NormalNull data = NormalNull.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
