// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_notice_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentNoticePeople _$MomentNoticePeopleFromJson(Map<String, dynamic> json) {
  return MomentNoticePeople(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseInt(json['pos']),
  );
}

Map<String, dynamic> _$MomentNoticePeopleToJson(MomentNoticePeople instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'pos': instance.pos,
    };
