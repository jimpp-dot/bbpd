// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamiliarResp _$FamiliarRespFromJson(Map<String, dynamic> json) {
  return FamiliarResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'], (e) => Util.parseInt(e)),
    tmpgroup: Util.parseList(json['tmpgroup'], (e) => Util.parseInt(e)),
  );
}
