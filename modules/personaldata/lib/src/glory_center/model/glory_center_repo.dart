import 'package:shared/shared.dart';

import 'pb/generated/slp_glory.pb.dart';

class GloryCenterRepo {
  /// GET  /go/yy/profile/glory
  /// 传参   uid   查看的uid
  ///       tab    1-获得，2-全部
  static Future<ResGloryCenterCate> getProfileGlory({required int uid}) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/profile/gloryCate?uid=$uid&version=1',
        pb: true,
        throwOnError: true,
      );
      return ResGloryCenterCate.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGloryCenterCate(success: false, msg: e.toString());
    }
  }

  static Future<ResGloryList> getProfileGloryList(
      {required int uid, required int tab, required int cateId}) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/profile/gloryList?uid=$uid&tab=$tab&cate_id=$cateId',
        pb: true,
        throwOnError: true,
      );
      return ResGloryList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGloryList(success: false, msg: e.toString());
    }
  }

  /// 取消穿戴
  /// POST  /go/yy/profile/takeoffbadge
  /// 传参    badge_id
  static Future<NormalNull> profileTakeOffBadge(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/profile/takeoffbadge',
        {'badge_id': badgeId.toString()},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 取消佩戴麦位标签
  static Future<NormalNull> takeOffMicBadge(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/profile/takeoffMicTag',
        {'badge_id': badgeId.toString()},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 佩戴麦位标签
  static Future<NormalNull> wearMicBadge(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/profile/wearMicTag',
        {'badge_id': badgeId.toString()},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
