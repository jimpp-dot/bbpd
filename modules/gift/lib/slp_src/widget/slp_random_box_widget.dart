import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift/slp_intimate_pay_mixin.dart';
import 'package:gift/slp_src/gift/widget/slp_balance_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';
import '../../assets.dart';
import '../../k.dart';
import 'package:shared/k.dart' as BaseK;

import 'slp_money_not_enough_dialog.dart';

/// 随机礼盒：二级页
class SlpRandomBoxWidget extends StatefulWidget {
  final GiftScene giftScene;

  /// 随机礼物
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

  /// 要打赏的用户是否存在风险
  final bool isRisk;
  final ChatRoomData? room;
  final bool fromChat;
  final bool showIntimate;

  const SlpRandomBoxWidget({
    Key? key,
    required this.giftScene,
    required this.gift,
    required this.totalMoney,
    required this.inMicUids,
    required this.chooseNumConfig,
    required this.rid,
    required this.refer,
    required this.id,
    required this.isRisk,
    required this.room,
    required this.fromChat,
    required this.showIntimate,
  }) : super(key: key);

  static Future<bool?> show(
    BuildContext context, {
    required GiftScene giftScene,
    required BbGiftPanelGift gift,
    required int totalMoney,
    required List<RoomPosition> inMicUids,
    required List<BbGiftPanelChooseNumConfig> chooseNumConfig,
    required int rid,
    required String? refer,
    required int id,
    required bool isRisk,
    required ChatRoomData? room,
    required bool fromChat,
    required bool showIntimate,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.7,
      defineBarrierColor: Colors.black54,
      settings: const RouteSettings(name: '/gift_random_box_panel'),
      builder: (BuildContext context) {
        return SlpRandomBoxWidget(
          giftScene: giftScene,
          gift: gift,
          totalMoney: totalMoney,
          inMicUids: inMicUids,
          chooseNumConfig: chooseNumConfig,
          rid: rid,
          refer: refer,
          id: id,
          isRisk: isRisk,
          room: room,
          fromChat: fromChat,
          showIntimate: showIntimate,
        );
      },
    );
  }

  @override
  BbRandomBoxState createState() {
    return BbRandomBoxState();
  }
}

