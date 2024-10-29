import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_beans.dart';

class TrueWordRepo {
  ///获取真心话类型列表
  static Future<DataRsp<List<TrueWordSheetItem>>> getSheetItems(int rid) async {
    String url = '${System.domain}accompany/truthOption?rid=$rid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<List<TrueWordSheetItem>>.fromXhrResponse(
          response,
          (object) => Util.parseList(object,
              (e) => TrueWordSheetItem.fromJson(e as Map<String, dynamic>)));
    } catch (e) {
      return DataRsp<List<TrueWordSheetItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  ///选择真心话类型
  static Future<BaseResponse> selectSheet(
      int rid, int targetUid, String? type) async {
    String url = '${System.domain}accompany/ask';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'rid': '$rid', 'type': '$type', 'targetId': '$targetUid'},
          throwOnError: false);
      return DataRsp<List<TrueWordSheetItem>>.fromXhrResponse(
          response,
          (object) => Util.parseList(object,
              (e) => TrueWordSheetItem.fromJson(e as Map<String, dynamic>)));
    } catch (e) {
      return DataRsp<List<TrueWordSheetItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<BaseResponse> answer(
      int rid, TrueWordMsgData msg, String answer) async {
    String url = '${System.domain}accompany/answer';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'senderId': '${msg.askUid}',
            'type': TrueWordMsgData.typeToString(msg.question?.type),
            'content': answer,
            'rid': '$rid'
          },
          throwOnError: false);
      return DataRsp<List<TrueWordSheetItem>>.fromXhrResponse(
          response,
          (object) => Util.parseList(object,
              (e) => TrueWordSheetItem.fromJson(e as Map<String, dynamic>)));
    } catch (e) {
      return DataRsp<List<TrueWordSheetItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
