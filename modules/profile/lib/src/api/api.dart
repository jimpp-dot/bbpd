import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:profile/src/model/gs_tool_item.dart';
import 'package:profile/src/model/nl_friend_recommend_model.dart';
import 'package:profile/src/model/pb/generated/account_frame.pb.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';
import 'package:profile/src/model/pb/generated/invite_for_gift.pb.dart';
import 'package:profile/src/model/pb/generated/sign_board.pb.dart';
import 'package:profile/src/model/reception_info_model.dart';
import 'package:profile/src/model/sign_in_model.dart';
import 'package:profile/src/model/task_model.dart';
import 'package:shared/src/pbModel/generated/gs_config.pb.dart';
import 'package:shared/src/pbModel/generated/slp_pretty.pb.dart';

class Api {
  /// 只获取任务列表
  static Future<TaskModel?> getTask() async {
    try {
      XhrResponse response = await Xhr.getJson(
        "/mission/listdailytask",
        throwOnError: true,
      );

      Map res = response.value();
      if (Util.parseBool(res['success'])) {
        var extra = res['data'];
        if (extra != null) {
          TaskModel taskData = TaskModel.fromJson(res as Map<String, dynamic>);
          return taskData;
        }
      }
      return null;
    } catch (e) {
      Log.d('eaegle.getDefendProfile = catch');
    } finally {
      Log.d('eaegle.getDefendProfile = finally');
    }
    return null;
  }

  static Future<SignInResp> getWeekTasks() async {
    var url =
        '${System.domain}go/yy/mission/listBoard?uid=${Session.uid}&version=1';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ListBoardRsp rsp = ListBoardRsp.fromBuffer(response.bodyBytes);
      if (!rsp.success) {
        return SignInResp(msg: rsp.msg, success: false);
      }
      return SignInResp(
          success: rsp.success,
          signed: rsp.data.signed,
          popTimes: rsp.data.popTimes,
          weekSign: rsp.data.board
              .asMap()
              .entries
              .map((entry) => WeekSignModel(
                  icon: entry.value.icon,
                  isSign: entry.value.isSign > 0,
                  signType: entry.value.signType.toString(),
                  missionType: entry.value.missionType.toString(),
                  missionId: entry.value.missionId.toString(),
                  awardType: entry.value.awardType,
                  awardIcon: entry.value.awardIcon,
                  awardNum: entry.value.awardNum,
                  day: entry.key + 1))
              .toList(),
          weekDay: rsp.data.weekDay,
          total: rsp.data.total,
          canSignWithoutMobile: rsp.data.canSignWithoutMobile);
    } catch (e) {
      return SignInResp(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<ReceptionConfig>> getReceptionConfig() async {
    String url = '${System.domain}reception/getApplyIndex';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<ReceptionConfig>.fromXhrResponse(response,
          (object) => ReceptionConfig.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ReceptionConfig>(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> cancelReceptionVerify(String channel) async {
    String url = '${System.domain}reception/cancelVerify';
    try {
      XhrResponse response = await Xhr.postJson(url, {'channel': channel});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<ChannelInfoModel>> startReceptionVerify(
      String channel) async {
    String url = '${System.domain}reception/startVerify';
    try {
      XhrResponse response = await Xhr.postJson(url, {'channel': channel});
      return DataRsp<ChannelInfoModel>.fromXhrResponse(
          response,
          (object) =>
              ChannelInfoModel.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ChannelInfoModel>(msg: '$e', success: false);
    }
  }

  /// NL转化成就榜 type 1 本周排名 2 上周排名
  static Future<NLAchieveRankRsp> getNLAchieveRankData(
      int type, int page) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}transfer/achieveRank?type=$type&page=$page",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return NLAchieveRankRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return NLAchieveRankRsp(msg: res['msg'], success: false);
      }
      try {
        NLAchieveRankRsp responseData =
            NLAchieveRankRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return NLAchieveRankRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NLAchieveRankRsp(msg: e.toString(), success: false);
    }
  }

  /// NL好友推荐列表
  static Future<NLRecommendFriendRsp> getNLRecommendFriendData(int page) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}transfer/recommend?page=$page",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return NLRecommendFriendRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return NLRecommendFriendRsp(msg: res['msg'], success: false);
      }
      try {
        NLRecommendFriendRsp responseData =
            NLRecommendFriendRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return NLRecommendFriendRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NLRecommendFriendRsp(msg: e.toString(), success: false);
    }
  }

  /// cdKey 兑换
  static Future<DataRsp<ShopMailCommodity>> exchange(String cdKey) async {
    String url = '${System.domain}mate/keyboardactvity/exchange';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'cd_key': cdKey, 'version': '1'});
      return DataRsp<ShopMailCommodity>.fromXhrResponse(
          response,
          (object) =>
              ShopMailCommodity.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ShopMailCommodity>(msg: '$e', success: false);
    }
  }

