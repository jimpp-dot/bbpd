import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';

import '../../k.dart';

class GroupApplyScreen extends StatefulWidget {
  final int? groupId;

  @override
  State<StatefulWidget> createState() {
    return _GroupApplyScreenState();
  }

  static void openGroupApplyScreen(BuildContext context, int groupId) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GroupApplyScreen(groupId: groupId),
    ));
  }

  const GroupApplyScreen({Key? key, this.groupId}) : super(key: key);
}

class _GroupApplyScreenState extends BaseScreenState<GroupApplyScreen> {
  GroupItem? _groupItem;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    GroupInfoResp resp = await GroupRepo.getGroupInfo(widget.groupId);
    if (resp.success == true && resp.data != null) {
      _groupItem = resp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  onTapErrorWidget() {
    _loadData();
  }

  Widget _buildBody() {
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_groupItem!.official) const GroupOfficialTag(),
            Text(
              _groupItem!.name,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
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
        GestureDetector(
          onTap: _apply,
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
                  : K.group_apply_join,
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

  void _apply() async {
    if (_groupItem!.inGroup) {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context,
          targetId: _groupItem!.groupId, type: 'group');
    } else {
      bool result = await GroupRepo.applyJoinGroup(_groupItem!.groupId);
      GroupReporter.applyInGroup();
      if (result && mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar(K.group_apply_join);
  }

  @override
  Widget buildContent() {
    return _buildBody();
  }
}
