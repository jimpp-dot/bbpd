import 'package:shared/shared.dart';
import '../model/gift_panel_banner.dart';
import '../model/time_limit_package_model.dart';

class LimitPackageRepo {
  static Future<DataRsp<TimeLimitPackageModel>> getTimeLimitPackage() async {
    try {
      String url = "${System.domain}mate/recharge-pkg/detail";
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<TimeLimitPackageModel>.fromXhrResponse(
        response,
        (object) =>
            TimeLimitPackageModel.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<TimeLimitPackageModel>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 礼物面板专属礼物提示条
  static Future<DataRsp<GiftPanelBanner>> getGiftPanelBanner(int rid) async {
    String url = '${System.domain}go/mate/gift/banner?rid=$rid';
    try {
      XhrResponse response =
          await Xhr.getJson(url, formatJson: true, throwOnError: false);
      return DataRsp.fromXhrResponse(
        response,
        (object) => GiftPanelBanner.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      Log.e(e);
      return DataRsp<GiftPanelBanner>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
