import 'package:shared/shared.dart';

class PublicScreenReportRepo {
  /// 公屏举报
  static Future<NormalNull> report(
      int toUid, int rid, String content, String contexts) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/report/publicScreenReport',
          {
            "to_uid": toUid.toString(),
            "rid": rid.toString(),
            "content": content,
            "contexts": contexts,
          },
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
