import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/wait_mic_user.dart';
import 'package:chat_room/src/base/widget/pickup_mic_page.dart';
import 'package:shared/shared.dart';
import '../art_center_can_not_join_mic_dialog.dart';

enum MicType {
  normal, // 普通麦
  boss, // 老板麦
  auction, // 竞拍对象麦
}

/// 申请上麦和排麦申请列表
class MicUpWaitList extends StatefulWidget {
  final ChatRoomData room;
  final bool admin; //是否显示抱上麦
  final bool isBoss; //点击麦位申请上麦 点的boss麦
  final bool isAuction; //点击麦位申请上麦 点的拍卖对象麦

  const MicUpWaitList({
    Key? key,
    required this.room,
    this.isBoss = false,
    this.isAuction = false,
    this.admin = false,
  }) : super(key: key);

  static Future show(
      {required BuildContext context, required WidgetBuilder builder}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: builder,
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<MicUpWaitList> with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;

  bool get _roomIsBoss => ((widget.room.config?.paier ?? 0) > 0); //房间带老板位
  bool get _roomIsAuction =>
      widget.room.config?.types == RoomTypes.Auction; //房间带竞拍

  bool get _waitingNormal => widget.room.wait.contains(Session.uid); //我在排老板麦
  bool get _waitingBoss =>
      widget.room.waitForBoss.contains(Session.uid); //我在排老板麦
  bool get _waitingAuction =>
      widget.room.waitForAuction.contains(Session.uid); //我在排竞拍

  bool get _tabHasBossOrAuction =>
      _roomIsBoss || _roomIsAuction || _waitingBoss || _waitingAuction;

  bool _meIsWaitingNormal = false;
  bool _meIsWaitingBossOrAuction = false;
  int _waitNormalNum = 0;
  int _waitBossOrAuctionNum = 0;

  /// 没有老板位或竞拍位的个人房 不显示tab
  bool get _showTab => _tabController != null && _tabController!.length > 1;

  @override
  initState() {
    super.initState();

    _initWaitStatus();
    _initTabController();
    widget.room.addListener(RoomConstant.Event_Join_Mic_Close, _onCloseMic);
  }

  @override
  dispose() {
    widget.room.removeListener(RoomConstant.Event_Join_Mic_Close, _onCloseMic);
    _tabController?.dispose();

    super.dispose();
  }

  void _initWaitStatus() {
    _meIsWaitingNormal = _waitingNormal;
    _meIsWaitingBossOrAuction = _waitingBoss || _waitingAuction;
    _waitNormalNum = widget.room.wait.length;

    if (_roomIsBoss) {
      _waitBossOrAuctionNum = widget.room.waitForBoss.length;
    } else if (_roomIsAuction) {
      _waitBossOrAuctionNum = widget.room.waitForAuction.length;
    }
  }

  void _initTabController() {
    int length = _tabHasBossOrAuction ? 2 : 1;
    int initialIndex =
        (widget.isAuction || widget.isBoss || _waitingBoss || _waitingAuction)
            ? 1
            : 0;
    if (length == 1) {
      initialIndex = 0;
    }

    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: initialIndex, length: length, vsync: this),
    );
  }

  void _onCloseMic(String type, dynamic data) {
    Navigator.of(context).pop();
  }

  // 刷新标题和人数
  void _callBack(MicType type, int waitNum, bool meIsWating) {
    if (mounted) {
      setState(() {
        if (type == MicType.normal) {
          _waitNormalNum = waitNum;
          _meIsWaitingNormal = meIsWating;
        } else if (type == MicType.boss || type == MicType.auction) {
          _waitBossOrAuctionNum = waitNum;
          _meIsWaitingBossOrAuction = meIsWating;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 394 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).padding.bottom),
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(20)),
        ),
        color: R.color.mainBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildDivider(),
          if (_showTab == true) _buildTab(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return BaseAppBar.custom(
      showBack: false,
      title: Text(
        (_meIsWaitingNormal || _meIsWaitingBossOrAuction || widget.admin)
            ? K.room_apply_list
            : K.room_upmic_interact,
        style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      actions: [_buildClearMicBtn()],
      backgroundColor: Colors.transparent,
    );
  }

  /// 靓号房或商业房 房主或接待 清空排麦列表功能
  Widget _buildClearMicBtn() {
    if (widget.admin && (widget.room.isBaba || widget.room.isBusiness)) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          BaseResponse res =
              await WaitMicRepository.clearWaitMicList(widget.room.realRid);
          if (res.success == true) {
            if (mounted) {
              setState(() {
                _waitNormalNum = 0;
                _waitBossOrAuctionNum = 0;
              });
            }
          } else if (!Util.isStringEmpty(res.msg)) {
            Fluttertoast.showCenter(msg: res.msg);
          }
        },
        child: Center(
          child: Container(
            width: 64,
            height: 28,
            margin: const EdgeInsetsDirectional.only(end: 20),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(width: 0.5, color: R.color.thirdTextColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img('ic_clear_mic_list.webp',
                    width: 16,
                    height: 16,
                    package: ComponentManager.MANAGER_BASE_ROOM),
                const SizedBox(width: 2),
                Text(
                  K.wait_mic_clear_list,
                  style: TextStyle(fontSize: 14, color: R.color.thirdTextColor),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildTab() {
    List<Widget> tabWidgets = [];

    String normalWaitNumStr =
        _waitNormalNum > 99 ? '(99+)' : '($_waitNormalNum)';
    String bossOrAuctionWaitNumStr =
        _waitBossOrAuctionNum > 99 ? '(99+)' : '($_waitBossOrAuctionNum)';

    tabWidgets.add(Text(K.room_normal_mic + normalWaitNumStr));
    if (_tabHasBossOrAuction) {
      String text = '';
      if (_roomIsAuction) {
        text = K.room_aution_mic;
      } else if (_roomIsBoss) {
        text = K.room_boss_mic;
      }

      text += bossOrAuctionWaitNumStr;
      tabWidgets.add(Text(text));
    }

    return Container(
      height: 44.0,
      padding: const EdgeInsetsDirectional.only(start: 10.0, bottom: 8),
      child: CommonTabBar(
        tabs: tabWidgets,
        isScrollable: true,
        labelColor: R.color.mainTextColor,
        controller: _tabController,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
          insets: const EdgeInsetsDirectional.only(bottom: 0),
          wantWidth: 16,
          draggingWidth: 12.0,
        ),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      ),
    );
  }

  Divider _buildDivider({double indent = 16}) {
    return Divider(
      height: 1.0,
      indent: indent,
      endIndent: indent,
      color: R.color.dividerColor,
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: _showTab == false
          ? _WaitList(
              room: widget.room,
              type: MicType.normal,
              isAdmin: widget.admin,
              meIsWaiting: _meIsWaitingNormal || _meIsWaitingBossOrAuction,
              callBack: _callBack,
            )
          : ExtendedTabBarView(
              controller: _tabController,
              children: [
                _WaitList(
                  room: widget.room,
                  type: MicType.normal,
                  isAdmin: widget.admin,
                  meIsWaiting: _meIsWaitingNormal || _meIsWaitingBossOrAuction,
                  callBack: _callBack,
                ),
                if (_tabHasBossOrAuction)
                  _WaitList(
                    room: widget.room,
                    type: _roomIsBoss ? MicType.boss : MicType.auction,
                    isAdmin: widget.admin,
                    meIsWaiting:
                        _meIsWaitingNormal || _meIsWaitingBossOrAuction,
                    callBack: _callBack,
                  ),
              ],
            ),
    );
  }
}

class _WaitList extends StatefulWidget {
  final ChatRoomData room;
  final MicType type;
  final bool isAdmin;
  final bool meIsWaiting;
  final Function(MicType, int, bool)? callBack;

  const _WaitList(
      {Key? key,
      required this.room,
      required this.type,
      this.isAdmin = false,
      this.meIsWaiting = false,
      this.callBack})
      : super(key: key);

  @override
  _WaitListState createState() => _WaitListState();
}

class _WaitListState extends State<_WaitList>
    with AutomaticKeepAliveClientMixin {
  List<WaitMicUserInfo> _waitList = [];
  List<PositionIndex> _positionTable = [];

  bool _meIsWaitingCurrentType = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _initListeners();
    _load();
  }

  void _initListeners() {
    widget.room.addListener(RoomConstant.Event_Wait_Changed, _onChanged);
    widget.room.addListener(RoomConstant.Event_Admin_Wait_Changed, _onChanged);
    widget.room
        .addListener(RoomConstant.Event_Auction_Wait_Changed, _onChanged);
  }

  void _removeListeners() {
    widget.room.removeListener(RoomConstant.Event_Wait_Changed, _onChanged);
    widget.room
        .removeListener(RoomConstant.Event_Admin_Wait_Changed, _onChanged);
    widget.room
        .removeListener(RoomConstant.Event_Auction_Wait_Changed, _onChanged);
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  _onChanged(String type, dynamic data) {
    _load();
  }

  /// 取消排麦
  _quitWaitMic() async {
    BaseResponse res = await WaitMicRepository.quitWaitMic(widget.room.realRid);

    if (res.success == true) {
      Fluttertoast.showCenter(msg: K.room_canceled_wait_mic);
      if (mounted && Navigator.of(context).canPop())
        Navigator.of(context).pop();
    } else {
      Fluttertoast.showCenter(msg: res.msg ?? '');
    }
  }

  void _load() async {
    WaitMicUserListRsp rsp = await WaitMicRepository.getWaitList(
        widget.room.realRid,
        widget.type == MicType.boss,
        widget.type == MicType.auction);

    if (rsp.success) {
      if (mounted) {
        setState(() {
          _waitList = rsp.waitMicUsers ?? [];
          _positionTable = rsp.positionTable ?? [];

          _meIsWaitingCurrentType =
              _waitList.firstWhereOrNull((e) => e.uid == Session.uid) != null;
          if (widget.callBack != null) {
            widget.callBack!(
                widget.type, _waitList.length, _meIsWaitingCurrentType);
          }
        });
      }
    } else if (rsp.msg != null) {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
  }

  /// boss位和竞拍位抱上麦
  _pickUp(WaitMicUserInfo waiMicUserInfo) async {
    int uid = waiMicUserInfo.uid;
    int? pos = -1;

    if (widget.type == MicType.boss) {
      pos = ChatRoomUtil.getBossChairPositions()
          .lastWhereOrNull((position) => position.uid == 0)
          ?.position;
      pos ??= widget.room.bossPosition;
    } else if (widget.type == MicType.auction) {
      pos = widget.room.auctionPosition;
    }

    Map? res = await RoomRepository.joinMic(widget.room.realRid, pos,
        uid: uid, needCertify: false);
    if (res != null && res['success'] == false) {
      Fluttertoast.showCenter(msg: res['msg'] ?? '');
    } else {
      Fluttertoast.showCenter(msg: K.room_wait_other_up_mic);
    }
  }

  _onPickUp(WaitMicUserInfo waiMicUserInfo) {
    // 特殊处理boss位和竞拍位
    if (widget.type == MicType.auction || _positionTable.isEmpty) {
      _pickUp(waiMicUserInfo);
      return;
    }
    // boss位 1个时 走老逻辑
    if (widget.type == MicType.boss &&
        ChatRoomUtil.getBossChairPositions().length <= 1) {
      _pickUp(waiMicUserInfo);
      return;
    }

    Navigator.of(context).pop();

    /// 普通麦位抱上麦 或 2个及以上boss位
    List<PositionIndex> positionTable = _positionTable;
    if (widget.type == MicType.boss) {
      positionTable = _positionTable
          .where((e) => ChatRoomUtil.isBossChairByPosition(e.position))
          .toList();
    }

    // 普通麦位/2个及以上boss位 抱上麦
    PickupMicModel model = PickupMicModel(
      waiMicUserInfo.uid,
      roomData: widget.room,
      title: K.room_pickup_some_body([waiMicUserInfo.name]),
      positionIndex: positionTable,
    );

    displayModalBottomSheet(
      context: System.context,
      maxHeightRatio: 1,
      builder: (context) => PickupMicPage(model: model),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _waitList.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemBuilder(_waitList[index], index);
            },
          ),
        ),
        _buildBottom(),
      ],
    );
  }

  Widget _itemBuilder(WaitMicUserInfo data, int index) {
    double maxSubContentWidth =
        widget.isAdmin == true ? Util.width - 190 : Util.width - (120 + (60));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
            context, data.uid, widget.room, 0);
      },
      child: Container(
        color: data.uid == Session.uid
            ? R.color.mainBrandColor.withOpacity(0.08)
            : Colors.transparent,
        height: 72,
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  index > 98 ? '99+' : '${index + 1}',
                  style: TextStyle(
                      color: R.color.mainTextColor.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CommonAvatar(
                  path: data.icon,
                  shape: BoxShape.circle,
                  size: 52,
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    LimitedBox(
                      maxWidth: maxSubContentWidth,
                      child: Text(
                        data.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                _buildSubContent(data),
              ],
            ),
            const Spacer(),
            _buildRightContent(data),
          ],
        ),
      ),
    );
  }

  Widget _buildRightContent(WaitMicUserInfo data) {
    //是管理 显示抱上麦
    if (widget.isAdmin) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _onPickUp(data),
            child: Container(
              width: 63.0,
              height: 28.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              ),
              child: Text(
                K.room_pick_up_mic,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          LimitedBox(
            maxWidth: 63,
            child: Text(
              data.datelineDiff,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    }

    /// 上座审核中
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(
          'ic_self_wait_tips.webp',
          width: 16,
          height: 16,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
        const SizedBox(width: 2),
        Text(
          K.room_checking,
          style: TextStyle(
              fontSize: 13, color: R.color.secondTextColor, height: 1.1),
        ),
      ],
    );
  }

  Widget _buildBottom() {
    if (widget.isAdmin) return const SizedBox.shrink();

    // 我在排麦中
    if (widget.meIsWaiting) {
      // 排的非当前type
      if (!_meIsWaitingCurrentType) return const SizedBox.shrink();
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _quitWaitMic,
        child: Container(
          alignment: AlignmentDirectional.center,
          margin:
              const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
          height: 52,
          decoration: BoxDecoration(
              color: const Color(0XFFF5F5F5),
              borderRadius: BorderRadius.circular(26)),
          child: Text(
            K.room_cancel_wait_mic,
            style: const TextStyle(
                fontSize: 16.0,
                color: Color(0xFF313131),
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    }

    //申请上麦
    double btnWidth = (Util.width - 40.0);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              /// 麦序房转入其他房间时，不能上麦
              if (widget.room.isArtCenterInsertOtherRoom) {
                ArtCenterCanNotJoinMicDialog.show(
                    context: context, toRid: widget.room.config?.rid ?? 0);
                return;
              }

              Map? data = await RoomRepository.queue(
                  widget.room.realRid, RoomConstant.Queue_Join,
                  boss: widget.type == MicType.boss,
                  isAuction: widget.type == MicType.auction,
                  needCertify: false,
                  type: widget.room.needVerify,
                  newType: widget.room.needVerifyNew);

              if (data != null &&
                  data.containsKey('certify') &&
                  data['certify'] == false) {
                // 未认证
                Fluttertoast.showCenter(msg: K.room_up_mic_unauth);
              }
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              width: btnWidth,
              height: 52,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                K.room_apply_upmic,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubContent(WaitMicUserInfo data) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 2),
          child: UserSexAndAgeWidget(sex: data.sex, age: data.year, height: 14),
        ),
        UserNobilityWidget(
            titleNew: data.titleNew,
            padding: const EdgeInsetsDirectional.only(end: 2)),
        UserVipWidget(
            vip: data.vip, padding: const EdgeInsetsDirectional.only(end: 2)),
      ],
    );
  }
}
