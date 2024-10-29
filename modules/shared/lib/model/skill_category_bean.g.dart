// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_category_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillCategoryResponse _$SkillCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return SkillCategoryResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => SkillCategory.fromJson(e as Map<String, dynamic>)),
    cid: Util.parseInt(json['cid']),
  );
}

Map<String, dynamic> _$SkillCategoryResponseToJson(
        SkillCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
      'cid': instance.cid,
    };

SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) {
  return SkillCategory(
    Util.parseInt(json['cid']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['name']) ?? '',
  );
}

Map<String, dynamic> _$SkillCategoryToJson(SkillCategory instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'type': instance.type,
      'name': instance.name,
    };
