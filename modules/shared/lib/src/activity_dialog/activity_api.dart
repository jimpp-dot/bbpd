import '../../shared.dart';
import '../pbModel/generated/boot_app_dialog.pb.dart';

class ActivityApi {
  /// 新手签到弹窗
  static Future<ApiBootAppResponse> getActivityConfig() async {
    String url = '${System.domain}go/yy/boot/app';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ApiBootAppResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiBootAppResponse(msg: e.toString(), success: false);
    }
  }
}
