import 'package:shared/shared.dart';

import 'pb/generated/slp_cp_house.pb.dart';
import 'pb/generated/slp_cp_house_friend.pb.dart';

class CpSmallHouseRepo {
  /// CP小屋个人页入口
  static Future<ResHouseProfile> getCpHouseProfile(int uid) async {
    String url = '${System.domain}go/yy/cphouse/profile';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid}, pb: true, throwOnError: true);
      return ResHouseProfile.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHouseProfile(msg: e.toString(), success: false);
    }
  }

  /// CP小屋详情页面
  static Future<ResHouseDetail> getCpHouseDetail(int uid, int id) async {
    String url = '${System.domain}go/yy/cphouse/detail';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'id': id, 'uid': uid},
          pb: true,
          throwOnError: true);
      return ResHouseDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHouseDetail(msg: e.toString(), success: false);
    }
  }

  /// CP小屋邀请我的人列表
  static Future<ResHouseInvite> getCpHouseInviteList(int lastId) async {
    String url = '${System.domain}go/yy/cphouse/inviteList';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'last_id': lastId}, pb: true, throwOnError: true);
      return ResHouseInvite.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHouseInvite(msg: e.toString(), success: false);
    }
  }

  /// CP小屋邀请组CP
  static Future<NormalNull> postCpHouseInvite(int uid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/cphouse/invite',
        {'uid': uid.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// cp小屋接受邀请
  static Future<NormalNull> postCpHouseAccept(int id) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/cphouse/accept',
        {'id': id.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// cp小屋拆除
  static Future<NormalNull> postCpHouseDestroy(int id) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/cphouse/destroy',
        {'id': id.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 好友列表
  static Future<ResFriendData> postCpHouseFriends(
      {String type = 'friend',
      int page = 1,
      int pageSize = 20,
      String query = ''}) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/friend/data',
        {
          'type': type,
          'page': page.toString(),
          'pageSize': pageSize.toString(),
          'query': query,
        },
        pb: true,
      );
      return ResFriendData.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResFriendData(success: false, msg: e.toString());
    }
  }
}
