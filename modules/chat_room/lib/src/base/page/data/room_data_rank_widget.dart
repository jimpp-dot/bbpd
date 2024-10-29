import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/room_data_rank_page.dart';
import 'package:chat_room/src/base/page/data/room_reward_list_screen.dart';

class RoomDataRankWidget extends StatefulWidget {
  final int rid;
  final int startTime; //时间段开启时间
  final int dateTime; //日期开始时间
  final int recent; //7或14天 三个参数选一个
  final int tabCount; //显示tab个数
  final bool showRightAction;

  const RoomDataRankWidget(
    this.rid, {
    this.tabCount = 3,
    this.startTime = 0,
    this.dateTime = 0,
    this.recent = 0,
    this.showRightAction = false,
    super.key,
  });

  @override
  RoomDataRankWidgetState createState() => RoomDataRankWidgetState();
}

class RoomDataRankWidgetState extends State<RoomDataRankWidget>
    with SingleTickerProviderStateMixin {
  late final ExtendedTabController _tabController;
  late final List<Widget> _tabsWidget;
  late List<String> _titles;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    Log.d('RoomDataRankWidgetState:${widget.tabCount}');
    _titles = [
      K.room_pay_statistics,
      K.room_income_statistics,
      K.room_new_pay_user
    ];
    if (widget.tabCount > 1) {
      if (widget.tabCount == 2) {
        _titles = [K.room_pay_statistics, K.room_income_statistics];
      }
      _tabsWidget = _titles.map((item) => Tab(child: Text(item))).toList();
      int i = 1;
      _pages = [];
      for (var element in _titles) {
        _pages.add(_buildTabContent(element, i));
        i++;
      }
      _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabsWidget.length, vsync: this);
    } else {
      _titles = [K.room_new_pay_user];
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Key currentIndexKey() {
    if (widget.tabCount == 1) {
      return Key(_titles.first);
    }
    return Key(_titles[_tabController.index]);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabCount == 1) {
      return _buildOnlyWidget();
    }
    return Container(
      color: R.color.mainBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTabWidget(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnlyWidget() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: R.color.mainBgColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 36,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(end: 20, start: 12),
            child: Text(
              _titles.first,
              style: R.textStyle.medium16,
            ),
          ),
          Expanded(
            child: _buildTabContent(_titles.first, 3),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String item, int type) {
    return NestedScrollViewInnerScrollPositionKeyWidget(
      Key(item),
      RoomDataRankPage(
        widget.rid,
        type,
        startTime: widget.startTime,
        dateTime: widget.dateTime,
        recent: widget.recent,
        key: PageStorageKey(item),
      ),
    );
  }

  _buildTabWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(4),
          topEnd: Radius.circular(14),
        ),
        color: R.color.mainBgColor,
      ),
      child: Container(
        height: 36,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(top: 12, end: 20),
        child: Row(
          children: [
            Expanded(
              child: CommonTabBar(
                tabs: _tabsWidget,
                controller: _tabController,
                marginStart: 0,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: R.color.mainTextColor,
                unselectedLabelColor: R.color.secondTextColor,
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.color.secondTextColor,
                ),
                labelPadding:
                    const EdgeInsetsDirectional.only(start: 10, end: 10),
                indicator: CommonUnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 2.0, color: R.color.mainBrandColor),
                ),
              ),
            ),
            if (widget.showRightAction)
              GestureDetector(
                onTap: () => RoomRewardListScreen.show(
                  System.context,
                  widget.rid,
                  widget.startTime,
                  widget.dateTime,
                  widget.recent,
                ),
                child: Row(
                  children: [
                    Text(
                      K.room_give_detail,
                      style: R.textStyle.medium12.copyWith(
                          color: R.color.mainBrandColor, fontSize: 13),
                    ),
                    R.img(
                      RoomAssets.chat_room$ic_next_small_svg,
                      color: R.color.mainBrandColor,
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
