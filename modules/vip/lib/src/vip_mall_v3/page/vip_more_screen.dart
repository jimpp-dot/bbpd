import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/page/bags_sub_page.dart';
import 'package:vip/src/vip_mall_v3/page/goods_sub_page.dart';
import '../../pb/generated/rpc_shop.pb.dart';
import '../../vip_mall/widget/bag_button.dart';

class VipMoreScreen extends StatefulWidget {
  final String? title;
  final List<ShopSubsetCate> subSets;

  const VipMoreScreen({super.key, this.title, required this.subSets});

  @override
  State<StatefulWidget> createState() => VipMoreScreenState();

  static Future show(BuildContext context, List<ShopSubsetCate> subSets,
      {String? title}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VipMoreScreen(title: title, subSets: subSets),
      settings: const RouteSettings(name: "/vipMoreScreen"),
    ));
  }
}

class VipMoreScreenState extends State<VipMoreScreen>
    with BaseScreenStateMixin, TickerProviderStateMixin {
  final List<Widget> _tabsWidget = [];
  final List<Widget> _pagesWidget = [];
  ExtendedTabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.homeSecondBgColor,
        appBar: _buildAppBar(),
        body: buildStatusContent());
  }

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  void _initTabs() {
    if (widget.subSets.isEmpty) {
      setScreenEmpty(emptyMsgColor: R.colors.mainTextColor);
    } else {
      _tabController = ExtendedTabController(
          initialIndex: 0, length: widget.subSets.length, vsync: this);
      for (var e in widget.subSets) {
        _tabsWidget.add(Tab(child: Text(e.name)));
        if (e.page == "shop_bag_list") {
          _pagesWidget.add(BagsSubPage(bagType: e.parentBType));
        } else {
          _pagesWidget.add(GoodsSubPage(type: e.page, extra: e.storeWhere));
        }
      }
      setScreenReady();
    }
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        _buildTabs(),
        Expanded(child: _buildSubPages()),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      backgroundColor: Colors.transparent,
      backColor: R.colors.mainTextColor,
      title: Text(
        widget.title ?? "",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: R.colors.mainTextColor,
        ),
      ),
      actions: <Widget>[const BagButton(), SizedBox(width: 16.dp)],
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: _tabsWidget,
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
        marginStart: 6,
        marginEnd: 6,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        tabItemAlign: const Alignment(0, 0.2),
      ),
    );
  }

  Widget _buildSubPages() {
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: _pagesWidget,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
}
