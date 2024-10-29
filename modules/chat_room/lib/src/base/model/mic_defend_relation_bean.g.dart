// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mic_defend_relation_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MicDefendRelationBean _$MicDefendRelationBeanFromJson(
    Map<String, dynamic> json) {
  return MicDefendRelationBean(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : MicDefendRelationData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

MicDefendRelationData _$MicDefendRelationDataFromJson(
    Map<String, dynamic> json) {
  return MicDefendRelationData(
    Util.parseList(json['defend_info'],
        (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)),
  );
}
