import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/page/group_apply_list.dart';
import 'package:group/src/page/group_apply_screen.dart';
import 'package:group/src/page/group_at_list_screen.dart';
import 'package:group/src/page/group_invite_operate_screen.dart';
import 'package:group/src/page/group_manager_screen.dart';
import 'package:group/src/page/group_new_create_screen.dart';
import 'package:group/src/page/group_select_user_screen.dart';
import 'package:group/src/page/user_group_list.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';
import '../k.dart';
import 'page/groupBlackScreen.dart';
import 'page/groupInfoScreen.dart';
import 'page/groupPersonInfoScreen.dart';
import 'page/groupSettingScreen.dart';
import 'package:group/src/join/join_group_bottom_sheet.dart';

class GroupManager implements IGroupManager {
  @override
  void loadStrings() {
//    R.putLangStringMap(strMap);
  }

  @override
  void openGroupBlackScreen(BuildContext context,
      {int? groupId, String? title}) {
    GroupBlackScreen.openGroupBlackScreen(context,
        groupId: groupId, title: title);
  }

  @override
  void openGroupCreateScreen(BuildContext context,
      {required int groupId, required int uid}) {
    String title =
        groupId > 0 ? R.string('add_member') : R.string('create_group');

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.showContactSelectScreen(context, (BuildContext context,
        List<int> uidList, List<bool> isGroupList, Map room) async {
      String url = "${System.domain}go/yy/group/create";
      if (groupId > 0) {
        url = "${System.domain}go/yy/group/add";
      }

      try {
        XhrResponse response = await Xhr.postJson(
            url,
            {
              'groupId': groupId.toString(),
              'uids': uidList.join(','),
              'version': '12',
            },
            formatJson: true,
            throwOnError: true);
        if (response.error == null) {
          Map res = response.value();
          if (res['success'] == true) {
            try {
              int needVerify = Util.parseInt(res['data']['need_verify'], 0);
              int needVerifyNew =
                  Util.parseInt(res['data']['need_verify_new'], 0);
              if (groupId == 0 &&
                  (Utility.isNeedVerify(needVerify, needVerifyNew))) {
                ILoginManager loginManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_LOGIN);
                loginManager.openAuthDialog(context,
                    type: needVerify,
                    newType: needVerifyNew,
                    refer: 'create_group');

                return;
              }
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  msg: R.string('add_success'), gravity: ToastGravity.CENTER);
            } catch (e) {
              Log.d(e);
            }
          } else {
            Fluttertoast.showToast(msg: res['msg']);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e);
      }
    }, preSelectUid: uid, hideGroupTab: true, title: title);
  }

  @override
  void openGroupInfoScreen(BuildContext context,
      {int? groupId, String? title}) {
    GroupInfoScreen.openGroupInfoScreen(context,
        groupId: groupId, title: title);
  }

  @override
  void openGroupPersonInfoScreen(BuildContext context,
      {int? groupId, int? uid}) {
    GroupPersonInfoScreen.openGroupPersonInfoScreen(context,
        groupId: groupId, uid: uid);
  }

  @override
  void openGroupSettingScreen(BuildContext context, {int? groupId}) {
    GroupSettingScreen.openGroupSettingScreen(context, groupId: groupId);
  }

  @override
  void openGroupManagerScreen(BuildContext context, int groupId) {
    GroupManagerScreen.openGroupManagerScreen(context, groupId);
  }

  @override
  Future<bool> checkCanCreateGroup() async {
    bool result = await GroupRepo.checkCreateGroup();
    return result;
  }

  @override
  void openGroupCreateScreenNew(BuildContext context) {
    NewGroupCreateScreen.openCreateGroupScreen(context);
  }

  @override
  Future<dynamic> openInviteUserScreen(BuildContext context,
      {int? groupId, required int uid, bool? isCreator}) {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    return roomManager.showContactSelectScreen(context, (BuildContext context,
        List<int> uidList, List<bool> isGroupList, Map room) async {
      bool result = await GroupRepo.inviteUsers(groupId, uidList);
      if (result) {
        GroupReporter.inviteInGroup(isCreator!);
        Navigator.of(context).pop(true);
      }
    }, preSelectUid: uid, hideGroupTab: true, title: K.add_member);
  }

  @override
  void openUserGroupListScreen(BuildContext context, int uid, int sex) {
    UserGroupListScreen.openUserGroupListScreen(context, uid, sex);
  }

  @override
  void openGroupInviteOperateScreen(
      BuildContext context, int inviteId, bool isSelf) {
    GroupInviteOperateScreen.openGroupInviteOperateScreen(
        context, inviteId, isSelf);
  }

  @override
  void openGroupApplyList(BuildContext context, int groupId) {
    GroupApplyListScreen.openGroupApplyListScreen(context, groupId);
  }

  @override
  void openUserApplyScreen(BuildContext context, int groupId) {
    GroupApplyScreen.openGroupApplyScreen(context, groupId);
  }

  @override
  Future<bool?> displayJoinGroupBottomSheet(
      BuildContext context, int groupId, String refer) {
    return JoinGroupBottomSheet.show(context, groupId, refer);
  }

  @override
  Future<ImGroupMember?> openAtUserScreen(
      BuildContext context, int groupId) async {
    return await GroupAtScreen.openAtScreen(context, groupId: groupId);
  }

  @override
  Future<List<int>?> openSelectUserScreen(BuildContext context,
      {String? title,
      List<int>? preSelectedUis,
      List<int>? selectedUis}) async {
    return await SelectUserScreen.show(context,
        title: title, preSelectedUis: preSelectedUis, selectedUis: selectedUis);
  }
}
