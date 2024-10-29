// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_msg_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickMsgItem _$QuickMsgItemFromJson(Map<String, dynamic> json) {
  return QuickMsgItem(
    Util.parseStr(json['content']),
    Util.parseInt(json['id']),
    Util.parseInt(json['type']),
  );
}

Map<String, dynamic> _$QuickMsgItemToJson(QuickMsgItem instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'type': instance.type,
    };
