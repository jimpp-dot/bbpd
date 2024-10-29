import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import 'rank_contribute_page.dart';
import 'rank_sweet_page.dart';
import 'refresh_mixin.dart';
import 'room_tab_item.dart';

/// 私密房榜单（每个子房间自己的排行榜）
class NestRoomAdminScreen extends StatefulWidget {
  final int rid;
  const NestRoomAdminScreen({super.key, required this.rid});

  @override
  NestRoomAdminState createState() {
    return NestRoomAdminState();
  }

  static void show(BuildContext context, int rid) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NestRoomAdminScreen(rid: rid),
      settings: const RouteSettings(name: '/nestRoomAdmin'),
    ));
  }
}

class NestRoomAdminState extends State<NestRoomAdminScreen>
    with SingleTickerProviderStateMixin<NestRoomAdminScreen> {
  late TabController _tabController;
  final List<GlobalKey> _keys = [];
  final List<Widget> _pages = [];
  final List<RoomTabItem> _tabItems = [];
  final List<Tab> _tabs = [];

  @override
  void initState() {
    super.initState();

    /// 贡献榜
    GlobalKey key = GlobalKey();
    _keys.add(key);
    _tabItems.add(RoomTabItem(RoomTabItem.week, K.room_tab_item_week));
    _pages.add(RankContributePage(
        key: key, rid: widget.rid, contributeType: ContributeType.week));

    /// 魅力榜
    GlobalKey key2 = GlobalKey();
    _keys.add(key2);
    _tabItems.add(RoomTabItem(RoomTabItem.charm_week, K.room_tab_item_beauty));
    _pages.add(RankContributePage(
        key: key2, rid: widget.rid, contributeType: ContributeType.charm));

    /// 守护榜
    GlobalKey key3 = GlobalKey();
    _keys.add(key3);
    _tabItems.add(RoomTabItem(RoomTabItem.sweet, K.room_tab_item_defend));
    _pages.add(RankSweetPage(key: key3, rid: widget.rid));

    for (var item in _tabItems) {
      _tabs.add(Tab(child: Text(item.label)));
    }

    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          '${K.room_nest_room}${widget.rid}',
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            child: CommonTabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _tabs,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  void _onTabChanged() {
    _reload();
  }

  void _reload() {
    if (mounted &&
        !_tabController.indexIsChanging &&
        _keys[_tabController.index].currentContext != null) {
      if (_keys[_tabController.index].currentState is RefreshMixin) {
        (_keys[_tabController.index].currentState as RefreshMixin).refresh();
      }
    }
  }
}
