import 'package:shared/shared.dart';
import '../model/pb/generated/slp_fate.pb.dart';

class FateRepo {
  /// 获取今日缘分匹配列表
  static Future<ResFateMatch> getFateMatch() async {
    // try {
    //   String url = '${System.domain}go/yy/fate/match';
    //   String uids = Session.browseFateUidsString;
    //   Map<String, String> body = {
    //     'uids': uids,
    //   };
    //   XhrResponse response = await Xhr.post(url, body, pb: true, throwOnError: true);
    //   return ResFateMatch.fromBuffer(response.bodyBytes);
    // } catch (e) {
    //   return ResFateMatch(success: false, msg: e.toString());
    // }
    return ResFateMatch(success: false, msg: '');
  }

  /// 今日缘分：喜欢/不喜欢 /// targetUid: 对方uid /// type: 0不喜欢 1喜欢
  static Future<void> fateLike(int targetUid, int type) async {
    try {
      String url = '${System.domain}go/yy/fate/like';
      await Xhr.post(url, {'uid': '$targetUid', 'type': '$type'},
          pb: true, throwOnError: true);
    } catch (e) {}
  }
}
