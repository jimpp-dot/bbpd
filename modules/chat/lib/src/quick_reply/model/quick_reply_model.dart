import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quick_reply_model.g.dart';

/// 快速回复Model
@JsonSerializable()
class QuickReplyGroup {
  @JsonKey(name: 'group_id', fromJson: Util.parseInt)
  final int id;
  @JsonKey(name: 'group_name', fromJson: Util.parseStr, defaultValue: '')
  String name;
  @JsonKey(name: 'num', fromJson: Util.parseInt)
  final int replyCount;
  @JsonKey(name: 'rows')
  final List<QuickReply> replies;

  QuickReplyGroup(
      {required this.id,
      required this.name,
      required this.replyCount,
      required this.replies});

  factory QuickReplyGroup.fromJson(Map<String, dynamic> json) =>
      _$QuickReplyGroupFromJson(json);
}

/// 快速回复分组Model
@JsonSerializable()
class QuickReply {
  @JsonKey(name: 'content_id', fromJson: Util.parseInt)
  final int contentId;
  @JsonKey(name: 'group_id', fromJson: Util.parseInt)
  final int groupId;
  @JsonKey(name: 'content', fromJson: Util.parseStr, defaultValue: '')
  final String? content;
  @JsonKey(name: 'title', fromJson: Util.parseStr, defaultValue: '')
  final String? title;
  @JsonKey(name: 'img', fromJson: Util.parseStr, defaultValue: '')
  final String? img;
  @JsonKey(name: 'img_w', fromJson: Util.parseInt)
  final int imgWidth;
  @JsonKey(name: 'img_h', fromJson: Util.parseInt)
  final int imgHeight;

  @JsonKey(name: 'content_type', fromJson: Util.parseInt)
  final int contentType; // 0 文字 1 语音

  final String? audio;
  final int duration;
  @JsonKey(name: 'verify_status', fromJson: Util.parseInt)
  final int verifyStatus;

  QuickReply(
      this.contentId,
      this.groupId,
      this.content,
      this.contentType,
      this.audio,
      this.duration,
      this.title,
      this.img,
      this.verifyStatus,
      this.imgWidth,
      this.imgHeight);

  factory QuickReply.fromJson(Map<String, dynamic> json) =>
      _$QuickReplyFromJson(json);
}

@JsonSerializable()
class QuickGroups {
  @JsonKey(name: 'list')
  final List<QuickReplyGroup> groups;

  QuickGroups(this.groups);

  factory QuickGroups.fromJson(Map<String, dynamic> json) =>
      _$QuickGroupsFromJson(json);
}

@JsonSerializable()
class GroupReplies {
  @JsonKey(name: 'list')
  final List<QuickReply> replies;

  GroupReplies(this.replies);

  factory GroupReplies.fromJson(Map<String, dynamic> json) =>
      _$GroupRepliesFromJson(json);
}
