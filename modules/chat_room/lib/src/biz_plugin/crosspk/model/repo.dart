import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

class CrossPKRepo {
  /// 拉取pk数据
  static Future<RespRoomCrossPkConfig> loadInfo(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/config',
        {
          'rid': rid.toString(),
          'version': '1',
        },
        pb: true,
      );
      RespRoomCrossPkConfig rsp =
          RespRoomCrossPkConfig.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return RespRoomCrossPkConfig(success: false, msg: e.toString());
    }
  }

  /// 拉取pk房间列表
  static Future<RespRoomCrossPkList> getRoomList(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/list',
        {'rid': rid.toString()},
        pb: true,
      );
      RespRoomCrossPkList rsp =
          RespRoomCrossPkList.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return RespRoomCrossPkList(success: false, msg: e.toString());
    }
  }

  /// 搜索
  /// [k] 关键字
  static Future<RespRoomCrossPkSearch> search(int rid, String k) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/search',
        {'rid': rid.toString(), 'k': k},
        pb: true,
      );
      RespRoomCrossPkSearch rsp =
          RespRoomCrossPkSearch.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return RespRoomCrossPkSearch(success: false, msg: e.toString());
    }
  }

  /// 获取pk设置
  static Future<RespRoomCrossPkSetting> getSettings(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/pkConfigV2',
        {'rid': rid.toString()},
        pb: true,
      );
      RespRoomCrossPkSetting rsp =
          RespRoomCrossPkSetting.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return RespRoomCrossPkSetting(success: false, msg: e.toString());
    }
  }

  /// 保存pk设置
  static Future<NormalNull> saveSettings({
    required int rid,
    required int acceptMatch, // 是否接受匹配 0为拒绝，1为接受
    required int acceptInvite, // 是否接受邀请，0为拒绝，1为接受
    required int coinEnable, // 是否支持金币礼物，0为不支持，1为支持
    required int duration, // pk时长
    int? punishId,
    String? punishContent,
  }) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/saveConfigV2',
        {
          'rid': rid.toString(),
          'acceptInvite': acceptInvite.toString(),
          'acceptMatch': acceptMatch.toString(),
          'coinEnable': coinEnable.toString(),
          'duration': duration.toString(),
          if (punishId != null) 'punishId': punishId.toString(),
          if (punishContent != null) 'punishment': punishContent,
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 匹配
  /// [mode] 0 未知，1 两房，2三房
  static Future<NormalNull> match(int rid, RoomCrossPKMode mode) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/match',
        {
          'rid': rid.toString(),
          'mode': mode.value.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 取消匹配
  static Future<NormalNull> cancelMatch(int rid, RoomCrossPKMode mode) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/cancelMatch',
        {
          'rid': rid.toString(),
          'mode': mode.value.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 邀请
  /// [targetRid] 发起pk请求的目标房间ID。邀请多个房间时，连续多次调用本接口
  static Future<NormalNull> invite({
    required int rid,
    required int targetRid,
    required RoomCrossPKMode mode,
  }) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/invite',
        {
          'rid': rid.toString(),
          'targetRid': targetRid.toString(),
          'mode': mode.value.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 接受pk
  static Future<NormalNull> accept(
    int rid,
    int sourceRid, {
    required RoomCrossPKMode mode,
    required RoomCrossPkInviteMode inviteMode,
    int version = 0,
  }) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/accept',
        {
          'rid': rid.toString(),
          'sourceRid': sourceRid.toString(),
          'mode': mode.value.toString(),
          'inviteMode': inviteMode.value.toString(),
          'version': version.toString(),
          'apiversion': '1',
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 拒绝pk
  static Future<NormalNull> reject(
    int rid,
    int sourceRid, {
    required RoomCrossPKMode mode,
    required RoomCrossPkInviteMode inviteMode,
    int version = 0,
  }) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/reject',
        {
          'rid': rid.toString(),
          'sourceRid': sourceRid.toString(),
          'mode': mode.value.toString(),
          'inviteMode': inviteMode.value.toString(),
          'version': version.toString(),
          'apiversion': '1',
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 结束pk
  static Future<NormalNull> end(int rid, int pkId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/end',
        {
          'rid': rid.toString(),
          'pkId': pkId.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// PK 申请加时
  static Future<NormalNull> applyOvertime(int rid, int time) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/overtimePoll',
        {'rid': rid.toString(), 'duration': time.toString()},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// PK 申请结束
  static Future<NormalNull> applyEnd(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/voteEnd',
        {
          'rid': rid.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// PK 同意/拒绝对方的加时申请
  static Future<NormalNull> voteOvertime(
      int rid, int vote, int duration) async {
    NormalNull rsp;
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/room/games/crosspk/overtimeVote',
        {
          'rid': rid.toString(),
          'vote': vote.toString(),
          'duration': duration.toString(),
        },
        throwOnError: true,
      );
      rsp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      rsp = NormalNull(success: false, msg: e.toString());
    }
    if (!rsp.success) {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
    return rsp;
  }

  /// PK 同意/拒绝对方的提前结束申请
  static Future<NormalNull> voteEnd(int rid, bool agree, int version) async {
    NormalNull rsp;
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/room/games/crosspk/voteEndReply',
        {
          'rid': rid.toString(),
          'reply': agree ? '1' : '2',
          'version': version.toString(),
        },
        throwOnError: true,
      );
      rsp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      rsp = NormalNull(success: false, msg: e.toString());
    }
    if (!rsp.success) {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
    return rsp;
  }

  /// 约战打开/关闭对方主播声音
  /// rid:自己房间rid
  /// uid:需要开闭麦的用户uid
  /// option: 0 开麦， 1 闭麦
  static Future<void> pkQuiet(int rid, int uid, int option) async {
    try {
      await Xhr.post(
        '${System.domain}go/room/games/crosspk/quiet',
        {
          'rid': '$rid',
          'uid': '$uid',
          'option': '$option',
        },
        pb: true,
      );
    } catch (e) {
      Log.d('pkQuiet error: $e');
    }
  }

  /// 拉取pk类型
  static Future<List<RoomCrossPkModeInfo>> getPkTab(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/games/crosspk/tab',
        {'rid': rid.toString()},
        pb: true,
      );

      ApiCrossPkTabResponse rsp =
          response.formatProtobuf(ApiCrossPkTabResponse.create());
      Log.d('getPkTab: $rsp');
      if (rsp.success == true && rsp.tab.tabs.isNotEmpty) {
        return rsp.tab.tabs;
      }

      if (Util.validStr(rsp.message)) {
        Fluttertoast.showCenter(msg: rsp.message);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
    return [];
  }

  /// PK记录-详情
  static Future<ApiRoomCrossPkExploitsDetailsResponse> getPKResultV2(
      int pkId, int rid) async {
    String url = '${System.domain}go/room/games/crosspk/exploitsDetails';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'pk_id': pkId, 'rid': rid}, pb: true);
      return ApiRoomCrossPkExploitsDetailsResponse.fromBuffer(
          response.bodyBytes);
    } catch (e) {
      return ApiRoomCrossPkExploitsDetailsResponse(
          success: false, message: e.toString());
    }
  }
}
