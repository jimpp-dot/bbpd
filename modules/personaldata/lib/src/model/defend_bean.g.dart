// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defend_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefendListResponse _$DefendListResponseFromJson(Map<String, dynamic> json) {
  return DefendListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: Util.parseList(json['data'],
            (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    more: Util.parseBool(json['more']),
  );
}
