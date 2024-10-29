import 'package:shared/shared.dart';

import 'birthday_type.dart';
import 'generated/gs_birthday.pb.dart';

class BirthdayRepository {
  static const _listUrl = 'go/yy/gs_birthday/list';
  static const _detailUrl = 'go/yy/gs_birthday/preferences';
  static const _wishDeliverUrl = 'go/yy/gs_birthday/wishDeliver';

  /// 获取生日列表信息
  static Future<ApiGsBirthdayListResponse> getGsBirthdayListData(
      {required String type,
      required int rid,
      required int uid,
      required int page}) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['type'] = type;
    queryParameters['page'] = page;
    if (type == BirthdayType.BirthdayParty) {
      queryParameters['which'] = rid;
    } else if (type == BirthdayType.BirthdayBlessWords ||
        type == BirthdayType.BirthdayBlessFriends) {
      queryParameters['which'] = uid;
    }
    try {
      XhrResponse response = await Xhr.get(
        _listUrl,
        queryParameters: queryParameters,
        pb: true,
        throwOnError: true,
      );
      return ApiGsBirthdayListResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiGsBirthdayListResponse(success: false, message: e.toString());
    }
  }

  /// 获取生日详情信息
  static Future<ApiGsBirthdayPreferencesResponse> getGsBirthdayDetailData(
      {required int uid, required int birthday}) async {
    try {
      XhrResponse response = await Xhr.get(
        _detailUrl,
        queryParameters: {'uid': uid, 'birthday': birthday},
        pb: true,
        throwOnError: true,
      );
      return ApiGsBirthdayPreferencesResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiGsBirthdayPreferencesResponse(
          success: false, message: e.toString());
    }
  }

  /// 确认赠送
  static Future<NormalNull> postGsBirthdayWishDeliver(
      {required int uid,
      required int giftId,
      required int cid,
      int num = 1,
      required String wish,
      int delay = 0}) async {
    try {
      XhrResponse response = await Xhr.post(
        _wishDeliverUrl,
        {
          'uid': uid.toString(),
          'giftId': giftId.toString(),
          'cid': cid.toString(),
          'num': num.toString(),
          'wish': wish,
          'delay': delay.toString(),
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
