import 'dart:core';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'account/gold_coin_page.dart';
import 'account/lock_page.dart';
import 'account/normal_page.dart';
import 'account/statistics_page.dart';

/// 账目明细页
class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const StatementScreen(),
      settings: const RouteSettings(name: '/statement'),
    ));
  }
}

class _State extends State<StatementScreen>
    with
        TickerProviderStateMixin<StatementScreen>,
        AutomaticKeepAliveClientMixin<StatementScreen> {
  bool _canRestoreIap = false;
  TabController? _tabController;
  ValueNotifier<int>? _curTabIndex;
  final List<Widget> _tabs = [];
  final List<Widget> _pages = [];
  late IPayManager _payManager;

  @override
  void initState() {
    super.initState();
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    _initView();
    _curTabIndex = ValueNotifier<int>(0);
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabs.length, vsync: this)
        ..addListener(() => _curTabIndex?.value = _tabController!.index),
    );

    _checkRestoreIap();
  }

  @override
  void dispose() {
    _tabs.clear();
    _pages.clear();
    _tabController?.dispose();
    super.dispose();
  }

  _initView() {
    /// 交易
    _addPage(K.setting_deal, NormalPage(type: 'all', onReady: _onReady));

    // /// 提 + 现
    // if (Platform.isAndroid && !Util.isLocale) {
    //   _addPage(Util.concat(['提', '现']), NormalPage(type: Util.concat(['ca', 'sh']), onReady: this._onReady));
    // }

    /// 锁定
    _addPage(K.setting_lock, const LockPage(type: 'package'));

    /// 订单收入
    if (_showStatistics())
      _addPage(K.setting_order_income, const StatisticsPage());

    /// 金币
    if (Session.supportCoinUse)
      _addPage(K.setting_statement_gold_coin, const GoldCoinPage(type: 'coin'));

    /// 碎片
    _addPage(K.setting_piece, const GoldCoinPage(type: 'piece'));
  }

  /// 添加Page
  void _addPage(String tab, Widget page) {
    _tabs.add(Tab(child: Text(tab)));
    _pages.add(page);
  }

  void _checkRestoreIap() async {
    bool canRestore = await _payManager.canRestoreIAP();
    if (canRestore != _canRestoreIap && mounted) {
      setState(() {
        _canRestoreIap = canRestore;
      });
    }
  }

  // 无双队友 不显示订单收入
  bool _showStatistics() => Session.role == UserRole.GOD;

  _onReady(money, moneyLock, moneyOut, moneyDebts, parent) {}

  _onRestoreIap() async {
    DialogLoadingController loading = DialogLoadingController();
    loading.show(context: context);
    await _payManager.restoreIAP(context);
    loading.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
            appBar: BaseAppBar(K.detailed_accounts_title,
                statusBrightness: darkMode ? Brightness.dark : Brightness.light,
                backgroundColor: Colors.transparent,
                backColor: R.colors.mainTextColor,
                titleColor: R.colors.mainTextColor,
                // iOS关闭的订单也可能有问题，需要重置所有订单检查
                actionTitle: (_canRestoreIap || Platform.isIOS)
                    ? K.detailed_accounts_restore
                    : '', onPressed: () {
              if (Platform.isIOS || _canRestoreIap) {
                _onRestoreIap();
              }
            }),
            backgroundColor: Colors.transparent,
            body: _buildBody())
        .withCommonBg();
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTabs(),
        Expanded(
          child: _buildPages(),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return CommonTabBar(
        controller: _tabController,
        tabs: _tabs,
        isScrollable: true,
        labelColor: R.color.mainTextColor,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 4),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12));
  }

  Widget _buildPages() {
    return TabBarView(
        physics: const ClampingScrollPhysics(),
        controller: _tabController,
        children: _pages);
  }

  @override
  bool get wantKeepAlive => true;
}
