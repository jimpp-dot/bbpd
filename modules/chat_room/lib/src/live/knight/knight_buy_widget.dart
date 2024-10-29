import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/live/model/live_repository.dart';
import '../../../k.dart';
import 'knight_buy_page.dart';

class KnightBuyWidget extends StatefulWidget {
  final int rid;
  final int uid;
  final int level;
  final bool isLive;

  const KnightBuyWidget(this.rid, this.uid, this.isLive,
      {Key? key, this.level = 0})
      : super(key: key);

  @override
  _KnightBuyWidgetState createState() => _KnightBuyWidgetState();

  static Future show(BuildContext context, int rid, int uid, bool isLive,
      {int level = 0}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      // ),
      builder: (BuildContext context) {
        return KnightBuyWidget(rid, uid, isLive, level: level);
      },
    );
  }
}

class _KnightBuyWidgetState extends State<KnightBuyWidget>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  int _pageIndex = 0;
  final List<Widget> _tabsWidget = [];
  final List<Widget> _pagesWidget = [];
  final List<GlobalKey<KnightBuyPageState>> _pageKey = [];
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  ResKnightConfigList? _resKnightConfigList;
  KnightItem? _selectKnightItem;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _payManager.dispose(PayManagerType.knightBuy);
    super.dispose();
  }

  List<KnightItem>? get knightConfigData {
    if (Util.isVerify) {
      /// 该状态，特殊数据下发
      return _resKnightConfigList?.verifyData;
    }

    return _resKnightConfigList?.data;
  }

  _loadData() async {
    _resKnightConfigList =
        await LiveRepository.getKnightConfigData(widget.rid, widget.uid);
    if (_resKnightConfigList!.success && knightConfigData!.isNotEmpty) {
      refresh(() {
        _pageIndex = 0;
        knightConfigData!.forEachIndexed((index, element) {
          if (element.knightLevel == widget.level) {
            _pageIndex = index;
          }

          _tabsWidget.add(Tab(
              child: Text(element.knightName,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500))));

          GlobalKey<KnightBuyPageState> key = GlobalKey<KnightBuyPageState>();
          _pageKey.add(key);
          _pagesWidget
              .add(KnightBuyPage(widget.rid, widget.uid, element, key: key));
        });
        safeRun(
          () => _tabController = ExtendedTabController(
              initialIndex: _pageIndex, length: _tabsWidget.length, vsync: this)
            ..addListener(_onTabChanged),
        );
        _onTabChanged();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      // height: 46 +
      //     268 +
      //     117.dp +
      //     max(Util.iphoneXBottom, 20) +
      //     (_selectKnightItem?.knightCoupon.hasUcid() == true ? 50 : 0),
      height: _selectKnightItem?.knightCoupon.hasUcid() == true
          ? Util.width * 884 / 750 + 50
          : Util.width * 884 / 750,
      decoration: BoxDecoration(
        image: DecorationImage(
          //750 884
          image: (R.img(RoomAssets.chat_room$kaitong_bg_bg_png,
                  width: Util.width,
                  height: Util.width * 884 / 750,
                  package: RoomAssets.package) as Image)
              .image,
          fit: BoxFit.fill,
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_resKnightConfigList == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (!_resKnightConfigList!.success) {
      return ErrorData(
        error: _resKnightConfigList!.msg,
        onTap: _loadData,
      );
    }
    if (knightConfigData!.isEmpty || _selectKnightItem == null) {
      return EmptyWidget(onTap: _loadData);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: [
            Container(
              height: 40,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(end: 20),
              margin: const EdgeInsets.only(bottom: 4.0),
              child: CommonTabBar(
                tabs: _tabsWidget,
                controller: _tabController,
                marginStart: 0,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313131)),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.5),
                ),
                labelPadding:
                    const EdgeInsetsDirectional.only(start: 10, end: 10),
                indicator: const CommonUnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr(
                          widget.isLive ? 'k59' : 'k64'));
                },
                child: R.img(
                  'ic_help.svg',
                  width: 20,
                  height: 20,
                  color: Colors.black.withOpacity(0.6),
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          ],
        ),

        // Container(
        //   height: 1,
        //   margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
        //   color: const Color(0x99313131).withOpacity(0.04),
        // ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                double offset = notification.metrics.pixels;
                double screenWidth = MediaQuery.of(context).size.width;
                _tabController!.scrollPosition = offset / screenWidth;
              }
              return false;
            },
            child: ExtendedTabBarView(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              children: _pagesWidget,
            ),
          ),
        ),
        if (_selectKnightItem?.knightCoupon.hasUcid() == true) ...[
          Container(
            height: 42,
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _selectKnightItem?.knightCoupon.couponTips ?? '',
                    style: TextStyle(
                        color: R.color.mainTextColor.withOpacity(0.6),
                        fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    IPayManager payManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PAY);
                    payManager.pay(
                      context,
                      key: PayManagerType.knightBuy,
                      type: 'available',
                      args: {
                        'money': Util.parseInt(
                            _selectKnightItem?.knightCoupon.ductionMoney),
                        'type': 'package',
                        'params': {
                          'rid': widget.rid,
                          'uids': '${widget.uid}',
                          'cid': Util.parseInt(
                              _selectKnightItem?.knightCoupon.ucid),
                          'price': Util.parseInt(
                              _selectKnightItem?.knightCoupon.ductionMoney),
                          'duction_money': Util.parseInt(
                              _selectKnightItem?.knightCoupon.ductionMoney),
                          'knight_level': Util.parseInt(
                              _selectKnightItem?.knightCoupon.knightLevel)
                        }
                      },
                      onPayed: _onPayed,
                      onError: _onPayError,
                    );
                  },
                  child: Container(
                    width: 68,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFFF4C5C), Color(0xFFFF72D2)]),
                    ),
                    child: Text(
                      K.room_topic_to_use,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
        GestureDetector(
          onTap: _confirmClick,
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFFFF52D0), Color(0xFFFF72D2)]),
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(K.room_open_buy,
                    style: R.textStyle.medium16.copyWith(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  K.room_become_knight([(_selectKnightItem!.knightName)]),
                  style: R.textStyle.regular12
                      .copyWith(color: const Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: max(Util.iphoneXBottom, 20))
      ],
    );
  }

  _confirmClick() async {
    int selectPriceIndex = 0;
    if (_pageIndex < _pageKey.length) {
      GlobalKey<KnightBuyPageState> key = _pageKey[_pageIndex];
      selectPriceIndex = key.currentState!.selectIndex;
    }
    KnightDurationList selectItem =
        _selectKnightItem!.durationList[selectPriceIndex];
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, Util.parseInt(selectItem.durationPrice));
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _payManager.pay(
      context,
      key: PayManagerType.knightBuy,
      type: result.value?.key ?? '',
      args: {
        'money': Util.parseInt(selectItem.durationPrice),
        'type': 'package',
        'params': {
          'price': Util.parseInt(selectItem.durationPrice),
          'knight_level': _selectKnightItem!.knightLevel,
          'duration_level': selectItem.durationLevel,
          'rid': widget.rid,
          'uids': '${widget.uid}',
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayed() async {
    Fluttertoast.showCenter(msg: K.room_fans_buy_knight_success);
    eventCenter.emit(RoomConstant.EVENT_JOIN_FANS_GROUP_SUCCESS);
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(true);
    }
  }

  void _onPayError(bool isErrorCatch) {}

  _onTabChanged() {
    _pageIndex = _tabController!.index;
    if (_resKnightConfigList == null) return;
    if (_pageIndex < knightConfigData!.length) {
      _selectKnightItem = knightConfigData![_pageIndex];
      refresh();
    }
  }
}
