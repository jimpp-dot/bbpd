import 'dart:ui';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift/widget/slp_balance_widget.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_util.dart';
import 'package:gift/slp_src/gift_suit/pb/generated/gift_suit.pb.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_repo.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';
import '../../assets.dart';
import '../../k.dart';

import '../gift/slp_intimate_pay_mixin.dart';
import '../widget/slp_money_not_enough_dialog.dart';

///礼物套装专属奖励面板
class GiftSuitRewardPanel extends StatefulWidget {
  final GiftScene giftScene;
  final BbGiftPanelGift gift;

  /// 钻石账户money
  final int totalMoney;

  /// 麦上用户列表
  final List<RoomPosition> inMicUids;

  /// 礼物选择数量
  final List<BbGiftPanelChooseNumConfig> chooseNumConfig;

  /// 房间ID
  final int rid;

  /// refer
  final String? refer;

  /// 单人打赏
  final int id;

  final ChatRoomData? room;
  final bool fromChat;
  final DisplayPage? page;
  final bool showIntimate;

  const GiftSuitRewardPanel({
    super.key,
    required this.giftScene,
    required this.gift,
    required this.totalMoney,
    required this.inMicUids,
    required this.chooseNumConfig,
    required this.rid,
    this.refer,
    required this.id,
    this.room,
    required this.fromChat,
    this.page,
    required this.showIntimate,
  });

  static Future<bool?> show(
    BuildContext context, {
    required GiftScene giftScene,
    required BbGiftPanelGift gift,
    required int totalMoney,
    required List<RoomPosition> inMicUids,
    required List<BbGiftPanelChooseNumConfig> chooseNumConfig,
    required int rid,
    String? refer,
    required int id,
    ChatRoomData? room,
    required bool fromChat,
    DisplayPage? page,
    required bool showIntimate,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.7,
      settings: const RouteSettings(name: '/gift_suit_reward_panel'),
      builder: (BuildContext context) {
        return GiftSuitRewardPanel(
          giftScene: giftScene,
          gift: gift,
          totalMoney: totalMoney,
          inMicUids: inMicUids,
          chooseNumConfig: chooseNumConfig,
          rid: rid,
          refer: refer,
          id: id,
          room: room,
          fromChat: fromChat,
          page: page,
          showIntimate: showIntimate,
        );
      },
    );
  }

  @override
  _GiftSuitRewardPanelState createState() => _GiftSuitRewardPanelState();
}

