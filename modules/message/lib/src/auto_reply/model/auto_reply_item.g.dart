// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_reply_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoReplyItem _$AutoReplyItemFromJson(Map<String, dynamic> json) {
  return AutoReplyItem(
    Util.parseStr(json['content']),
    Util.parseInt(json['id']),
    Util.parseInt(json['state']),
    Util.parseInt(json['content_type']),
    Util.parseStr(json['scene']),
    Util.parseInt(json['scene_type']),
    (json['gift_ids'] as List).map((e) => Util.parseInt(e)).toList(),
  );
}

Map<String, dynamic> _$AutoReplyItemToJson(AutoReplyItem instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'state': instance.state,
      'content_type': instance.contentType,
      'scene': instance.scene,
      'scene_type': instance.sceneType,
      'gift_ids': instance.giftIds,
    };

AutoReply _$AutoReplyFromJson(Map<String, dynamic> json) {
  return AutoReply(
    Util.parseStr(json['scene']) ?? '',
    Util.parseInt(json['scene_type']),
    Util.parseList(json['items'],
        (e) => AutoReplyItem.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['gs_reply_count']) ?? '',
    Util.parseStr(json['user_reply_rate']) ?? '',
  );
}

Map<String, dynamic> _$AutoReplyToJson(AutoReply instance) => <String, dynamic>{
      'scene': instance.scene,
      'scene_type': instance.sceneType,
      'items': instance.items,
      'gs_reply_count': instance.gsReplyCount,
      'user_reply_rate': instance.userReplyRate,
    };
