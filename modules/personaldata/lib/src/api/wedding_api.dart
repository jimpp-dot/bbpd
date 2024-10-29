import 'package:shared/shared.dart';
import 'package:personaldata/src/model/wedding_bean.dart';

import '../../k.dart';

/// 婚礼相关api
class WeddingApi {
  static Future<WeddingInvitationResp> getEditWeddingInvitation() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}games/wedding/cardIndexPage",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingInvitationResp(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingInvitationResp(msg: res['msg'], success: false);
      }
      try {
        WeddingInvitationResp responseData =
            WeddingInvitationResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("getEditWeddingInvitation error and e msg = ${e.toString()}");

        return WeddingInvitationResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingInvitationResp(msg: e.toString(), success: false);
    }
  }

  static Future<WeddingInvitationResp> getWeddingInvitationDetail(
      int weddingId) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}games/wedding/cardDetail?wid=$weddingId",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingInvitationResp(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingInvitationResp(msg: res['msg'], success: false);
      }
      try {
        WeddingInvitationResp responseData =
            WeddingInvitationResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("getEditWeddingInvitation error and e msg = ${e.toString()}");

        return WeddingInvitationResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingInvitationResp(msg: e.toString(), success: false);
    }
  }

  static Future<InviteFriendsResp> getFriendsList(
      int weddingId, int page, int pageSize, String name) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}games/wedding/cardInvitees?wid=$weddingId&page=$page&name=${Uri.encodeComponent(name)}&pageSize=$pageSize",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return InviteFriendsResp(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return InviteFriendsResp(msg: res['msg'], success: false);
      }
      try {
        InviteFriendsResp responseData = InviteFriendsResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("getFriendsList error and e msg = ${e.toString()}");

        return InviteFriendsResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return InviteFriendsResp(msg: e.toString(), success: false);
    }
  }

  /// 修改请柬描述文本
  static Future<bool> updateCardContent(int weddingId, String content) async {
    try {
      String url = '${System.domain}games/wedding/cardEdit';
      Map<String, String> params = {
        'wid': '$weddingId',
        'card_content': content
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.marry_bg_modify_success);
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

  /// 修改是否仅持贴人可参加0：否，1：是
  static Future<bool> updateAuthority(int wid, int only) async {
    try {
      String url = '${System.domain}games/wedding/joinAuthority';
      Map<String, String> params = {
        'wid': '$wid',
        'only_inviter': '$only',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.marry_bg_modify_success);
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

  /// 发送请柬
  static Future<SendCardResp> sendCard(
      int wid, List<int>? host, List<int>? accompany, List<int>? guest) async {
    try {
      String url = '${System.domain}games/wedding/cardSend';
      Map<String, String> params = {
        'wid': '$wid',
        'host': Util.isCollectionEmpty(host) ? '' : host!.join(','),
        'accompany':
            Util.isCollectionEmpty(accompany) ? '' : accompany!.join(','),
        'guest': Util.isCollectionEmpty(guest) ? '' : guest!.join(',')
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return SendCardResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return SendCardResp(msg: res['msg'], success: false);
      }
      try {
        SendCardResp responseData = SendCardResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("sendCard error and e msg = ${e.toString()}");

        return SendCardResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SendCardResp(msg: e.toString(), success: false);
    }
  }

  static Future<WeddingAlbumResp> getWeddingAlbum(int wid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}games/wedding/album?wid=$wid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingAlbumResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingAlbumResp(msg: res['msg'], success: false);
      }
      try {
        WeddingAlbumResp responseData = WeddingAlbumResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("getWeddingAlbum error and e msg = ${e.toString()}");
        return WeddingAlbumResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingAlbumResp(msg: e.toString(), success: false);
    }
  }

  static Future<WeddingAlbumResp> addWeddingImg(int wid, String imgUrl) async {
    try {
      String url = '${System.domain}games/wedding/addEssenceImage';
      Map<String, String> params = {
        'wid': '$wid',
        'image': imgUrl,
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingAlbumResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingAlbumResp(msg: res['msg'], success: false);
      }
      try {
        WeddingAlbumResp responseData = WeddingAlbumResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("addWeddingImg error and e msg = ${e.toString()}");
        return WeddingAlbumResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingAlbumResp(msg: e.toString(), success: false);
    }
  }

  static Future<WeddingAlbumResp> deleteWeddingImg(int wid, int imgId) async {
    try {
      String url = '${System.domain}games/wedding/delEssenceImage';
      Map<String, String> params = {
        'wid': '$wid',
        'id': '$imgId',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingAlbumResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingAlbumResp(msg: res['msg'], success: false);
      }
      try {
        WeddingAlbumResp responseData = WeddingAlbumResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("deleteWeddingImg error and e msg = ${e.toString()}");
        return WeddingAlbumResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingAlbumResp(msg: e.toString(), success: false);
    }
  }

  static Future<WeddingAlbumResp> replaceWeddingImg(
      int wid, int imgId, String imgUrl) async {
    try {
      String url = '${System.domain}games/wedding/replaceEssenceImage';
      Map<String, String> params = {
        'wid': '$wid',
        'id': '$imgId',
        'image': imgUrl
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WeddingAlbumResp(msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return WeddingAlbumResp(msg: res['msg'], success: false);
      }
      try {
        WeddingAlbumResp responseData = WeddingAlbumResp.fromJson(res);
        return responseData;
      } catch (e) {
        Log.d("replaceWeddingImg error and e msg = ${e.toString()}");
        return WeddingAlbumResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WeddingAlbumResp(msg: e.toString(), success: false);
    }
  }
}
