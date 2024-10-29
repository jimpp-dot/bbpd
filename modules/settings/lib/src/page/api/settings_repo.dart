import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';
import 'package:settings/src/model/pb/generated/pay.pb.dart';
import '../../model/pb/generated/account_hot.pb.dart';

class SettingRepo {
  static Future<ResSmallAccountList> getSmallAccountList(
      {int needDetail = 0}) async {
    String url = "${System.domain}go/yy/small/list";
    try {
      String dtoken = Session.getString('dtoken', '');
      XhrResponse response = await Xhr.postPb(
          url, {'need_detail': '$needDetail', 'dtoken': dtoken});
      return ResSmallAccountList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResSmallAccountList(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> deleteSmallAccount(int uid) async {
    String url = "${System.domain}go/yy/small/del";
    try {
      XhrResponse response = await Xhr.postPb(url, {'uid': '$uid'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 红人认证
  static Future<ResAccountHotStatus> getHotStatus() async {
    String url = "${System.domain}go/yy/account/hotStatus";
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return ResAccountHotStatus.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccountHotStatus(success: false, msg: e.toString());
    }
  }

  /// 红人取消or佩戴
  static Future<NormalNull> wearHot() async {
    String url = "${System.domain}go/yy/account/hotWear";
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 限时充值大礼包弹窗
  static Future<ResPayTimeLimitProduct> getRechargeLimitTimeProduct() async {
    String url = "${System.domain}go/yy/pay/productTimeLimit";
    try {
      XhrResponse response = await Xhr.postPb(url, {}, throwOnError: true);
      return ResPayTimeLimitProduct.fromBuffer(
        response.bodyBytes,
      );
    } catch (e) {
      return ResPayTimeLimitProduct(success: false, msg: e.toString());
    }
  }
}
