import 'package:shared/shared.dart';
import '../../protobuf/generated/business_wedding.pb.dart';

class WeddingBusinessRepo {
  /// 商业婚礼房：全量数据
  static Future<BusinessWeddingConfigResponseApi> getWeddingConfig(
      int rid) async {
    String url = '${System.domain}go/room/wedding/config';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': '$rid'}, pb: true, throwOnError: true);
      return BusinessWeddingConfigResponseApi.fromBuffer(response.bodyBytes);
    } catch (e) {
      return BusinessWeddingConfigResponseApi(
          message: e.toString(), success: false);
    }
  }

  /// 商业婚礼房：设置状态,
  static int lastClick = 0;
  static Future<void> setState(int rid, int state) async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastClick <= 2000) {
      /// 2s防连点
      return;
    }
    String url = '${System.domain}go/room/wedding/next';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': '$rid', 'next': '$state'},
          pb: true,
          throwOnError: true);
      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
  }
}
