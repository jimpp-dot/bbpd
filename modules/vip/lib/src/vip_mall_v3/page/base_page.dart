import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../pb/generated/rpc_shop.pb.dart';
import 'credit_sub_page.dart';
import 'goods_sub_page.dart';

class BasePage extends StatefulWidget {
  final String mainType;
  final List<ShopSubsetCate> subSets;
  final int subIndex;

  const BasePage(
      {super.key,
      required this.mainType,
      required this.subSets,
      this.subIndex = 0});

  @override
  State<StatefulWidget> createState() => BasePageState();
}

class BasePageState extends State<BasePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late String _tag;
  final List<Widget> _tabsWidget = [];
  final List<Widget> _pagesWidget = [];
  ExtendedTabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tag = "BasePageState_${widget.mainType}";
    _initTabs();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.subSets.isNotEmpty) {
      return Column(
        children: [
          SizedBox(height: 5.dp),
          _buildTabs(),
          Expanded(child: _buildSubPages()),
        ],
      );
    } else {
      return GoodsSubPage(type: widget.mainType);
    }
  }

  void _initTabs() {
    _tabController = ExtendedTabController(
        initialIndex:
            widget.subIndex < widget.subSets.length ? widget.subIndex : 0,
        length: widget.subSets.length,
        vsync: this);
    for (var e in widget.subSets) {
      _tabsWidget.add(Tab(child: Text(e.name)));
      if (e.page == "light_hot") {
        _pagesWidget.add(CreditSubPage(type: e.page)); // 积分兑换
      } else {
        _pagesWidget.add(GoodsSubPage(type: e.page, extra: e.storeWhere));
      }
    }
  }

  Widget _buildTabs() {
    return Container(
      height: 40,
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

  @override
  bool get wantKeepAlive => true;
}
