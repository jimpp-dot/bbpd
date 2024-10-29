import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/page/trade_page.dart';

import '../../k.dart';

/// 交易历史页面
/// 冲鸭用
///
class TradeHistoryScreen extends StatefulWidget {
  const TradeHistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TradeHistoryState();
  }

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TradeHistoryScreen(),
      settings: const RouteSettings(name: '/trade_history'),
    ));
  }
}

class TradeHistoryState extends State<TradeHistoryScreen>
    with TickerProviderStateMixin {
  final List<Widget> _tabs = [];
  final List<Widget> _pages = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _initView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.setting_trade_history),
      body: Column(
        children: <Widget>[
          Container(
            height: 44,
            alignment: Alignment.bottomCenter,
            child: CommonTabBar(
              tabs: _tabs,
              controller: _tabController,
              labelStyle: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              unselectedLabelColor: R.color.mainTextColor.withOpacity(0.7),
              indicatorWeight: 6,
              indicatorPadding: const EdgeInsetsDirectional.only(top: 6),
              labelPadding: const EdgeInsets.symmetric(horizontal: 40),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const ClampingScrollPhysics(),
              controller: _tabController,
              children: _pages,
            ),
          )
        ],
      ),
    );
  }

  void _initView() {
    _tabs.add(Tab(
      child: Text(K.setting_deal),
    ));
    _pages.add(const TradePage("all"));
    if (Session.supportCoinUse) {
      _tabs.add(Tab(
        child: Text(K.setting_statement_gold_coin),
      ));
      _pages.add(const TradePage("coin"));
    }
    safeRun(() {
      _tabController =
          TabController(initialIndex: 0, length: _tabs.length, vsync: this);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
}
