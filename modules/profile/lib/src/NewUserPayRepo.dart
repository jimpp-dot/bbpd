import 'package:shared/shared.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';

class NewUserPayRepo {
  /// 新用户转化 - 汇总
  static Future<ResGsTransferStat> getTransferState() async {
    String url = '${System.domain}go/yy/gs/transferStat';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResGsTransferStat.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsTransferStat(msg: e.toString(), success: false);
    }
  }

  /// 新用户转化 - 积分详情-tabs
  static Future<ResGsTransferPointsDetail> getTransferPointsTabs() async {
    String url = '${System.domain}go/yy/gs/transferPointsDetail';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'tab_only': 1}, pb: true, throwOnError: true);
      return ResGsTransferPointsDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsTransferPointsDetail(msg: e.toString(), success: false);
    }
  }

  /// 新用户转化 - 积分详情-list
  static Future<ResGsTransferPointsDetail> getTransferPointsDetail(
      int dateTab, int scene, int page) async {
    String url = '${System.domain}go/yy/gs/transferPointsDetail';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'date_tab': dateTab, 'scene': scene, 'page': page},
          pb: true,
          throwOnError: true);
      return ResGsTransferPointsDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsTransferPointsDetail(msg: e.toString(), success: false);
    }
  }

  /// 新用户转化 - 转化人数
  static Future<ResNewUserPayGsRank> getTransferUserList(
      int dateTab, int page) async {
    String url = '${System.domain}go/yy/gs/transferUserList';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'date_tab': dateTab, 'page': page},
          pb: true,
          throwOnError: true);
      return ResNewUserPayGsRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResNewUserPayGsRank(msg: e.toString(), success: false);
    }
  }
}
