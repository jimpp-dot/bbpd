// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_notify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineNotificationData _$OnlineNotificationDataFromJson(
    Map<String, dynamic> json) {
  return OnlineNotificationData(
    Util.parseStr(json['type']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['rid']),
    Util.parseStr(json['userName']),
    Util.parseStr(json['content']),
    Util.parseStr(json['btnText']),
  );
}

Map<String, dynamic> _$OnlineNotificationDataToJson(
        OnlineNotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.icon,
      'uid': instance.uid,
      'rid': instance.rid,
      'userName': instance.userName,
      'content': instance.content,
      'btnText': instance.btnText,
    };
