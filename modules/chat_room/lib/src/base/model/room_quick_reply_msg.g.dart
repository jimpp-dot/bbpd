// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_quick_reply_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomQuickReplyMsg _$RoomQuickReplyMsgFromJson(Map<String, dynamic> json) {
  return RoomQuickReplyMsg(
      Util.parseBool(json['success']),
      Util.parseStr(json['msg']),
      Util.parseList(json['data'],
          (e) => RoomQuickReplyMsgData.fromJson(e as Map<String, dynamic>)));
}

Map<String, dynamic> _$RoomQuickReplyMsgToJson(RoomQuickReplyMsg instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

RoomQuickReplyMsgData _$RoomQuickReplyMsgDataFromJson(
    Map<String, dynamic> json) {
  return RoomQuickReplyMsgData(
    Util.parseInt(json['id']),
    Util.notNullStr(json['content']),
  );
}

Map<String, dynamic> _$RoomQuickReplyMsgDataToJson(
        RoomQuickReplyMsgData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