class _GiftSuitRewardPanelState extends State<GiftSuitRewardPanel>
    with TickerProviderStateMixin, SlpIntimatePayMixin<GiftSuitRewardPanel> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final GlobalKey _selectNumKey = GlobalKey();
  ExtendedTabController? _tabController;
  List<GetSuitInfoResp_Tab> _tabList = [];

  /// 打赏礼物数量
  int _selectGiftNum = 1;

  /// 已选打赏uids
  List<int> selectUids = [];

  /// 奖励数据
  GetSuitInfoResp? _rewardRsp;
  bool _loading = true;

  /// 当前余额
  int _totalMoney = 0;

  //所有麦上用户都被选中打赏
  bool _selectAllUsers = true;

  @override
  bool get supportSlpIntimate => widget.showIntimate;

  @override
  void initState() {
    super.initState();

    if (widget.id > 0) {
      /// 私聊打赏，房间单人打赏。不展示用户列表，直接选中
      selectUids.add(widget.id);
    } else if (widget.inMicUids.isNotEmpty) {
      for (RoomPosition roomPosition in widget.inMicUids) {
        // 直播：默认只勾选主播
        // 其他：全选
        bool isTalent = ChatRoomUtil.isLiveTalent(widget.room?.config);
        if (!isTalent &&
            widget.room?.config?.types == RoomTypes.Live &&
            roomPosition.uid > 0 &&
            roomPosition.uid == widget.room?.createor?.uid) {
          selectUids.add(roomPosition.uid);
          break;
        } else {
          if (roomPosition.uid > 0) {
            selectUids.add(roomPosition.uid);
          }
        }
      }
    }

    _refreshSelectedUsers();

    _totalMoney = widget.totalMoney;

    _load();
  }

  void _load() async {
    _rewardRsp = await GiftSuitRepo.rewardPanel(widget.gift.id);
    _loading = false;
    if (_rewardRsp!.success) {
      _tabList = _rewardRsp!.data.tabs
          .where((e) => GiftSuitUtil.supportTab(e.tabId))
          .toList();
      _tabController ??=
          ExtendedTabController(length: _tabList.length, vsync: this);
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMicUsers(),
          Container(
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              color: !widget.fromChat
                  ? const Color(0xFF171621).withOpacity(0.7)
                  : (darkMode ? const Color(0xFF171621) : R.color.mainBgColor),
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(16), topEnd: Radius.circular(16)),
            ),
            child: _isInRoom ? _wrapBlurBg(_buildBody()) : _buildBody(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading || _rewardRsp?.success != true) {
      return Container(
        height: 336.dp,
        alignment: AlignmentDirectional.center,
        child: _loading
            ? const Loading()
            : EmptyWidget(
                onTap: () {
                  _loading = true;
                  refresh();
                  _load();
                },
                size: 140,
                paddingBottom: 0,
                desc: _rewardRsp?.msg,
                textColor: !widget.fromChat || darkMode
                    ? Colors.white.withOpacity(0.4)
                    : R.color.mainTextColor,
              ),
      );
    }
    return SizedBox(
      height: 336.dp,
      child: Column(
        children: [
          _buildTopBar(_rewardRsp!.data),
          Expanded(child: _buildContent(_rewardRsp!.data)),
        ],
      ),
    );
  }

  Widget _buildTopBar(GetSuitInfoResp_Data data) {
    return SizedBox(
      height: 44,
      child: BaseAppBar.custom(
          backgroundColor: Colors.transparent,
          title: Text(
            data.title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: !widget.fromChat || darkMode
                    ? Colors.white
                    : R.color.mainTextColor),
          ),
          backColor: !widget.fromChat || darkMode
              ? Colors.white
              : R.color.mainTextColor),
    );
  }

  Widget _buildContent(GetSuitInfoResp_Data data) {
    String desc = data.desc;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 6, start: 16, end: 16),
          child: Text(
            desc,
            style: TextStyle(
                fontSize: 12,
                color: !widget.fromChat || darkMode
                    ? Colors.white.withOpacity(0.5)
                    : R.color.secondTextColor),
          ),
        ),
        const Spacer(),
        Container(
          height: 44,
          alignment: AlignmentDirectional.centerStart,
          child: CommonTabBar(
            tabs: _tabList.map((e) => Tab(child: Text(e.name))).toList(),
            isScrollable: true,
            controller: _tabController!,
            labelColor: !widget.fromChat || darkMode
                ? Colors.white
                : R.color.mainTextColor,
            unselectedLabelColor: !widget.fromChat || darkMode
                ? Colors.white.withOpacity(0.7)
                : R.color.secondTextColor,
            labelStyle: TextStyle(
              color: !widget.fromChat || darkMode
                  ? Colors.white
                  : R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              color: !widget.fromChat || darkMode
                  ? Colors.white.withOpacity(0.7)
                  : R.color.secondTextColor,
              fontSize: 14,
            ),
            indicator: const BoxDecoration(),
            indicatorWeight: 0,
            marginStart: 6,
            labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            tabItemAlign: const Alignment(0, 0),
          ),
        ),
        SizedBox(
          height: 115.dp,
          child: ExtendedTabBarView(
            controller: _tabController,
            children: _tabList
                .map((e) => _SubRewardTabPage(e, widget.fromChat))
                .toList(),
          ),
        ),
        const Spacer(),
        _buildHandleBar(),
      ],
    );
  }

  /// 可能需要的最大钻石数
  int _needMoney() {
    int userNum = selectUids.isEmpty ? 1 : selectUids.length;
    return userNum * _selectGiftNum * widget.gift.price;
  }

  /// 操作条
  Widget _buildHandleBar() {
    List<Widget> widgets = [];

    BbGiftPanelGift gift = widget.gift;

    double numMaxWidth = gift.isCombo == 1 ? 68 * Util.ratio : 168 * Util.ratio;

    int realTotalMoney = _totalMoney;
    widgets = [
      SlpBalanceWidget(
        ratio: 1,
        numMaxWidth: numMaxWidth,
        selfMoney: realTotalMoney,
        showIntimate: supportSlpIntimate,
        dark: darkMode || !widget.fromChat,
      ),
      const Spacer(),
      // 选择数量
      GestureDetector(
        onTap: _switchNum,
        child: Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: R.color.mainBrandColor, width: 1),
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              bottomStart: Radius.circular(16),
            ).resolve(Directionality.of(context)),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 4),
                child: Text(
                  "x$_selectGiftNum",
                  style: TextStyle(
                    color: R.color.mainBrandColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              R.img(
                Assets.ic_up_arrow_svg,
                width: 16,
                height: 16,
                color: R.color.mainBrandColor,
                package: ComponentManager.MANAGER_GIFT,
                key: _selectNumKey,
              ),
            ],
          ),
        ),
      ),
      // 赠送按钮
      GestureDetector(
        onTap: () {
          _submit();
        },
        child: Container(
          width: 60,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(16),
              bottomEnd: Radius.circular(16),
            ),
          ),
          child: Text(
            K.give_something,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  _switchNum() async {
    RenderBox rowRenderBox =
        _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset =
        rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));
    SlpGiftNumSelectWidget.show(
            context, widget.chooseNumConfig, _selectGiftNum, offset)
        .then((value) {
      if (Util.parseInt(value?[0]) > 0) {
        if (mounted) {
          setState(() {
            _selectGiftNum = value![0];
          });
        }
      }
    });
  }

  /// 房间内打赏的用户列表
  Widget _buildMicUsers() {
    if (!Util.validList(widget.inMicUids) || widget.rid <= 0 || widget.id > 0) {
      /// 仅在房间内有人在麦上，且不是单人打赏
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      child: _wrapBlurBg(
        Container(
          height: 60,
          width: Util.width - 16,
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF171621).withOpacity(0.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Text(
                K.gift_send,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 13),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.inMicUids.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildMicAvatar(index);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _renderSelectAll(),
            ],
          ),
        ),
        radius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _renderSelectAll() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _changeAllUserSelect(!_selectAllUsers);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: _selectAllUsers
              ? null
              : LinearGradient(colors: R.color.mainBrandGradientColors),
          color: _selectAllUsers ? Colors.white.withOpacity(0.2) : null,
        ),
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        alignment: AlignmentDirectional.center,
        child: Text(
          _selectAllUsers ? K.gift_cancel_all : K.gift_all_mic,
          style: const TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMicAvatar(int index) {
    if (widget.inMicUids.isEmpty) {
      return const SizedBox.shrink();
    }
    RoomPosition user = widget.inMicUids.elementAt(index);
    String? image = user.icon;

    bool selected = selectUids.contains(user.uid);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectUids.contains(user.uid)) {
            selectUids.remove(user.uid);
          } else {
            selectUids.add(user.uid);
          }

          _refreshSelectedUsers();
        });
      },
      child: Container(
        height: 38,
        width: 32,
        margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        selected ? R.color.mainBrandColor : Colors.transparent,
                    width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: CommonAvatar(
                key: ValueKey(image),
                size: 32,
                path: image,
                shape: BoxShape.circle,
                suffix: (image.contains('ic_mystery.png')) ? '' : '!head150',
              ),
            ),
            PositionedDirectional(
              end: -2,
              top: -2,
              child: IgnorePointer(
                child: selected ? _buildSelectMic() : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMic() {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: R.color.mainBrandGradientColors,
        ),
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
        Assets.ic_mic_select_svg,
        package: ComponentManager.MANAGER_GIFT,
        width: 14,
        height: 14,
        color: const Color(0xFFD4FA00),
      ),
    );
  }

  Widget _wrapBlurBg(Widget child, {BorderRadius? radius}) {
    return ClipRRect(
      borderRadius:
          radius ?? const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: child,
      ),
    );
  }

  void _changeAllUserSelect(bool select) {
    selectUids.clear();
    if (select) {
      for (RoomPosition roomPosition in widget.inMicUids) {
        /// 全选
        if (roomPosition.uid > 0) {
          selectUids.add(roomPosition.uid);
        }
      }
    }
    _refreshSelectedUsers();
  }

  void _refreshSelectedUsers() {
    _selectAllUsers = selectUids.length == widget.inMicUids.length;
  }

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene) && widget.rid > 0;
  }

  bool _isPaying = false;

  /// 礼物总价
  int _totalPrice = 0;

  /// 总个数
  int _totalNum = 0;

  int get price => widget.gift.price;

  _submit() async {
    if (widget.gift.id <= 0) return;
    if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;

    int userNum = _isInRoom ? selectUids.length : 1;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }
    int finalGiftNum = _selectGiftNum;
    if (finalGiftNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_select_a_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    if (price <= 0) return;

    int maxCost = _needMoney();
    if (maxCost > _totalMoney && !useIntimateCardPay) {
      /// 需要有最大花费（最大礼物单价*礼物个数*人数）的余额，才可以赠送，否则，弹充值提示弹窗
      bool recharge = await SlpMoneyNotEnoughDialog.show(context, maxCost);

      /// 刷新余额
      if (recharge) {
        BalanceInfo? data = await BalanceInfo.loadBalanceInfo();
        if (mounted && data != null) {
          setState(() {
            _totalMoney = data.available;
          });
        }
      }
      return;
    }

    _totalPrice = price * finalGiftNum * userNum;

    _totalNum = finalGiftNum * userNum;

    /// 前面拦截了最大花费，仅走余额支付即可
    _pay('available');
  }

  _pay(String type) {
    int finalGiftNum = _selectGiftNum;
    if (_isPaying) return;

    _isPaying = true;
    if (_isInRoom) {
      Map params = {
        'rid': widget.rid,
        'uids': selectUids.join(','),
        'positions': _getSelectPosition().join(','),
        'position': _getMyPosition(),
        'giftId': widget.gift.id,
        'giftNum': finalGiftNum,
        'price': price,
        'cid': 0,
        'ctype': '',
        'duction_money': 0,
        'version': 2,
        'num': _totalNum,
        'gift_type': widget.gift.giftType,
        'star': 0,
        'show_pac_man_guide':
            Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
        'refer': widget.room != null ? '${widget.room?.refer}:room' : '',
        'all_mic': _isAllMic() ? 1 : 0,
        'gift_refer': widget.refer ?? '', // 打开礼物面板本身的refer
        'gift_tab': widget.page != null ? describeEnum(widget.page) : '',
        // 亲密卡id
        if (intimateCardInfo != null)
          'intimate_card_id': '${intimateCardInfo!.cardId}'
      };

      _payManager.pay(context,
          key: 'gift',
          type: type,
          refer: 'gift',
          args: {'money': _totalPrice, 'type': 'package', 'params': params},
          showLoading: type != IPayManager.pTAvailable,
          onPayed: () => _onPayed(),
          onError: (isErrorCatch) => _onPayError(isErrorCatch),
          onPayAppOpen: () {
            _isPaying = false;
          });
    } else if (widget.giftScene == GiftScene.private) {
      _payManager.pay(context,
          key: 'gift',
          type: type,
          refer: 'gift',
          args: {
            'money': _totalPrice,
            'type': 'chat-gift',
            'params': {
              'notify_group_id': widget.room?.chatGroupId ?? 0,
              'to': widget.id,
              'giftId': widget.gift.id,
              'giftNum': finalGiftNum,
              'cid': 0,
              'ctype': '',
              'duction_money': 0,
              'version': 2,
              'num': _totalNum,
              'gift_type': widget.gift.giftType,
              'star': 0,
              'show_pac_man_guide':
                  Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
              'all_mic': _isAllMic() ? 1 : 0,
              'gift_tab': widget.page != null ? describeEnum(widget.page) : '',
            }
          },
          onPayed: () => _onPayed(),
          onError: (isErrorCatch) => _onPayError(isErrorCatch),
          onPayAppOpen: () {
            _isPaying = false;
          });
    } else {
      _isPaying = false;
      Fluttertoast.showToast(
          msg: K.wrong_purchase_option, gravity: ToastGravity.CENTER);
    }
  }

  void _onPayed() {
    _isPaying = false;
    int finalGiftNum = _selectGiftNum;
    if (widget.fromChat == true) {
      bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
      Map orderSayHiUids = Im.orderSayHiUids;
      String targetId = widget.id.toString();
      if (orderSayHiUids.containsKey(targetId)) {
        toDate = true;
        orderSayHiUids.remove(targetId);
      }

      Tracker.instance.track(TrackEvent.chat, properties: {
        'target_uid': widget.id,
        'message_type': 'gift',
        'ref': Im.refer,
        if (toDate) 'to_date': true,
      });
    }

    ChatRoomData? room0 = _isInRoom ? widget.room : null;

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': _isInRoom
          ? 'room'
          : widget.giftScene == GiftScene.private
              ? 'private'
              : 'order',
      'rid': _isInRoom ? widget.room?.rid : 0,
      'gift_name': widget.gift.name,
      'gift_id': widget.gift.id,
      'gift_price': price,
      'gift_num': finalGiftNum,
      'user_num': _isInRoom ? selectUids.length : 1,
      'total_price': price * finalGiftNum,
      'gift_type': widget.gift.giftType,
      'is_combo': 2,
      'gift_award_id': 0,
      'gift_award_name': '',
      'gift_award_type': '',
      'award_progress': 0,
      if (room0 != null) 'chat_room_type': room0.config?.type,
      if (room0 != null)
        'chat_room_property': room0.config?.property.toString(),
      if (room0 != null) 'chat_room_types': room0.config?.types.toString(),
      if (!Util.isNullOrEmpty(room0?.config?.typeName))
        'type_label': room0?.config?.typeName,
      if (!Util.isNullOrEmpty(room0?.config?.originalRFT))
        'room_factory_type': room0?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room0?.config?.settlementChannel))
        'settlement_channel': room0?.config?.settlementChannel,
    };

    if (_isInRoom) {
      ChatRoomData? room = ChatRoomData.getInstance();
      String roomType = room?.config?.type ?? '';
      properties['time'] = DateTime.now().millisecondsSinceEpoch;
      properties['room_type'] = roomType;
      properties['refer'] = room?.refer ?? '';
      properties['is_pk'] = room?.gpkEnable ?? false;
      if (room?.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        properties['game_type'] = wereWolfManager.getGameType();
      }
    }

    if (_isInRoom) {
      for (var element in selectUids) {
        properties['to_uid'] = element;
        Tracker.instance.track(TrackEvent.send_gift, properties: properties);
      }
    } else {
      if (Util.parseInt(widget.id) > 0) {
        properties['to_uid'] = widget.id;
      }
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    if (intimateCardInfo != null) {
      refreshIntimateCard(); // 刷新亲密卡余额
    }

    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop(true);
    }
    eventCenter.emit("Gift.SendSuccess");
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }

  // 选中的麦序
  List<int> _getSelectPosition() {
    List<int> positions = [];
    for (int i = 0; i < widget.inMicUids.length; ++i) {
      RoomPosition p = widget.inMicUids[i];
      if (selectUids.contains(p.uid)) {
        positions.add(p.position);
      }
    }

    return positions;
  }

  // 我的麦序
  int _getMyPosition() {
    int myPosition = -1;

    // _position
    widget.room?.positions.forEach((RoomPosition position) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        myPosition = position.position;
      }
    });

    return myPosition;
  }

  bool _isAllMic() {
    //全麦
    if (!_isInRoom) return false;
    bool allMic = true;
    for (RoomPosition position in widget.room!.positions) {
      if (position.uid == Session.uid) {
        continue;
      }
      if (position.uid == 0 || !selectUids.contains(position.uid)) {
        allMic = false;
        break;
      }
    }
    return allMic;
  }
}

