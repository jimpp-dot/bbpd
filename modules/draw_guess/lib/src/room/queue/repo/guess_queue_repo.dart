import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_beans.dart';

class GuessQueueRepo {
  static Future<dynamic> getConfig(int rid) {
    return Future.value(1);
  }

  /// 画猜接龙排行榜
  static Future<GuessQueueResultRankRsp> getQueueResultRank(int? rid) async {
    if (rid == null)
      return GuessQueueResultRankRsp(
          msg: R.array('xhr_error_type_array')[6], success: false);

    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}roomguessqueue/endDetails?rid=$rid",
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GuessQueueResultRankRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return GuessQueueResultRankRsp(msg: res['msg'], success: false);
      }
      try {
        GuessQueueResultRankRsp responseData =
            GuessQueueResultRankRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return GuessQueueResultRankRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GuessQueueResultRankRsp(msg: e.toString(), success: false);
    }
  }

  static Future<WordCategoryDataResp> getTextCategories(int rid) async {
    try {
      String url = "${System.domain}roomguessqueue/getTextCategories";

      XhrResponse response =
          await Xhr.postJson(url, {'rid': '$rid'}, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WordCategoryDataResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return WordCategoryDataResp(msg: res['msg'], success: false);
      }
      try {
        WordCategoryDataResp responseData =
            WordCategoryDataResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return WordCategoryDataResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WordCategoryDataResp(msg: e.toString(), success: false);
    }
  }

  /// 画猜接龙提交答案
  static Future<BaseResponse> submitGuessQueueAnswer(
      int? rid, String? word) async {
    if (rid == null || word == null)
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);

    try {
      String url = '${System.domain}roomguessqueue/guessSubmit';
      Map<String, String> params = {
        'rid': rid.toString(),
        'word': word,
      };
      XhrResponse response = await Xhr.postJson(url, params);

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

  /// 画猜接龙获取确认选择的词
  static Future<GuessQueueConfirmWordRsp> getQueueConfirmWords(
      int? rid, int? cateId, int position) async {
    if (rid == null || cateId == null) {
      return GuessQueueConfirmWordRsp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }

    try {
      String url = '${System.domain}roomguessqueue/getText';

      Map<String, String> params = {
        'rid': rid.toString(),
        'cate_id': cateId.toString(),
        'position': '$position'
      };

      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GuessQueueConfirmWordRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return GuessQueueConfirmWordRsp(msg: res['msg'], success: false);
      }
      try {
        GuessQueueConfirmWordRsp responseData =
            GuessQueueConfirmWordRsp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return GuessQueueConfirmWordRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GuessQueueConfirmWordRsp(msg: e.toString(), success: false);
    }
  }

  /// 画猜接龙选择词语
  static Future<BaseResponse> submitConfirmWord(
      int? rid, String? wordId) async {
    if (rid == null || wordId == null)
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);

    try {
      String url = '${System.domain}roomguessqueue/chooseWord';

      Map<String, String> params = {
        'rid': rid.toString(),
        'wid': wordId,
      };

      XhrResponse response = await Xhr.postJson(url, params);
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

  static Future<bool> startGame(int rid, int catId) async {
    try {
      String url = '${System.domain}roomguessqueue/start';
      Map<String, String> params = {"rid": '$rid', 'cate_id': '$catId'};
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

  static Future<DrawWordResp> getDrawWord(int? rid) async {
    if (rid == null) {
      return DrawWordResp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
    try {
      String url = '${System.domain}roomguessqueue/getWords';
      Map<String, String> params = {"rid": '$rid'};

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return DrawWordResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return DrawWordResp(msg: res['msg'], success: false);
      }
      try {
        DrawWordResp responseData =
            DrawWordResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return DrawWordResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return DrawWordResp(msg: e.toString(), success: false);
    }
  }

  static Future<GuessImgResp> getImages(int? rid) async {
    if (rid == null) {
      return GuessImgResp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
    try {
      String url = '${System.domain}roomguessqueue/getImages';
      Map<String, String> params = {"rid": '$rid'};

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GuessImgResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return GuessImgResp(msg: res['msg'], success: false);
      }
      try {
        GuessImgResp responseData =
            GuessImgResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return GuessImgResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GuessImgResp(msg: e.toString(), success: false);
    }
  }

  /// 画画提交
  static Future<BaseResponse> submitDrawImg(
      int rid, String img, String lineId, int finish) async {
    try {
      String url = '${System.domain}roomguessqueueimg/upload';
      Map<String, String> params = {
        'rid': '$rid',
        'line_id': lineId,
        'img': img,
        'finish': '$finish'
      };
      XhrResponse response = await Xhr.postJson(url, params);

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

  ///选择最喜欢的画
  static Future<BaseResponse> chooseFavorite(
      int rid, int toUid, int lineId) async {
    String url = '${System.domain}roomguessqueue/favorite';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'rid': '$rid', 'to_uid': '$toUid', 'line_id': '$lineId'});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  ///判断接龙是否成功
  static Future<BaseResponse> judgementResult(
      int rid, int success, int lineId) async {
    String url = '${System.domain}roomguessqueue/queueResSubmit';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'rid': '$rid', 'success': '$success', 'line_id': '$lineId'});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  /// 1号麦位，切换词库
  static Future<BaseResponse> switchWord(int rid, int catId) async {
    String url = '${System.domain}roomguessqueue/chooseCategory';
    Map<String, String> params = {"rid": '$rid', 'cate_id': '$catId'};
    try {
      XhrResponse response = await Xhr.postJson(url, params);
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  /// 1号麦结束游戏
  static Future<BaseResponse> endGame(int rid) async {
    String url = '${System.domain}roomguessqueue/end';
    try {
      XhrResponse response = await Xhr.postJson(url, {'rid': '$rid'});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }
}
