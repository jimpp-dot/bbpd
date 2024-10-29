import 'package:shared/shared.dart';

import 'generated/slp_imprint.pb.dart';

class AccompanyRememberApi {
  /// 陪伴记详情页接口 /go/yy/imprint/lightList
  static Future<ResImprintLight> getAccompanyRememberRes(
      int uid, bool weekOrSum) async {
    String url = '${System.domain}go/yy/imprint/lightList?version=1';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'tab': weekOrSum ? 'week' : 'sum'},
          pb: true,
          throwOnError: true);
      return ResImprintLight.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResImprintLight(msg: e.toString(), success: false);
    }
  }

  /// 陪伴列表接口 /go/yy/imprint/userList
  static Future<ResImprintUserList> getAccompanyRememberUserListRes(
      int uid, int page) async {
    String url = '${System.domain}go/yy/imprint/userList?version=1';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'page': page},
          pb: true,
          throwOnError: true);
      return ResImprintUserList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResImprintUserList(msg: e.toString(), success: false);
    }
  }
}
