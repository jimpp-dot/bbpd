// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return NotificationPayload(
    Util.parseStr(json['title']) ?? '',
    Util.parseStr(json['subTile']) ?? '',
    Util.parseStr(json['body']) ?? '',
    Util.parseStr(json['imgurl']) ?? '',
    Util.parseStr(json['action']) ?? '',
    Util.parseStr(json['channelId']) ?? '',
    Util.parseStr(json['pushTypeId']) ?? '',
    Util.parseStr(json['contentId']) ?? '',
    Util.parseStr(json['pushType']) ?? '',
  );
}
