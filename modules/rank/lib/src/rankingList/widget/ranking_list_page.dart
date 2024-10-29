import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/page/pk/pk_rank_sub_daily_page.dart';
import 'package:rank/src/rankingList/widget/ranking_knight_page.dart';

import 'ranking_list_rule_dialog.dart';
import 'ranking_list_tab_page.dart';

class RankingListPage extends StatefulWidget {
  const RankingListPage(
      {super.key,
      this.initTab,
      this.disappear,
      required this.rid,
      this.rule,
      @required this.tabList});

  final int? initTab;
  final int rid;
  final Function? disappear;
  final List<TabItem>? tabList;
  final Map<String, List<String>>? rule;

  @override
  _RankingListPageState createState() => _RankingListPageState();

  static openRankingListPage(BuildContext context,
      {Key? key,
      int? initTab,
      required int rid,
      List<TabItem>? tabList,
      Map<String, List<String>>? rule}) {
    return displayModalBottomSheet(
      maxHeightRatio: 1,
      context: context,
      builder: (BuildContext context) {
        final page = RankingListPage(
          initTab: initTab,
          tabList: tabList,
          rid: rid,
          rule: rule,
          disappear: () {
            Navigator.of(context).pop();
          },
        );
        return page;
      },
    );
  }
}

class _RankingListPageState extends State<RankingListPage>
    with TickerProviderStateMixin {
  ExtendedTabController? _tabController;

  List<TabItem>? get _tabList => widget.tabList;
  List<GlobalKey<RankingListTabPageState>>? _pageKeys;

  int get _tabIndex {
    if (_tabController != null) {
      return _tabController!.index;
    } else if (widget.initTab != null) {
      return widget.initTab!;
    }

    return 0;
  }

  double get pageHeight => 506 + MediaQuery.of(context).padding.bottom;

  String get ruleTitle {
    final Map titleMap = {
      "hour": K.rank_hour_rule,
      'day': K.rank_day_rule,
      'week': K.rank_week_rule,
      'pk': K.pk_score_rule
    };
    String currentType = _tabList?[_tabIndex].type ?? '';
    return titleMap[currentType] ?? '';
  }

  List<String> get ruleContent {
    String currentType = _tabList?[_tabIndex].type ?? '';
    return widget.rule?[currentType] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _pageKeys =
        _tabList?.map((e) => GlobalKey<RankingListTabPageState>()).toList();
    _loadData(restoreIndex: _tabIndex);
  }

  Future _loadData({required int restoreIndex}) async {
    int initIndex = 0;
    if (_tabList != null && _tabList!.isNotEmpty) {
      if (restoreIndex >= 0 && restoreIndex < _tabList!.length) {
        initIndex = restoreIndex;
      }
    }
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChange);
      _tabController!.dispose();
    }
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: initIndex, length: _tabList!.length, vsync: this)
        ..addListener(_onTabChange),
    );
  }

  _onTabChange() {
    if (_pageKeys != null && _tabIndex < _pageKeys!.length) {
      _pageKeys![_tabIndex].currentState?.loadData();
    }
  }

  _onHelp() {
    if (widget.rule == null || widget.rule!.isEmpty) return;
    showDialog(
        context: context,
        builder: (context) {
          return RankingListRuleDialog(
            title: ruleTitle,
            subTitles: ruleContent,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pageHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFFD50055), Color(0xFFFE629F)],
            begin: FractionalOffset(0.44, 1.0),
            end: FractionalOffset(0.44, 0.19),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: GestureDetector(onTap: () {}, child: _renderBody()),
    );
  }

  Widget _renderBody() {
    if (_tabList == null || _tabList!.isEmpty) {
      return Center(
        child: ErrorData(
          onTap: () => _loadData(restoreIndex: _tabIndex),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 12,
        ),
        _renderTab(),
        Expanded(
          child: _renderPager(),
        ),
      ],
    );
  }

  Widget _renderTab() {
    double tabHeight = 44;
    List<Widget> tabs = <Widget>[];
    final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 14,
    );
    for (int i = 0; i < _tabList!.length; i++) {
      tabs.add(Tab(
        child: Container(
          height: tabHeight,
          alignment: AlignmentDirectional.center,
          child: Text(
            _tabList![i].label ?? '',
          ),
        ),
      ));
    }
    return Row(
      children: [
        Flexible(
          child: CommonTabBar(
            tabs: tabs,
            isScrollable: false,
            controller: _tabController,
            labelStyle: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            unselectedLabelStyle: unselectedLabelStyle,
            indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.white),
                insets: EdgeInsetsDirectional.only(bottom: 4),
                wantWidth: 16,
                draggingWidth: 12.0),
            indicatorWeight: 0,
            marginStart: 16,
            labelPadding: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
          ),
        ),
        // Flexible(child: Container()),
        GestureDetector(
          onTap: _onHelp,
          child: Container(
            width: 130 * Util.ratio,
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: R.img(BaseAssets.ic_help_svg,
                color: Colors.white.withOpacity(0.7),
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
        ),
      ],
    );
  }

  Widget _renderPager() {
    List<StatefulWidget> subPage = [];
    for (int i = 0; i < _tabList!.length; i++) {
      if (_tabList![i].type == 'pk') {
        subPage.add(const PkSubDailyPage(
          rankType: PkDailyRankType.weekly,
          refer: PageRefer('PkWeeklyRank'),
          backgroundColor: Colors.white,
        ));
      } else if (_tabList![i].type == 'knight') {
        subPage.add(RankingKnightPage(
          key: _pageKeys![i],
          rid: widget.rid,
          type: _tabList![i].type,
          name: _tabList![i].label,
        ));
      } else {
        subPage.add(RankingListTabPage(
          key: _pageKeys![i],
          rid: widget.rid,
          type: _tabList![i].type,
          name: _tabList![i].label,
          refreshCallback: () {
            _loadData(restoreIndex: _tabIndex);
          },
        ));
      }
    }
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: subPage,
    );
  }
}
