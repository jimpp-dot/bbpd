import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/room_list/model/room_list_api.dart';
import 'package:rank/src/room_list/widget/room_list_friend_screen.dart';
import 'package:rank/src/room_list/widget/room_list_recommend_screen.dart';

class RoomListTabScreen extends StatefulWidget {
  const RoomListTabScreen({
    super.key,
  });

  @override
  _RoomListTabScreenState createState() => _RoomListTabScreenState();
}

const Set<String> _supportedTabTypes = {'room_go', 'games_room_go'};

class _RoomListTabScreenState extends State<RoomListTabScreen>
    with TickerProviderStateMixin, ReloadStateMixin {
  ExtendedTabController? _tabController;
  int _initialIndex = 0;
  GlobalKey _tabBarViewKey = GlobalKey();
  GlobalKey _animTabBarKey = GlobalKey();

  final List<GamesRoomTabItem> _roomTabs = [];
  final List<GlobalKey> _roomTabsKey = [];

  List<GamesRoomTabItem> get tabs => _roomTabs;

  ExtendedTabController? get tabController => _tabController;

  bool get refreshTab => true;

  // 跳转指定tab
  String? toCurrentKey;

  bool _loading = true;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        EventConstant.EventHomePageJumpToCurrentTab, _scrollToCurrentTab);

    _load();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    eventCenter.removeListener(
        EventConstant.EventHomePageJumpToCurrentTab, _scrollToCurrentTab);
    super.dispose();
  }

  ///加载tab
  void _load() async {
    RespGamesRoomTab respGamesRoomTab = await RoomListApi.goGamesTabList();
    _loading = false;
    if (respGamesRoomTab.success && respGamesRoomTab.data.isNotEmpty) {
      _roomTabs.clear();
      _roomTabsKey.clear();
      for (var item in respGamesRoomTab.data) {
        if (_supportedTabTypes.contains(item.type)) {
          _roomTabs.add(item);
        }
      }
      for (int i = 0; i < _roomTabs.length; i++) {
        _roomTabsKey.add(GlobalKey());
      }
      _initTabController(clearKey: true);
    } else {
      _errorMsg = respGamesRoomTab.msg;
    }
    _refresh();
  }

  void _initTabController({bool clearKey = false}) {
    _getDefaultTabIndex(clearKey: clearKey);

    safeRun(
      () => _tabController = ExtendedTabController(
        initialIndex: _initialIndex,
        length: _roomTabs.length,
        vsync: this,
      )..addListener(_onTabChanged),
    );
    _tabBarViewKey = GlobalKey();
    _animTabBarKey = GlobalKey();
  }

  void _getDefaultTabIndex({bool clearKey = false}) {
    String? currentKey = toCurrentKey ?? Constant.roomTabCurrentKey;
    if (Util.validStr(currentKey)) {
      // 优先跳转到指定TAB
      for (int i = 0; i < _roomTabs.length; i++) {
        if (currentKey?.endsWith(_roomTabs[i].filter) ?? false) {
          _initialIndex = i;
          toCurrentKey = null;
          Constant.roomTabCurrentKey = null;
          return;
        }
      }
    }
    if (clearKey) {
      toCurrentKey = null;
      Constant.roomTabCurrentKey = null;
    }

    for (int i = 0; i < _roomTabs.length; i++) {
      if (_roomTabs[i].default_4 == 1) {
        _initialIndex = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (_errorMsg != null) {
      return Center(
        child: ErrorData(
          error: _errorMsg,
          onTap: () {
            setState(() {
              _loading = true;
              _errorMsg = null;
            });
            _load();
          },
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (_roomTabs.length > 1) renderTab(),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                double offset = notification.metrics.pixels;
                double screenWidth = MediaQuery.of(context).size.width;
                _tabController?.scrollPosition = offset / screenWidth;
              }
              return false;
            },
            child: ExtendedTabBarView(
              key: _tabBarViewKey,
              controller: _tabController,
              children: buildSubPages(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildSubPages() {
    List<Widget> pages = [];
    for (int i = 0; i < _roomTabs.length; i++) {
      GamesRoomTabItem homeTab = _roomTabs[i];
      Widget page;
      GlobalKey pageKey = _roomTabsKey[i];
      if (homeTab.type == 'room_go') {
        page = RoomListFriendScreen(
          key: pageKey,
          type: homeTab.filter,
          tabName: homeTab.tab,
        );
      } else if (homeTab.type == 'games_room_go') {
        page = RoomListRecommendScreen(
          key: pageKey,
          type: homeTab.filter,
          tabName: homeTab.tab,
        );
      } else {
        page = Center(child: Text(homeTab.tab));
      }
      pages.add(page);
    }
    return pages;
  }

  Widget renderTab() {
    List<Widget> tabs = [];
    List<String> titles = [];
    for (int i = 0; i < _roomTabs.length; i++) {
      tabs.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(_roomTabs[i].tab),
        ),
      ));
      titles.add(_roomTabs[i].tab);
    }

    double barHeight = 44.0;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, bottom: 4),
      child: Stack(
        children: [
          Util.isUseAnimTabBar()
              ? AnimTabBar(
                  key: _animTabBarKey,
                  controller: _tabController,
                  height: barHeight,
                  titles: titles,
                  marginStart: 10,
                  marginEnd: barHeight * 1.5,
                  selectedFontSize: 18,
                  selectedFontColor: R.color.mainTextColor,
                  selectedFontWeight: FontWeight.w700,
                  unselectedFontSize: 16,
                  unselectedFontColor: R.color.mainTextColor.withOpacity(0.6),
                  unselectedFontWeight: FontWeight.w500,
                  onTap: handleTabClickReport,
                )
              : SizedBox(
                  height: barHeight,
                  child: CommonTabBar(
                    isScrollable: true,
                    controller: _tabController,
                    tabs: tabs,
                    labelStyle: null,
                    unselectedLabelStyle: null,
                    indicator: null,
                    marginStart: 8,
                    marginEnd: barHeight * 1.5,
                    onTap: handleTabClickReport,
                  ),
                ),
        ],
      ),
    );
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onTabChanged() {
    // Log.d('_MainPageState._onTabChanged index = ${_tabController.index}');
    reload(force: false, animated: false);
  }

  void handleTabClickReport(int index) {
    if (_tabController!.length > index) {
      Tracker.instance.track(TrackEvent.party_page,
          properties: {'click_tab': _roomTabs[index].tab});
    }
  }

  @override
  void reload({bool force = true, animated = true}) {
    // Log.d("RoomListTabScreen reload force=$force animated=$animated");
    if (_tabController != null && _roomTabs.isNotEmpty) {
      int index = _tabController!.index;
      if (index >= 0 && index < _roomTabs.length) {
        if (_roomTabsKey[index].currentState != null) {
          (_roomTabsKey[index].currentState as ReloadStateMixin)
              .reload(force: force, animated: animated);
        }
      }
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    // Log.d("RoomListTabScreen scrollToTop animated=$animated");
    if (_tabController != null && _roomTabs.isNotEmpty) {
      int index = _tabController!.index;
      if (index >= 0 && index < _roomTabs.length) {
        (_roomTabsKey[index].currentState as ReloadStateMixin).scrollToTop();
      }
    }
  }

  // 跳转到指定tab
  void _scrollToCurrentTab(String type, dynamic data) {
    if (data is! String) {
      return;
    }
    String cKey = data;
    if (_roomTabs.isEmpty || _roomTabs.length < 2) {
      toCurrentKey = cKey;
      Constant.roomTabCurrentKey = null;
      return;
    }
    for (int i = 0; i < _roomTabs.length; i++) {
      GamesRoomTabItem tab = _roomTabs[i];
      if (cKey.endsWith(tab.filter)) {
        _tabController?.index = i;
        Constant.roomTabCurrentKey = null;
        return;
      }
    }
  }
}
