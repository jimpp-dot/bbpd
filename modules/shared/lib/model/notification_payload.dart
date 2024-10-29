import 'package:json_annotation/json_annotation.dart';

import 'package:shared/src/util.dart';

part 'notification_payload.g.dart';

@JsonSerializable(createToJson: false)
class NotificationPayload {
  String title;

  String subTile;

  String body;

  String imgurl;

  String action;

  String channelId;

  String pushTypeId;

  String contentId;

  String pushType;

  NotificationPayload(
      this.title,
      this.subTile,
      this.body,
      this.imgurl,
      this.action,
      this.channelId,
      this.pushTypeId,
      this.contentId,
      this.pushType);

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);
}
