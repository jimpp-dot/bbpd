import 'package:chat_room/src/accompany/model/accompany_pay_model.dart';
import 'package:chat_room/src/base/model/pb/generated/common_reward.pb.dart';
import 'package:chat_room/src/base/model/room_push_bean.dart';
import 'package:chat_room/src/base/model/superadmin_quickanswer_data.dart';
import 'package:chat_room/src/base/model/voice_connect_info.dart';
import 'package:chat_room/src/protobuf/generated/admin_list.pb.dart';
import 'package:chat_room/src/protobuf/generated/admin_log.pb.dart';
import 'package:chat_room/src/protobuf/generated/common_banner.pb.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';
import 'package:chat_room/src/protobuf/generated/forbidden_log.pb.dart';
import 'package:chat_room/src/protobuf/generated/online_list.pb.dart';
import 'package:chat_room/src/protobuf/generated/package_log.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_all.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_charm.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_contribute.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_defend.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_fans.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_love.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_noble.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_sweet.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';
import 'package:shared/shared.dart';

import '../../protobuf/generated/drainage.pb.dart';
import '../../protobuf/generated/nest.pb.dart';
import '../../protobuf/generated/ranking_reception.pb.dart';
import '../../protobuf/generated/room_package.pb.dart';

class RoomApi {
  RoomApi._();

