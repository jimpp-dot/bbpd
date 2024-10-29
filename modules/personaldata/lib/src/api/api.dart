import 'package:shared/shared.dart';
import 'package:personaldata/src/model/exam_model.dart';
import 'package:personaldata/src/model/feed_game_guide_bean.dart';
import 'package:personaldata/src/model/my_personal_data.dart';
import 'package:personaldata/src/model/profile_model.dart';
import 'package:personaldata/src/model/title_role_bean.dart';
import 'package:personaldata/src/model/voiceTextModel.dart';
import 'package:personaldata/src/model/wedding_model.dart';
import 'package:moment/src/api/api.dart' as MomentApi;

class Api {
  /// 获取个人页用户信息
  /// [uid] 用户id
  /// [rid] 房间id
  static Future<ProfileResponse> getProfileHome(int uid, int rid) async {
    String url = '${System.domain}profile/home/?version=18&uid=$uid&rid=$rid';
    try {
      double lng = Util.parseDouble(Config.get('location.longitude'));
      double lat = Util.parseDouble(Config.get('location.latitude'));

      Map<String, String> param = {
        'lat': (NumUtil.getNumByValueDouble(lat, 7)).toStringAsFixed(7),
        'lng': (NumUtil.getNumByValueDouble(lng, 7)).toStringAsFixed(7)
      };

      XhrResponse response =
          await Xhr.postJson(url, param, throwOnError: false);
      if (response.error != null) {
        return ProfileResponse(msg: response.error.toString(), success: false);
      }
      try {
        return ProfileResponse.fromJson(
            response.value() as Map<String, dynamic>);
      } catch (e) {
        return ProfileResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return ProfileResponse(msg: e.toString(), success: false);
    }
  }

  /// 交友卡台词列表(卡片)
  static Future<VoiceTextModelRsp?> getVoiceTextModels(int page) async {
    try {
      VoiceTextModelRsp rsp;
      String url = "${System.domain}rush/config/friendCardDialogList";
      Map<String, String> params = {'page': page.toString()};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      rsp = VoiceTextModelRsp.fromJson(res);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  ///superme 活动奖品信息
  static Future<ActivityLotteryResponse> getActivityLotteryInfo() async {
    try {
      String url = '${System.domain}_activity/superme/index/info';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        return ActivityLotteryResponse(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return ActivityLotteryResponse(msg: res['msg'], success: false);
      }
      try {
        ActivityLotteryResponse responseData =
            ActivityLotteryResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return ActivityLotteryResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return ActivityLotteryResponse(msg: e.toString(), success: false);
    }
  }

  static Future<ActivityLotteryResultResponse> getActivityLotteryResult(
      String type) async {
    try {
      String url = '${System.domain}_activity/superme/index/lottery';
      XhrResponse response = await Xhr.postJson(url, {'type': type});
      if (response.error != null) {
        return ActivityLotteryResultResponse(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return ActivityLotteryResultResponse(msg: res['msg'], success: false);
      }
      try {
        ActivityLotteryResultResponse responseData =
            ActivityLotteryResultResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return ActivityLotteryResultResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return ActivityLotteryResultResponse(msg: e.toString(), success: false);
    }
  }

  static Future<ActivityUserInfoResponse> getActivityUserInfo() async {
    try {
      String url = '${System.domain}_activity/superme/index/address';
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return ActivityUserInfoResponse(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return ActivityUserInfoResponse(msg: res['msg'], success: false);
      }
      try {
        ActivityUserInfoResponse responseData =
            ActivityUserInfoResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return ActivityUserInfoResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return ActivityUserInfoResponse(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> saveActivityUserInfo(
      Map<String, String> map) async {
    try {
      String url = '${System.domain}_activity/superme/index/saveAddress';
      XhrResponse response = await Xhr.postJson(url, map);
      if (response.error != null) {
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData = BaseResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return BaseResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 获取所有称号列表
  static Future<TitleRoleBean> getRoleTitles() async {
    String url = '${System.domain}games/ju/titles';
    try {
      Map<String, String> param = {};

      XhrResponse response =
          await Xhr.postJson(url, param, throwOnError: false);
      if (response.error != null) {
        return TitleRoleBean(msg: response.error.toString(), success: false);
      }
      try {
        return TitleRoleBean.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return TitleRoleBean(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return TitleRoleBean(msg: e.toString(), success: false);
    }
  }

  /// 获取预约婚礼数据
  static Future<WeddingPrepareResponse> getWeddingPrepareData() async {
    String url = '${System.domain}games/marryprepare/index?version=1';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return WeddingPrepareResponse(
            msg: response.error.toString(), success: false);
      }
      try {
        WeddingPrepareResponse prepareResponse =
            WeddingPrepareResponse.fromJson(response.value()['data']);
        prepareResponse.success = true;
        return prepareResponse;
      } catch (e) {
        return WeddingPrepareResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return WeddingPrepareResponse(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> confirmPropose(
      {int? fromUid, bool? op, int? giftId, int? rid}) async {
    String url = '${System.domain}room/wedding/confirmPropose';
    try {
      Util.parseInt(op);
      Map<String, String> param = {
        'from_uid': '$fromUid',
        'gift_id': '$giftId',
        'rid': '$rid',
        'op': op == false ? '0' : '1'
      };
      XhrResponse response =
          await Xhr.postJson(url, param, throwOnError: false);
      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      return BaseResponse(success: true);
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<AudioWordsInfoModel>> getAudioWords() async {
    String url = '${System.domain}reception/getAudioWords';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<AudioWordsInfoModel>.fromXhrResponse(
          response,
          (object) =>
              AudioWordsInfoModel.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<AudioWordsInfoModel>(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<MarkDownInfo>> getBehaviorRules(int type) async {
    String url = '${System.domain}reception/getBehaviorRules';
    try {
      XhrResponse response = await Xhr.postJson(url, {'type': '$type'});
      return DataRsp<MarkDownInfo>.fromXhrResponse(response,
          (object) => MarkDownInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MarkDownInfo>(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<QuestionListInfo>> getExamQuestions() async {
    String url = '${System.domain}reception/getExamQuestions';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<QuestionListInfo>.fromXhrResponse(
          response,
          (object) =>
              QuestionListInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<QuestionListInfo>(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> chooseAnswer(
      int examId, int questionId, String answer) async {
    String url = '${System.domain}reception/chooseAnswer';
    try {
      XhrResponse response = await Xhr.postJson(url, {
        'exam_id': '$examId',
        'question_index': '$questionId',
        'answer': answer
      });
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<ExamResultInfo>> submitExam(
      int examId, int time, int verifyId) async {
    String url = '${System.domain}reception/submitExam';
    try {
      XhrResponse response = await Xhr.postJson(url, {
        'exam_id': '$examId',
        'answer_time': '$time',
        'verify_id': '$verifyId'
      });
      return DataRsp<ExamResultInfo>.fromXhrResponse(response,
          (object) => ExamResultInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ExamResultInfo>(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<QuestionListInfo>> getWrongQuestions(int examId) async {
    String url = '${System.domain}reception/getWrongQuestions';
    try {
      XhrResponse response =
          await Xhr.getJson(url, params: {'exam_id': '$examId'});
      return DataRsp<QuestionListInfo>.fromXhrResponse(
          response,
          (object) =>
              QuestionListInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<QuestionListInfo>(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> receptionSaveAudio(
      int verifyId, int order, String audio) async {
    String url = '${System.domain}reception/saveAudio';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'verify_id': '$verifyId', 'order': '$order', 'audio': audio});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<DataRsp<FeedGameGuideBean>> getFeedGuide() async {
    String url = '${System.domain}games/guide/feedGuide';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
      );
      return DataRsp<FeedGameGuideBean>.fromXhrResponse(
          response,
          (object) =>
              FeedGameGuideBean.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<FeedGameGuideBean>(msg: '$e', success: false);
    }
  }

  /// 获取运营活动勋章列表
  static Future<HomeProfileBadgesResp> getActivityBadge(int uid) async {
    if (uid <= 0)
      return HomeProfileBadgesResp(
          msg: R.array('xhr_error_type_array')[6], success: false);

    String url = '${System.domain}go/yy/profile/badges';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'ver': '5'}, pb: true);
      return HomeProfileBadgesResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HomeProfileBadgesResp(msg: e.toString(), success: false);
    }
  }

  /// 穿戴运营活动勋章
  static Future<HomeProfileWearBadgeResp> wearActivityBadge(int badgeId) async {
    String url = '${System.domain}go/yy/profile/wearbadge';
    try {
      XhrResponse response =
          await Xhr.post(url, {'badge_id': badgeId.toString()}, pb: true);
      return HomeProfileWearBadgeResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HomeProfileWearBadgeResp(msg: e.toString(), success: false);
    }
  }

  /// [scene] 1:标识房间面板请求的,
  /// [isSuper] bool: 是否为房间的超管
  static Future<List<dynamic>> getHomeProfileMixData(int uid, int rid,
      {int scene = 0, bool isSuper = false, bool? onMic}) async {
    List<dynamic> respList = await Future.wait([
      BuffApi.getHomeProfileData(uid, rid,
          scene: scene, isSuper: isSuper, onMic: onMic),
      MomentApi.Api.getCirclePics(uid, 0),
    ]);
    return respList;
  }

  /// 获取自己的个人资料信息(进行编辑的信息)
  static Future<DataRsp<MyPersonalData>> getMyPersonalData() async {
    String url = 'go/yy/account/info?version=3';
    try {
      XhrResponse response = await Xhr.getJson('${System.domain}$url',
          throwOnError: false, formatJson: true);
      return DataRsp<MyPersonalData>.fromXhrResponse(response,
          (json) => MyPersonalData.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 编辑个人单选资料
  static Future<NormalNull> editSingleInfo(Map<String, String> info) async {
    String url = 'go/hisong/account/editFriendCard';
    try {
      Log.d("postData: $info");
      XhrResponse response = await Xhr.post('${System.domain}$url', info,
          throwOnError: false, pb: true);
      Log.d("res: ${response.value()}");
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
