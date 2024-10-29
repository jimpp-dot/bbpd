import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/model/commodity_bean.dart';

import '../../../k.dart';
import 'friends_select_page.dart';

class SendGiftContactsPanel extends StatefulWidget {
  final CommodityBuyInfo buyInfo;
  final Item selectItem;
  final int cid;
  final String? type;
  final int num;

  const SendGiftContactsPanel(
      {super.key,
      required this.buyInfo,
      required this.selectItem,
      required this.cid,
      this.type,
      required this.num});

  static Future<bool?> show(BuildContext context, CommodityBuyInfo buyInfo,
      Item selectItem, int cid, String? type, int num) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 0.75,
        builder: (BuildContext context) {
          return SendGiftContactsPanel(
              buyInfo: buyInfo,
              selectItem: selectItem,
              cid: cid,
              type: type,
              num: num);
        });
  }

  @override
  State<StatefulWidget> createState() {
    return _SendGiftContactsPanelState(buyInfo, selectItem, num);
  }
}

class _SendGiftContactsPanelState extends State<SendGiftContactsPanel>
    with SingleTickerProviderStateMixin {
  List<Widget> _tabsWidget = [];
  late ExtendedTabController _tabController;
  final GlobalKey<FriendsSelectPageState> _keyFriend = GlobalKey();
  final GlobalKey<FriendsSelectPageState> _keyFollow = GlobalKey();
  final GlobalKey<FriendsSelectPageState> _keyFan = GlobalKey();
  final List<String> _tabs = ['好友', '关注', '粉丝'];
  List<GlobalKey<FriendsSelectPageState>> _keys = [];
  int _pageIndex = 0;
  SelectData selectData = SelectData();
  List<int> finalSelectIdList = [];
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final CommodityBuyInfo buyInfo;
  final Item selectItem;
  bool useCoupon = false;

  static int minPayMoney = 1;

  int _totalMoney = 0; // 原价
  int _reduceMoney = 0; // 优惠金额
  final int num;

  _SendGiftContactsPanelState(this.buyInfo, this.selectItem, this.num);

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'page_name': 'shop_send',
      'item_id': widget.cid,
      'item_type': widget.type ?? '',
    });
    _calcPrice();
    _initUI();
  }

  @override
  void dispose() {
    _payManager.dispose(buyType());
    super.dispose();
  }

  String buyType() {
    return 'deco-present';
  }

  void _initUI() {
    _tabsWidget = <Widget>[];
    for (int i = 0; i < _tabs.length; i++) {
      _tabsWidget.add(Tab(
        child: Text(_tabs[i]),
      ));
    }
    _keys = [_keyFriend, _keyFollow, _keyFan];
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _keys.length, vsync: this)
        ..addListener(onTapChange),
    );
  }

  onTapChange() {
    if (_pageIndex == _tabController.index) {
      return;
    }
    _pageIndex = _tabController.index;
    _keyFriend.currentState?.closeInput();
    for (int i = 0; i < _keys.length; i++) {
      _keys[i].currentState?.isCurrentTab = _pageIndex == i;
    }
  }

  void selectChanged() {
    finalSelectIdList.clear();

    List<int> showIdList = [];
    for (GlobalKey<FriendsSelectPageState> key in _keys) {
      if (key.currentState != null) {
        showIdList.addAll(key.currentState?.showIdList() ?? []);
        key.currentState?.setState(() {});
      }
    }

    for (int uid in selectData.selectIdList) {
      if (showIdList.contains(uid)) {
        finalSelectIdList.add(uid);
      }
    }

    _calcPrice();

    setState(() {});
  }

  void _calcPrice() {
    int person = finalSelectIdList.isNotEmpty ? finalSelectIdList.length : 1;
    int anum = num * person;

    // 商品总价
    _totalMoney = selectItem.unitPrice * anum;
    _reduceMoney = 0; // 优惠价格
    int couponReduce = 0;
    // 优惠券减免
    if (selectItem.couponId > 0 && selectItem.couponMoney > 0) {
      couponReduce = selectItem.couponMoney;
      _reduceMoney = couponReduce;
      useCoupon = true;
    }

    // 折扣价
    if (selectItem.ductionRate > 0 && num >= selectItem.ductionLimitMin) {
      int discountNum = anum;
      if (selectItem.ductionLimitMax > 0) {
        discountNum = min(discountNum, selectItem.ductionLimitMax);
      }
      int reduceMoney = (selectItem.unitPrice *
              discountNum *
              (100 - selectItem.ductionRate) /
              100)
          .floor();

      if (reduceMoney >= couponReduce) {
        _reduceMoney = reduceMoney;
        useCoupon = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String countStr = num > 1 ? ' x$num' : '';
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 44,
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsetsDirectional.only(start: 3),
              child: IntrinsicWidth(
                child: CommonTabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CommonUnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 3, color: R.color.mainTextColor),
                    insets: const EdgeInsetsDirectional.only(bottom: 3),
                    wantWidth: 16,
                    draggingWidth: 12.0,
                  ),
                  indicatorWeight: 0,
                  indicatorColor: R.color.mainTextColor,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  labelColor: R.color.mainTextColor,
                  unselectedLabelColor: R.color.secondTextColor,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    color: R.color.secondTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: _tabs
                      .map((text) => Tab(
                            text: text,
                          ))
                      .toList(),
                ),
              ),
            ),
            Expanded(
                child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _tabController.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _tabController,
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  FriendsSelectPage(
                    type: FriendsListType.Friend,
                    key: _keyFriend,
                    selectData: selectData,
                    selectChanged: selectChanged,
                    showSearchBar: true,
                  ),
                  FriendsSelectPage(
                      type: FriendsListType.Follow,
                      key: _keyFollow,
                      selectData: selectData,
                      selectChanged: selectChanged),
                  FriendsSelectPage(
                      type: FriendsListType.Fan,
                      key: _keyFan,
                      selectData: selectData,
                      selectChanged: selectChanged),
                ],
              ),
            )),
            Container(
              width: double.infinity,
              color: const Color(0x1051FCB6),
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 8, bottom: 8),
              child: Text(
                '${K.send_to_person([
                      finalSelectIdList.length.toString()
                    ])}  ${buyInfo.name}$countStr${selectItem.period}',
                style: TextStyle(fontSize: 13, color: R.color.mainBrandColor),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGoodsPrice(),
                      const SizedBox(height: 2),
                      if (selectItem.ductionExtra.isNotEmpty)
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(bottom: 2.0),
                          child: Text(
                            selectItem.ductionExtra,
                            style: TextStyle(
                                color: R.color.thirdTextColor, fontSize: 11.0),
                          ),
                        ),
                      _buildMyMoney(buyInfo),
                    ],
                  ),
                  const Spacer(),
                  _buildBuyButton(),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 获取金币 or 充值
  void _onCharge() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    if (Session.isLogined) {
      if (buyInfo.isGoldCoin()) {
        MissionManager.gotoMissionCenter(context);
      } else if (buyInfo.isMoney()) {
        ISettingManager? settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager?.openRechargeScreen(context, refer: 'shop');
      } else if (buyInfo.isBean()) {
        ISettingManager? settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager?.showExchangeBeanScreen(context, refer: 'shop');
      } else {
        if (buyInfo.pieceJumpPage.isEmpty) return;
        BaseWebviewScreen.show(context, url: buyInfo.pieceJumpPage);
      }
    } else {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
    }
  }

  void _onBuyTaped() async {
    if (buyInfo.isLimitBuy) {
      Fluttertoast.showToast(msg: buyInfo.limitDesc);
      return;
    }

    if (finalSelectIdList.isEmpty) {
      Toast.show(context, R.string('please_selecet_a_target_at_least'));
      return;
    }

    if (buyInfo.isMoney()) {
      _showPayBottomSheet();
    } else {
      _payManager.pay(
        context,
        key: buyType(),
        type: 'available',
        refer: 'shop',
        args: {
          'money': _totalMoney,
          'type': buyType(),
          'params': {
            'num': num,
            'uids': finalSelectIdList.join(','),
            'money_type': buyInfo.moneyType,
            'cid': selectItem.cid,
            'price': selectItem.unitPrice,
            'coupon_id': useCoupon ? selectItem.couponId : 0,
            'duction_money': _reduceMoney,
            'version': 2,
          }
        },
        onPayed: _onPayed,
        onError: _onPayError,
      );
    }
  }

  void _showPayBottomSheet() async {
    int discountPrice = max(_totalMoney - _reduceMoney, minPayMoney);

    SheetCallback? result =
        await _payManager.showRechargeSheet(context, discountPrice);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    int couponId = selectItem.couponId;
    int ductionMoney = _reduceMoney;
    if (useCoupon && selectItem.isNewPayInvalid()) {
      ductionMoney = 0;
      couponId = 0;
    }

    _payManager.pay(
      context,
      key: buyType(),
      type: result.value?.key ?? '',
      refer: 'shop',
      args: {
        'money': _totalMoney,
        'type': buyType(),
        'params': {
          'num': num,
          'uids': finalSelectIdList.join(','),
          'money_type': buyInfo.moneyType,
          'cid': selectItem.cid,
          'price': selectItem.unitPrice,
          'coupon_id': couponId,
          'duction_money': ductionMoney,
          'version': 2,
          'gift_scene': 'shop'
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayError(bool isErrorCatch) {
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_card_click': 'action_send',
      'item_id': '${buyInfo.cid}',
      'item_type': widget.type ?? '',
      'item_status': 'others',
    });
  }

  void _onPayed() {
    Navigator.of(context).pop(true);
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_card_click': 'action_send',
      'item_id': '${buyInfo.cid}',
      'item_type': widget.type ?? '',
      'item_status': 'success_sent',
    });
    Toast.show(
        context,
        K.sent_gifts_to_person([
          '${buyInfo.name}${selectItem.period}',
          '${finalSelectIdList.length}'
        ]));
  }

  // 商品价格
  Widget _buildGoodsPrice() {
    int discountPrice = max(_totalMoney - _reduceMoney, minPayMoney);

    Widget icon = Container();
    String priceStr = Util.removeDecimalZeroFormat(discountPrice / 1);
    String totalMoneyStr = Util.removeDecimalZeroFormat(_totalMoney / 1);
    if (buyInfo.isGoldCoin()) {
      icon = R.img('ic_coin.png',
          width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE);
    } else if (buyInfo.isMoney()) {
      icon = Image.asset(
        MoneyConfig.moneyIcon,
        width: 16.0,
        height: 16.0,
      );
      priceStr = MoneyConfig.moneyNum(discountPrice);
      totalMoneyStr = MoneyConfig.moneyNum(_totalMoney);
    } else if (buyInfo.isBean()) {
      icon = Image.asset(
        MoneyConfig.goldBeanIcon,
        width: 16.0,
        height: 16.0,
      );
    } else {
      if (buyInfo.pieceIcon.isNotEmpty) {
        icon = CachedNetworkImage(
          imageUrl: buyInfo.pieceIcon,
          width: 16.0,
          height: 16.0,
        );
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        // 折扣价
        NumText(
          priceStr,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (_reduceMoney != 0)
          Text(
            '${K.vip_origin_price}$totalMoneyStr',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: R.color.secondTextColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          )
      ],
    );
  }

  // 我的余额
  Widget _buildMyMoney(CommodityBuyInfo data) {
    String myMoney;
    String getText = K.vip_get;
    if (data.isMoney()) {
      getText = K.vip_recharge;
    } else if (data.isBean()) {
      getText = K.vip_coin_exchange;
    }
    if (data.isGoldCoin()) {
      myMoney = '${data.goldCoin}${K.gift_coin_unit}';
    } else if (data.isMoney()) {
      myMoney = '${MoneyConfig.moneyNum(data.money)}${MoneyConfig.moneyName1}';
    } else if (data.isBean()) {
      myMoney = '${data.goldBean}${K.vip_gold_bean}';
    } else {
      myMoney = '${data.pieceBalance}${data.pieceDesc}';
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onCharge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            myMoney,
            style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w500),
          ),
          if (data.isMoney() ||
              data.isBean() ||
              data.isGoldCoin() ||
              data.showJumpPage())
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  color: R.color.thirdTextColor,
                ),
                Text(
                  getText,
                  style: TextStyle(
                      color: R.color.thirdTextColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                ),
                R.img(
                  'mall/ic_arrow.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_VIP,
                  color: R.color.thirdTextColor,
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onBuyTaped,
      child: Container(
        width: 150,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          K.vip_goto_send,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
