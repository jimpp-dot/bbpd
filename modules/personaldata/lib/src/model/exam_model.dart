import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'exam_model.g.dart';

@JsonSerializable(createToJson: false)
class QuestionOptionInfo {
  String type;
  String content;
  @JsonKey(name: 'is_correct')
  int isCorrect;
  bool selected = false;

  QuestionOptionInfo(this.type, this.content, this.isCorrect);
  factory QuestionOptionInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuestionAnswerInfo {
  @JsonKey(name: 'A')
  QuestionOptionInfo? a;
  @JsonKey(name: 'B')
  QuestionOptionInfo? b;
  @JsonKey(name: 'C')
  QuestionOptionInfo? c;
  @JsonKey(name: 'D')
  QuestionOptionInfo? d;

  QuestionOptionInfo? getOptionInfoWithIndex(int index) {
    if (index == 0) {
      return a;
    }
    if (index == 1) {
      return b;
    }
    if (index == 2) {
      return c;
    }
    if (index == 3) {
      return d;
    }
    return null;
  }

  QuestionOptionInfo? getOptionInfoWithStr(String str) {
    if (str == 'A') {
      return a;
    }
    if (str == 'B') {
      return b;
    }
    if (str == 'C') {
      return c;
    }
    if (str == 'D') {
      return d;
    }
    return null;
  }

  String getStringWithIndex(int index) {
    if (index == 0) {
      return 'A';
    }
    if (index == 1) {
      return 'B';
    }
    if (index == 2) {
      return 'C';
    }
    if (index == 3) {
      return 'D';
    }
    return '';
  }

  String getAnswerStr() {
    String str = '';
    if (a != null && a?.selected == true) {
      str = '${str}A';
    }
    if (b != null && b?.selected == true) {
      str = '${str}B';
    }
    if (c != null && c?.selected == true) {
      str = '${str}C';
    }
    if (d != null && d?.selected == true) {
      str = '${str}D';
    }
    return str;
  }

  QuestionAnswerInfo(this.a, this.b, this.c, this.d);
  factory QuestionAnswerInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuestionInfo {
  String question;
  int type; //题目类型，1-单选，2-多选
  int index; //题目序号
  @JsonKey(name: 'my_answer')
  List myAnswer;

  @JsonKey(name: 'options')
  QuestionAnswerInfo? options;

  QuestionInfo(
      this.question, this.type, this.index, this.myAnswer, this.options);
  factory QuestionInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestionInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuestionListInfo {
  List<QuestionInfo> list;
  int? total;
  @JsonKey(name: 'exam_id')
  int? examId;
  int? duration;
  @JsonKey(name: 'right_num')
  int rightNum;
  @JsonKey(name: 'wrong_num')
  int wrongNum;

  QuestionListInfo(this.list, this.rightNum, this.wrongNum);
  factory QuestionListInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestionListInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ExamResultInfo {
  @JsonKey(name: 'total_score')
  int totalScore;
  int pass; //是否通过，0-失败，1-通过

  ExamResultInfo(this.totalScore, this.pass);
  factory ExamResultInfo.fromJson(Map<String, dynamic> json) =>
      _$ExamResultInfoFromJson(json);
}
