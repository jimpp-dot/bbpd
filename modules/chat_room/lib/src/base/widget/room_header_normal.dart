import 'dart:math';
import 'dart:typed_data';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/auction/rank/rank_page.dart';
import 'package:chat_room/src/base/admin/room_tab_item.dart';
import 'package:chat_room/src/base/widget/room_head_scroll.dart';
import 'package:chat_room/src/base/widget/room_notice_widget.dart';
import 'package:chat_room/src/base/widget/room_reception_widget.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/widget/cplink_rank_tips_widget.dart';
import 'package:chat_room/src/fans/join_fans_group_screen.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';
import 'package:chat_room/src/live/knight/knight_rank_widget.dart';
import 'package:chat_room/src/protobuf/generated/ranking_contribute.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_toast.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/roomtask/widget/room_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';

import '../../../../k.dart';
import '../../../assets.dart';
import 'header/room_header_setting.dart';

LinearGradient followBtnGradient = LinearGradient(
  begin: AlignmentDirectional.topStart,
  end: AlignmentDirectional.bottomEnd,
  colors: R.colors.darkGradientColors,
);

class RoomHeaderNormal extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback? onSettingClick;
  final bool? showHelp;
  final String? helpUrl;
  final String? helpTitle;

  const RoomHeaderNormal({
    super.key,
    required this.room,
    this.onSettingClick,
    this.showHelp,
    this.helpUrl,
    this.helpTitle,
  });

  @override
  _RoomHeaderNormalState createState() => _RoomHeaderNormalState();
}

