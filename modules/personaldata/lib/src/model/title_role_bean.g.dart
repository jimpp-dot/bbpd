// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_role_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleRoleBean _$TitleRoleBeanFromJson(Map<String, dynamic> json) {
  return TitleRoleBean(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['data'],
            (e) => TitleRoleItemBean.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

TitleRoleItemBean _$TitleRoleItemBeanFromJson(Map<String, dynamic> json) {
  return TitleRoleItemBean(
    tid: Util.parseInt(json['tid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['pic']),
    description: Util.parseStr(json['description']),
  );
}

Map<String, dynamic> _$TitleRoleItemBeanToJson(TitleRoleItemBean instance) =>
    <String, dynamic>{
      'tid': instance.tid,
      'name': instance.name,
      'pic': instance.icon,
      'description': instance.description,
    };
