import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/util/color_constant.dart';

/// 个人页所在圈子 房间 or 家族 buff数据格式
class GroupNewWidget extends StatelessWidget {
  final HomeProfileData? data;
  const GroupNewWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    }

    // Log.d('data.hasKfgShow:${data.hasKfgShow()}  data.hasRoom():${data.hasRoom()} data.hasFleet():${data.hasFleet()} data.hasUnion()${data.hasUnion()} this._hasGroup()${this._hasGroup()}');
    if (!data!.hasKfgShow() &&
        !data!.hasRoom() &&
        !data!.hasFleet() &&
        !data!.hasUnion() &&
        !_hasGroup()) {
      return Container();
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
            child: Text(
              K.joined_groups,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.colors.mainTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: LimitedBox(
              maxHeight: 76,
              child: ListView(
                  key: const PageStorageKey<String>('GroupWidget'),
                  padding:
                      const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _createWidgets()),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
            color: R.color.dividerColor,
            height: 0.5,
          )
        ],
      ),
    );
  }

  List<Widget> _createWidgets() {
    HomeProfileKolInfo kolInfo = data!.kfgShow;
    HomeProfileRoom room = data!.room;
    HomeProfileFleet fleet = data!.fleet;
    HomeProfileUnion union = data!.union;
    List<HomeProfileSinger> singers = data!.singerClub;
    List<HomeProfilePartyGroup> groupInfoList = data!.partyGroup;

    String sexString = BaseK.K.common_she;
    if (data!.base.sex == 1) {
      sexString = BaseK.K.common_he;
    }

    List<Widget> widgets = [];

    /// 歌友会入口
    if (singers.isNotEmpty) {
      for (var e in singers) {
        String content = '';

        if (e.userTitle == 10 || e.userTitle == 20) {
          content = sexString + K.personal_is + e.titleName;
        }
        widgets
            .add(_buildItem(5, e.name, content, subIndex: singers.indexOf(e)));
      }
    }

    if (kolInfo.kfgId > 0) {
      widgets.add(_JoinFansGroupItemWidget(kolInfo));
    }

    if (room.uid > 0) {
      bool receiption = false;
      bool create = false;
      if (room.role == 'creator') {
        create = true;
      }

      if (room.role == 'receiption') {
        receiption = true;
      }

      int micCount = Util.parseInt(room.onmicNum);
      String content = '';
      if (receiption) {
        content = K.personal_room_reception([sexString]);
      } else {
        content = K.personal_number_chating([micCount.toString()]);
      }
      widgets.add(_buildItem(0, room.name, content));

      RoomProperty roomProperty = RoomConfig.getProperty(room.property);
      if ((roomProperty == RoomProperty.Private ||
              roomProperty == RoomProperty.Vip) &&
          create) {
        //个人房房主
        if (micCount > 0) {
          content = K.personal_number_chating([micCount.toString()]);
        } else {
          content = K.personal_private_room([sexString]);
        }
        widgets.add(_buildItem(1, room.name, content));
      }
    }

    if (fleet.gid > 0) {
      String content = '';
      if (data!.base.uid == fleet.creator) {
        //创始人
        content = K.personal_is_creator([sexString]);
      }
      widgets.add(_buildItem(2, fleet.name, content));
    }

    if (union.unId > 0) {
      String content = sexString + K.personal_is + union.titleName;
      widgets.add(_buildItem(3, union.name, content));
    }

    if (_hasGroup()) {
      String name = groupInfoList[0].name;
      String content = K.personal_people_count([groupInfoList[0].memberNum]);
      bool isOfficial = groupInfoList[0].official;
      Widget? titleTipsWidget = isOfficial ? _buildGroupOfficialTag() : null;
      widgets
          .add(_buildItem(4, name, content, titleTipsWidget: titleTipsWidget));
    }

    return widgets;
  }

  void _roomClick() {
    int rid = Util.parseInt(data?.room.rid);
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(Constant.context, rid);
  }

  void _groupClick(bool toList) {
    IGroupManager iGroupManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);

    if (toList) {
      iGroupManager.openUserGroupListScreen(
          Constant.context, data?.base.uid ?? 0, data?.base.sex ?? 0);
    } else {
      iGroupManager.openUserApplyScreen(
          Constant.context, data?.partyGroup[0].groupId ?? 0);
    }
    Tracker.instance.track(TrackEvent.profile_group_click,
        properties: {'is_myself': data?.base.uid == Session.uid});
  }

  Widget _buildItem(int index, String title, String content,
      {Widget? titleTipsWidget, int subIndex = 0}) {
    List tipsColors = [
      R.color.mainBrandGradientColors,
      [
        const Color(0xFFF4B1FF),
        const Color(0xFF99A4FF),
      ],
      [
        const Color(0xFFFFC96A),
        const Color(0xFFFFA974),
      ],
      [
        const Color(0xFF63C7FF),
        const Color(0xFF679CFF),
      ],
      [
        const Color(0xFF60C8FF),
        const Color(0xFF79E2FF),
      ],
      [
        const Color(0xFFDFABFD),
        const Color(0xFFC29BFE),
      ],
    ];

    List tips = [
      K.personal_playing,
      K.room,
      K.personal_group,
      K.personal_singer_club
    ];

    String icon = '';
    if (index <= 1 && data?.room != null) {
      icon = "${System.imageDomain}${data?.room.icon ?? ''}";
    } else if (index == 2 && Util.validList(data?.partyGroup ?? '')) {
      icon = "${System.imageDomain}${data?.partyGroup[0].cover ?? ''}";
    } else if (index == 3 && !Util.isCollectionEmpty(data?.singerClub)) {
      icon = Util.getRemoteImgUrl(data?.singerClub[subIndex].logo ?? '');
    }

    List<Widget> extraWidgets = index == 4 ? _getGroupExtraInfo() : [];

    return GestureDetector(
        onTap: () {
          if (index <= 1 && data?.room != null) {
            _roomClick();
          } else if (index == 4 && Util.validList(data?.partyGroup)) {
            _groupClick(false);
          }
        },
        child: Rext.themeCardContainer(
            cornerRadius: 16,
            width: Util.width - 32,
            height: 72,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: icon,
                    suffix: '!head150',
                    width: 52.0,
                    height: 52.0,
                    fadeInDuration: const Duration(microseconds: 0),
                    fadeOutDuration: const Duration(microseconds: 0),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        child: Row(
                      children: [
                        if (titleTipsWidget != null) titleTipsWidget,
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: R.colors.mainTextColor),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(3, 1, 3, 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: LinearGradient(
                                colors: tipsColors[index],
                                begin: AlignmentDirectional.bottomStart,
                                end: AlignmentDirectional.topEnd),
                          ),
                          child: Text(
                            tips[index],
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: Util.fontFamily,
                            ),
                          ),
                        ),
                        if (!Util.isStringEmpty(content)) ...[
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            content,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: R.colors.mainTextColor,
                              fontFamily: Util.fontFamily,
                            ),
                          )
                        ]
                      ],
                    )
                  ],
                )),
                ...extraWidgets,
                ...getArrowArea(!Util.isCollectionEmpty(extraWidgets))
              ],
            )));
  }

  List<Widget> _getGroupExtraInfo() {
    List<Widget> list = [];

    List<HomeProfilePartyGroup> originalList = data?.partyGroup ?? [];

    if (originalList.length <= 1) {
      return [];
    }

    String sexString = BaseK.K.common_she;
    if (data?.base.sex == 1) {
      sexString = BaseK.K.common_he;
    }

    list.add(
      Container(
        margin: const EdgeInsetsDirectional.only(end: 8),
        width: 0.5,
        height: 32,
        color: R.color.dividerColor,
      ),
    );

    List<HomeProfilePartyGroup> groupItems =
        originalList.length > 3 ? data!.partyGroup.sublist(0, 3) : originalList;

    double width = 0.0;
    if (groupItems.length == 1) {
      width = 25;
    } else if (groupItems.length == 2) {
      width = 40;
    } else if (groupItems.length == 3) {
      width = 55;
    }

    List<Widget> groupIcons = [];
    for (int i = 0; i < groupItems.length; i++) {
      groupIcons.add(PositionedDirectional(
          start: i * 15.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: CommonAvatar(
              path: groupItems[i].cover,
              size: 20,
              shape: BoxShape.circle,
            ),
          )));
    }

    list.add(GestureDetector(
      onTap: () {
        _groupClick(true);
      },
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: width,
              height: 25,
              child: Stack(
                  alignment: AlignmentDirectional.center, children: groupIcons),
            ),
            Text(
              K.personal_user_groups(
                  [sexString, data!.partyGroup.length.toString()]),
              style: TextStyle(color: R.colors.secondTextColor, fontSize: 10),
            )
          ],
        ),
      ),
    ));
    return list;
  }

  Widget _buildGroupOfficialTag() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFFFBD26), Color(0xFFFFDD35)]),
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12),
              topEnd: Radius.circular(12),
              bottomStart: Radius.circular(12))),
      child: Text(
        K.personal_official,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  List<Widget> getArrowArea(bool hasGroup) {
    List<Widget> resultList = [
      const SizedBox(
        width: 8,
      ),
      R.img(
        'ic_next.svg',
        width: 16,
        height: 16,
        color: R.colors.thirdTextColor,
        package: ComponentManager.MANAGER_PROFILE,
      ),
      const SizedBox(
        width: 4,
        height: 52,
      )
    ];

    if (hasGroup) {
      return [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _groupClick(true);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: resultList,
          ),
        )
      ];
    } else {
      return resultList;
    }
  }

  bool _hasGroup() {
    return Util.validList(data?.partyGroup);
  }
}

