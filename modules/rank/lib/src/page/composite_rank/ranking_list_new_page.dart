import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/page/pk/pk_rank_sub_daily_page.dart';
import 'package:rank/src/rankingList/widget/ranking_knight_page.dart';

import '../../rankingList/widget/ranking_list_rule_dialog.dart';
import 'ranking_list_new_tab_page.dart';

class RankingListNewPage extends StatefulWidget {
  const RankingListNewPage(
      {super.key,
      this.initTab,
      required this.disappear,
      required this.rid,
      required this.rule,
      this.tabList,
      required this.rankeTypeChange});

  final int? initTab;
  final int rid;
  final Function disappear;
  final List<TabItem>? tabList;
  final Map<String, List<String>>? rule;
  final Function(int index) rankeTypeChange;

  @override
  RankingListNewPageState createState() => RankingListNewPageState();
}

class RankingListNewPageState extends State<RankingListNewPage>
    with TickerProviderStateMixin {
  ExtendedTabController? tabController;

  List<TabItem>? get _tabList => widget.tabList;
  List<GlobalKey<RankingListNewTabPageState>>? _pageKeys;

  int get _tabIndex {
    if (tabController != null) {
      return tabController!.index;
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
    String currentType = _tabList![_tabIndex].type ?? '';
    return titleMap[currentType];
  }

  List<String>? get ruleContent {
    String currentType = _tabList![_tabIndex].type ?? '';
    return widget.rule?[currentType];
  }

  @override
  void initState() {
    super.initState();
    _pageKeys =
        _tabList?.map((e) => GlobalKey<RankingListNewTabPageState>()).toList();
    _loadData(restoreIndex: _tabIndex);
  }

  Future _loadData({required int restoreIndex}) async {
    int initIndex = 0;
    if (_tabList != null && _tabList!.isNotEmpty) {
      if (restoreIndex >= 0 && restoreIndex < _tabList!.length) {
        initIndex = restoreIndex;
      }
    }
    if (tabController != null) {
      tabController!.removeListener(_onTabChange);
      tabController!.dispose();
    }
    safeRun(
      () => tabController = ExtendedTabController(
          initialIndex: initIndex, length: _tabList?.length ?? 0, vsync: this)
        ..addListener(_onTabChange),
    );
  }

  _onTabChange() {
    if (_pageKeys != null && _tabIndex < _pageKeys!.length) {
      _pageKeys![_tabIndex].currentState?.loadData();
    }

    widget.rankeTypeChange(_tabIndex);
  }

  onHelp() {
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
    return SizedBox(
      height: pageHeight,
      width: double.infinity,
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
        Expanded(
          child: _renderPager(),
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
        subPage.add(RankingListNewTabPage(
          key: _pageKeys![i],
          rid: widget.rid,
          type: _tabList![i].type ?? '',
          name: _tabList![i].label,
          refreshCallback: () {
            _loadData(restoreIndex: _tabIndex);
          },
        ));
      }
    }
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: tabController,
      children: subPage,
    );
  }
}
