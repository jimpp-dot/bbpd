// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatMatchItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMatchItem _$ChatMatchItemFromJson(Map<String, dynamic> json) {
  return ChatMatchItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['sex']),
    Util.parseStr(json['audio']) ?? '',
    Util.parseInt(json['duration']),
    Util.parseStr(json['desc']) ?? '',
    Util.parseInt(json['age']),
    Util.parseBool(json['has_like']),
    Util.parseInt(json['liked_num']),
    Util.parseInt(json['isfollow']),
    Util.parseBool(json['hasExpand']),
    Util.parseList(
        json['tags'], (e) => TagItem.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['audioIcon']) ?? '',
    json['dialog'] == null
        ? null
        : DialogData.fromJson(json['dialog'] as Map<String, dynamic>),
    Util.parseList(
        json['color'], (e) => TagColor.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['height']),
    Util.parseStr(json['industry']) ?? '',
    Util.parseStr(json['education']) ?? '',
  )
    ..hometownCity = Util.parseStr(json['hometown_city'])
    ..hometownCityCode = Util.parseInt(json['hometown_city_code']);
}

Map<String, dynamic> _$ChatMatchItemToJson(ChatMatchItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'audio': instance.audio,
      'duration': instance.duration,
      'desc': instance.desc,
      'age': instance.age,
      'has_like': instance.liked,
      'liked_num': instance.liked_num,
      'isfollow': instance.isFollow,
      'hasExpand': instance.hasExpand,
      'tags': instance.tags,
      'dialog': instance.dialog,
      'audioIcon': instance.audioIcon,
      'color': instance.color,
      'hometown_city': instance.hometownCity,
      'hometown_city_code': instance.hometownCityCode,
    };

TagItem _$TagItemFromJson(Map<String, dynamic> json) {
  return TagItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$TagItemToJson(TagItem instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
    };

DialogData _$DialogDataFromJson(Map<String, dynamic> json) {
  return DialogData(
    Util.parseStr(json['title']) ?? '',
    Util.parseStr(json['subtitle']) ?? '',
    Util.parseStr(json['content']) ?? '',
  );
}

Map<String, dynamic> _$DialogDataToJson(DialogData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
    };

TagColor _$TagColorFromJson(Map<String, dynamic> json) {
  return TagColor(
    Util.parseStr(json['bg_start']) ?? '',
    Util.parseStr(json['bg_end']) ?? '',
    Util.parseStr(json['border_start']) ?? '',
    Util.parseStr(json['border_end']) ?? '',
  );
}

Map<String, dynamic> _$TagColorToJson(TagColor instance) => <String, dynamic>{
      'bg_start': instance.bgStart,
      'bg_end': instance.bgEnd,
      'border_start': instance.borderStart,
      'border_end': instance.borderEnd,
    };
