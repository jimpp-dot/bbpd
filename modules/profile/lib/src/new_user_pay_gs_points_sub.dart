import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';
import 'package:profile/src/new_user_pay_gs_points_sub_list.dart';

class NewUserPayGsPointsSub extends StatefulWidget {
  final int dateTab; // 1-今天，2-昨天，3-本周，4-上周
  final List<GsTransferPointsTabs>? subTabs;

  const NewUserPayGsPointsSub({super.key, required this.dateTab, this.subTabs});

  @override
  State<StatefulWidget> createState() => NewUserPayGsPointsSubState();
}

class NewUserPayGsPointsSubState extends State<NewUserPayGsPointsSub>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final List<Widget> _pageWidgets = [];
  ExtendedTabController? _tabController;

  List<GsTransferPointsTabs> get subTabs => widget.subTabs ?? [];

  @override
  void initState() {
    super.initState();
    if (subTabs.length > 1) {
      safeRun(
        () => _tabController = ExtendedTabController(
            initialIndex: 0, length: subTabs.length, vsync: this),
      );
      for (var e in subTabs) {
        _pageWidgets.add(
            NewUserPayGsPointsSubList(dateTab: widget.dateTab, scene: e.tabId));
      }
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (subTabs.length <= 1) {
      return NewUserPayGsPointsSubList(dateTab: widget.dateTab, scene: 0);
    }
    return Column(
      children: [
        _buildTabWidget(),
        Expanded(
            child:
                TabBarView(controller: _tabController, children: _pageWidgets)),
      ],
    );
  }

  Widget _buildTabWidget() {
    return Container(
      width: double.infinity,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: subTabs
            .map((e) => Text(e.tabName, style: const TextStyle(fontSize: 14)))
            .toList(),
        controller: _tabController,
        labelColor: const Color(0xFF202020),
        isScrollable: true,
        unselectedLabelColor: const Color(0xFF202020).withOpacity(0.5),
        labelStyle: const TextStyle(color: Color(0xFF202020), fontSize: 14),
        unselectedLabelStyle: TextStyle(
            color: const Color(0xFF202020).withOpacity(0.5), fontSize: 14),
        indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: Color(0xFF12C5FF)),
            insets: EdgeInsetsDirectional.only(bottom: 6)),
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
