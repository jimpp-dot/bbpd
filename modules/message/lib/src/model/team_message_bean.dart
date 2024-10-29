import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_message_bean.g.dart';

@JsonSerializable(createToJson: false)
class MatchVoiceRemain {
  @JsonKey(name: 'remain_num')
  final int remainNum;

  @JsonKey(name: "icons")
  final List<String> icons;

  MatchVoiceRemain(this.remainNum, this.icons);

  factory MatchVoiceRemain.fromJson(Map<String, dynamic> json) =>
      _$MatchVoiceRemainFromJson(json);
}

@JsonSerializable(createToJson: false)
class MatchVoiceRoom {
  @JsonKey(name: 'remain_num')
  final int remainNum;

  final int rid;

  final int uid;

  MatchVoiceRoom(this.remainNum, this.rid, this.uid);

  factory MatchVoiceRoom.fromJson(Map<String, dynamic> json) =>
      _$MatchVoiceRoomFromJson(json);
}
