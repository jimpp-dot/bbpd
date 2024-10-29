import 'package:shared/shared.dart';

class WolfTestRepository {
  ///获取测试题目，mode：1-6人场，3-12人局
  static Future<List<Question>> getQuestions(int mode) async {
    List<Question> result = [];

    try {
      String url = '${System.domain}roomwolfv2/getQuestion';
      Map<String, String> params = {'mode': '$mode'};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.response as Map;
      if (res['success'] == true) {
        List data = res['data'];
        for (var element in data) {
          result.add(Question.fromJson(element));
        }
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return result;
  }

  ///提交答案
  static Future<Map> postAnswer(int qid, int oid,
      {bool isEnd = false, int mode = 1}) async {
    Map result = {};
    try {
      String url = "${System.domain}roomwolf/submitquestion";
      if (mode == 3) {
        //12人局
        url = '${System.domain}roomwolfv2/submitQuestion';
      }
      Map<String, String> params = {
        'qid': '$qid',
        'answer_oid': '$oid',
        'is_end': isEnd ? '1' : '0'
      };
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.response as Map;
      if (res['success'] == true) {
        result = res['data'];
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return result;
  }

  ///上报答题选项，新手不答题，
  static Future<void> setNewPlayer() async {
    try {
      String url = "${System.domain}roomwolf/setnewplayer";
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map res = response.response as Map;
      if (res['success'] == true) {
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }
}

class Question {
  static const int MODE_EASY = 1;
  static const int MODE_ADVANCE = 2;

  final int qid;
  final String title;
  final List<QuestionOption> options;

  Question.fromJson(Map json)
      : qid = Util.parseInt(json['qid']),
        title = json['title'],
        options =
            Util.parseList(json['option'], (e) => QuestionOption.fromJson(e));
}

class QuestionOption {
  final int oid;
  final String key;
  final String value;

  QuestionOption.fromJson(Map json)
      : oid = Util.parseInt(json['oid']),
        key = Util.parseStr(json['option_key']) ?? '',
        value = Util.parseStr(json['option_value']) ?? '';
}
