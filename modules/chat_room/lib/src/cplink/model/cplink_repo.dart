import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

import '../../protobuf/generated/cplink.pb.dart';
import 'cplink_model.dart';

class CpLinkRepo {
  /// 控制流程版本
  static const int NEXT_STEP_VERSION = 1;

  static Future<BaseResponse> nextStep(int rid, CpLinkState curState,
      {int selectId = 0}) async {
    int nextState = 0;
    if (curState == CpLinkState.wait) {
      nextState = 1;
    } else if (curState == CpLinkState.heart) {
      nextState = 2;
    }
    String url = '${System.domain}cplink/next?uid=${Session.uid}';
    try {
      Map<String, String> params = {
        'rid': '$rid',
        'next_stage': '$nextState',
        'version': '$NEXT_STEP_VERSION',
      };
      if (selectId > 0) {
        params['auction_id'] = '$selectId';
      }

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData = BaseResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<DelayData>> delay(int rid) async {
    String url = '${System.domain}cplink/delay?uid=${Session.uid}';
    Map<String, String> params = {
      'rid': '$rid',
    };
    XhrResponse response = await Xhr.postJson(url, params, throwOnError: false);
    return DataRsp<DelayData>.fromXhrResponse(
        response, (json) => DelayData.fromJson(json as Map<String, dynamic>));
  }

  /// 选定(取消选定)场景
  static Future<BaseResponse?> chooseScene(
      int scene, bool op, int rid, int targetUid) async {
    String url = "${System.domain}cplink/scene";
    Map<String, String> params = {
      "scene": scene.toString(),
      "op": op ? "1" : "2",
      "rid": rid.toString(),
      "target_uid": targetUid.toString()
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map<String, dynamic> data = response.value() as Map<String, dynamic>;
      BaseResponse baseResponse = BaseResponse.fromJson(data);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }

    return null;
  }

  /// 连线完成
  static Future<BaseResponse?> finishLink(
      int rid, int uid1, int uid2, String relationId) async {
    String url = "${System.domain}cplink/finish";
    Map<String, String> params = {
      "rid": rid.toString(),
      "uid1": uid1.toString(),
      "uid2": uid2.toString(),
      "auction_id": relationId,
      'version': '1',
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map<String, dynamic> data = response.value() as Map<String, dynamic>;
      BaseResponse baseResponse = BaseResponse.fromJson(data);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }

    return null;
  }

  static Future<BaseResponse?> assist(int rid, bool cpLinkAssist) async {
    String url = "${System.domain}cplink/assist";
    Map<String, String> params = {
      "rid": rid.toString(),
      "op": cpLinkAssist ? "1" : "2"
    };
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map<String, dynamic> data = response.value() as Map<String, dynamic>;
      BaseResponse baseResponse = BaseResponse.fromJson(data);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  static Future<DataRsp<RelationshipData>?> relationList(int rid) async {
    String url = "${System.domain}cplink/relationV1";
    Map<String, String> params = {
      "rid": '$rid',
    };
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      DataRsp<RelationshipData> rsp = DataRsp<RelationshipData>.fromXhrResponse(
          response,
          (json) => RelationshipData.fromJson(json as Map<String, dynamic>));
      return rsp;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 心动连连看V2 选关系
  static Future<DataRsp<RelationshipDataV2>?> relationListV2(int rid) async {
    String url = "${System.domain}cplink/relationPanel?version=1";
    Map<String, String> params = {"rid": '$rid'};
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      DataRsp<RelationshipDataV2> rsp =
          DataRsp<RelationshipDataV2>.fromXhrResponse(
              response,
              (json) =>
                  RelationshipDataV2.fromJson(json as Map<String, dynamic>));
      return rsp;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 心动连连看V2 进度
  static Future<RespCplinkDefendProgressApi> progressList(int rid) async {
    String url = "${System.domain}go/room/cplink/progress";
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid'}, throwOnError: false);
      return RespCplinkDefendProgressApi.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespCplinkDefendProgressApi(success: false, message: e.toString());
    }
  }

  static Future<NormalNull> commitDiyRelation(
      {required int rid, required String diyName}) async {
    String url = '${System.domain}go/room/cplink/diy';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'diyName': diyName,
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> replayDiyRelation(
      {required int rid,
      required int agree,
      required String diyName,
      required int version}) async {
    String url = '${System.domain}go/room/cplink/diyReply';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'agree': '$agree',
        'diyName': diyName,
        'version': '$version',
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 获取公告\玩法说明内容
  /// [type] type=1玩法说明
  static Future<DataRsp<NoticeInfo>> noticeInfo(int rid, int type) async {
    String url = "${System.domain}cplink/noticeinfo";
    Map<String, String> params = {
      "rid": '$rid',
      "type": '$type',
    };

    XhrResponse response = await Xhr.postJson(url, params, throwOnError: false);
    DataRsp<NoticeInfo> rsp = DataRsp<NoticeInfo>.fromXhrResponse(
        response, (json) => NoticeInfo.fromJson(json as Map<String, dynamic>));
    return rsp;
  }

  /// 心动连连榜单接口
  static Future<ResDefendPatRankList> getCpLinkRankData(String type) async {
    String url = "${System.domain}go/yy/rank/defendPatRank?r_type=$type";
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      debugPrint(
          ResDefendPatRankList.fromBuffer(response.bodyBytes).toString());
      return ResDefendPatRankList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResDefendPatRankList(success: false, msg: e.toString());
    }
  }

  /// 心动连连入口滚屏请求接口
  static Future<RespCplinkDefendPatRankIndex> getCpLinkEnterData(
      int rid) async {
    String url = "${System.domain}go/room/cplink/defendPatRankIndex";
    try {
      XhrResponse response = await Xhr.get(url,
          pb: true,
          queryParameters: {
            "rid": '$rid',
          },
          throwOnError: true);
      debugPrint(RespCplinkDefendPatRankIndex.fromBuffer(response.bodyBytes)
          .toString());
      return RespCplinkDefendPatRankIndex.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespCplinkDefendPatRankIndex(success: false, msg: e.toString());
    }
  }
}

class CpLinkModel {
  static Future<void> nextStep(BuildContext context, ChatRoomData room) async {
    bool? result = await showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            content: K.room_cplink_next_alert,
          );
        });

    if (result ?? false) {
      BaseResponse rsp = await CpLinkRepo.nextStep(
          room.rid, (room.config?.configExpendData as CpLinkConfigData).state);
      if (!(rsp.success == true) && (rsp.msg?.isNotEmpty ?? false)) {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    }
  }

  static Future<void> delay(ChatRoomData room) async {
    DataRsp<DelayData> rsp = await CpLinkRepo.delay(room.rid);
    if (rsp.success == true) {
      if (rsp.data?.delayLeftTimes.compareTo(0) == 1) {
        Fluttertoast.showToast(
            msg: K.room_cplink_delay_tip(['${rsp.data!.delayLeftTimes}']));
      }
    } else if (rsp.msg?.isNotEmpty ?? false) {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  static Future<bool> assist(int rid, bool cpLinkAssist) async {
    BaseResponse? rsp = await CpLinkRepo.assist(rid, cpLinkAssist);
    if (rsp != null &&
        !(rsp.success == true) &&
        (rsp.msg?.isNotEmpty ?? false)) {
      Fluttertoast.showToast(msg: rsp.msg);
    }
    return rsp?.success ?? false;
  }
}
