import '../../shared.dart';
import '../pbModel/generated/checkin.pb.dart';

class SignApi {
  /// 新手签到弹窗,type:0 新手，1:进阶签到
  static Future<CheckInHomeRsp> getSignHome(int type) async {
    String url = '${System.domain}go/yy/check-in/home';
    Map<String, String> map = {
      "typ": type == 0 ? "rookie" : "normal" //rookie:新手, normal:签到卡
    };
    try {
      XhrResponse response = await Xhr.postPb(url, map);
      return CheckInHomeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return CheckInHomeRsp(msg: e.toString(), success: false);
    }
  }

  ///签到 type:0 新手，1:进阶签到
  static Future<CheckInRsp> signIn(int type) async {
    String url = '${System.domain}go/yy/check-in/checkIn';
    Map<String, String> map = {
      "typ": type == 0 ? "rookie" : "normal" //rookie:新手, normal:签到卡
    };
    try {
      XhrResponse response = await Xhr.postPb(url, map);
      return CheckInRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return CheckInRsp(msg: e.toString(), success: false);
    }
  }
}
