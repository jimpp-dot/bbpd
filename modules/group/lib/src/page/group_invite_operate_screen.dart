import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';

import '../../k.dart';

class GroupInviteOperateScreen extends StatefulWidget {
  final int? inviteId;
  final bool isSelf; //true:  我邀请的的别人， false： 别人邀请的我

  @override
  State<StatefulWidget> createState() {
    return _GroupInviteOperateState();
  }

  static void openGroupInviteOperateScreen(
      BuildContext context, int inviteId, bool isSelf) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          GroupInviteOperateScreen(inviteId: inviteId, isSelf: isSelf),
    ));
  }

  const GroupInviteOperateScreen({Key? key, this.inviteId, this.isSelf = false})
      : super(key: key);
}

class _GroupInviteOperateState
    extends BaseScreenState<GroupInviteOperateScreen> {
  GroupItem? _groupItem;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    GroupInfoResp resp = await GroupRepo.getInviteInfo(widget.inviteId);
    if (resp.success == true && resp.data != null) {
      _groupItem = resp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        CommonAvatar(
          path: _groupItem!.cover,
          size: 96,
          shape: BoxShape.circle,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          _groupItem!.name,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 4,
          width: Util.width,
        ),
        Text(
          K.group_members_count([_groupItem!.memberCount.toString()]),
          style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
        ),
        const SizedBox(
          height: 64,
        ),
        if (widget.isSelf)
          Text(
            _groupItem!.inGroup ? K.group_invite_accepted : K.group_invite_sent,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
          )
        else
          GestureDetector(
            onTap: _operate,
            child: Container(
              width: 200,
              height: 48,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                  )),
              child: Text(
                _groupItem!.inGroup
                    ? K.group_has_in_group_chat
                    : K.group_join_group,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
      ],
    );
  }

  void _operate() async {
    if (_groupItem!.inGroup) {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context,
          targetId: _groupItem!.groupId, type: 'group');
    } else {
      bool result = await GroupRepo.inviteOperate(widget.inviteId);
      GroupReporter.acceptGroupInvitation();
      if (result && mounted) {
        _loadData();
      }
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar(K.group_invite_title);
  }
}
