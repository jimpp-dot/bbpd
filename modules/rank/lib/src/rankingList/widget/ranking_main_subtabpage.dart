import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/page/pk/pk_rank_sub_daily_page.dart';
import 'package:rank/src/rankingList/model/ranking_main_screen_bean.dart';
import 'package:rank/src/rankingList/widget/ranking_list_user_page.dart';
import 'package:rank/src/rankingList/widget/ranking_week_star_page.dart';

import 'ranking_knight_page.dart';
import 'ranking_list_tab_page.dart';
import 'ranking_star_tab_page.dart';

class RankingMainSubTabPage extends StatefulWidget {
  final int rid;
  final String? charmType;
  final FirstTab firstTab;
  final int initIndex;
  final String tabType;

  /// rid / charmType 必须传递一个来确定排行榜的数据来源
  const RankingMainSubTabPage({
    super.key,
    required this.rid,
    this.charmType,
    required this.firstTab,
    required this.tabType,
    this.initIndex = 0,
  });

  @override
  RankingMainSubTabPageState createState() => RankingMainSubTabPageState();
}

class RankingMainSubTabPageState extends State<RankingMainSubTabPage>
    with TickerProviderStateMixin {
  ExtendedTabController? _tabController;

  final _pageKeys = <GlobalKey>[];

  var _pageWidgetList = <Widget>[];

  @override
  void initState() {
    super.initState();
    _initPageWidget();
  }

  void _initPageWidget() {
    safeRun(
      () => _tabController = ExtendedTabController(
        initialIndex: widget.initIndex,
        length: widget.firstTab.list.length,
        vsync: this,
      )..addListener(_onTabChange),
    );
    _pageKeys.clear();
    _pageWidgetList = widget.firstTab.list.map((e) {
      switch (e.type) {
        case 'hour':
        case 'day':
        case 'week':
        case 'month':
          var key = GlobalKey();
          _pageKeys.add(key);
          if (widget.tabType == 'user') {
            // 用户榜
            return RankingListUserPage(
              key: key,
              rid: widget.rid,
              type: e.type,
              name: e.title,
            );
          }
          // 主播榜
          return RankingListTabPage(
            key: key,
            rid: widget.rid,
            charmType: widget.charmType,
            type: e.type,
            name: e.title,
            refreshCallback: () {
              // _loadData(restoreIndex: _tabIndex);
            },
          );
        case 'pk':
          var key = GlobalKey();
          _pageKeys.add(key);
          return PkSubDailyPage(
            key: key,
            rankType: PkDailyRankType.weekly,
            refer: const PageRefer('PkWeeklyRank'),
            backgroundColor: Colors.white,
          );
        case 'star_week':
          var key = GlobalKey();
          _pageKeys.add(key);
          return RankingStarTabPage(
            key: key,
            rid: widget.rid,
            type: e.type,
            name: e.title,
            refreshCallback: () {
              // _loadData(restoreIndex: _tabIndex);
            },
          );
        case 'knight':
          var key = GlobalKey();
          _pageKeys.add(key);
          return RankingKnightPage(
            key: key,
            rid: widget.rid,
            type: e.type,
            name: e.title,
          );
        case 'week_star':
          var key = GlobalKey();
          _pageKeys.add(key);
          return RankingWeekStarPage(
            key: key,
          );
        default:
          return Center(
            child: Text(e.title),
          );
      }
    }).toList();
  }

  int get _tabIndex {
    if (_tabController != null) return _tabController!.index;
    return 0;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  _onTabChange() {
    if (_tabIndex < _pageKeys.length) {
      var state = _pageKeys[_tabIndex].currentState;
      if (state is ReloadStateMixin) {
        (state as ReloadStateMixin).reload();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.only(bottom: 5.0),
          child: _buildTab(),
        ),
        Expanded(child: _buildPage()),
      ],
    );
  }

  void loadData() {}

  Widget _buildTab() {
    var labels = widget.firstTab.list.map((e) => e.title).toList();
    return SubTabScrollWidget(
      controller: _tabController,
      tabLabels: labels,
      horizonMargin: 60.dp,
      selectColor: const Color(0xFFEA667F),
      unSelectColor: const Color(0xFF833BC9),
      allBgColor: Colors.white30,
      selectedBgColor: Colors.white,
    );
  }

  Widget _buildPage() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          double offset = notification.metrics.pixels;
          double screenWidth = MediaQuery.of(context).size.width;
          _tabController?.scrollPosition = offset / screenWidth;
        }
        return false;
      },
      child: ExtendedTabBarView(
        controller: _tabController,
        children: _pageWidgetList,
      ),
    );
  }
}
