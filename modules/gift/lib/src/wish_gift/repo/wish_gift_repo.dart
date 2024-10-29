import 'package:gift/k.dart';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:gift/src/wish_gift/model/wish_gift_beans.dart';

import '../model/pb/generated/slp_roomgiftwish.pb.dart';

class WishGiftRepo {
  static Future<WishGiftsResp> getWishGiftsData(int rid) async {
    try {
      String url = "${System.domain}roomgiftwish/detail?rid=$rid";
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        return WishGiftsResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic>? res = response.response as Map<String, dynamic>?;
      if (!(res?['success'] ?? false)) {
        return WishGiftsResp(msg: res?['msg'], success: false);
      }
      try {
        WishGiftsResp responseData = WishGiftsResp.fromJson(res ?? {});
        return responseData;
      } catch (e) {
        return WishGiftsResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WishGiftsResp(msg: e.toString(), success: false);
    }
  }

  static Future<bool> postWishGiftsData(
      int rid, List<WishGift> gifts, bool autoOpen,
      {String? rewardWords, int? duration, int? reserveRank}) async {
    List<Map> p = [];
    for (var element in gifts) {
      p.add({'gift_id': element.giftId, 'num': element.wishNum});
    }
    try {
      String url = '${System.domain}roomgiftwish/save';
      Map<String, String> params = {
        "rid": '$rid',
        'settings': Util.isCollectionEmpty(p) ? '' : jsonEncode(p),
        'auto_open': autoOpen ? '1' : '0'
      };
      if (Util.validStr(rewardWords)) {
        // 答谢文案
        params['reward_words'] = '$rewardWords';
      }
      if (Util.parseInt(duration) > 0) {
        // 周期时长，单位秒
        params['duration'] = '$duration';
      }
      if (reserveRank != null) {
        // 是否保留榜单，0-不保留，1-保留
        params['reserve_rank'] = '${Util.parseInt(reserveRank)}';
      }
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.gift_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static postWishGiftsAutoOpen(int rid, bool autoOpen) async {
    try {
      String url = '${System.domain}roomgiftwish/save';
      Map<String, String> params = {
        "rid": '$rid',
        'auto_open': autoOpen ? '1' : '0'
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.gift_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  /// todo 接口迁移
  static Future<DataRsp<List<Gift>>> getWishGiftListResp(int rid) async {
    try {
      String url =
          "${System.domain}room/giftConfigV2?v=4&type=room&supportCoinUse=0&act_version=2&rid=$rid&gift_wish=1";
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<Gift>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => Gift.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<Gift>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<ResBbGiftPanel> getBBWishGiftListResp(int rid) async {
    try {
      String url =
          "${System.domain}go/yy/gift/panel?version=7&type=room&support_coin_use=0&act_version=2&support_unity_rocket=1&gift_wish=1&rid=$rid";
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResBbGiftPanel.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResBbGiftPanel(msg: e.toString(), success: false);
    }
  }

  /// 获取心愿助力榜
  static Future<ResRoomGiftWishRank> assistRank(
      {required int rid, int page = 1}) async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/roomgiftwish/assistRank',
        queryParameters: {'rid': rid, 'page': page},
        pb: true,
        throwOnError: true,
      );
      return ResRoomGiftWishRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomGiftWishRank(success: false, msg: e.toString());
    }
  }
}
