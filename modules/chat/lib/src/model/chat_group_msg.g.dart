// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupInviteMsg _$GroupInviteMsgFromJson(Map<String, dynamic> json) {
  return GroupInviteMsg(
    Util.parseInt(json['group_id']),
    Util.parseStr(json['group_name']),
    Util.parseStr(json['group_cover']),
    Util.parseInt(json['member_num']),
    Util.parseInt(json['invite_id']),
    Util.parseStr(json['invite_tips']),
  );
}

GroupDutyWords _$GroupDutyWordsFromJson(Map<String, dynamic> json) {
  return GroupDutyWords(
    Util.parseInt(json['mark']),
    Util.parseStr(json['words']),
  );
}
