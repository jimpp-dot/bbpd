import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/page/group_apply_screen.dart';
import 'package:group/src/repo/group_repo.dart';

import '../../k.dart';

/// Ta的所有群
class UserGroupListScreen extends StatefulWidget {
  final int? uid;
  final int? sex;

  @override
  State<StatefulWidget> createState() {
    return _UserGroupListState();
  }

  static openUserGroupListScreen(BuildContext context, int uid, int sex) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UserGroupListScreen(
        uid: uid,
        sex: sex,
      ),
    ));
  }

  const UserGroupListScreen({Key? key, this.uid, this.sex}) : super(key: key);
}

class _UserGroupListState extends BaseScreenState<UserGroupListScreen> {
  List<GroupItem>? _list = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    GroupListResp resp = await GroupRepo.getGroupList(widget.uid);
    if (resp.success == true && resp.data != null) {
      if (Util.isCollectionEmpty(resp.data!.list)) {
        setScreenEmpty();
      } else {
        _list = resp.data!.list;
        Log.d("setScreenReady........");
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar(K.group_list_title([Util.getSexDesc(widget.sex!)]));
  }

  @override
  Widget buildContent() {
    Log.d("list lenght = ${_list!.length}");

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 84,
            delegate: FixedExtentSliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildGroupItem(_list![index]);
              },
              childCount: _list!.length,
              addAutomaticKeepAlives: false,
              semanticIndexOffset: 0,
              cacheCount: 0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGroupItem(GroupItem item) {
    String btnText = item.inGroup ? K.group_go_chat : K.group_join_group;

    return Container(
      height: 84,
      margin: const EdgeInsetsDirectional.only(top: 12),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(12)),
        boxShadow: [getCardBoxShadow()],
      ),
      child: Row(
        children: [
          CommonAvatar(
            path: item.cover,
            shape: BoxShape.circle,
            size: 52,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.official) const GroupOfficialTag(),
                  Expanded(
                    child: Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 15, color: R.color.mainTextColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                K.group_members_count([item.memberCount.toString()]),
                style: TextStyle(color: R.color.secondTextColor, fontSize: 12),
              )
            ],
          )),
          GestureDetector(
            onTap: () {
              _onBtnTap(item);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 13, end: 13, top: 5, bottom: 5),
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                  )),
              child: Text(
                btnText,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onBtnTap(GroupItem item) {
    if (item.inGroup) {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context,
          targetId: item.groupId, type: 'group');
    } else {
      GroupApplyScreen.openGroupApplyScreen(context, item.groupId);
    }
  }
}
