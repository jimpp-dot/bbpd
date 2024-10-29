import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';

class DigitBombGameRepository {
  /// 创建数字炸弹游戏
  static Future<DigitBombInfoResp> createDigitBombGame(int rid,
      {int? lastgid}) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}digitbomb/create",
          {'rid': rid.toString(), 'lastgid': '$lastgid'},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return DigitBombInfoResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;

      if (!(res['success'] ?? false)) {
        return DigitBombInfoResp(msg: res['msg'], success: false);
      }

      try {
        DigitBombInfoResp responseData =
            DigitBombInfoResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return DigitBombInfoResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return DigitBombInfoResp(msg: e.toString(), success: false);
    }
  }

  /// 设置炸弹和范围
  static Future<BaseResponse> setDigitBomb(
      {required int rid,
      required int id,
      required int min,
      required int max,
      required int bomb,
      required int bombMode}) async {
    var url = '${System.domain}digitbomb/setting';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
      'min': '$min',
      'max': '$max',
      'bomb': '$bomb',
      'bomb_mode': '$bombMode', // 1 表示随机炸弹，2表示指定炸弹
    });
    return BaseResponse.parse(response);
  }

  /// 房主点击下一步，跳过当前玩家麦位
  static Future<BaseResponse> digitBombNext(int rid, int id) async {
    var url = '${System.domain}digitbomb/next';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
    });
    return BaseResponse.parse(response);
  }

  /// 获取数字炸弹游戏公告
  static Future<String> getDigitBombHelp(int rid, int id) async {
    try {
      String url = '${System.domain}digitbomb/help?rid=$rid&id=$id';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true &&
          res['data'] != null &&
          res['data']['annotation'] != null) {
        return res['data']['annotation'];
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return '';
  }

  /// 玩家输入数字炸弹
  static Future<BaseResponse> digitBombInput(int rid, int id, int digit) async {
    var url = '${System.domain}digitbomb/input';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
      'digit': '$digit',
    });
    return BaseResponse.parse(response);
  }

  /// 自定义数字炸弹的公告
  static Future<BaseResponse> digitBombSetAnnotation(
      int rid, int id, String annotation) async {
    var url = '${System.domain}digitbomb/setannotation';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
      'annotation': annotation,
    });
    return BaseResponse.parse(response);
  }

  /// 房主结束数字炸弹游戏
  static Future<BaseResponse> digitBombClose(int rid, int id) async {
    var url = '${System.domain}digitbomb/close';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
    });
    Log.d('digitBombClose id=$id, rid=$rid');
    return BaseResponse.parse(response);
  }

  /// 房主开始数字炸弹游戏
  static Future<BaseResponse> digitBombStart(int rid, int id) async {
    var url = '${System.domain}digitbomb/start';
    var response = await Xhr.postJson(url, {
      'id': '$id',
      'rid': '$rid',
    });
    return BaseResponse.parse(response);
  }

  /// 获取数字炸弹游戏信息
  static Future<DigitBombInfoResp> loadDigitBombInfo(int rid) async {
    var url = '${System.domain}digitbomb/config';
    var response = await Xhr.postJson(url, {'rid': '$rid'});
    try {
      return DigitBombInfoResp.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      return DigitBombInfoResp(msg: e.toString(), success: false);
    }
  }
}
