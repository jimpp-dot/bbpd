import 'package:shared/shared.dart';

import '../../../../k.dart';

class MicRepo {
  /// 设置麦位状态
  /// state ： 0-正常，1-离开
  static Future<NormalNull> setMicState(int rid, int state) async {
    String url = '${System.domain}go/room/room/setMicStatus';
    NormalNull resp;
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'rid': '$rid', 'state': '$state'},
          throwOnError: true);
      resp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = NormalNull(success: false, msg: e.toString());
    }
    if (resp.success) {
      Fluttertoast.showCenter(msg: K.room_operate_success);
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return resp;
  }
}
