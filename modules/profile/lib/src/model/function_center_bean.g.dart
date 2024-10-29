// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_center_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionCenterBean _$FunctionCenterBeanFromJson(Map<String, dynamic> json) {
  return FunctionCenterBean(
    Util.parseList(
        json['data'], (e) => FunctionItem.fromJson(e as Map<String, dynamic>)),
  );
}

FunctionItem _$FunctionItemFromJson(Map<String, dynamic> json) {
  return FunctionItem(
    Util.notNullStr(json['name']),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['tip_type']),
    Util.notNullStr(json['tip_string']),
    Util.notNullStr(json['url']),
  );
}
