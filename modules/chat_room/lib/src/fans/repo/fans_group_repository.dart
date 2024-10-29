import 'package:shared/shared.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/protobuf/generated/api_room_challenge.pb.dart';

class FansGroupRepo {
  /// 十星挑战数据
  static Future<ResChallengeData> getStarChallengeData(int rid) async {
    try {
      XhrResponse response = await Xhr.getPb(
          "${System.domain}go/yy/fans/challenge?rid=$rid",
          throwOnError: true);
      return ResChallengeData.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResChallengeData(msg: e.toString(), success: false);
    }
  }

  static Future<FansEntranceResp> getFansEntrance(int rid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/entrance?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FansEntranceResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return FansEntranceResp(msg: res['msg'], success: false);
      }
      try {
        FansEntranceResp responseData =
            FansEntranceResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFansGroupTaskInfo and e msg = ${e.toString()}");

        return FansEntranceResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FansEntranceResp(msg: e.toString(), success: false);
    }
  }

  static Future<JoinFansGroupResp> getJoinFansGroup(int rid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/popup?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return JoinFansGroupResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return JoinFansGroupResp(msg: res['msg'], success: false);
      }
      try {
        JoinFansGroupResp responseData =
            JoinFansGroupResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFansGroupTaskInfo and e msg = ${e.toString()}");

        return JoinFansGroupResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return JoinFansGroupResp(msg: e.toString(), success: false);
    }
  }

  ///粉丝团排名
  static Future<FansGroupRankRsp> getFansGroupRankData(
      int rid, int type, int page) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/rank?rid=$rid&type=$type&page=$page",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FansGroupRankRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return FansGroupRankRsp(msg: res['msg'], success: false);
      }
      try {
        FansGroupRankRsp responseData =
            FansGroupRankRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("FansGroupRankRsp and e msg = ${e.toString()}");

        return FansGroupRankRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FansGroupRankRsp(msg: e.toString(), success: false);
    }
  }

  ///粉丝任务列表 粉丝榜 粉丝团信息
  static Future<FansGroupRsp> getFansTaskRankData(int rid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/member?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FansGroupRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return FansGroupRsp(msg: res['msg'], success: false);
      }
      try {
        FansGroupRsp responseData =
            FansGroupRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("FansGroupRsp and e msg = ${e.toString()}");

        return FansGroupRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FansGroupRsp(msg: e.toString(), success: false);
    }
  }

  ///粉丝特权礼包
  static Future<FansPrivilegeRsp> getFansPrivilegeBagData(int rid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/privilegeGift?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FansPrivilegeRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return FansPrivilegeRsp(msg: res['msg'], success: false);
      }
      try {
        FansPrivilegeRsp responseData =
            FansPrivilegeRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return FansPrivilegeRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FansPrivilegeRsp(msg: e.toString(), success: false);
    }
  }

  static Future<FansLabelListResp> getFansLabels(int rid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}fans/labelList?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FansLabelListResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return FansLabelListResp(msg: res['msg'], success: false);
      }
      try {
        FansLabelListResp responseData =
            FansLabelListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFansGroupTaskInfo and e msg = ${e.toString()}");

        return FansLabelListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FansLabelListResp(msg: e.toString(), success: false);
    }
  }

  /// 粉丝签到
  static Future<BaseResponse> fansSign(int rid) async {
    try {
      Map<String, String> params = {'rid': rid.toString()};

      XhrResponse response = await Xhr.postJson(
          "${System.domain}fans/sign", params,
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
}
