import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:message/src/model/nearby_match_request_list_data.dart';
import 'package:message/src/model/team_message_bean.dart';

class Api {
  /// 获取匹配请求列表
  static Future<NearbyMatchRequestListDataResp> getNearbyMatchRequestList(
      String? extendParam) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}party/match/list?version=1${extendParam ?? ''}",
          throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return NearbyMatchRequestListDataResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return NearbyMatchRequestListDataResp(msg: res['msg'], success: false);
      }

      try {
        NearbyMatchRequestListDataResp responseData =
            NearbyMatchRequestListDataResp.fromJson(
                res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return NearbyMatchRequestListDataResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NearbyMatchRequestListDataResp(msg: e.toString(), success: false);
    }
  }

  /// 获取打招呼的用户 剩余匹配人数
  static Future<SayhiMatchRsp> getMatchedUsers(int? page) async {
    try {
      String url = '${System.domain}party/match/match';

      double longitude = Util.parseDouble(Config.get('location.longitude'));
      double latitude = Util.parseDouble(Config.get('location.latitude'));
      // double longitude = 114.408896;
      // double latitude = 30.489262;

      XhrResponse response = await Xhr.postJson(
          url,
          {
            'longitude': longitude.toString(),
            'latitude': latitude.toString(),
            'browseUids': json.encode(await Session.sayhiMatchBrowseUids),
            'page': page != null ? page.toString() : '1',
            'cityCode': Config.get('location.cityCode') ?? '',
          },
          throwOnError: true);

      if (response.error != null) {
        Log.d(response.error.toString());
        return SayhiMatchRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SayhiMatchRsp(msg: res['msg'], success: false);
      }

      try {
        SayhiMatchRsp responseData =
            SayhiMatchRsp.fromJson(res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return SayhiMatchRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SayhiMatchRsp(msg: e.toString(), success: false);
    }
  }

  /// 获取剩余匹配人数
  static Future<SayhiMatchRemainNumRsp> getMatchRemainNum() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}party/match/remaineNum",
          throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return SayhiMatchRemainNumRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SayhiMatchRemainNumRsp(msg: res['msg'], success: false);
      }

      try {
        SayhiMatchRemainNumRsp responseData =
            SayhiMatchRemainNumRsp.fromJson(res as Map<String, dynamic>);

        if (res['data'] != null && res['data']['remaining_num'] != null) {
          responseData.remainNum = Util.parseInt(res['data']['remaining_num']);
        }

        return responseData;
      } catch (e) {
        return SayhiMatchRemainNumRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SayhiMatchRemainNumRsp(msg: e.toString(), success: false);
    }
  }

  ///清除异常用户
  static Future<NormalString> clearUnusualUsers() async {
    String url = "${System.domain}go/yy/friend/clean";
    try {
      XhrResponse response =
          await Xhr.post(url, {'format': 'pb'}, pb: true, throwOnError: false);
      return NormalString.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalString(msg: e.toString(), success: false);
    }
  }

  /// 清除所有匹配请求
  static Future<BaseResponse> clearAllMathRequest() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}party/match/clearMatch",
          throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }

      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 接受匹配
  static Future<BaseResponse> acceptMatchRequest(int uid) async {
    try {
      String url = '${System.domain}party/match/accept';
      XhrResponse response =
          await Xhr.postJson(url, {'uid': uid.toString()}, throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }

      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 发起匹配
  static Future<BaseResponse> matchBatchSend(
      {required String viewuids, required String touids}) async {
    try {
      String url = '${System.domain}party/match/batchsend';
      XhrResponse response = await Xhr.postJson(
          url, {'viewuids': viewuids, 'touids': touids},
          throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }

      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 刷新匹配红点
  // static Future<BaseResponse> getMatchNum() async {
  //   try {
  //     XhrResponse response = await Xhr.getJson(
  //         "${System.domain}party/match/matchNum", throwOnError: false);
  //
  //     if (response.error != null) {
  //       Log.d(response.error.toString());
  //       return SayhiMatchNumModelResq(
  //           msg: response.error.toString(), success: false);
  //     }
  //
  //     Map res = response.response;
  //     if (!(res['success'] ?? false)) {
  //       return SayhiMatchNumModelResq(msg: res['msg'], success: false);
  //     }
  //
  //     try {
  //       SayhiMatchNumModelResq responseData = SayhiMatchNumModelResq.fromJson(res);
  //
  //       NewMatchRequestModel model = NewMatchRequestModel(responseData.model.num, Utility.getDateDiff(
  //           responseData.model.dateLine));
  //       eventCenter.emit('msg.sayhi.match.new.request', model);
  //
  //       return responseData;
  //     } catch (e) {
  //       return SayhiMatchNumModelResq(
  //           msg: R.array('xhr_error_type_array')[6], success: false);
  //     }
  //
  //   } catch (e) {
  //     return SayhiMatchNumModelResq(msg: e.toString(), success: false);
  //   }
  // }

  /// 获取附近的人
  static Future<SayHiNearbyPeopleRsq> getPeopleNearyby() async {
    try {
      String url = "${System.domain}home/nearby?page=1&version=15";

      int sex;
      if (Session.sex == 1) {
        // 男性用户默认看女性用户
        sex = 2;
      } else {
        sex = 0;
      }

      double longitude = Util.parseDouble(Config.get('location.longitude'));
      double latitude = Util.parseDouble(Config.get('location.latitude'));

      final Map<String, String> params = {
        'sex': sex.toString(),
        'cityCode': Config.get('location.cityCode') ?? '',
        'longitude': longitude.toString(),
        'latitude': latitude.toString(),
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);

      if (response.error != null) {
        Log.d(response.error.toString());
        return SayHiNearbyPeopleRsq(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SayHiNearbyPeopleRsq(msg: res['msg'], success: false);
      }

      try {
        if (res['data'] != null &&
            res['data'][0] != null &&
            res['data'][0]['data'] != null &&
            res['data'][0]['data'].isNotEmpty) {
          SayHiNearbyPeopleRsq responseData =
              SayHiNearbyPeopleRsq.fromJson(res['data'][0]);
          return responseData;
        }

        return SayHiNearbyPeopleRsq(
            msg: R.array('xhr_error_type_array')[6], success: false);
      } catch (e) {
        return SayHiNearbyPeopleRsq(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SayHiNearbyPeopleRsq(msg: e.toString(), success: false);
    }
  }

  /// 获取语音匹配次数
  static Future<DataRsp<MatchVoiceRemain>> getMatchVoiceRemain() async {
    String url = '${System.domain}mate/match/voiceRemain';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<MatchVoiceRemain>.fromXhrResponse(
          response,
          (object) =>
              MatchVoiceRemain.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MatchVoiceRemain>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 获取语音匹配房间id
  static Future<DataRsp<MatchVoiceRoom>> getMatchVoiceRoom() async {
    String url = '${System.domain}mate/match/voiceRoom';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<MatchVoiceRoom>.fromXhrResponse(response,
          (object) => MatchVoiceRoom.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MatchVoiceRoom>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
