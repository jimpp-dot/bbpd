import 'dart:async';

import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/bag/bag_api.dart';
import '../vip_mall/mixin/bag_item_mixin.dart';
import '../vip_mall/widget/mall_goods_widget.dart';
import 'bag_sub_page.dart';
import 'model/bag_bean.dart';

/// 我的背包页面
///
class BagPage extends StatefulWidget {
  static const String routeName = '/BagPage';
  final String? tabType;

  const BagPage({super.key, this.tabType});

  @override
  _BagPageState createState() => _BagPageState();

  static Future show(BuildContext context, {String? tabType}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BagPage(
        tabType: tabType,
      ),
      settings: const RouteSettings(name: routeName),
    ));
  }
}

class _BagPageState extends State<BagPage>
    with TickerProviderStateMixin, BagItemMixin {
  ExtendedTabController? _tabController;
  List<BagTab> _tabList = [];
  bool _loading = true;
  String? _errorMessage;

  BagGoods? bagGoods;
  bool _showPreview = false;

  final List<int> _redDotList = []; // tab红点管理

  @override
  void initState() {
    super.initState();
    _loadData();
    eventCenter.addListener(EventConstant.BagItemNumChanged, _onRefresh);

    eventCenter.addListener(EventConstant.EventBagItemChanged, _onFlushTop);
  }

  _onFlushTop(type, data) {
    bagGoods = data;
    if (bagGoods != null) {
      setState(() {
        _showPreview = true;
        bagGoods = data;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.BagItemNumChanged, _onRefresh);
    eventCenter.removeListener(EventConstant.EventBagItemChanged, _onFlushTop);
    _tabController?.removeListener(_onTabChange);
    _tabController?.dispose();
  }

  _onRefresh(type, data) {
    if (!mounted) return;
    _loadData(restoreIndex: _tabController?.index ?? 0);
  }

  Future _loadData({int? restoreIndex}) async {
    DataRsp<List<BagTab>> response = await BagApi.getBagTab();
    if (response.success == true) {
      _tabList = response.data ?? [];
      _initTabData(restoreIndex: restoreIndex);
    } else {
      _errorMessage = response.msg;
    }
    _loading = false;

    if (mounted) setState(() {});
  }

  _initTabData({int? restoreIndex}) {
    int initIndex = 0;
    if (_tabList.isNotEmpty) {
      if (restoreIndex != null) {
        if (restoreIndex >= 0 && restoreIndex < _tabList.length) {
          initIndex = restoreIndex;
        }
      } else {
        for (int i = 0; i < _tabList.length; i++) {
          if (_tabList[i].isNew == 1) {
            initIndex = i;
            break;
          }
        }

        String? tabType = widget.tabType;
        if (tabType != null && tabType.isNotEmpty) {
          for (int i = 0; i < _tabList.length; i++) {
            if (_tabList[i].type == tabType) {
              initIndex = i;
              break;
            }
          }
        }
      }
      _tabController?.removeListener(_onTabChange);
      _tabController?.dispose();
      safeRun(
        () => _tabController = ExtendedTabController(
            initialIndex: initIndex, length: _tabList.length, vsync: this)
          ..addListener(_onTabChange),
      );
      // 第一个定位的tab不显示红点
      for (int i = 0; i < _tabList.length; i++) {
        if (_tabList[i].isNew == 1 && initIndex != i) _redDotList.add(i);
      }
    }
  }

  _onTabChange() {
    if (_tabController == null || _tabController!.indexIsChanging) {
      return;
    }
    // 点击tab时移除红点
    if (_redDotList.contains(_tabController!.index)) {
      _redDotList.remove(_tabController!.index);
    }
    Tracker.instance.track(TrackEvent.backpack_page, properties: {
      'backpack_page_click': _tabList[_tabController!.index].name,
    });
    setState(() {
      _showPreview = false;
    });
  }

  _reload() {
    _loading = true;
    _tabList = [];
    _redDotList.clear();
    if (mounted) setState(() {});
    _loadData();
  }

  _gotoVipMallScreen() {
    Navigator.pop(context);
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    vipManager.show(context);
    Tracker.instance.track(TrackEvent.backpack_page, properties: {
      'backpack_page_click': 'shop',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: Text(
          K.vip_my_bag,
          style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: _gotoVipMallScreen,
              child: Container(
                height: 26,
                width: 86,
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.only(end: 20),
                padding: const EdgeInsetsDirectional.only(start: 4, end: 6),
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: R.colors.mainBrandGradientColors),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    R.img('bag_ic_shop.svg',
                        width: 22,
                        height: 22,
                        color: Colors.black,
                        package: ComponentManager.MANAGER_VIP),
                    Text(
                      K.vip_shop_home,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: _renderBody(),
    ).withCommonBg();
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    }
    if (!Util.isStringEmpty(_errorMessage)) {
      return Center(
        child: ErrorData(
          error: _errorMessage,
          fontColor: R.colors.mainTextColor,
          onTap: _reload,
        ),
      );
    }

    if (Util.isCollectionEmpty(_tabList)) {
      return EmptyWidget(
        textColor: R.colors.mainTextColor,
        onTap: _reload,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _renderTab(),
        Expanded(
          child: _renderTabBarView(),
        ),
      ],
    );
  }

  Widget _buildInnerImage() {
    var commodity = bagGoods as ShopMailCommodity;
    Log.d('bagGoods:${bagGoods?.extra}');
    Log.d('commodity.commodityType:${commodity.commodityType}');

    switch (commodity.commodityType) {
      case ShopMailCommodityType.EnterEffect:
        return buildEnterEffect(commodity);
      case ShopMailCommodityType.Frame:
        return HeaderFrameWidget(
          commodity.commodityAvatar,
          commodity.commodityImage,
          130,
          commodityLiveOnly: commodity.commodityLiveOnly,
          commodityLiveLabel: commodity.commodityLiveLabel,
        );
      case ShopMailCommodityType.Bubble:
        return buildBubble(commodity);
      case ShopMailCommodityType.MicrophoneEffect:
        return MicEffectWidget(
            commodity.commodityAvatar, commodity.commodityImage, 160.dp);
      case ShopMailCommodityType.DummyHonor:
      case ShopMailCommodityType.DummyMedal:
        return buildAchievementMedal(commodity);
      case ShopMailCommodityType.RoomListDecorate:
        return RoomListDecorate(
            commodity.commodityAvatar, commodity.commodityImage, 328.dp);
      default:
        return buildGift(commodity);
    }
  }

  Widget _renderTab() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: _tabList.map((e) => Tab(child: Text(e.name))).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: R.colors.mainTextColor,
        unselectedLabelColor: R.colors.secondTextColor,
        labelStyle: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(color: R.colors.secondTextColor, fontSize: 14),
        indicator: const BoxDecoration(),
        indicatorWeight: 0,
        marginStart: 6,
        marginEnd: 6,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        redDotIndex: _redDotList,
        tabItemAlign: const Alignment(0, 0.2),
      ),
    );
  }

  Widget _renderTabBarView() {
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: _tabList
          .map((e) => BagSubPage(
              tab: e,
              refreshCallback: () =>
                  _loadData(restoreIndex: _tabController?.index)))
          .toList(),
    );
  }
}