/// 加入粉丝团ItemWidget
class _JoinFansGroupItemWidget extends StatefulWidget {
  final HomeProfileKolInfo group;

  const _JoinFansGroupItemWidget(this.group, {Key? key}) : super(key: key);
  @override
  _JoinFansGroupItemWidgetState createState() =>
      _JoinFansGroupItemWidgetState();
}

class _JoinFansGroupItemWidgetState extends State<_JoinFansGroupItemWidget> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        EventConstant.EventJoinFansGroupChanged, _onFansGroupStatusChanged);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        EventConstant.EventJoinFansGroupChanged, _onFansGroupStatusChanged);
  }

  void _onFansGroupStatusChanged(String type, dynamic data) {
    if (data == null) return;
    setState(() {
      widget.group.isJoin = data == 'join_fans_group' ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(_buildIcon(Util.parseIcon(widget.group.icon)));
    widgets.add(_buildTitle(widget.group.groupName));
    widgets.add(_buildMemberCount(widget.group.memberNum));
    if (!Util.parseBool(widget.group.isJoin))
      widgets.add(_buildJoinButton(widget.group.kfgId));
    return GestureDetector(
        onTap: () {
          if (!Util.parseBool(widget.group.isJoin)) return;
          _locationHomeFansGroup();
        },
        child: Container(
          width: 293,
          height: 76,
          margin: const EdgeInsetsDirectional.only(end: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorConstant.joinGroupItemBackground.withOpacity(0.06)),
          child: Stack(children: widgets),
        ));
  }

  void _locationHomeFansGroup() async {
    Navigator.popUntil(System.context, ModalRoute.withName('/'));
    eventCenter.emit('HomePage.JumpToHomePage', '');
    eventCenter.emit('HomePage.JumpToHomeTabKol', 'tabKol');
  }

  Widget _buildIcon(String url) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 13, top: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          width: 52.0,
          height: 52.0,
          fadeInDuration: const Duration(microseconds: 0),
          fadeOutDuration: const Duration(microseconds: 0),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 77, top: 18),
      child: Text(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: R.color.unionRankText1,
            fontSize: 15,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildMemberCount(int memberNum) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 77, top: 42),
      child: Text(
        '$memberNum${K.people_unit}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: R.color.unionRankText1.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildJoinButton(int groupId) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
          onTap: () async {
            IGroupManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_GROUP);
            await manager.displayJoinGroupBottomSheet(
                context, groupId, 'UserPage');
          },
          child: Container(
              margin: const EdgeInsetsDirectional.only(top: 24, end: 16),
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              height: 28,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient:
                    LinearGradient(colors: ColorConstant.joinGroupButtonColor),
              ),
              child: Text(
                K.personal_join_fans_group,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    height: 1.0,
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
