import 'package:shared/shared.dart';

class RelationRepo {
  static Future<NormalNull> commitDiyRelation(
      {required int toUid,
      required int position,
      required String diyName}) async {
    String url = '${System.domain}go/room/defend/diyVerify';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'defendUid': '$toUid',
        'relationId': '$position',
        'diyName': diyName,
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