  ///邀请用户进房 type :friend  nearby
  static Future<BaseResponse> inviteUserJoinRoom(String uid, String rid, String type, int distance) async {
    String url = '${System.domain}invite/inviteUserJoinRoom';
    try {
      Map<String, String> map = {'invite_uid': uid, 'rid': rid, 'type': type, 'distance': '$distance'};
      XhrResponse response = await Xhr.postJson(url, map);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      try {
        return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return BaseResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  ///邀请用户免费进付费小房
  static Future<BaseResponse> inviteDrainageShareRoom(
    String uid,
    String rid,
  ) async {
    String url = '${System.domain}go/room/drainage/share';
    try {
      Map<String, String> map = {
        'rid': rid,
        'to': uid,
      };
      XhrResponse response = await Xhr.postJson(url, map, formatJson: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      try {
        return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return BaseResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  ///房间推送tab
  static Future<TabsResponse> getRoomPushTab() async {
    String url = '${System.domain}transfer/tab';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        Log.d(response.error.toString());
        return TabsResponse(msg: response.error.toString(), success: false);
      }
      try {
        return TabsResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return TabsResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return TabsResponse(msg: e.toString(), success: false);
    }
  }

  ///房间推送tab
  static Future<BaseResponse> pushRoomMessage(int shardRid, int toRid) async {
    String url = '${System.domain}transfer/share';
    Map<String, String> map = {'rid': '$shardRid', 'to_rid': '$toRid'};
    try {
      XhrResponse response = await Xhr.postJson(url, map);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      try {
        return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return BaseResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  ///修改房间公告rid
  static Future<BaseResponse> editRoomDesc(int rid, String desc) async {
    String url = '${System.domain}option/saveDesc';
    Map<String, String> map = {'rid': '$rid', 'description': desc};
    try {
      XhrResponse response = await Xhr.postJson(url, map);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<AccompanyGiftData>> accompanyGiftData(int rid) async {
    String url = '${System.domain}chatroom/pvPopup';
    try {
      XhrResponse response = await Xhr.getJson(url, params: {'rid': '$rid'});
      return DataRsp<AccompanyGiftData>.fromXhrResponse(response, (object) => AccompanyGiftData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<AccompanyGiftData>(msg: '$e', success: false);
    }
  }

  /// 获取房间公告
  static Future<ResRoomDataDesc> roomDescription(int rid) async {
    String url = "${System.domain}go/yy/room/desc";

    try {
      XhrResponse response = await Xhr.get(url, queryParameters: {'rid': rid.toString()}, pb: true);
      ResRoomDataDesc data = ResRoomDataDesc.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResRoomDataDesc(msg: e.toString(), success: false);
    }
  }

  //房间统计数据
  static Future<ResRoomData> getRoomAdminData(int uid, int rid, {int start = 0}) async {
    Map<String, dynamic> map = {'uid': '$uid', 'rid': '$rid', 'phase_start': '${Util.parseInt(start)}'};
    String url = '${System.domain}go/yy/room/data';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomData.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomData(msg: '$e', success: false);
    }
  }

  //全部房间排行榜数据
  static Future<ResRoomData> getRoomAdminAllData() async {
    String url = '${System.domain}go/yy/room/index';
    XhrResponse response = await Xhr.get(url, pb: true);
    try {
      return ResRoomData.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomData(msg: '$e', success: false);
    }
  }

  static Future<ResRoomDataList> getRoomAdminDataList(int rid, int page, int type, {int start = 0, int date = 0, int recent = 0}) async {
    Map<String, dynamic> map = {
      'rid': '$rid',
      'page': '$page',
      'type': '$type',
      'phase_start': '${Util.parseInt(start)}',
      'date_time': '${Util.parseInt(date)}',
      'recent': '${Util.parseInt(recent)}'
    };
    String url = '${System.domain}go/yy/room/datalist';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomDataList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomDataList(msg: '$e', success: false);
    }
  }

  static Future<ResRoomPhaseDetail> getRoomAdminPhaseDetail(int rid, {int start = 0, int date = 0, int recent = 0}) async {
    Map<String, dynamic> map = {
      'rid': '$rid',
      'phase_start': '${Util.parseInt(start)}',
      'date_time': '${Util.parseInt(date)}',
      'recent': '${Util.parseInt(recent)}'
    };

    String url = '${System.domain}go/yy/room/phasedetail';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomPhaseDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPhaseDetail(msg: '$e', success: false);
    }
  }

  static Future<ResRoomPhaseList> getRoomAdminPhaseList(int rid) async {
    Map<String, dynamic> map = {'rid': '$rid'};
    String url = '${System.domain}go/yy/room/phaselist';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomPhaseList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPhaseList(msg: '$e', success: false);
    }
  }

  static Future<ResRoomPackageDetail> getRoomAdminPackageDetail(int rid, int page, {int start = 0, int date = 0, int recent = 0}) async {
    Map<String, dynamic> map = {
      'rid': '$rid',
      'page': '$page',
      'phase_start': '${Util.parseInt(start)}',
      'date_time': '${Util.parseInt(date)}',
      'recent': '${Util.parseInt(recent)}'
    };
    String url = '${System.domain}go/yy/room/packagedetail';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomPackageDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPackageDetail(msg: '$e', success: false);
    }
  }

  static Future<ResRoomDataReceptionTransferList> getRoomDataReceptionTransferList(int rid, int page) async {
    Map<String, dynamic> map = {'rid': '$rid', 'page': '$page'};
    String url = '${System.domain}go/yy/room/receptiontransferlist';
    XhrResponse response = await Xhr.get(url, pb: true, queryParameters: map);
    try {
      return ResRoomDataReceptionTransferList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomDataReceptionTransferList(msg: '$e', success: false);
    }
  }

  static Future<NormalString> searchRoomId(String rid) async {
    Map<String, String> map = {'rid': rid};
    String url = '${System.domain}go/yy/room/search';
    XhrResponse response = await Xhr.post(url, map, pb: true);
    try {
      return NormalString.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalString(msg: '$e', success: false);
    }
  }

  /// 房间在线列表
  static Future<ResOnlineList> getRoomOnlineList(int rid, String word) async {
    String url = '${System.domain}go/yy/room/online';

    Map<String, String> body = {'rid': '$rid', if (!Util.isStringEmpty(word, trim: true)) 'word': word};
    try {
      XhrResponse response = await Xhr.post(url, body, pb: true);
      return ResOnlineList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResOnlineList(msg: e.toString(), success: false);
    }
  }

  /// 打赏日志
  static Future<ResPackageLog> getRoomPackageLog(int rid) async {
    String url = '${System.domain}go/room/package/log/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResPackageLog.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPackageLog(msg: e.toString(), success: false);
    }
  }

  /// 操作日志
  static Future<ResAdminLog> getRoomAdminLog(int rid) async {
    String url = '${System.domain}go/room/admin/log/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResAdminLog.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAdminLog(msg: e.toString(), success: false);
    }
  }

  /// 管理员列表
  static Future<ResAdminList> getRoomAdminList(int rid) async {
    String url = '${System.domain}go/room/admin/list/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResAdminList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAdminList(msg: e.toString(), success: false);
    }
  }

  /// 封禁日志
  static Future<ResForbiddenLog> getRoomForbiddenLog(int rid) async {
    String url = '${System.domain}go/room/forbidden/log/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResForbiddenLog.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResForbiddenLog(msg: e.toString(), success: false);
    }
  }

  /// 房间贡献周榜
  static Future<ResRankingContribute> getRoomContributeWeekList(int rid) async {
    String url = '${System.domain}go/room/ranking/contribute/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingContribute.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingContribute(msg: e.toString(), success: false);
    }
  }

  /// 房间贡献总榜
  static Future<ResRankingAll> getRoomContributeAllList(int rid) async {
    String url = '${System.domain}go/room/ranking/all/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingAll.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingAll(msg: e.toString(), success: false);
    }
  }

  /// 魅力榜
  static Future<ResRankingCharm> getRoomCharmList(int rid) async {
    String url = '${System.domain}go/room/ranking/charm/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingCharm.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingCharm(msg: e.toString(), success: false);
    }
  }

