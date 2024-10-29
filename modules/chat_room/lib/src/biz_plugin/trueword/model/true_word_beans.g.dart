// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'true_word_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrueWordSheetItem _$TrueWordSheetItemFromJson(Map<String, dynamic> json) {
  return TrueWordSheetItem(
    Util.notNullStr(json['type']),
    Util.notNullStr(json['desc']),
  );
}

Map<String, dynamic> _$TrueWordSheetItemToJson(TrueWordSheetItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };

TrueWordMsgData _$TrueWordMsgDataFromJson(Map<String, dynamic> json) {
  return TrueWordMsgData(
    Util.parseInt(json['source']),
    Util.parseInt(json['target']),
    TrueWordMsgData.parseMode(json['mode']),
    TrueWordMsgData.parseType(json['type']),
    Util.notNullStr(json['content']),
    json['question'] == null
        ? null
        : TrueWordQuestion.fromJson(json['question'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrueWordMsgDataToJson(TrueWordMsgData instance) =>
    <String, dynamic>{
      'source': instance.askUid,
      'target': instance.answerUid,
      'mode': _$TrueWordModeEnumMap[instance.mode],
      'type': _$TrueWordMsgTypeEnumMap[instance.type],
      'content': instance.content,
      'question': instance.question,
    };

const _$TrueWordModeEnumMap = {
  TrueWordMode.ask: 'ask',
  TrueWordMode.answer: 'answer',
};

const _$TrueWordMsgTypeEnumMap = {
  TrueWordMsgType.private: 'private',
  TrueWordMsgType.normal: 'normal',
  TrueWordMsgType.open: 'open',
  TrueWordMsgType.privateInvite: 'privateInvite',
};

TrueWordQuestion _$TrueWordQuestionFromJson(Map<String, dynamic> json) {
  return TrueWordQuestion(
    Util.notNullStr(json['content']),
    Util.parseList(json['answers'], (e) => Util.notNullStr(e)),
    TrueWordMsgData.parseType(json['type']),
  );
}

Map<String, dynamic> _$TrueWordQuestionToJson(TrueWordQuestion instance) =>
    <String, dynamic>{
      'content': instance.content,
      'answers': instance.answers,
      'type': _$TrueWordMsgTypeEnumMap[instance.type],
    };
