import 'package:shared/model/im_group_beans.dart';
import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IGroupManager extends IResourceLoader {
  static const String EVENT_REFRESH_GROUP_INFO = 'event.refresh.group.info';

  static const String EVENT_NICK_NAME_CHANGED = 'event.group.nickname.changed';

  ///
  void openGroupCreateScreen(BuildContext context,
      {required int groupId, required int uid});

  ///
  void openGroupInfoScreen(BuildContext context, {int? groupId, String? title});

  ///
  void openGroupSettingScreen(BuildContext context, {int? groupId});

  ///
  void openGroupPersonInfoScreen(BuildContext context,
      {int? groupId, int? uid});

  ///
  void openGroupBlackScreen(BuildContext context,
      {int? groupId, String? title});

  /// 新的群管理界面
  void openGroupManagerScreen(BuildContext context, int groupId);

  /// 检查是否可以创建群
  Future<bool> checkCanCreateGroup();

  /// 打开新的群组创建界面
  void openGroupCreateScreenNew(BuildContext context);

  /// 打开邀请用户入群页面
  Future<dynamic> openInviteUserScreen(BuildContext context,
      {int? groupId, required int uid, bool? isCreator});

  /// 打开用户的群列表
  void openUserGroupListScreen(BuildContext context, int uid, int sex);

  /// 打开用户邀请操作界面
  /// [isSelf] true:  我邀请的的别人， false： 别人邀请的我
  void openGroupInviteOperateScreen(
      BuildContext context, int inviteId, bool isSelf);

  /// 进群申请列表(群主)
  void openGroupApplyList(BuildContext context, int groupId);

  /// 打开申请入群界面(普通成员)
  void openUserApplyScreen(BuildContext context, int groupId);

  /// 打开加入粉丝团底部菜单
  Future<bool?> displayJoinGroupBottomSheet(
      BuildContext context, int groupId, String refer);

  /// 打开群成员列表，选择@的人
  Future<ImGroupMember?> openAtUserScreen(BuildContext context, int groupId);

  /// 邀请入群，选择联系人 / 创建临时群，选择联系人
  Future<List<int>?> openSelectUserScreen(BuildContext context,
      {String? title, List<int>? preSelectedUis, List<int>? selectedUis});
}
