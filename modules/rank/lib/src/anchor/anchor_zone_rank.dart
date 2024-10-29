import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import 'anchor_zone_rank_model.dart';
import 'anchor_zone_rank_page.dart';
import 'anchor_zone_rank_repository.dart';
import 'package:shared/widget/explain_button.dart';

/// 主播专区-排行榜
class AnchorZoneRankScreen extends StatefulWidget {
  final int groupId;
  final String? refer;

  const AnchorZoneRankScreen(this.groupId, this.refer, {super.key});

  @override
  _AnchorZoneRankScreenState createState() => _AnchorZoneRankScreenState();

  static Future<dynamic> launch(
      BuildContext context, int groupId, String? refer) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AnchorZoneRankScreen(groupId, refer)));
  }
}

class _AnchorZoneRankScreenState extends State<AnchorZoneRankScreen>
    with
        TickerProviderStateMixin<AnchorZoneRankScreen>,
        AutomaticKeepAliveClientMixin<AnchorZoneRankScreen> {
  TabController? _tabController;
  late ValueNotifier<int> _curTabIndex;
  AnchorZoneRankModel? _rankModel;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _curTabIndex = ValueNotifier<int>(0);
    _loadTabFromNetwork();
  }

  void _loadTabFromNetwork() async {
    AnchorZoneRankModel? rankModel =
        await AnchorZoneRankRepository.loadTabFromNetwork(widget.groupId);
    if (!mounted) return;
    setState(() {
      _rankModel = rankModel;
      initTabs();
    });
  }

  void initTabs() {
    if (_tabController != null) return;
    if ((_rankModel?.hasTab ?? false) == false) return;
    _tabController = ExtendedTabController(
        initialIndex: _rankModel?.initTabIndex ?? 0,
        length: _rankModel!.tabCount,
        vsync: this);
    _tabController!.addListener(() {
      _curTabIndex.value = _tabController!.index;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: _appBar(),
        body: _rankModel == null ? const Loading(label: '') : _body());
  }

  /// 标题栏
  PreferredSizeWidget _appBar() {
    return BaseAppBar.custom(
      title: Text(
        _rankModel?.rankListTitle ?? '',
        style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
      actions: [ExplainButton(onTap: _onExplainTap)],
    );
  }

  void _onExplainTap() {
    String? url = _rankModel?.explain;
    if (url?.isEmpty ?? true) return;
    BaseWebviewScreen.show(context, url: url!, title: K.rank_explain);
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _tabs(),
        Expanded(
          child: _pages(),
        ),
      ],
    );
  }

  /// 构建每一个tab
  Widget _tabs() {
    if ((_rankModel?.hasTab ?? false) == false) return Container();
    List<Tab> tabs = [];
    for (var tab in _rankModel!.tabList) {
      tabs.add(Tab(child: Text(tab.name)));
    }
    return CommonTabBar(
        controller: _tabController,
        tabs: tabs,
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

  /// 构建每一个tab对应的页面
  Widget _pages() {
    if ((_rankModel?.hasTab ?? false) == false) return Container();
    List<Widget> pages = [];
    for (var i = 0, size = _rankModel!.tabCount; i < size; i++) {
      AnchorZoneRankTab tab = _rankModel!.tabList[i];
      pages.add(AnchorZoneRankPage(
          widget.groupId,
          tab.type,
          _rankModel!.initTabIndex == i ? _rankModel!.defaultRank : null,
          widget.refer));
    }

    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: pages,
    );
  }
}
