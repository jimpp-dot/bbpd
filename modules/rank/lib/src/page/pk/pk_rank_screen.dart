import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/widget/pk/pk_rule_dialog.dart';
import 'package:shared/shared.dart';

import 'pk_rank_sub_daily_page.dart';
import 'pk_rank_sub_history_page.dart';

class PkRankScreen extends StatefulWidget {
  final int? uid;
  final int rid;
  final int tabIndex;

  const PkRankScreen({super.key, required this.rid, this.uid, this.tabIndex = 0});

  static Future openPkScreen(
    BuildContext context,
    int rid,
    int? uid, {
    Key? key,
    int tabIndex = 0,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PkRankScreen(key: key, rid: rid, uid: uid, tabIndex: tabIndex);
        },
      ),
    );
  }

  @override
  _PkRankScreenState createState() => _PkRankScreenState();
}

class _PkRankScreenState extends State<PkRankScreen> with SingleTickerProviderStateMixin<PkRankScreen> {
  ExtendedTabController? _tabController;
  late List<Widget> _pages;
  late List<String> _tabTitles;
  late List<Widget> _tabWidgets;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _renderBody(),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar.custom(
      backgroundColor: Colors.white,
      backColor: Colors.black,
      statusBrightness: Brightness.light,
      title: Text(
        K.pk_rank_page,
        style: R.textStyle.title.copyWith(color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          iconSize: 24,
          icon: R.img(Assets.pk_pk_rank_faq_webp, width: 24, color: Colors.black, package: ComponentManager.MANAGER_RANK),
          onPressed: () {
            PkRuleDialog.showRuleDialog(context);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
    }
    super.dispose();
  }

  init() {
    if (widget.uid == Session.uid) {
      _pages = [
        const PkSubDailyPage(
          rankType: PkDailyRankType.daily,
          refer: PageRefer('PkDailyRank'),
          backgroundColor: Colors.white,
        ),
        const PkSubDailyPage(rankType: PkDailyRankType.weekly, refer: PageRefer('PkWeeklyRank')),
        PkSubHistoryPage(rid: widget.rid, refer: const PageRefer('PkHistoryRank'))
      ];
      _tabTitles = [K.rank_config_daily, K.week_ranklist, K.history_rank_list];
    } else {
      _pages = [
        const PkSubDailyPage(
          rankType: PkDailyRankType.daily,
          refer: PageRefer('PkDailyRank'),
          backgroundColor: Colors.white,
        ),
        const PkSubDailyPage(
          rankType: PkDailyRankType.weekly,
          refer: PageRefer('PkWeeklyRank'),
          backgroundColor: Colors.white,
        ),
      ];
      _tabTitles = [K.rank_config_daily, K.week_ranklist];
    }
    safeRun(
      () => _tabController = ExtendedTabController(initialIndex: widget.tabIndex, length: _pages.length, vsync: this)
        ..addListener(_onTabChanged),
    );
    _tabWidgets = [];
    for (int i = 0; i < _tabTitles.length; i++) {
      _tabWidgets.add(Tab(
        child: Text(_tabTitles[i]),
      ));
    }
  }

  _onTabChanged() {
    if (_tabController!.indexIsChanging) return;
    Log.d("tab ${_tabController!.index}");
  }

  Widget _buildTab() {
    return _tabTitles.isNotEmpty
        ? Container(
            height: 36.0,
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            margin: const EdgeInsetsDirectional.only(bottom: 2.0, top: 2.0),
            child: false
                ? AnimTabBar(
                    marginStart: 8 * Util.ratio,
                    controller: _tabController,
                    titles: _tabTitles,
                  )
                : CommonTabBar(
                    tabs: _tabWidgets,
                    controller: _tabController,
                    marginStart: 8 * Util.ratio,
                    unselectedLabelColor: Colors.black.withOpacity(0.5),
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                  ),
          )
        : Container();
  }

  Widget _renderBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTab(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _pages,
          ),
        )
      ],
    );
  }
}
