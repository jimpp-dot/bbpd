// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_transfer_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUserTransfer _$NewUserTransferFromJson(Map<String, dynamic> json) {
  return NewUserTransfer(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['sex']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['age']),
    Util.parseInt(json['level']),
    Util.parseInt(json['online_status']),
    Util.parseStr(json['regist_text']) ?? '',
    Util.parseStr(json['online_text']) ?? '',
    json['rookie_tag'] == null
        ? null
        : RookieTag.fromJson(json['rookie_tag'] as Map<String, dynamic>),
    Util.parseBool(json['new_noble']),
  )..selected = Util.parseBool(json['selected']);
}

RookieTag _$RookieTagFromJson(Map<String, dynamic> json) {
  return RookieTag(
    Util.parseInt(json['seven_new']),
    Util.parseInt(json['pay_level']),
  );
}
