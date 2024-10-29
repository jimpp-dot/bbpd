import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'model/match_ticket_model.dart';
import 'ticket_detail_sub_page.dart';

/// 门票明细
class TicketDetailScreen extends StatefulWidget {
  final String type;
  final String title;
  final List<TicketDetailTab> tab;

  /// [type] tab类型
  static Future openTicketDetailScreen(BuildContext context, String type,
      String title, List<TicketDetailTab> tab) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            TicketDetailScreen(type: type, title: title, tab: tab),
        settings: const RouteSettings(name: 'TicketDetailScreen'),
      ),
    );
  }

  const TicketDetailScreen(
      {super.key, required this.type, required this.title, required this.tab});

  @override
  _TicketDetailScreenState createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen>
    with SingleTickerProviderStateMixin<TicketDetailScreen> {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(() {
      _tabController = TabController(
          initialIndex: 0, length: widget.tab.length, vsync: this);
      _tabController!.addListener(_onTabChanged);
    });
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
      _tabController = null;
    }
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController!.indexIsChanging) return;
    Tracker.instance
        .track(TrackEvent.competition_ticket_details_page_click, properties: {
      'page_click': widget.tab[_tabController!.index].name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget.title),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (Util.isCollectionEmpty(widget.tab)) return const ErrorData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTab(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tab
                .map((e) =>
                    TicketDetailSubPage(state: e.useState, type: widget.type))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _renderTab() {
    List<Widget> tabs = <Widget>[];
    for (int i = 0; i < widget.tab.length; i++) {
      tabs.add(Tab(
        child: Container(
          height: 44,
          alignment: AlignmentDirectional.center,
          child: Text(widget.tab[i].name),
        ),
      ));
    }
    return CommonTabBar(
      tabs: tabs,
      isScrollable: true,
      controller: _tabController,
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
        draggingWidth: 12.0,
      ),
      indicatorWeight: 0,
      marginStart: 8,
      marginEnd: 60,
      labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
    );
  }
}
