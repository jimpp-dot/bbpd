import 'package:shared/shared.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';

/// 婚礼房相关api
class RoomWeddingRepo {
  /// 获取婚礼房数据
  static Future<WeddingData?> getWeddingData(int rid) async {
    try {
      XhrResponse xhrResponse =
          await Xhr.getJson('${System.domain}roomwedding/data?rid=$rid');
      return WeddingData.fromJson(xhrResponse.value()['data']);
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 进行下一步
  static Future<BaseResponse?> weddingNext(
      {int? uid, required int rid, required int op}) async {
    String url = '${System.domain}roomwedding/next';
    try {
      Map<String, String> params = {'rid': rid.toString(), 'op': op.toString()};
      if (uid != null) params['uid'] = uid.toString();
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      BaseResponse baseResponse =
          BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 婚礼发起人二次确认
  static Future<BaseResponse?> weddingConfirmNext(
      {int? uid,
      required int rid,
      required int confirm,
      required int stage}) async {
    String url = '${System.domain}roomwedding/confirmNext';
    try {
      Map<String, String> params = {
        'rid': rid.toString(),
        'stage': stage.toString(),
        'confirm': confirm.toString()
      };
      if (uid != null) params['uid'] = uid.toString();
      XhrResponse response = await Xhr.postJson(url, params);
      BaseResponse baseResponse =
          BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 进行下一步
  static Future<BaseResponse?> weddingClose({required int rid}) async {
    String url = '${System.domain}roomwedding/close';
    try {
      Map<String, String> params = {'rid': rid.toString()};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      BaseResponse baseResponse =
          BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      return baseResponse;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 获取连击id
  static Future<DataRsp<String>> weddingComboPre({required int rid}) async {
    String url = '${System.domain}roomwedding/comboPre';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'rid': '$rid'}, throwOnError: false);
      return DataRsp<String>.fromXhrResponse(response, (object) {
        Map<String, dynamic> data = object as Map<String, dynamic>;
        return Util.parseStr(data['combo_id']) ?? '';
      });
    } catch (e) {
      return DataRsp<String>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 道具连击点击
  static Future<DataRsp<int>> weddingCombo(
      {required int rid, required String comboId}) async {
    String url = '${System.domain}pay/weddingCombo';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'rid': '$rid', 'combo_id': comboId},
          throwOnError: false);
      return DataRsp<int>.fromXhrResponse(response, (object) {
        Map<String, dynamic> data = object as Map<String, dynamic>;
        return Util.parseInt(data['combo_time']);
      });
    } catch (e) {
      return DataRsp<int>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
