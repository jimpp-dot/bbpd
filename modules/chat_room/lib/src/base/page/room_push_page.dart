import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/model/room_push_bean.dart';
import 'package:chat_room/src/base/page/push_user_list_page.dart';
import 'package:chat_room/src/base/page/room_push_sub_page.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import '../../../k.dart';

class RoomPushPage extends StatefulWidget {
  const RoomPushPage({super.key});

  @override
  _RoomPushPageState createState() => _RoomPushPageState();

  static Future show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1.0,
      builder: (context) => const RoomPushPage(),
    );
  }
}

class _RoomPushPageState extends State<RoomPushPage>
    with TickerProviderStateMixin<RoomPushPage>, ReloadStateMixin {
  TabController? _tabController;
  GlobalKey tabBarGlobalKey = GlobalKey();
  GlobalKey tabViewGlobalKey = GlobalKey();
  TabsResponse? _tabsResponse;
  bool _loading = true;
  final Map<String, GlobalKey> roomTabKeyMap = {};
  bool _showSharePage = false;
  RoomItemModel? _selectItem;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  _loadData() async {
    _loading = true;
    _tabsResponse = await RoomApi.getRoomPushTab();
    _loading = false;
    initTabController();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Util.height * 2 / 3,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16)),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 56,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          _showSharePage
              ? GestureDetector(
                  onTap: () {
                    _showSharePage = false;
                    _selectItem = null;
                    if (mounted) setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: R.img(
                      RoomAssets.chat_room$ic_black_back_webp,
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              : const SizedBox(width: 44),
          Expanded(
            child: Text(
              _showSharePage ? K.room_select_push_people : K.room_push,
              style: R.textStyle.medium18,
              textAlign: TextAlign.center,
            ),
          ),
          _showSharePage
              ? const SizedBox(width: 44)
              : GestureDetector(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 20),
                    child: R.img(
                      RoomAssets.chat_room$ic_black_close_webp,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }
    if (_tabsResponse == null ||
        !_tabsResponse!.success ||
        !Util.validList(_tabsResponse!.data)) {
      return EmptyWidget(onTap: _loadData);
    }
    if (_showSharePage && _selectItem != null) {
      return PushUserListPage(roomItem: _selectItem!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.0,
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: buildTabWidget(),
        ),
        Expanded(
          child: ExtendedTabBarView(
            key: tabViewGlobalKey,
            controller: _tabController,
            children: buildTabViews(),
          ),
        ),
      ],
    );
  }

  Widget buildTabWidget() {
    List<Widget> tabs = [];
    for (int i = 0; i < _tabsResponse!.data!.length; i++) {
      Tab tab = Tab(
        icon: null,
        child: Container(
          height: 28,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: R.color.secondBgColor,
          ),
          child: Text(_tabsResponse!.data![i].title),
        ),
      );
      tabs.add(tab);
    }

    return CommonTabBar(
      key: tabBarGlobalKey,
      showSplash: false,
      labelPadding: const EdgeInsetsDirectional.only(end: 12),
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
      labelColor: R.color.mainBrandColor,
      unselectedLabelColor: R.color.secondTextColor,
      labelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: R.color.mainBgColor)),
    );
  }

  _itemClick(RoomItemModel item) {
    _selectItem = item;
    _showSharePage = true;
    if (mounted) {
      setState(() {});
    }
  }

  List<Widget> buildTabViews() {
    List<Widget> pages = [];
    for (int i = 0; i < _tabsResponse!.data!.length; i++) {
      TabModel tabModel = _tabsResponse!.data![i];
      RoomPushSubPage subPage = RoomPushSubPage(
        key: roomTabKeyMap[tabModel.filter],
        type: tabModel.filter,
        tabName: tabModel.title,
        itemCallback: _itemClick,
      );
      pages.add(subPage);
    }
    return pages;
  }

  void initTabController() {
    if (_tabsResponse != null &&
        _tabsResponse!.success &&
        Util.validList(_tabsResponse!.data)) {
      for (var element in _tabsResponse!.data!) {
        if (!roomTabKeyMap.containsKey(element.filter)) {
          roomTabKeyMap[element.filter] = GlobalKey();
        }
      }

      int newLength = _tabsResponse!.data!.length;
      _tabController?.removeListener(_onTabChanged);
      safeRun(() {
        _tabController = TabController(
            length: newLength,
            initialIndex: _getDefaultTabIndex(),
            vsync: this);
        _tabController?.addListener(_onTabChanged);
      });
    }
  }

  void _onTabChanged() {
    if (_tabController?.indexIsChanging ?? true) return;
    reload(force: false, animated: false);
    if (mounted) {
      setState(() {});
    }
  }

  int _getDefaultTabIndex() {
    if (_tabController != null &&
        _tabsResponse!.data!.length > _tabController!.index) {
      return _tabController!.index;
    }
    int index = 0;

    for (int i = 0; i < _tabsResponse!.data!.length; i++) {
      if (Util.parseBool(_tabsResponse!.data![i].isDefault)) {
        index = i;
        break;
      }
    }
    return index;
  }

  @override
  void reload({bool force = true, animated = true}) {
    if (_tabsResponse != null &&
        Util.validList(_tabsResponse!.data) &&
        _tabsResponse!.data!.length > _tabController!.index &&
        roomTabKeyMap[_tabsResponse!.data![_tabController!.index].filter]
            ?.currentState is ReloadStateMixin) {
      (roomTabKeyMap[_tabsResponse!.data![_tabController!.index].filter]!
              .currentState as ReloadStateMixin)
          .reload(force: force, animated: animated);
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_tabsResponse != null &&
        Util.validList(_tabsResponse!.data) &&
        _tabsResponse!.data!.length > _tabController!.index &&
        roomTabKeyMap[_tabsResponse!.data![_tabController!.index].filter]
            ?.currentState is ReloadStateMixin) {
      (roomTabKeyMap[_tabsResponse!.data![_tabController!.index].filter]!
              .currentState as ReloadStateMixin)
          .scrollToTop(animated: animated);
    }
  }
}
