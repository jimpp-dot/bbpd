import 'package:shared/shared.dart';

import '../models/generated/slp_newbie.pb.dart';

class QualityUserRankRepository {
  static const String _userListUrl = 'go/yy/newbie/userList';
  static const String _sayHiUrl = 'go/yy/newbie/sayHi';

  /// 获取优质用户榜单列表
  static Future<ResNewbieUserList> getUserList({int page = 1}) async {
    try {
      XhrResponse response = await Xhr.get(
        _userListUrl,
        pb: true,
        queryParameters: {'page': page.toString()},
      );
      return ResNewbieUserList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResNewbieUserList(success: false, msg: e.toString());
    }
  }

  /// 发送打招呼
  static Future<NormalNull> sayHi(int to) async {
    try {
      XhrResponse response = await Xhr.post(
        _sayHiUrl,
        {'to': to.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