  /// profile page 配置(快乐星球)
  static Future<ConfigProfileData?> getBbConfig() async {
    String url = '${System.domain}go/yy/config/profile?version=1';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResConfigProfile config = ResConfigProfile.fromBuffer(response.bodyBytes);
      if (config.success) {
        return config.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// 用户头像框
  static Future<ResAccountFrame> getAccountFrame(List<int> uids) async {
    String url = '${System.domain}go/yy/account/frame';
    try {
      XhrResponse response =
          await Xhr.post(url, {'uids': jsonEncode(uids)}, pb: true);
      ResAccountFrame data = ResAccountFrame.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResAccountFrame(msg: e.toString(), success: false);
    }
  }

  /// 是否展示已转化及NL新贵转化好友推荐
  static Future<ResTransferShow> getTransferShow() async {
    String url = '${System.domain}go/yy/transfer/show';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResTransferShow data = ResTransferShow.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResTransferShow(msg: e.toString(), success: false);
    }
  }

  /// 主播工具中心
  static Future<DataRsp<List<GsToolItem>>> gsTools() async {
    String url = '${System.domain}go/mate/config/gsTools';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<List<GsToolItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => GsToolItem.fromJson(e)),
      );
    } catch (e) {
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///获取邀请有礼相关的数据
  static Future<ResInviteInfo> getInviteForGiftInfo() async {
    String url = '${System.domain}go/hisong/union/invite';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResInviteInfo data = ResInviteInfo.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResInviteInfo(msg: e.toString(), success: false);
    }
  }

  ///获取恋爱人格测试状态数据
  static Future<LoveExamIndexRes> getLoveTestStatus() async {
    try {
      String url = '${System.domain}go/hisong/act/loveExamIndex';
      XhrResponse response = await Xhr.get(url, pb: true);
      LoveExamIndexRes resp = LoveExamIndexRes.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return LoveExamIndexRes(msg: e.toString(), success: false);
    }
  }

  ///获取恋爱人格测试结果数据
  static Future<ResLoveMatchRes> getLoveTestResult(int tagId, int page) async {
    try {
      String url = '${System.domain}/go/hisong/act/getLoveExamDetail';
      var params = {'tag_id': tagId, 'page': page};
      XhrResponse response =
          await Xhr.get(url, queryParameters: params, pb: true);
      ResLoveMatchRes resp = ResLoveMatchRes.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return ResLoveMatchRes(msg: e.toString(), success: false);
    }
  }

  /// 获取性格测试测试题
  static Future<GetLoveExamRes> getLoveTestQuestion() async {
    String url = '${System.domain}go/hisong/act/getLoveExam';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      GetLoveExamRes data = GetLoveExamRes.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return GetLoveExamRes(msg: e.toString(), success: false);
    }
  }

  /// 提交性格测试题答案
  static Future<GetLoveExamResultRes> submitLoveTestAnswer(
      Map<String, int> answerMap) async {
    String url = '${System.domain}go/hisong/act/getLoveExamResult';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'answer': json.encode(answerMap),
          },
          pb: true);
      GetLoveExamResultRes data =
          GetLoveExamResultRes.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return GetLoveExamResultRes(msg: e.toString(), success: false);
    }
  }

  /// 我的靓号列表
  static Future<ResMyPrettyIdList> getPrettyIdList() async {
    String url = '${System.domain}go/yy/pretty/myList';
    try {
      XhrResponse response = await Xhr.post(url, {}, pb: true);
      ResMyPrettyIdList rsp = ResMyPrettyIdList.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return ResMyPrettyIdList(msg: e.toString(), success: false);
    }
  }

  /// 靓号使用 selectId：要使用的靓号id，currId：当前正在使用的靓号id，type:0使用靓号，1隐藏靓号
  static Future<NormalNull> prettyIdUse(
      int selectId, int currId, int type) async {
    String url = '${System.domain}go/yy/pretty/use';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            "pretty_id": "$selectId",
            "current_pretty_id": "$currId",
            "type": "$type"
          },
          pb: true);
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
