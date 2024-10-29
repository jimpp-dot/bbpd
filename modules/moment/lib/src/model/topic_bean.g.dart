// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicTab _$TopicTabFromJson(Map<String, dynamic> json) {
  return TopicTab(
    Util.parseStr(json['name']),
    Util.parseInt(json['id']),
    Util.parseStr(json['type']),
  );
}

Map<String, dynamic> _$TopicTabToJson(TopicTab instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };

TopicSquareListResponse _$TopicSquareListResponseFromJson(
    Map<String, dynamic> json) {
  return TopicSquareListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : TopicSquareListData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TopicSquareListResponseToJson(
        TopicSquareListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

TopicSquareListData _$TopicSquareListDataFromJson(Map<String, dynamic> json) {
  return TopicSquareListData(
    Util.parseList(
        json['output'], (e) => Topic.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['more']),
  );
}

Map<String, dynamic> _$TopicSquareListDataToJson(
        TopicSquareListData instance) =>
    <String, dynamic>{
      'output': instance.topicList,
      'more': instance.more,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(Util.parseInt(json['id']), Util.parseStr(json['name']),
      Util.parseStr(json['icon']), Util.parseStr(json['content']),
      prefix: Util.parseStr(json['prefix']),
      url: Util.parseStr(json['url']),
      isFollow: Util.parseInt(json['isFollow']),
      color: Util.parseStr(json['color']),
      desc: Util.parseStr(json['rcmd_name']),
      isActivity: Util.parseBool(json['is_activity']));
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'content': instance.content,
      'prefix': instance.prefix,
      'url': instance.url,
      'isFollow': instance.isFollow,
      'color': instance.color,
      'rcmd_name': instance.desc,
      'is_activity': instance.isActivity
    };
