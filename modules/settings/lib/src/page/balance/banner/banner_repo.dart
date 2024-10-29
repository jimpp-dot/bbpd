import 'package:shared/shared.dart';
import 'model/recommend_top_info.dart';
import 'package:shared/src/pbModel/generated/banner_center.pb.dart';

class BannerRepo {
  /// 获取banner列表
  static Future<ResRechargeBanner> getBannerList() async {
    String url = '${System.domain}go/yy/room/chargeBanner';
    try {
      XhrResponse response = await Xhr.post(url, {'version': "2"}, pb: true);
      return ResRechargeBanner.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRechargeBanner(msg: e.toString(), success: false);
    }
  }

  /// 获取推荐置顶信息
  static Future<DataRsp<RecommendTopInfo>> getRecommendTopInfo() async {
    String url = '${System.domain}mate/charge/getchargeinfo';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp.fromXhrResponse(
        response,
        (object) => RecommendTopInfo.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      Log.e(e);
      return DataRsp<RecommendTopInfo>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 发起推荐置顶
  static Future<DataRsp> doRecommendTop() async {
    String url = '${System.domain}mate/charge/postrecommend';
    try {
      XhrResponse response = await Xhr.postJson(url, null, throwOnError: false);
      return DataRsp.fromXhrResponse(
        response,
        null,
      );
    } catch (e) {
      Log.e(e);
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
