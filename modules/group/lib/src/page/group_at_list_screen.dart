import 'package:group/assets.dart';
import 'package:group/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/repo/group_repo.dart';

class GroupAtScreen extends StatefulWidget {
  final int? groupId;

  static Future<ImGroupMember?> openAtScreen(BuildContext context,
      {Key? key, int? groupId}) async {
    return displayModalBottomSheet(
      maxHeightRatio: 1,
      context: context,
      builder: (BuildContext context) =>
          GroupAtScreen(key: key, groupId: groupId),
    );
  }

  const GroupAtScreen({Key? key, this.groupId}) : super(key: key);

  @override
  _GroupAtScreenState createState() => _GroupAtScreenState();
}

class _GroupAtScreenState extends BaseScreenState<GroupAtScreen> {
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();
  Timer? _cancelTimer;

  List<ImGroupMember> _memberList = [];

  bool _atAll = false;

  late String _searchKey = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    GroupMemberListResp resp =
        await GroupRepo.getGroupMemberList(widget.groupId, _searchKey);
    if (resp.success == true) {
      List<ImGroupMember>? list = resp.data!.list;
      _atAll = resp.data!.atAll;
      if (Util.isCollectionEmpty(list)) {
        setScreenEmpty();
      } else {
        // 不能@自己
        list!.removeWhere((element) => element.uid == Session.uid);
        if (Util.isCollectionEmpty(list)) {
          setScreenEmpty();
        } else {
          _memberList = list;
          setScreenReady();
        }
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  void _onQueryChanged(String text) {
    setState(() {});
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  /// [query] 搜索key
  void _search(String query) async {
    _searchKey = query;
    _loadData();
  }

  void closeInput() {
    if (_inputKey.currentState != null) {
      _inputKey.currentState!.close();
    }
  }

  void _onTap(ImGroupMember item) {
    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // 防止点击事件穿透
      child: Container(
        height: Util.height - kToolbarHeight,
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          color: R.color.mainBgColor,
        ),
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            Expanded(child: buildStatusContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 10),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: R.color.thirdTextColor,
              borderRadius: const BorderRadius.all(Radius.circular(2.5)),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Row(
            children: <Widget>[
              const NavigatorClose(
                alignment: AlignmentDirectional.centerStart,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    K.group_select_at_member,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: R.color.mainTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSearch(),
        Expanded(
          child: GestureDetector(
            onTap: closeInput,
            child: _buildFriendList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          top: 6, bottom: 6, start: 20, end: 20),
      child: SearchBar(
        _onQueryChanged,
        key: _inputKey,
        height: 36,
        hintText: base.K.input_name_to_search,
      ),
    );
  }

  Widget _buildFriendList() {
    return CustomScrollView(
      slivers: [
        if (_atAll) _buildAll(),
        _buildMemberTitle(),
        SliverFixedExtentList(
            itemExtent: 72,
            delegate: FixedExtentSliverChildBuilderDelegate(
              _itemBuilder,
              childCount: _memberList.length,
            ))
      ],
    );
  }

  Widget _buildAll() {
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          /// @所有人，uid = -1， name = 所有人
          _onTap(ImGroupMember.uidName(-1, K.group_all_member));
        },
        child: Container(
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                child: Center(
                    child: R.img(Assets.group$group_ic_all_person_svg,
                        width: 32, height: 32)),
              ),
              const SizedBox(width: 12),
              Text(
                K.group_all_member,
                style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberTitle() {
    return SliverToBoxAdapter(
      child: Container(
        height: 44,
        color: R.color.secondBgColor,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Text(
          K.group_member,
          style: TextStyle(
              fontSize: 14,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    ImGroupMember member = _memberList[index];
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: InkWell(
        onTap: () {
          _onTap(member);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _renderImage(context, member),
            const SizedBox(width: 12, height: 72),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Util.width - 140,
                    child: Text(
                      member.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: Util.fontFamily,
                        color: R.color.mainTextColor,
                      ),
                    ),
                  ),
                  IDWidget(
                    uid: member.uid,
                    fontSize: 13,
                    fontColor: R.color.secondTextColor,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderImage(BuildContext context, ImGroupMember item) {
    return CommonAvatar(
      path: item.icon,
      size: 52,
      shape: BoxShape.circle,
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return _buildBody();
  }
}
