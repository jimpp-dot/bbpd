import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/accompany.tacit.pb.dart';
import 'package:shared/k.dart' as BaseK;

/// @Author wangyang
/// @Description
/// @Date 2022/9/14
class AccompanyTacitRepo {
  /// 拉取默契问答题目
  /// lastId:上一次的题目，没有传0
  static Future<ResTacitQuestion> getTacitQuestion(int lastId) async {
    String url = '${System.domain}go/yy/tacit/question';
    try {
      XhrResponse response = await Xhr.post(url, {'lastid': '$lastId'},
          pb: true, throwOnError: true);
      return ResTacitQuestion.fromBuffer(response.bodyBytes);
    } catch (e) {
      late String msg;
      if (e is XhrError) {
        msg = e.toString();
      } else {
        msg = BaseK.K.server_return_error_retry;
      }
      return ResTacitQuestion(msg: msg, success: false);
    }
  }

  /// 发送默契问答
  /// id: 题目ID
  /// to: 发送给人的uid
  /// choose：选择的答案， 范围[1,4]
  static Future<ResSendTacitQuestion> sendTacit(
      int id, int to, int choose, int rid) async {
    String url = '${System.domain}go/yy/tacit/send';
    try {
      XhrResponse response = await Xhr.post(
          url, {'id': '$id', 'to': '$to', 'choose': '$choose', 'rid': '$rid'},
          pb: true, throwOnError: true);
      return ResSendTacitQuestion.fromBuffer(response.bodyBytes);
    } catch (e) {
      late String msg;
      if (e is XhrError) {
        msg = e.toString();
      } else {
        msg = BaseK.K.server_return_error_retry;
      }
      return ResSendTacitQuestion(msg: msg, success: false);
    }
  }

  /// 回答默契问答
  /// msgid: 问答ID
  /// answer: 答案， 范围[1,4]
  static Future<ResAnswerTacitQuestion> answerTacit(
      int msgId, int answer, int origin, int rid) async {
    String url = '${System.domain}go/yy/tacit/answer';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'msgId': '$msgId',
            'answer': '$answer',
            'origin': '$origin',
            'rid': '$rid',
          },
          pb: true,
          throwOnError: true);
      return ResAnswerTacitQuestion.fromBuffer(response.bodyBytes);
    } catch (e) {
      late String msg;
      if (e is XhrError) {
        msg = e.toString();
      } else {
        msg = BaseK.K.server_return_error_retry;
      }
      return ResAnswerTacitQuestion(msg: msg, success: false);
    }
  }
}
