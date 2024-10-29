// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionOptionInfo _$QuestionOptionInfoFromJson(Map<String, dynamic> json) {
  return QuestionOptionInfo(
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['content']) ?? '',
    Util.parseInt(json['is_correct']),
  )..selected = Util.parseBool(json['selected']);
}

QuestionAnswerInfo _$QuestionAnswerInfoFromJson(Map<String, dynamic> json) {
  return QuestionAnswerInfo(
    json['A'] == null
        ? null
        : QuestionOptionInfo.fromJson(json['A'] as Map<String, dynamic>),
    json['B'] == null
        ? null
        : QuestionOptionInfo.fromJson(json['B'] as Map<String, dynamic>),
    json['C'] == null
        ? null
        : QuestionOptionInfo.fromJson(json['C'] as Map<String, dynamic>),
    json['D'] == null
        ? null
        : QuestionOptionInfo.fromJson(json['D'] as Map<String, dynamic>),
  );
}

QuestionInfo _$QuestionInfoFromJson(Map<String, dynamic> json) {
  return QuestionInfo(
    Util.parseStr(json['question']) ?? '',
    Util.parseInt(json['type']),
    Util.parseInt(json['index']),
    json['my_answer'] as List,
    json['options'] == null
        ? null
        : QuestionAnswerInfo.fromJson(json['options'] as Map<String, dynamic>),
  );
}

QuestionListInfo _$QuestionListInfoFromJson(Map<String, dynamic> json) {
  return QuestionListInfo(
    Util.parseList(json['list'],
            (e) => QuestionInfo.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseInt(json['right_num']),
    Util.parseInt(json['wrong_num']),
  )
    ..total = Util.parseInt(json['total'])
    ..examId = Util.parseInt(json['exam_id'])
    ..duration = Util.parseInt(json['duration']);
}

ExamResultInfo _$ExamResultInfoFromJson(Map<String, dynamic> json) {
  return ExamResultInfo(
    Util.parseInt(json['total_score']),
    Util.parseInt(json['pass']),
  );
}
