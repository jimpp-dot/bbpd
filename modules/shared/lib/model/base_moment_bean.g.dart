// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_moment_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentTopicResponse _$RecentTopicResponseFromJson(Map<String, dynamic> json) {
  return RecentTopicResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : UserBean.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecentTopicResponseToJson(
        RecentTopicResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

UnreadMessagesResponse _$UnreadMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return UnreadMessagesResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : UnreadMessage.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UnreadMessagesResponseToJson(
        UnreadMessagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

UnreadMessage _$UnreadMessageFromJson(Map<String, dynamic> json) {
  return UnreadMessage(
    Util.parseInt(json['num']),
  );
}

Map<String, dynamic> _$UnreadMessageToJson(UnreadMessage instance) =>
    <String, dynamic>{
      'num': instance.num,
    };
