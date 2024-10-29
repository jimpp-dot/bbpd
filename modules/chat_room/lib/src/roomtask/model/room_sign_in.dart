import 'package:shared/shared.dart';

/// 房间签到榜
class RoomSignInListRsp extends BaseResponse {
  final List<RoomSignIn> list;
  final RoomSignIn? my;
  final bool more;

  RoomSignInListRsp(
      {super.success,
      super.msg,
      required this.list,
      this.my,
      required this.more});

  factory RoomSignInListRsp.fromJson(Map<String, dynamic> json) {
    bool success = false;
    String? msg = '';
    List<RoomSignIn> resultList = [];
    RoomSignIn? my;
    bool more = false;
    try {
      success = Util.parseBool(json['success']);
      msg = Util.parseStr(json['msg']);
      if (success) {
        Map data = json['data'];
        more = Util.parseBool(data['more']);
        for (var element in (data['list'] as List)) {
          resultList.add(RoomSignIn.fromJson(element));
        }
        if (data.containsKey('sign_info')) {
          my = RoomSignIn.fromJson(data['sign_info']);
        }
      }
    } catch (e) {
      Log.d(e);
    }
    RoomSignInListRsp rsp = RoomSignInListRsp(
        success: success, msg: msg, list: resultList, my: my, more: more);
    return rsp;
  }
}

class RoomSignIn {
  final int rank;
  final String avatar;
  final String nickname;
  final int day;
  bool signed;

  RoomSignIn(
      {required this.rank,
      required this.avatar,
      required this.nickname,
      required this.day,
      required this.signed});

  static RoomSignIn fromJson(Map element) {
    return RoomSignIn(
        rank: Util.parseInt(element['rank']),
        avatar: Util.notNullStr(element['avatar']),
        nickname: Util.notNullStr(element['nickname']),
        day: Util.parseInt(element['sign_days']),
        signed: Util.parseBool(element['signed']));
  }
}
