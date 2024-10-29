import 'package:shared/shared.dart';
import '../model/pbModel/generated/tacit.pb.dart';
import 'package:shared/k.dart' as BaseK;

class TacitRepo {
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
      int id, String to, int choose) async {
    String url = '${System.domain}go/yy/tacit/send';
    try {
      XhrResponse response = await Xhr.post(
          url, {'id': '$id', 'to': to, 'choose': '$choose'},
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

  /// 查询默契问答接收方的回答
  /// msgid: 问答ID
  static Future<ResQueryTacitQuestion> queryTacit(String msgid) async {
    String url = '${System.domain}go/yy/tacit/query';
    try {
      XhrResponse response =
          await Xhr.post(url, {'msgid': msgid}, pb: true, throwOnError: true);
      return ResQueryTacitQuestion.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResQueryTacitQuestion(msg: e.toString(), success: false);
    }
  }

  /// 回答默契问答
  /// msgid: 问答ID
  /// answer: 答案， 范围[1,4]
  static Future<ResAnswerTacitQuestion> answerTacit(
      String msgId, int answer) async {
    String url = '${System.domain}go/yy/tacit/answer';
    try {
      XhrResponse response = await Xhr.post(
          url, {'msgid': msgId, 'answer': '$answer'},
          pb: true, throwOnError: true);
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

  /// 发送心动问答
  /// id: 题目ID
  /// to: 发送给人的uid
  static Future<ResSendTacitQuestion> sendHeartFlip(int id, int to) async {
    String url = '${System.domain}go/yy/heartflip/send';
    try {
      XhrResponse response = await Xhr.post(url, {'id': '$id', 'to': '$to'},
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

  /// 回答心动问答
  /// msgid: 问答ID
  /// answer: 答案， 范围[1,4]
  static Future<ResSendHeartFlipAnswer> answerHeartFlip(
      String msgId, int answer) async {
    String url = '${System.domain}go/yy/heartflip/answer';
    try {
      XhrResponse response = await Xhr.post(
          url, {'msgid': msgId, 'answer': '$answer'},
          pb: true, throwOnError: true);
      return ResSendHeartFlipAnswer.fromBuffer(response.bodyBytes);
    } catch (e) {
      late String msg;
      if (e is XhrError) {
        msg = e.toString();
      } else {
        msg = BaseK.K.server_return_error_retry;
      }
      return ResSendHeartFlipAnswer(msg: msg, success: false);
    }
  }

  /// 查询心动问答接收方的回答
  /// msgid: 问答ID
  static Future<ResQueryTacitQuestion> queryHeartFlip(String msgid) async {
    String url = '${System.domain}go/yy/heartflip/query';
    try {
      XhrResponse response =
          await Xhr.post(url, {'msgid': msgid}, pb: true, throwOnError: true);
      return ResQueryTacitQuestion.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResQueryTacitQuestion(msg: e.toString(), success: false);
    }
  }
}
