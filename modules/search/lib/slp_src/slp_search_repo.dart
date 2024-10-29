import 'package:shared/shared.dart';
import 'package:search/src/model/pb/generated/pretty_user.pb.dart';

class SlpSearchRepo {
  static Future<JointSearchResp> searchUser(String key,
      {JointSearchItemType? type, int? page}) async {
    String url = "${System.domain}go/yy/search/joint";
    int jointSearchVersion = 9;
    XhrResponse response = await Xhr.post(
      url,
      {
        'k': key,
        'version': jointSearchVersion.toString(),
        if (page != null) 'page': page.toString(),
        if (type != null) 'type': type.value.toString(),
      },
      pb: true,
      throwOnError: false,
    );
    try {
      return JointSearchResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return JointSearchResp(msg: e.toString(), success: false);
    }
  }

  /// 领取新用户礼包
  static Future<BaseResponse> getNewUserBag(String bagId) async {
    String url = '${System.domain}search/getNewUserPackage';

    try {
      XhrResponse response =
          await Xhr.postJson(url, {'k': bagId}, throwOnError: false);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  /// 个人靓号扩展信息
  static Future<RspPrettyInfo> getPrettyExtendInfo(List<int> uids) async {
    String url = "${System.domain}go/hisong/user/prettyInfo";

    XhrResponse response = await Xhr.post(
        url,
        {
          'uids': uids.join(','),
        },
        pb: true,
        throwOnError: false);
    try {
      RspPrettyInfo data = RspPrettyInfo.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return RspPrettyInfo(msg: e.toString(), success: false);
    }
  }
}
