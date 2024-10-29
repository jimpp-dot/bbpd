// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickReplyGroup _$QuickReplyGroupFromJson(Map<String, dynamic> json) {
  return QuickReplyGroup(
    id: Util.parseInt(json['group_id']),
    name: Util.parseStr(json['group_name']) ?? '',
    replyCount: Util.parseInt(json['num']),
    replies: Util.parseList(
        json['rows'], (e) => QuickReply.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$QuickReplyGroupToJson(QuickReplyGroup instance) =>
    <String, dynamic>{
      'group_id': instance.id,
      'group_name': instance.name,
      'num': instance.replyCount,
      'rows': instance.replies,
    };

QuickReply _$QuickReplyFromJson(Map<String, dynamic> json) {
  return QuickReply(
    Util.parseInt(json['content_id']),
    Util.parseInt(json['group_id']),
    Util.parseStr(json['content']) ?? '',
    Util.parseInt(json['content_type']),
    Util.parseStr(json['audio']),
    Util.parseInt(json['duration']),
    Util.parseStr(json['title']),
    Util.parseStr(json['img']),
    Util.parseInt(json['verify_status']),
    Util.parseInt(json['img_w']),
    Util.parseInt(json['img_h']),
  );
}

Map<String, dynamic> _$QuickReplyToJson(QuickReply instance) =>
    <String, dynamic>{
      'content_id': instance.contentId,
      'group_id': instance.groupId,
      'content': instance.content,
      'content_type': instance.contentType,
      'audio': instance.audio,
      'duration': instance.duration,
      'img': instance.img,
      'img_w': instance.imgWidth,
      'img_h': instance.imgHeight,
      'verify_status': instance.verifyStatus,
    };

QuickGroups _$QuickGroupsFromJson(Map<String, dynamic> json) {
  return QuickGroups(
    Util.parseList(json['list'],
        (e) => QuickReplyGroup.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$QuickGroupsToJson(QuickGroups instance) =>
    <String, dynamic>{
      'list': instance.groups,
    };

GroupReplies _$GroupRepliesFromJson(Map<String, dynamic> json) {
  return GroupReplies(Util.parseList(
      json['list'], (e) => QuickReply.fromJson(e as Map<String, dynamic>)));
}

Map<String, dynamic> _$GroupRepliesToJson(GroupReplies instance) =>
    <String, dynamic>{
      'list': instance.replies,
    };
