import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'hron_publish_list_sub_tab.dart';
import '../../k.dart';

class HornPublishListTab extends StatefulWidget {
  final int waitSendNum;

  const HornPublishListTab({super.key, this.waitSendNum = 0});

  @override
  State<HornPublishListTab> createState() => _HornPublishListTabState();
}

class _HornPublishListTabState extends State<HornPublishListTab>
    with SingleTickerProviderStateMixin {
  final _tabs = [
    K.horn_tab_exam,
    K.horn_tab_send,
    K.horn_tab_sent,
    K.horn_tab_refused
  ];

  final TextStyle _tabStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  late final TabController _tabController;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _pages = _tabs
        .mapIndexed((index, e) => HornPublishListSubTab(index: index))
        .toList();
    eventCenter.addListener(EventConstant.EventGlobalHorn, _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventGlobalHorn, _onEvent);
    _tabController.dispose();
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventGlobalHorn) {
      // 提交喊话时触发，此时需要切换到待审核tab
      _tabController.index = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      height: 24,
      child: CommonTabBar(
        tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        labelStyle: _tabStyle,
        unselectedLabelStyle: _tabStyle,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        redDotPosTop: 2,
        redDotIndex: widget.waitSendNum > 0 ? [1] : [],
        indicator: const BoxDecoration(),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: _pages,
    );
  }
}