class _SubRewardTabPage extends StatefulWidget {
  final GetSuitInfoResp_Tab tab;
  final bool fromChat;

  const _SubRewardTabPage(this.tab, this.fromChat);

  @override
  State<_SubRewardTabPage> createState() => _SubRewardTabPageState();
}

class _SubRewardTabPageState extends State<_SubRewardTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 115.dp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 16.dp),
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(widget.tab.items[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8.dp);
        },
        itemCount: widget.tab.items.length,
      ),
    );
  }

  Widget _buildItem(GetSuitInfoResp_Tab_TabItem item) {
    bool decorate = widget.tab.tabId == 1;
    double cardW = decorate ? 109.dp : 167.5.dp;
    double cardH = 115.dp;
    double rewardW = decorate ? 60.dp : 140.dp;
    double rewardH = decorate ? 60.dp : 39.dp;
    return Container(
      width: cardW,
      height: cardH,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: !widget.fromChat || darkMode
            ? Colors.white.withOpacity(0.06)
            : R.color.mainTextColor.withOpacity(0.06),
      ),
      child: Column(
        children: [
          SizedBox(height: decorate ? 16.5.dp : 23.5.dp),
          CachedNetworkImage(
            imageUrl: item.img,
            width: rewardW,
            height: rewardH,
            fit: BoxFit.contain,
          ),
          SizedBox(height: decorate ? 5.dp : 16.5.dp),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 14,
              color: !widget.fromChat || darkMode
                  ? Colors.white
                  : R.color.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
