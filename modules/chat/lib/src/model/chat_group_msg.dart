import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'chat_group_msg.g.dart';

@JsonSerializable(createToJson: false)
class GroupInviteMsg {
  @JsonKey(name: 'group_id')
  int groupId;

  @JsonKey(name: 'group_name')
  String? groupName;

  @JsonKey(name: 'group_cover')
  String? groupIcon;

  @JsonKey(name: 'member_num')
  int memberCount;

  @JsonKey(name: 'invite_id')
  int inviteId;

  @JsonKey(name: 'invite_tips')
  String? inviteTips;

  GroupInviteMsg(this.groupId, this.groupName, this.groupIcon, this.memberCount,
      this.inviteId, this.inviteTips);

  factory GroupInviteMsg.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteMsgFromJson(json);
}

class ChatGroupTypes {
  // 普通群
  static const PARTY = 'party';

  // 临时群
  static const TEMP = 'person';
}

@JsonSerializable(createToJson: false)
class GroupDutyWords {
  int mark;

  String? words;

  GroupDutyWords(this.mark, this.words);

  factory GroupDutyWords.fromJson(Map<String, dynamic> json) =>
      _$GroupDutyWordsFromJson(json);
}