class _RoomHeaderNormalState extends State<RoomHeaderNormal> {
  bool _hasFollowReception = false;
  FansEntrance? _fansEntrance;
  final GlobalKey _noticeKey = GlobalKey();
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    _hasFollowReception = widget.room.isFollowReception;
    _loadFansData();
    _loadFollowRelation();
    eventCenter.addListener(RoomConstant.EVENT_JOIN_FANS_GROUP_SUCCESS, _joinSuccess);
    eventCenter.addListener(RoomConstant.Event_Reception_Follow_Refresh, _refreshReceptionFollow);
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    widget.room.addListener(RoomConstant.Event_Room_Simple_Toast, _onSimpleToast);
  }

  @override
  void didUpdateWidget(covariant RoomHeaderNormal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.room.rid != widget.room.rid) {
      /// 麦序房切换主播，需要重置关注状态
      _hasFollowReception = widget.room.isFollowReception;
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.EVENT_JOIN_FANS_GROUP_SUCCESS, _joinSuccess);
    eventCenter.removeListener(RoomConstant.Event_Reception_Follow_Refresh, _refreshReceptionFollow);
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    widget.room.removeListener(RoomConstant.Event_Room_Simple_Toast, _onSimpleToast);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.config == null) return const SizedBox.shrink();

    return Container(
      height: 32,
      margin: EdgeInsetsDirectional.only(top: Util.statusHeight + 6, end: 12, bottom: 6),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: R.img("back.svg", width: 24.0, height: 24.0, package: ComponentManager.MANAGER_BASE_ROOM),
            ),
          ),
          _buildTitle(),
          Expanded(child: _showCpLinkRelationshipTip()),
          _rightWidget(),
        ],
      ),
    );
  }

  Widget _showCpLinkRelationshipTip() {
    bool showPat = false;
    if (widget.room.config?.configExpendData is CpLinkConfigData) {
      showPat = (widget.room.config?.configExpendData as CpLinkConfigData).showPat;
    }
    if (showPat) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 5),
        child: CpLinkRankTipsWidget(
          room: widget.room,
          key: const ValueKey('CpLinkRankTipsWidget'),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  ///有接待优先判断接待 没有判断房主
  bool get _receptionOnMic {
    return ChatRoomUtil.isReceptionOnMic(room: widget.room);
  }

  String get _iconShowed {
    return ChatRoomUtil.roomIcon(room: widget.room);
  }

  String get _nameShowed {
    if (_receptionOnMic) {
      RoomPosition position = widget.room.positions.first;
      return position.name;
    }

    return widget.room.createor?.name ?? '';
  }

  bool get _hasFollowed {
    if (_receptionOnMic) {
      RoomPosition position = widget.room.positions.first;
      if (position.uid == Session.uid) {
        return true;
      } else {
        return _hasFollowReception;
      }
    }
    if (widget.room.createor?.uid == Session.uid) {
      return true;
    } else {
      return widget.room.isFollowCreator;
    }
  }

  _onSimpleToast(String type, dynamic value) {
    if (value != null && value is Uint8List) {
      SimpleToast data = SimpleToast.fromBuffer(value);
      if (Util.validStr(data.content)) {
        Fluttertoast.showCenter(msg: data.content);
      }
    }
  }

  _onUserFollow(String type, dynamic value) {
    /// 关注状态改变刷新UI
    if (value is Map && value.containsKey('follow') && value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];

      int toUid;
      if (_receptionOnMic) {
        toUid = widget.room.positions.first.uid;
      } else {
        toUid = widget.room.createor?.uid ?? 0;
      }

      if (Util.parseInt(uid) == toUid) {
        setState(() {
          _hasFollowReception = follow;
          if (toUid == widget.room.createor?.uid) {
            widget.room.isFollowCreator = follow;
          }
        });
      }
    }
  }

  _loadFollowRelation() async {
    if (_receptionOnMic) {
      RoomPosition position = widget.room.positions.first;
      Map<int, int> res = await BaseRequestManager.batchQueryFollowStatus([position.uid]);
      if (res.isNotEmpty) {
        _hasFollowReception = (res[position.uid] ?? 0) > 0;
        if (mounted) setState(() {});
      }
    }
  }

  _loadFansData() async {
    if (!widget.room.isLiveRoom) return;
    FansEntranceResp resp = await FansGroupRepo.getFansEntrance(widget.room.rid);
    if (resp.success && mounted) {
      _fansEntrance = resp.data;
      setState(() {});
    }
  }

  Widget _buildTitle() {
    return Container(
      height: 32,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 4, 0),
      // decoration: const ShapeDecoration(shape: StadiumBorder(), color: Color(0x1FFFFFFF)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonAvatar(path: _iconShowed, size: 28, shape: BoxShape.circle),
          const SizedBox(width: 4),
          Flexible(
            child: LimitedBox(
              maxWidth: (Util.width / 2) - 120,
              child: RoomHeadScroll(
                room: widget.room,
                name: widget.room.config?.name ?? '',
                nameShowed: _nameShowed,
                onComplete: _titleClick,
              ),
            ),
          ),
          const SizedBox(width: 4),
          _actionBtnWidget()
        ],
      ),
    );
  }

  Widget _actionBtnWidget() {
    bool isLiveTalent = ChatRoomUtil.isLiveTalent(widget.room.config);
    bool isLive = widget.room.isLiveRoom;
    bool isBusinessRadio = widget.room.isBusinessRadio;
    bool isBusinessPayVoice = widget.room.config?.factoryType == RoomFactoryType.BusinessPayVoice;
    bool needShowFollow = isLive || isBusinessRadio || isBusinessPayVoice || widget.room.isMicLink || widget.room.isPrivate;

    // /// 需要显示关注按钮 并且没有关注
    // if (needShowFollow && !_hasFollowed) {
    //   return GestureDetector(
    //     onTap: _onFollow,
    //     child: Container(
    //       height: 26,
    //       padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
    //       margin: const EdgeInsetsDirectional.only(start: 6),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15),
    //         gradient: const LinearGradient(
    //           begin: AlignmentDirectional.topStart,
    //           end: AlignmentDirectional.bottomEnd,
    //           colors: [Color(0xFf2F0D51), Color(0xFf2F0D51)],
    //         ),
    //         border: Border.all(color: const Color(0xFF9EFF4E), width: 1),
    //       ),
    //       alignment: AlignmentDirectional.center,
    //       child: Row(
    //         children: [
    //           const Icon(Icons.add, size: 12, color: Color(0xFF9EFF4E)),
    //           Text(
    //             K.follow,
    //             style: R.textStyle.medium12.copyWith(color: const Color(0xFF9EFF4E)),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    ///关注的效果图
    // if (_showAnimation) {
    //   return Container(
    //     width: 40,
    //     height: 26,
    //     margin: const EdgeInsetsDirectional.only(start: 6),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15),
    //       gradient: const LinearGradient(
    //         colors: [Color(0xFF6560FF), Color(0xFFAD4BFF), Color(0xFFFFA972)],
    //         begin: AlignmentDirectional.topStart,
    //         end: AlignmentDirectional.bottomEnd,
    //       ),
    //     ),
    //     alignment: AlignmentDirectional.center,
    //     child: MultiframeImage.asset(
    //       R.imagePath('ic_follow_animation.webp', package: ComponentManager.MANAGER_BASE_ROOM),
    //       onComplete: () {
    //         _showAnimation = false;
    //         if (mounted) {
    //           setState(() {});
    //         }
    //       },
    //     ),
    //   );
    // }

    bool showFansGroup = isLive && !isLiveTalent;

    ///直播房关注后显示粉丝团入口
    if (showFansGroup) {
      return GestureDetector(
        onTap: _toFansGroup,
        child: Container(
          width: 40,
          height: 26,
          margin: const EdgeInsetsDirectional.only(start: 6),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   gradient: const LinearGradient(
          //     colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)],
          //     begin: AlignmentDirectional.topStart,
          //     end: AlignmentDirectional.bottomEnd,
          //   ),
          // ),
          alignment: AlignmentDirectional.center,
          child: MultiframeImage.asset(
            R.imagePath('fans/fans_group_icon.webp', package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ),
      );
    }

    ///有任务的房间显示任务入口
    // if (widget.room.showReceptionTask() || widget.room.showRoomTask()) {
    //   return GestureDetector(
    //     onTap: _taskAction,
    //     child: R.img(RoomAssets.chat_room$ic_room_task_webp, width: 24, height: 24),
    //   );
    // }

    ///其他商业房显示房间公告
    bool showNotice = widget.room.isBusiness;
    if (showNotice) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          RoomNoticeWidget.show(context, widget.room.isAdmin, _noticeKey, widget.room.rid);
        },
        child: R.img(key: _noticeKey, RoomAssets.chat_room$ic_room_task_webp, width: 24, height: 24),
      );
    }
    return const SizedBox(width: 6);
  }

  Widget _buildHelpWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        String url;
        String title = widget.helpTitle ?? K.room_game_rules;
        if (widget.helpUrl?.isNotEmpty == true) {
          url = widget.helpUrl!;
        } else if (widget.room.config?.game == Games.Under) {
          url = Util.getHelpUrlWithQStr('k23');
        } else if (widget.room.config?.game == Games.Guess) {
          url = Util.getHelpUrlWithQStr('k24');
        } else if (widget.room.config?.game == Games.Wolf) {
          url = Util.getHelpUrlWithQStr('k25');
        } else if (ChatRoomUtil.isPuzzleRoom(widget.room.config)) {
          url = Util.getPuzzleQA();
        } else if (widget.room.isCpLink) {
          url = Util.getHelpUrlWithQStr('k48');
        } else {
          return;
        }
        BaseWebviewScreen.show(context, url: url, title: title);
      },
      child: Container(
        decoration: const ShapeDecoration(shape: StadiumBorder(), color: Color(0x1FFFFFFF)),
        padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
        alignment: AlignmentDirectional.center,
        child: R.img('ic_info.svg', width: 20, height: 20, package: ComponentManager.MANAGER_BASE_ROOM),
      ),
    );
  }

  Widget _rightWidget() {
    bool isLive = widget.room.isLiveRoom;
    bool isLiveTalent = ChatRoomUtil.isLiveTalent(widget.room.config);
    bool isBusinessRadio = widget.room.isBusinessRadio;
    bool showKnight = (isLive && !isLiveTalent) || isBusinessRadio;
    bool showReception = widget.room.generalSetting?.data.openReceptionRank == 1;

    ///商业电台房接待麦位没人不显示骑士团入口
    if (isBusinessRadio) {
      if (!_receptionOnMic) {
        showKnight = false;
      }
    }
    bool showContributeTop = widget.room.isPrivate || showKnight;
    bool hideHotIcon = showContributeTop || isLiveTalent;

    ///贡献榜头像最大人数
    int maxCount = 3;
    if (showKnight) {
      maxCount = 2;
    }

    bool isAuction = widget.room.config?.types == RoomTypes.Auction;
    bool showHot = true;
    bool showHelp = widget.showHelp ?? widget.room.config?.game != Games.None || widget.room.isCpLink;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showKnight) _buildKnightItem(context),
        if (showContributeTop) _buildRankTopItem(maxCount),
        if (isAuction) _buildAuctionRank(),
        if (showReception)
          const Padding(
            padding: EdgeInsetsDirectional.only(end: 6),
            child: RoomReceptionWidget(),
          ),
        if (showHot)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 6),
            child: RoomHotNewWidget(widget.room, hiddenIcon: hideHotIcon),
          ),
        // if (showHelp)
        //   Padding(
        //     padding: const EdgeInsetsDirectional.only(end: 6),
        //     child: _buildHelpWidget(context),
        //   ),
        InkWell(
          onTap: widget.onSettingClick,
          child: const Padding(
            padding: EdgeInsetsDirectional.only(end: 8.0),
            child: RoomHeaderSettingWidget(),
          ),
        )
      ],
    );
  }

  // 守护之星
  Widget _buildKnightItem(BuildContext context) {
    int uid = widget.room.createor?.uid ?? 0;
    if (_receptionOnMic) {
      uid = widget.room.positions.first.uid;
    }
    return GestureDetector(
      onTap: () {
        if (widget.room.config!.hasKingRank || Session.uid == uid) {
          KnightRankWidget.show(context, widget.room.rid, uid, widget.room.isLiveRoom);
        } else {
          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openBuyKnightScreen(context);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 6, top: 1),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GradientCircularProgressIndicator(
              colors: const [Color(0xFF9F61FA), Color(0xFFF71C83)],
              radius: 14,
              stokeWidth: 1,
              value: 1,
            ),
            PositionedDirectional(
              bottom: 1,
              child: Util.validStr(widget.room.config?.knightKingIcon)
                  ? CommonAvatar(
                      path: widget.room.config!.knightKingIcon,
                      size: 26,
                      shape: BoxShape.circle,
                    )
                  : Container(
                      width: 26,
                      height: 26,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color(0x33FF4C5C),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: R.img(RoomAssets.chat_room$ic_position_empty_png, width: 16, height: 16),
                    ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF8752FC), Color(0xFFE73FF5)]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                Util.validStr(widget.room.config?.knightKingName) ? (widget.room.config!.knightKingName ?? '') : K.room_knight_star,
                style: youSheStyle.copyWith(fontSize: 7, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRankTopItem(int maxCount) {
    if (!Util.validList(widget.room.contributeTopData)) {
      return const SizedBox.shrink();
    }
    int count = min(maxCount, widget.room.contributeTopData.length);
    List<Color> colors = [
      const Color(0xFFC4A422).withOpacity(0.95),
      const Color(0xFF95A1B1).withOpacity(0.95),
      const Color(0xFF9F6322).withOpacity(0.95)
    ];
    List<Widget> res = [];
    for (int i = 0; i < count; i++) {
      RankList item = widget.room.contributeTopData[i];
      res.add(
        Container(
          margin: const EdgeInsetsDirectional.only(end: 2),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1, color: const Color(0x1AFFFFFF)),
                ),
                alignment: AlignmentDirectional.center,
                child: CommonAvatar(
                  path: item.icon,
                  size: 26,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 23,
                height: 9,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.5), color: colors[i]),
                child: Text(
                  Util.numberToKString(item.money ~/ 100, fix: 1),
                  style: R.textStyle.regular10.copyWith(fontSize: 7, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        RoomNavUtil.openRoomAdminScreen(
          context,
          rid: widget.room.rid,
          purview: widget.room.purview,
          types: widget.room.config?.types,
          fullScreenDialog: true,
          uid: widget.room.createor?.uid ?? 0,
          defaultTab: RoomTabItem.week,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: res,
      ),
    );
  }

  Widget _buildAuctionRank() {
    return GestureDetector(
      onTap: () {
        AuctionRankPage.show(context: context);
      },
      child: Container(
        width: 84,
        height: 26,
        margin: const EdgeInsetsDirectional.only(end: 4),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0x30FF29DE),
              Color(0x30A722FF),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_rank_auction_world,
              style: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
            ),
            const Icon(
              Icons.navigate_next_rounded,
              size: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  _titleClick() {
    int level = Util.parseInt(widget.room.config?.level);
    if (level >= 1) {
      String taskPath = 'banban-v140/#/room-level';
      BaseWebviewScreen.show(context, url: Util.getWebUrl(taskPath, params: {'rid': '${widget.room.rid}'}));
      Tracker.instance.track(TrackEvent.view_room_rightpage, properties: {
        'rid': '${widget.room.rid}',
        'owner_uid': '${widget.room.createor?.uid}',
        'refer': 'room_title',
      });
    } else {
      _taskAction();
    }
  }

  _taskAction() {
    if (widget.room.showReceptionTask()) {
      IProfileManager profileManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
      profileManager.openReceptionTask(context, widget.room.rid);
    } else if (widget.room.showRoomTask()) {
      RoomTaskInfoWidget.show(context, widget.room);
    }
  }

  _joinSuccess(String type, dynamic value) {
    _loadFansData();
  }

  _refreshReceptionFollow(String type, dynamic value) {
    _loadFollowRelation();
    _loadFansData();
  }

  _onFollow() async {
    int uid = widget.room.createor?.uid ?? 0;
    if (_receptionOnMic) {
      RoomPosition position = widget.room.positions.first;
      uid = position.uid;
    }
    await BaseRequestManager.onFollow('$uid');
    if (_receptionOnMic) {
      _hasFollowReception = true;
    }
    if (uid == widget.room.createor?.uid) {
      widget.room.isFollowCreator = true;
    }
    _showAnimation = true;
    if (mounted) {
      setState(() {});
    }
  }

  _toFansGroup() async {
    if (_fansEntrance?.fans == true || (widget.room.createor?.uid == Session.uid)) {
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openFansGroupPage(context, widget.room.rid, widget.room.createor?.uid ?? 0);
    } else {
      bool? join = await JoinFansGroupScreen.show(context,
          uid: widget.room.createor?.uid ?? 0, rid: widget.room.rid, icon: widget.room.createor?.icon);
      if (join == true && mounted) {
        _loadFansData();
      }
    }
  }
}
