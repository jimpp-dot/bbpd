import 'package:shared/shared.dart';
import 'package:vip/src/level/model/card_bean.dart';
import 'package:vip/src/level/model/pb/generated/viability.pb.dart';
import 'package:vip/src/level/model/welfare_pond_bean.dart';

import 'model/level_bean.dart';

const double topTotalHeight = 326;
const double backgroundHeight = 280;

enum WelfareType {
  Vip,
  Popularity,
}

class LevelApi {
  /// 我的人气
  static Future<PopularityResponse> getMyPopularity() async {
    String url = '${System.domain}mine/popularity?v=1';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return PopularityResponse(
            msg: response.error.toString(), success: false);
      }
      try {
        return PopularityResponse.fromJson(
            response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return PopularityResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return PopularityResponse(msg: e.toString(), success: false);
    }
  }

  /// 我的vip
  static Future<VipLevelResponse> getMyLevel() async {
    String url = '${System.domain}mine/vip';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return VipLevelResponse(msg: response.error.toString(), success: false);
      }
      try {
        return VipLevelResponse.fromJson(
            response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return VipLevelResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return VipLevelResponse(msg: e.toString(), success: false);
    }
  }

  /// 领取人气奖励
  static Future<BaseResponse> grantPopularityAward(int level) async {
    String url = '${System.domain}mine/grantPopularityAward';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'level': '$level',
        },
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      try {
        return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 我的爵位
  static Future<MyTitleResponse> getMyTitle() async {
    String url = '${System.domain}mine/title';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return MyTitleResponse(msg: response.error.toString(), success: false);
      }
      try {
        return MyTitleResponse.fromJson(
            response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return MyTitleResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return MyTitleResponse(msg: e.toString(), success: false);
    }
  }

  static Future<CardDataResp> getCardData(String type) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}benefit/cardShow?card_type=$type",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return CardDataResp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return CardDataResp(msg: res['msg'], success: false);
      }
      try {
        CardDataResp responseData =
            CardDataResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getCardData and e msg = ${e.toString()}");

        return CardDataResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return CardDataResp(msg: e.toString(), success: false);
    }
  }

  static Future<WelfarePondBean> getCardPool(int cardId) async {
    try {
      String url = '${System.domain}benefit/cardPools?card_id=$cardId';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WelfarePondBean(
            msg: response.error.toString(), success: false, data: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return WelfarePondBean(msg: res['msg'], success: false, data: []);
      }
      try {
        WelfarePondBean responseData =
            WelfarePondBean.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getCardPool and e msg = ${e.toString()}");
        return WelfarePondBean(
            msg: R.array('xhr_error_type_array')[6], success: false, data: []);
      }
    } catch (e) {
      return WelfarePondBean(msg: e.toString(), success: false, data: []);
    }
  }

  static Future<LotteryBoxResp> getLotteryBox(
      int cardId, String cardType, int num) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}benefit/lotteryMore",
          {
            'card_id': cardId.toString(),
            'card_type': cardType,
            'num': num.toString()
          },
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return LotteryBoxResp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return LotteryBoxResp(msg: res['msg'], success: false);
      }
      try {
        LotteryBoxResp responseData =
            LotteryBoxResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getLotteryBox and e msg = ${e.toString()}");

        return LotteryBoxResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return LotteryBoxResp(msg: e.toString(), success: false);
    }
  }

  /// 放弃补领
  static Future<bool> giveupRegot(int cardId, String cardType) async {
    try {
      String url = '${System.domain}benefit/giveupRegot';
      Map<String, String> params = {
        "card_id": cardId.toString(),
        "card_type": cardType
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<ResViabilityInfo> getActivityLevelMissionData() async {
    try {
      String url = '${System.domain}go/yy/viability/viabilityInfo';
      XhrResponse response =
          await Xhr.post(url, null, pb: true, throwOnError: true);
      return ResViabilityInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResViabilityInfo(msg: e.toString(), success: false);
    }
  }

  static Future<ResViabilityBenefit> getActivityRewardData() async {
    try {
      String url = '${System.domain}go/yy/viability/viabilityBenefit';
      XhrResponse response =
          await Xhr.post(url, null, pb: true, throwOnError: true);
      return ResViabilityBenefit.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResViabilityBenefit(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> getActivityReward(int level) async {
    try {
      String url = '${System.domain}go/yy/viability/drawBenefit';
      XhrResponse response = await Xhr.post(url, {'level': level.toString()},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
