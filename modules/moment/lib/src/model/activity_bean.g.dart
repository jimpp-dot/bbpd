// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityBean _$ActivityBeanFromJson(Map<String, dynamic> json) {
  return ActivityBean(
    Util.parseInt(json['id']),
    Util.parseList(json['images'], (e) => Util.parseStr(e) ?? ''),
    Util.parseStr(json['title']),
    Util.parseStr(json['tag']),
    Util.parseStr(json['content']),
    Util.parseInt(json['user_num']),
  );
}

Map<String, dynamic> _$ActivityBeanToJson(ActivityBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'title': instance.title,
      'tag': instance.tag,
      'content': instance.content,
      'user_num': instance.userNum,
    };
