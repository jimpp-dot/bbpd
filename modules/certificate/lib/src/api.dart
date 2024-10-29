import 'package:shared/shared.dart';
import 'model/pb/generated/category.pb.dart';

class Api {
  /// 资质列表
  static Future<ResCategoryIndex> getCategoryList() async {
    String url = '${System.domain}go/yy/category/index';
    Map<String, String> params = {};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ResCategoryIndex.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCategoryIndex(msg: e.toString(), success: false);
    }
  }

  /// 资质详情
  static Future<ResCategoryDetail> getCertificateDetail(int cid) async {
    String url = '${System.domain}go/yy/category/detail';
    Map<String, String> params = {"cid": "$cid"};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ResCategoryDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCategoryDetail(msg: e.toString(), success: false);
    }
  }

  /// 提交资质
  static Future<NormalNull> postCertificate(Map<String, String> params) async {
    String url = '${System.domain}go/yy/category/cert';
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
