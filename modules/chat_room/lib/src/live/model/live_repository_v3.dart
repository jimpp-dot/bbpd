import 'package:shared/shared.dart';
import 'package:chat_room/src/live/model/live_pk_invite_friend_model_v3.dart';
import 'package:chat_room/src/live/model/live_pk_recent_match_model_v3.dart';

import 'live_pk_set_config_model_v3.dart';

class LiveRepositoryV3 {
  ///结束PK
  static Future<bool> cancelPK(int rid, int pkId) async {
    String url = "${System.domain}games/pk/end";
    final Map<String, String> params = {
      "rid": '$rid',
      "pk_id": '$pkId',
    };

    XhrResponse response = await Xhr.postJson(url, params);
    Map res = response.value();
    if (res["success"]) {
      return true;
    }
    if (res['success'] == false) {
      Fluttertoast.showToast(
          msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
    }
    return false;
  }

  /// 发起再来一局
  static Future<BaseResponse> launchMatchAgain(
      {required int fromRid, required int toRid}) async {
    String url = "${System.domain}games/match/onemoreNotify";
    final Map<String, String> params = {
      "from_rid": '$fromRid',
      "to_rid": '$toRid',
    };
    Log.d('url = $url params= $params');
    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  /// 接受再来一局
  static Future<BaseResponse> acceptMatchAgain(
      {required int fromRid, required int toRid}) async {
    String url = "${System.domain}games/match/onemoreAgree";
    final Map<String, String> params = {
      "from_rid": '$fromRid',
      "to_rid": '$toRid',
    };
    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  /// 获取直播PK设置
  static Future<LivePKSetConfigModelV3?> getPKConfig(int rid) async {
    LivePKSetConfigModelV3? result;
    try {
      String url = "${System.domain}games/pk/getConfig";
      final Map<String, String> params = {
        "rid": '$rid',
        "version": '1',
      };

      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        result =
            LivePKSetConfigModelV3.fromJson(Map<String, dynamic>.from(res));
      }
    } catch (e) {
      Log.d('getPKConfig exception: $e');
    }
    return result;
  }

  /// 直播PK设置
  static Future<DataRsp> setPKConfig({
    required int rid,
    required int configId,
    required String pkStatus,
    required String pkTime,
    required int punishId,
    required String punishContent,
    required String hostInvite,
    required String coinEnable,
  }) async {
    String url = "${System.domain}games/pk/setConfig";
    final Map<String, String> params = {
      "version": '2',
      "rid": '$rid',
      "config_id": '$configId',
      "pk_status": pkStatus,
      "pk_time": pkTime,
      'punish_id': '$punishId',
      "punish_content": punishContent,
      "host_invite": hostInvite,
      "coin_enable": coinEnable,
    };

    XhrResponse response = await Xhr.postJson(url, params);
    DataRsp rsp = DataRsp.fromXhrResponse(response, (json) => json);
    return rsp;
  }

  /// 邀请好友列表
  static Future<List<LivePKInviteFriendItem>> getInviteFriendList(
      int rid) async {
    List<LivePKInviteFriendItem> result = [];
    try {
      String url = "${System.domain}live/friends";
      final Map<String, String> params = {
        "rid": '$rid',
      };

      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true &&
          res['data'] != null &&
          res['data']['friends'] != null) {
        result = (res['data']['friends'] as List)
            .map((jsonItem) => LivePKInviteFriendItem.fromJson(jsonItem))
            .toList();
      }
    } catch (e) {
      Log.d('getInviteFriendList exception: $e');
    }
    return result;
  }

  /// 最近匹配列表
  static Future<List<LivePKRecentItem>> getRecentMatchList(int rid) async {
    List<LivePKRecentItem> result = [];
    try {
      String url = "${System.domain}live/recent";
      final Map<String, String> params = {
        "rid": '$rid',
      };

      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();

      if (res['success'] == true && res['data'] != null) {
        result = (res['data'] as List)
            .map((jsonItem) => LivePKRecentItem.fromJson(jsonItem))
            .toList();
      }
    } catch (e) {
      Log.d('getRecentMatchList exception: $e');
    }
    return result;
  }

  /// 搜索PK好友
  static Future<List<LivePKInviteFriendItem>> searchLivePKList(
      int rid, String key) async {
    List<LivePKInviteFriendItem> result = [];
    try {
      String url = "${System.domain}live/search";
      final Map<String, String> params = {
        "rid": '$rid',
        'k': key,
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        result = (res['data'] as List)
            .map((jsonItem) => LivePKInviteFriendItem.fromJson(jsonItem))
            .toList();
      }
    } catch (e) {
      Log.d('searchLivePKList exception: $e');
    }
    return result;
  }

  ///获取连麦token
  static Future<Map<String, String>?> getPkToken(
      int rid1, int uid1, int rid2, int uid2) async {
    Map<String, String>? tokenMap;
    try {
      String url = '${System.domain}games/pk/getPkToken';
      XhrResponse response = await Xhr.postJson(
        url,
        {'rid1': '$rid1', 'uid1': '$uid1', 'rid2': '$rid2', 'uid2': '$uid2'},
        throwOnError: true,
      );
      Map res = response.value();
      if (res['success'] == true) {
        Map data = res['data'];
        tokenMap = {
          'token1': data['token1'],
          'token2': data['token2'],
        };
      }
      if (res['success'] == false) {
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Log.d('getPkToken failed : $e');
    }

    return tokenMap;
  }

  /// 随机匹配
  static Future<BaseResponse> startMatch(int rid) async {
    String url = "${System.domain}games/match/pkmatch";
    final Map<String, String> params = {
      "rid": '$rid',
      "version": "1",
    };
    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  ///取消匹配
  static Future<BaseResponse> cancelMatch(String rid) async {
    String url = "${System.domain}games/match/pkunmatch";
    final Map<String, String> params = {
      "rid": rid.toString(),
      "version": "1",
    };
    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  ///接受PK
  static Future<BaseResponse> pkAgree(
      {required int pkId,
      required int mainRid,
      required int competeRid}) async {
    String url = "${System.domain}games/match/pkAgreeV2";
    final Map<String, String> params = {
      "pk_id": pkId.toString(),
      "main_rid": mainRid.toString(),
      "compete_rid": competeRid.toString(),
    };
    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  ///拒绝PK
  /// [inviteSource] 1，表示从好友列表中邀请，2，最近PK场记录中邀请，3，搜索结果邀请，4，随机邀请匹配。
  /// 1,2,3发出的邀请，如果对方拒绝，pk直接结束。4 发出的邀请，如果对方拒绝，主方无感知，继续匹配。
  static Future<DataRsp> pkReject({
    required int pkId,
    required int mainRid,
    required int competeRid,
    required int inviteSource,
  }) async {
    String url = "${System.domain}games/match/pkrejectV2";
    final Map<String, String> params = {
      "pk_id": pkId.toString(),
      "main_rid": mainRid.toString(),
      "compete_rid": competeRid.toString(),
      'invite_source': inviteSource.toString(),
    };
    XhrResponse response = await Xhr.postJson(url, params);
    DataRsp rsp = DataRsp.fromXhrResponse(response, (json) => json);
    return rsp;
  }

  /// 邀请PK
  /// [inviteSource] 1，表示从好友列表中邀请，2，最近PK场记录中邀请，3，搜索结果邀请
  static Future<BaseResponse> invitePK({
    required int mainRid,
    required int mainUid,
    required int inviteRid,
    required int inviteUid,
    required int inviteSource,
  }) async {
    String url = "${System.domain}games/match/invitePk";
    final Map<String, String> params = {
      "main_rid": mainRid.toString(),
      "main_uid": mainUid.toString(),
      "invite_rid": inviteRid.toString(),
      "invite_uid": inviteUid.toString(),
      "invite_source": inviteSource.toString(),
    };

    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  /// 结束PK
  static Future<BaseResponse> endPK(int rid, int pkId) async {
    String url = "${System.domain}games/pk/end";
    final Map<String, String> params = {
      "rid": '$rid',
      "pk_id": '$pkId',
    };

    XhrResponse response = await Xhr.postJson(url, params);
    return BaseResponse.parse(response);
  }

  /// 连麦关麦
  /// rid 对方rid
  /// display 1开麦 2关麦
  static Future<bool> closeJoinMic(int rid, int pkId, int display) async {
    String url = "${System.domain}games/pk/closeJoinMic";
    final Map<String, String> params = {
      "rid": '$rid',
      "pk_id": '$pkId',
      "display": '$display'
    };

    XhrResponse response = await Xhr.postJson(url, params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (!(baseResponse.success == true)) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  static Future<ResKnightRankList> getKnightRankData(int rid, int page) async {
    String url = '${System.domain}go/yy/knight/rank/';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'page': '$page'}, pb: true);
      return ResKnightRankList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightRankList(msg: e.toString(), success: false);
    }
  }

  static Future<ResKnightConfigList> getKnightConfigData(
      int rid, int uid) async {
    String url = '${System.domain}go/yy/knight/config/';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'uid': '$uid'}, pb: true);
      return ResKnightConfigList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightConfigList(msg: e.toString(), success: false);
    }
  }

  static Future<ResKnightMine> getKnightMineData(int rid, int uid) async {
    String url = '${System.domain}go/yy/knight/mine';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'master_uid': '$uid'}, pb: true);
      return ResKnightMine.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightMine(msg: e.toString(), success: false);
    }
  }
}
