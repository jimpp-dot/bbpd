import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_setting_beans.g.dart';

@JsonSerializable(createToJson: false)
class GroupSettings {
  int id;

  String type;

  int creator;

  String name;

  String cover;

  String notice;

  @JsonKey(name: "apply_num")
  int applyNum;

  @JsonKey(name: 'is_manager')
  bool isManager;

  //是否允许群成员邀请加群，0-不允许，1-允许
  @JsonKey(name: "allow_invite")
  bool allowInvite;

  // 加群是否需要群主审核，0-不需要，1-需要
  @JsonKey(name: "need_audit")
  bool needAudit;

  @JsonKey(name: 'allow_search')
  bool allowSearch;

  List<ImGroupMember>? members;

  String nickname;

  /// 群禁言
  @JsonKey(name: "forbidden")
  bool mute;

  /// 歌友会群聊天仅歌友会成员可见
  @JsonKey(name: "chat_only_member")
  int chatOnlyMember;

  /// 群封面是否正在审核中
  @JsonKey(name: "cover_audit")
  int coverAudit;

  /// 群名称是否正在审核中
  @JsonKey(name: "name_audit")
  int nameAudit;

  GroupSettings(
      this.id,
      this.type,
      this.creator,
      this.name,
      this.cover,
      this.notice,
      this.applyNum,
      this.isManager,
      this.allowInvite,
      this.needAudit,
      this.members,
      this.allowSearch,
      this.nickname,
      this.mute,
      this.chatOnlyMember,
      this.coverAudit,
      this.nameAudit);

  factory GroupSettings.fromJson(Map<String, dynamic> json) =>
      _$GroupSettingsFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupApplyListResp extends BaseResponse
    with PageListResponse<GroupApplyItem> {
  GroupApplyList? data;

  GroupApplyListResp({required bool success, required String msg, this.data})
      : super(success: success, msg: msg);

  factory GroupApplyListResp.fromJson(Map<String, dynamic> json) =>
      _$GroupApplyListRespFromJson(json);

  @override
  List<GroupApplyItem> get items => data!.list!;

  @override
  bool get hasMore => data!.more;
}

@JsonSerializable(createToJson: false)
class GroupApplyList {
  List<GroupApplyItem>? list;

  bool more;

  GroupApplyList(this.list, this.more);

  factory GroupApplyList.fromJson(Map<String, dynamic> json) =>
      _$GroupApplyListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupApplyItem {
  int id;
  int groupId;
  int uid;

  //申请状态，0-待处理，1-已同意，2-已拒绝
  int state;

  String icon;
  String name;

  @JsonKey(name: "update_time")
  int updateTime;

  GroupApplyItem(this.id, this.groupId, this.uid, this.state, this.icon,
      this.name, this.updateTime);

  factory GroupApplyItem.fromJson(Map<String, dynamic> json) =>
      _$GroupApplyItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupListResp extends BaseResponse {
  GroupList? data;

  GroupListResp({required bool success, required String msg, this.data})
      : super(success: success, msg: msg);

  factory GroupListResp.fromJson(Map<String, dynamic> json) =>
      _$GroupListRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupList {
  List<GroupItem>? list;

  GroupList(this.list);

  factory GroupList.fromJson(Map<String, dynamic> json) =>
      _$GroupListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupItem {
  @JsonKey(name: "group_id")
  int groupId;

  String name;
  String cover;

  @JsonKey(name: "member_num")
  int memberCount;

  @JsonKey(name: "in")
  bool inGroup;

  bool official;

  GroupItem(this.groupId, this.name, this.cover, this.memberCount, this.inGroup,
      this.official);

  factory GroupItem.fromJson(Map<String, dynamic> json) =>
      _$GroupItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInfoResp extends BaseResponse {
  GroupItem? data;

  GroupInfoResp({required bool success, required String msg, this.data})
      : super(success: success, msg: msg);

  factory GroupInfoResp.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupMemberListResp extends BaseResponse {
  GroupMemberList? data;

  GroupMemberListResp({required bool success, required String msg, this.data})
      : super(success: success, msg: msg);

  factory GroupMemberListResp.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberListRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupMemberList {
  @JsonKey(name: 'at_all')
  bool atAll;

  List<ImGroupMember>? list;

  GroupMemberList(this.list, this.atAll);

  factory GroupMemberList.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInviteTabResp extends BaseResponse {
  GroupInviteTabs? data;

  GroupInviteTabResp({required bool success, required String msg, this.data})
      : super(success: success, msg: msg);

  factory GroupInviteTabResp.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteTabRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInviteTabs {
  List<GroupInviteTabItem>? tabs;

  @JsonKey(name: 'show_search')
  bool showSearch;

  GroupInviteTabs(this.tabs, this.showSearch);

  factory GroupInviteTabs.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteTabsFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInviteTabItem {
  String key;

  String name;

  GroupInviteTabItem(this.key, this.name);

  factory GroupInviteTabItem.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteTabItemFromJson(json);
}
