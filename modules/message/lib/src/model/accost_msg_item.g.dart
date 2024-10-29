// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accost_msg_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccostMsgItem _$AccostMsgItemFromJson(Map<String, dynamic> json) {
  return AccostMsgItem(
    Util.parseStr(json['content']),
    Util.parseInt(json['msg_id']),
    Util.parseInt(json['state']),
    Util.parseInt(json['type']),
  );
}

Map<String, dynamic> _$AccostMsgItemToJson(AccostMsgItem instance) =>
    <String, dynamic>{
      'content': instance.content,
      'msg_id': instance.msgId,
      'state': instance.state,
      'type': instance.type,
    };
