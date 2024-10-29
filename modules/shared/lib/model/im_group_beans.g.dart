// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'im_group_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImGroupMember _$ImGroupMemberFromJson(Map<String, dynamic> json) {
  return ImGroupMember(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseBool(json['is_creator']),
    Util.parseBool(json['is_manager']),
  );
}
