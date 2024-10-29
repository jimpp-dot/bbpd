// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_message_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchVoiceRemain _$MatchVoiceRemainFromJson(Map<String, dynamic> json) {
  return MatchVoiceRemain(
    Util.parseInt(json['remain_num']),
    Util.parseList(json['icons'], (e) => Util.parseStr(e) ?? ''),
  );
}

MatchVoiceRoom _$MatchVoiceRoomFromJson(Map<String, dynamic> json) {
  return MatchVoiceRoom(
    Util.parseInt(json['remain_num']),
    Util.parseInt(json['rid']),
    Util.parseInt(json['uid']),
  );
}
