import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_notify_model.g.dart';

@JsonSerializable()
class OnlineNotificationData {
  String? type;

  String? icon;

  int uid;

  int rid;

  String? userName;

  String? content;

  String? btnText;

  OnlineNotificationData(this.type, this.icon, this.uid, this.rid,
      this.userName, this.content, this.btnText);

  factory OnlineNotificationData.fromJson(Map<String, dynamic> json) =>
      _$OnlineNotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineNotificationDataToJson(this);

  NotificationType getType() {
    if (type == 'party_invite') {
      return NotificationType.PartyInvite;
    } else if (type == 'friend_apply') {
      return NotificationType.FriendApply;
    } else if (type == 'be_friend') {
      return NotificationType.BeFriend;
    } else if (type == 'im') {
      return NotificationType.IM;
    } else if (type == 'phone') {
      return NotificationType.PhoneCall;
    } else {
      return NotificationType.Unknown;
    }
  }
}

enum NotificationType {
  PartyInvite, // 邀请入房
  FriendApply, // 匹配申请
  BeFriend, // 匹配申请同意(成为朋友)
  IM, // (IM 消息)
  PhoneCall, // (语音电话)
  Unknown
}
