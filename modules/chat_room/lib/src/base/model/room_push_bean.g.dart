// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_push_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabModel _$TabModelFromJson(Map<String, dynamic> json) {
  return TabModel(
    Util.notNullStr(json['tab']),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['filter']),
    Util.parseInt(json['default']),
  );
}

TabsResponse _$TabsResponseFromJson(Map<String, dynamic> json) {
  return TabsResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => TabModel.fromJson(e as Map<String, dynamic>)),
  );
}