  /// 电台守护榜
  static Future<ResRankingDefend> getRoomDefendList(int rid) async {
    String url = '${System.domain}go/room/ranking/defend/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingDefend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingDefend(msg: e.toString(), success: false);
    }
  }

  /// 甜蜜守护榜
  static Future<ResRankingSweet> getRoomSweetList(int rid) async {
    String url = '${System.domain}go/room/ranking/sweet/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingSweet.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingSweet(msg: e.toString(), success: false);
    }
  }

  /// 贵族榜
  static Future<ResRankingNoble> getRoomNobleList(int rid) async {
    String url = '${System.domain}go/room/ranking/noble/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingNoble.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingNoble(msg: e.toString(), success: false);
    }
  }

  /// 真爱榜
  static Future<ResRankingLove> getRoomLoveList(int rid) async {
    String url = '${System.domain}go/room/ranking/love/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      return ResRankingLove.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingLove(msg: e.toString(), success: false);
    }
  }

  /// 粉丝榜
  static Future<ResRankingFans> getRoomFansList(int rid, int liveUid) async {
    String url = '${System.domain}go/room/ranking/fans/';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'rid': '$rid',
            'live_uid': '$liveUid',
          },
          pb: true);
      return ResRankingFans.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRankingFans(msg: e.toString(), success: false);
    }
  }

  /// 房间banner
  static Future<ResBanner> getRoomBanner(int rid, int sex, int role) async {
    /// 新增半屏Banner需求后导致运营把规则搞乱了，这里和服务端协调统一version=4以处理修复这个问题
    String url = '${System.domain}go/yy/room/banner?sex=$sex&role=$role&version=4&crid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResBanner.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResBanner(msg: e.toString(), success: false);
    }
  }

  /// 超管快捷回复话术
  static Future<SuperAdminQuickAnswerRsp> getQuickReplyData(int rid) async {
    String url = '${System.domain}Quickreply/superAdmin';

    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'rid': '$rid',
        },
        throwOnError: true,
      );

      if (response.error != null) {
        return SuperAdminQuickAnswerRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SuperAdminQuickAnswerRsp(msg: res['msg'], success: false);
      }
      try {
        SuperAdminQuickAnswerRsp responseData = SuperAdminQuickAnswerRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return SuperAdminQuickAnswerRsp(msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SuperAdminQuickAnswerRsp(msg: e.toString(), success: false);
    }
  }

  /// 私密房列表
  static Future<ApiNestChildrenResponse> getNestRoomList(int rid) async {
    Map<String, dynamic> map = {'rid': '$rid'};
    String url = '${System.domain}go/room/nest/children';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true, queryParameters: map);
      return ApiNestChildrenResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiNestChildrenResponse(message: '$e', success: false);
    }
  }

  /// 创建商业房关联小房间
  /// rid: 大房间uid
  /// type：待创建小房间类型
  /// uids：邀请用户列表, 优化一版后，默认不邀请用户，传[]即可
  /// giftId: 设置进小房的礼物id，不设置传0
  /// giftNu吗: 设置进小房礼物个数，不设置传0
  static Future<ResDrainageCreate> createPrivateRoom(
    int rid,
    String type,
    List<int> uids,
    int giftId,
    int giftNum,
  ) async {
    String url = '${System.domain}go/room/drainage/create';

    Map<String, String> body = {
      'master_rid': '$rid',
      'type': type,
      'uids': uids.join(','),
      'need_giftid': '$giftId',
      'need_giftnum': '$giftNum',
    };
    try {
      XhrResponse response = await Xhr.post(url, body, pb: true);
      return ResDrainageCreate.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResDrainageCreate(message: e.toString(), success: false);
    }
  }

  /// 房间打赏 and 打赏明细
  /// type 1-房间打赏 ；2-打赏明细
  static Future<ApiRankRewardResponse> getRoomRewardList(int type, int rid, int gs, int page, {int? uid, int? sort}) async {
    String url = '${System.domain}go/room/ranking/reward';
    try {
      Map<String, dynamic> param = {'type': type, 'rid': rid, 'gs': gs, 'page': page};
      if (uid != null) param['uid'] = uid;
      if (sort != null) param['sort'] = sort;
      XhrResponse response = await Xhr.get(url, queryParameters: param, pb: true);

      return ApiRankRewardResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRankRewardResponse(message: e.toString(), success: false);
    }
  }

  /// 背景音乐配置
  static Future<ResBgMConfig> getMusicConfig(int rid) async {
    String url = '${System.domain}go/yy/music/config?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResBgMConfig rsp = response.formatProtobuf(ResBgMConfig.create());
      Log.d('getMusicConfig:$rsp');
      return rsp;
    } catch (e) {
      return ResBgMConfig(msg: e.toString(), success: false);
    }
  }

  /// 红包流水
  static Future<RspRoomPackageRecords> getRoomPacketLst(int rid, int lastId) async {
    String url = '${System.domain}go/yy/room-package/records/';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid', 'last_id': "$lastId"}, pb: true);
      return RspRoomPackageRecords.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RspRoomPackageRecords(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<VoiceConnectInfo>> startVoiceConnect(int srcUid, int destRid) async {
    //
    String url = '${System.domain}rooms/pubclub/syncVoice';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'uid': '$srcUid',
            'rid': '$destRid',
          },
          throwOnError: false);
      return DataRsp<VoiceConnectInfo>.fromXhrResponse(response, (object) => VoiceConnectInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<VoiceConnectInfo>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 优质接待榜单
  static Future<RespRankBestReceptionWeekly> getReceptionRankData(int page, int rankType) async {
    String url = '${System.domain}go/yy/rank/reception/';
    try {
      XhrResponse response = await Xhr.post(url, {'page': "$page", 'rank_type': '$rankType', "limit": "20"}, pb: true);
      return RespRankBestReceptionWeekly.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespRankBestReceptionWeekly(msg: e.toString(), success: false);
    }
  }
}
