// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_setting_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupSettings _$GroupSettingsFromJson(Map<String, dynamic> json) {
  return GroupSettings(
    Util.parseInt(json['id']),
    Util.parseStr(json['type']) ?? '',
    Util.parseInt(json['creator']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['cover']) ?? '',
    Util.parseStr(json['notice']) ?? '',
    Util.parseInt(json['apply_num']),
    Util.parseBool(json['is_manager']),
    Util.parseBool(json['allow_invite']),
    Util.parseBool(json['need_audit']),
    (json['members'] as List?)
        ?.map((e) => ImGroupMember.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseBool(json['allow_search']),
    Util.parseStr(json['nickname']) ?? '',
    Util.parseBool(json['forbidden']),
    Util.parseInt(json['chat_only_member']),
    Util.parseInt(json['cover_audit']),
    Util.parseInt(json['name_audit']),
  );
}

GroupApplyListResp _$GroupApplyListRespFromJson(Map<String, dynamic> json) {
  return GroupApplyListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : GroupApplyList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupApplyList _$GroupApplyListFromJson(Map<String, dynamic> json) {
  return GroupApplyList(
    (json['list'] as List?)
        ?.map((e) => GroupApplyItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseBool(json['more']),
  );
}

GroupApplyItem _$GroupApplyItemFromJson(Map<String, dynamic> json) {
  return GroupApplyItem(
    Util.parseInt(json['id']),
    Util.parseInt(json['groupId']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['state']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['update_time']),
  );
}

GroupListResp _$GroupListRespFromJson(Map<String, dynamic> json) {
  return GroupListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : GroupList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupList _$GroupListFromJson(Map<String, dynamic> json) {
  return GroupList(
    (json['list'] as List?)
        ?.map((e) => GroupItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GroupItem _$GroupItemFromJson(Map<String, dynamic> json) {
  return GroupItem(
    Util.parseInt(json['group_id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['cover']) ?? '',
    Util.parseInt(json['member_num']),
    Util.parseBool(json['in']),
    Util.parseBool(json['official']),
  );
}

GroupInfoResp _$GroupInfoRespFromJson(Map<String, dynamic> json) {
  return GroupInfoResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : GroupItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupMemberListResp _$GroupMemberListRespFromJson(Map<String, dynamic> json) {
  return GroupMemberListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : GroupMemberList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupMemberList _$GroupMemberListFromJson(Map<String, dynamic> json) {
  return GroupMemberList(
    (json['list'] as List?)
        ?.map((e) => ImGroupMember.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseBool(json['at_all']),
  );
}

GroupInviteTabResp _$GroupInviteTabRespFromJson(Map<String, dynamic> json) {
  return GroupInviteTabResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : GroupInviteTabs.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupInviteTabs _$GroupInviteTabsFromJson(Map<String, dynamic> json) {
  return GroupInviteTabs(
    (json['tabs'] as List?)
        ?.map((e) => GroupInviteTabItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseBool(json['show_search']),
  );
}

GroupInviteTabItem _$GroupInviteTabItemFromJson(Map<String, dynamic> json) {
  return GroupInviteTabItem(
    Util.parseStr(json['key']) ?? '',
    Util.parseStr(json['name']) ?? '',
  );
}