class BbRandomBoxState extends State<SlpRandomBoxWidget>
    with SlpIntimatePayMixin<SlpRandomBoxWidget> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final GlobalKey _selectNumKey = GlobalKey();

  /// 打赏礼物数量
  int _selectGiftNum = 1;

  /// 已选打赏uids
  List<int> selectUids = [];

  /// 随机礼盒奖池数据
  BoxGiftPoolInfo? pollInfo;
  bool loading = true;

  /// 当前余额
  int _totalMoney = 0;

  //所有麦上用户都被选中打赏
  bool _selectAllUsers = true;

  int _totalWeight = 0;

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

    load();
  }

  void load() async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/gift/boxInfo',
        queryParameters: {'gift_id': widget.gift.id},
        pb: true,
        throwOnError: true,
      );
      RspBoxGiftPoolInfo info =
          RspBoxGiftPoolInfo.fromBuffer(response.bodyBytes);
      if (info.success == true) {
        pollInfo = info.data;
        if (pollInfo != null) {
          _totalWeight = 0;
          for (var item in pollInfo!.poolGifts) {
            _totalWeight += item.weight;
          }
        }
      } else if (Util.validStr(info.msg)) {
        Fluttertoast.showCenter(msg: info.msg);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
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
            height: 336 * Util.ratio + 24 + Util.iphoneXBottom,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              color: _isInRoom
                  ? const Color(0xFF171621).withOpacity(0.7)
                  : R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
            child: _isInRoom ? wrapBlurBg(_buildColumn()) : _buildColumn(),
          )
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildTopBar(),
        Expanded(child: _buildBody()),
        if (pollInfo != null) _buildHandleBar(),
      ],
    );
  }

  Widget _buildTopBar() {
    return SizedBox(
      height: 44,
      child: BaseAppBar.custom(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.gift.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _isInRoom ? Colors.white : R.color.mainTextColor,
          ),
        ),
        backColor: _isInRoom ? Colors.white : R.color.mainTextColor,
      ),
    );
  }

  Widget _buildBody() {
    if (loading) {
      return const Loading();
    } else if (pollInfo == null) {
      return EmptyWidget(
        onTap: load,
        size: 140,
        paddingBottom: 0,
        textColor:
            _isInRoom ? Colors.white.withOpacity(0.4) : R.color.mainTextColor,
      );
    }

    return _buildPoll();
  }

  Widget _buildPoll() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pollInfo?.poolDesc ?? '',
              style: TextStyle(
                fontSize: 13,
                color: _isInRoom ? Colors.white60 : R.color.secondTextColor,
                height: 1.3,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 8),
            width: Util.width - 32,
            height: 192,
            decoration: BoxDecoration(
              color: _isInRoom ? Colors.white10 : Colors.black12,
              borderRadius: BorderRadiusDirectional.circular(8),
              border: Border.all(
                  color: _isInRoom
                      ? const Color(0x33F6F7F9)
                      : const Color(0x33202020),
                  width: 0.5),
            ),
            child: pageCount > 0
                ? Swiper(
                    itemCount: pageCount,
                    autoplay: pageCount > 1,
                    loop: pageCount > 1,
                    duration: 500,
                    itemBuilder: (context, index) => buildSwiperPage(index),
                    pagination: pageCount > 1
                        ? SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.only(bottom: 8),
                            builder: RectSwiperPaginationBuilder(
                              space: 2,
                              size: const Size(8, 4),
                              activeSize: const Size(8, 4),
                              activeColor: Colors.white.withOpacity(0.9),
                              color: Colors.white.withOpacity(0.3),
                              radius: 2,
                            ),
                          )
                        : null,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  static int numPerPage = 10;

  /// Swiper页数
  int get pageCount {
    if (!Util.validList(pollInfo?.poolGifts)) {
      return 0;
    }

    /// 每页展示10个礼物
    return (pollInfo!.poolGifts.length ~/ numPerPage) +
        ((pollInfo!.poolGifts.length % numPerPage > 0) ? 1 : 0);
  }

  int crossAxisCount = numPerPage ~/ 2;
  double childAspectRatio = ((Util.width - 32) / 5) / (192 / 2);

  Widget buildSwiperPage(int index) {
    int num = numPerPage;
    if (pollInfo!.poolGifts.length - index * numPerPage < numPerPage) {
      num = pollInfo!.poolGifts.length - index * numPerPage;
    }

    List<BoxGiftPoolGiftItem> list =
        pollInfo!.poolGifts.skip(index * numPerPage).take(num).toList();

    return GridView.count(
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      childAspectRatio: childAspectRatio,
      children: list.map((gift) => _buildGiftItem(gift)).toList(),
    );
  }

  Widget _buildGiftItem(BoxGiftPoolGiftItem gift) {
    String unit = MoneyConfig.moneyName;
    String priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.price));
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 6),
            CachedNetworkImage(
              placeholder: const CupertinoActivityIndicator(),
              imageUrl:
                  Util.getRemoteImgUrl(gift.icon) + Util.getGiftUrlSuffix(),
              width: 40,
              height: 40,
              cachedWidth: Util.getCommonCacheSize(60),
              cachedHeight: Util.getCommonCacheSize(60),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              gift.name,
              style: TextStyle(
                color: _isInRoom ? Colors.white : R.color.mainTextColor,
                fontSize: 11,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 2),
            Text(
              "$priceStr$unit",
              style: TextStyle(
                color: _isInRoom ? Colors.white60 : R.color.secondTextColor,
                fontSize: 10,
              ),
            )
          ],
        ),
        if (gift.weight > 0 && _totalWeight > 0)
          PositionedDirectional(top: 5, end: 5, child: _buildOdds(gift.weight)),
      ],
    );
  }

  Widget _buildOdds(int weight) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: R.colors.femaleGradientColors),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding:
          const EdgeInsetsDirectional.only(start: 4, top: 2, end: 4, bottom: 2),
      child: Text(
        // 最高精度为0.01%。显示如下：x% x.x% x.xx%
        '${((weight * 100 * 100 / _totalWeight).truncate() / 100)}%',
        style: const TextStyle(
            fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// 可能需要的最大钻石数
  int needMoney() {
    int userNum = selectUids.isEmpty ? 1 : selectUids.length;
    return userNum * _selectGiftNum * (pollInfo?.price ?? 0);
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              R.img(
                Assets.ic_up_arrow_svg,
                width: 16,
                height: 16,
                color: Colors.white,
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
      child: wrapBlurBg(
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
              : LinearGradient(colors: R.color.maleGradientColors),
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

  Widget wrapBlurBg(Widget child, {BorderRadius? radius}) {
    return ClipRRect(
      borderRadius:
          radius ?? const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: child,
      ),
    );
  }

  _changeAllUserSelect(bool select) {
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

    if (Util.parseInt(widget.id) > 0) {
      bool checkResult = await _checkCheat(widget.id);
      if (!checkResult) return;
    }

    if (price <= 0) return;

    int maxCost = needMoney();
    if (useIntimateCardPay && intimateCardInfo!.leftMoney < maxCost) {
      Fluttertoast.showCenter(msg: K.gift_intimate_money_not_enough);
      return;
    } else if (maxCost > _totalMoney) {
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

  Future<bool> _checkCheat(int uid) async {
    if (!widget.isRisk) return true;

    bool result = await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: BaseK.K.base_warm_prompt,
        content: BaseK.K.gift_risk_dialog_content,
        positiveButton: PositiveButton(
          text: BaseK.K.gift_risk_dialog_button_sure,
        ),
        negativeButton: NegativeButton(
          text: BaseK.K.base_go_back,
        ),
      ),
    );
    return result;
  }
}
