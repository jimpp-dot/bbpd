// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'superadmin_quickanswer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperAdminQuickAnswerData _$SuperAdminQuickAnswerDataFromJson(
    Map<String, dynamic> json) {
  return SuperAdminQuickAnswerData(
      Util.parseList(json['list'], (e) => Util.notNullStr(e)));
}

SuperAdminQuickAnswerRsp _$SuperAdminQuickAnswerRspFromJson(
    Map<String, dynamic> json) {
  return SuperAdminQuickAnswerRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : SuperAdminQuickAnswerData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}
