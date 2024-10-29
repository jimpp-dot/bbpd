// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagCategoryModel _$TagCategoryModelFromJson(Map<String, dynamic> json) {
  return TagCategoryModel(
    Util.parseStr(json['id']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseList(json['detail'],
        (e) => PersonalTagModel.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$TagCategoryModelToJson(TagCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'detail': instance.detail,
    };

PersonalTagModel _$PersonalTagModelFromJson(Map<String, dynamic> json) {
  return PersonalTagModel(
    Util.parseStr(json['id']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseBool(json['selected']),
  );
}

Map<String, dynamic> _$PersonalTagModelToJson(PersonalTagModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'selected': instance.selected,
    };
