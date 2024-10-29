// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePage _$MessagePageFromJson(Map<String, dynamic> json) {
  return MessagePage(
    Util.parseList(
        json['msgs'], (e) => MessageBean.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['next']),
    Util.parseBool(json['have_forbidden']),
  );
}

Map<String, dynamic> _$MessagePageToJson(MessagePage instance) =>
    <String, dynamic>{
      'msgs': instance.msgs,
      'next': instance.next,
      'have_forbidden': instance.showForbidTips,
    };

MessageBean _$MessageBeanFromJson(Map<String, dynamic> json) {
  return MessageBean(
    Util.parseInt(json['cmtid']),
    Util.parseStr(json['cmt']),
    Util.parseInt(json['is_barrage']),
    Util.parseStr(json['voice_cmt_url']),
    Util.parseInt(json['tpid']),
    Util.parseInt(json['tuid']),
    Util.parseStr(json['tpcont']),
    _$enumDecodeNullable(_$MomentTypeEnumMap, json['tptype'],
        unknownValue: MomentType.text),
    Util.parseInt(json['is_work']),
    Util.parseStr(json['tpattach']),
    Util.parseInt(json['id']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
    Util.parseStr(json['type']),
    Util.parseInt(json['time']),
    Util.parseInt(json['duration']),
    Util.parseStr(json['mkname']),
    Util.parseInt(json['replied']),
    Util.parseStr(json['tips']),
  );
}

Map<String, dynamic> _$MessageBeanToJson(MessageBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'mkname': instance.markName,
      'icon': instance.icon,
      'type': instance.type,
      'cmtid': instance.commentId,
      'cmt': instance.commentContent,
      'is_barrage': instance.isBarrageComment,
      'voice_cmt_url': instance.voiceCommentUrl,
      'tpid': instance.topicId,
      'tuid': instance.topicUid,
      'tpcont': instance.topicContent,
      'tptype': _$MomentTypeEnumMap[instance.topicType],
      'is_work': instance.isWork,
      'tpattach': instance.topicAttach,
      'duration': instance.duration,
      'time': instance.time,
      'replied': instance.replied,
      'tips': instance.tips,
    };

T? _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source).key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T? _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MomentTypeEnumMap = {
  MomentType.normal: 'normal',
  MomentType.text: 'text',
  MomentType.picture: 'picture',
  MomentType.video: 'video',
  MomentType.audio: 'audio',
  MomentType.work: 'work',
};
