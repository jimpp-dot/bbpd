import 'dart:async';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/model/friend_bean.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/scheduler.dart';

class InviteMoreScreen extends StatefulWidget {
  final ContactTab initialPage;
  final Function(List<int> uids)? onFinish;

  const InviteMoreScreen(
      {super.key, this.initialPage = ContactTab.friend, this.onFinish});

  static Future show(
    BuildContext context, {
    String? from,
    ContactTab initialPage = ContactTab.friend,
    Function(List<int> uids)? onFinish,
    List<int>? uids,
  }) {
    return Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => _SelectionDataWidget(
          uids: uids ?? [],
          child: InviteMoreScreen(
            initialPage: initialPage,
            onFinish: onFinish,
          ),
        ),
        settings: const RouteSettings(name: 'invite_more'),
      ),
    );
  }

  @override
  _InviteMoreScreenState createState() => _InviteMoreScreenState();
}

class _SelectionDataWidget extends InheritedWidget {
  _SelectionDataWidget({required List<int> uids, required Widget child})
      : super(child: child) {
    selectedUids.addAll(uids);
  }

  final Set<int> selectedUids = <int>{};
  final Set<FriendItem> selectedItems = <FriendItem>{};

  void addItem(FriendItem item) {
    selectedUids.add(item.uid);
    selectedItems.add(item);
  }

  void removeItem(FriendItem item) {
    selectedUids.remove(item.uid);
    selectedItems.remove(item);
  }

  static _SelectionDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_SelectionDataWidget>();
  }

  @override
  bool updateShouldNotify(_SelectionDataWidget old) {
    return old.selectedUids.length != selectedUids.length ||
        old.selectedItems.length != selectedItems.length;
  }
}

class _InviteMoreScreenState extends State<InviteMoreScreen>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  final GlobalKey<_FriendListWidgetState> _keyFriend = GlobalKey();
  final GlobalKey<_FriendListWidgetState> _keyFan = GlobalKey();
  final GlobalKey<_FriendListWidgetState> _keyFollow = GlobalKey();
  final GlobalKey<_FriendListWidgetState> _keyCompanion = GlobalKey();

  List<GlobalKey<_FriendListWidgetState>> _keys = [];
  late final ExtendedTabController _tabController;

  List<String> _tabs = [];

  late List<Widget> _tabsWidget;
  String _title = '';

  @override
  void initState() {
    super.initState();
    List<String> tabs = R.array('contact_tabs');
    _tabs = tabs.sublist(0, tabs.length - 1);
    _tabsWidget = _tabs.map((e) => Tab(child: Text(e))).toList();
    _keys = [_keyFriend, _keyFollow, _keyFan, _keyCompanion];
    _pageIndex = widget.initialPage.index;
    _tabController = ExtendedTabController(
        initialIndex: _pageIndex, length: _keys.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTitle();
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  _onTabChanged() {
    if (_pageIndex == _tabController.index) {
      return;
    }

    _pageIndex = _tabController.index;
    _keyFriend.currentState?.closeInput();
    for (int i = 0; i < _keys.length; i++) {
      _keys[i].currentState?.isCurrentTab = _pageIndex == i;
    }
    _reload();
    _updateTitle();
  }

  _reload() {
    _keys[_tabController.index].currentState?.reload(true);
  }

  _updateTitle() {
    _title = _tabs[_pageIndex];

    if (mounted) {
      setState(() {});
    }
  }

  void _onFinish() {
    List<int> selectedUids =
        _SelectionDataWidget.of(context)?.selectedUids.toList() ?? [];
    if (widget.onFinish != null) widget.onFinish?.call(selectedUids);
    Navigator.of(context).pop(selectedUids);
  }

  void _onSelectChanged(FriendItem item, bool selected) {
    _SelectionDataWidget? selectionData = _SelectionDataWidget.of(context);
    setState(() {
      if (selected) {
        selectionData?.addItem(item);
      } else {
        selectionData?.removeItem(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge ??
              TextStyle(fontFamily: Util.fontFamily),
          child: Text(_title),
        ),
        actions: <Widget>[
          _FinishButton(onTap: _onFinish),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              margin: const EdgeInsets.only(bottom: 6.0),
              child: Util.isUseAnimTabBar()
                  ? AnimTabBar(
                      controller: _tabController,
                      titles: _tabs,
                      marginStart: 10,
                      selectedFontSize: 18,
                      selectedFontColor: R.color.mainTextColor,
                      selectedFontWeight: FontWeight.w700,
                      unselectedFontSize: 16,
                      unselectedFontColor:
                          R.color.mainTextColor.withOpacity(0.6),
                      unselectedFontWeight: FontWeight.w500,
                    )
                  : CommonTabBar(
                      tabs: _tabsWidget,
                      controller: _tabController,
                      marginStart: 10,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                    ),
            ),
            if (_SelectionDataWidget.of(context)?.selectedItems.isNotEmpty ??
                false)
              _SelectedUserList(
                data: _SelectionDataWidget.of(context)!.selectedItems.toList(),
                onTap: (item) => _onSelectChanged(item, false),
              ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    double offset = notification.metrics.pixels;
                    double screenWidth = MediaQuery.of(context).size.width;
                    _tabController.scrollPosition = offset / screenWidth;
                  }
                  return false;
                },
                child: ExtendedTabBarView(
                  controller: _tabController,
                  physics: const ClampingScrollPhysics(),
                  children: <Widget>[
                    _FriendListWidget(
                      type: FriendsListType.Friend,
                      key: _keyFriend,
                      showSearchBar: true,
                      showPhoneFriend: true,
                      onSelected: _onSelectChanged,
                    ),
                    _FriendListWidget(
                      onSelected: _onSelectChanged,
                      type: FriendsListType.Follow,
                      key: _keyFollow,
                    ),
                    _FriendListWidget(
                      onSelected: _onSelectChanged,
                      type: FriendsListType.Fan,
                      key: _keyFan,
                    ),
                    _FriendListWidget(
                      onSelected: _onSelectChanged,
                      type: FriendsListType.Companion,
                      key: _keyCompanion,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 全选按钮
class _FinishButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FinishButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    int selectedNum =
        _SelectionDataWidget.of(context)?.selectedUids.length ?? 0;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsetsDirectional.only(start: 20, end: 16),
            child: Text(
              (selectedNum > 0)
                  ? "${R.string('chat_done')}($selectedNum)"
                  : R.string('chat_done'),
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendListWidget extends StatefulWidget {
  final String type;
  final bool showSearchBar;
  final bool showPhoneFriend; //通讯录好友
  final Function(FriendItem item, bool selected) onSelected;

  const _FriendListWidget({
    super.key,
    required this.type,
    required this.onSelected,
    this.showSearchBar = false,
    this.showPhoneFriend = false,
  });

  @override
  _FriendListWidgetState createState() => _FriendListWidgetState();
}

class _FriendListWidgetState extends State<_FriendListWidget>
    with AutomaticKeepAliveClientMixin<_FriendListWidget> {
  final int pageSize = 20;

  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  Timer? _cancelTimer;
  final List _data = [];
  final List _origin = [];
  bool _loading = true;
  bool _first = true;

  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  final ScrollController _controller = ScrollController();
  String _searchKey = '';
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  int _firstIndex = -1; //当前屏幕内可见的第一个条目索引
  int _lastIndex = -1; //当前屏幕内可见的最后一个条目索引
  final Map<int, UserConfig> _configMap = {}; //列表中用户状态信息
  Timer? _loadOnlineTimer;
  bool _isCurrentTab = true;
  bool _showDeleteUserTips = false;
  final List<int> _hasRefreshUid = [];

  set isCurrentTab(bool isCurrent) {
    _isCurrentTab = isCurrent;
    if (_isCurrentTab) {
      _restartLoadOnlineTimer();
    } else {
      _loadOnlineTimer?.cancel();
    }
  }

  bool get isCurrentTab => _isCurrentTab;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _load(1);
    _restartLoadOnlineTimer();
  }

  _restartLoadOnlineTimer() {
    _loadOnlineTimer?.cancel();
    _loadOnlineTimer = Timer.periodic(const Duration(seconds: 3), _loadOnline);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _cancelTimer?.cancel();
    closeInput();
    _loadOnlineTimer?.cancel();
    super.dispose();
  }

  // 加载更多
  _onScroll() {
    if (!_controller.hasClients) return;
    closeInput();
    if (_more == true &&
        _lock == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _load(pageIndex + 1);
    }
  }

  closeInput() {
    _inputKey.currentState?.close();
  }

  Future reload([bool force = false]) async {
    Log.d("friend view reload ${widget.type}");
    closeInput();
    if (_first && !force) {
      _first = false;
      return;
    }
    await _key.currentState?.show();
  }

  //重置数据并刷行界面
  resetData() {
    _data.clear();
    _configMap.clear();
    setState(() {});
  }

  _load(int page) async {
    _lock = true;

    String url = '${System.domain}go/yy/friend/data';

    Map<String, String> params = {
      "type": widget.type,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);

      Map res = response.value();
      List list = res['data'];
      if (page == 1) {
        _data.clear();
        _configMap.clear();
        _hasRefreshUid.clear();
        _showDeleteUserTips = widget.type == FriendsListType.Fan &&
            Util.parseBool(res['have_forbidden']);
      }

      if (list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            FriendItem friend = FriendItem.fromJson(item);
            if (friend.uid > 0) {
              _data.add(friend);
            }
          } catch (e) {
            Log.d(e);
          }
        }
        if (list.length < pageSize) {
          _more = false;
        } else {
          _more = true;
        }
      } else {
        _more = false;
      }

      if (widget.type != FriendsListType.Friend) {
        _origin.clear();
        _origin.addAll(_data);
      }

      pageIndex = page;
      _error = null;
    } catch (e) {
      Log.d(e);
      _error = e.toString();
    }

    _loading = false;
    _lock = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future _onRefresh() async {
    _more = false;
    pageIndex = 1;
    if (_controller.hasClients) {
      _controller.jumpTo(0.0);
    }

    _load(pageIndex);
  }

  Widget _buildLoadMore() {
    if (!_more && _data.length < pageSize) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(
          _more ? R.string('common_loading') : R.string('common_no_more'),
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 13.0, color: R.color.secondTextColor),
        ),
      ),
    );
  }

  String getName(Object data) {
    return (data as FriendItem).markName ?? '';
  }

  void _onSelect(FriendItem item, bool selected) {
    widget.onSelected(item, selected);
  }

  Widget _buildSearchBar() {
    if (widget.type == FriendsListType.Friend && widget.showSearchBar) {
      return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 8, bottom: 6),
        padding: const EdgeInsets.all(8.0),
        child: SearchBar(
          _onQueryChanged,
          key: _inputKey,
          height: 36,
          hintText: base.K.input_name_to_search,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 8, bottom: 6),
        padding: const EdgeInsets.all(8.0),
        child: SearchBar(
          _onLocaleQueryChanged,
          key: _inputKey,
          height: 36,
          onCancelTap: () {
            setState(() {
              _data.addAll(_origin);
            });
          },
          hintText: base.K.input_name_to_search,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    if (_error != null && pageIndex == 1) {
      return Center(
        child: ErrorData(
          error: _error,
          onTap: () {
            _load(pageIndex);
          },
        ),
      );
    }

    bool searchResultEmpty = false;

    if (_searchKey.isNotEmpty && pageIndex == 1 && _data.isEmpty) {
      searchResultEmpty = true;
    }
    List<Widget> slivers = [
      SliverToBoxAdapter(
        child: _buildSearchBar(),
      ),
    ];
    if (_loading && pageIndex == 1) {
      slivers.add(const SliverFillRemaining(
        child: Loading(),
      ));
    } else {
      if (searchResultEmpty) {
        slivers.add(
          SliverToBoxAdapter(
            child: _buildEmpty(),
          ),
        );
      } else {
        slivers.addAll([
          if (_showDeleteUserTips) const DeletedUserTips(),
          SliverList(
            delegate: FixedExtentSliverChildBuilderDelegate(
              (BuildContext context, int index) {
                FriendItem item = _data.elementAt(index);
                if (_hasRefreshUid.contains(item.uid)) {
                  UserConfig? config = _configMap[item.uid];
                  config ??= UserConfig.fromJson({});
                }
                bool selected = _SelectionDataWidget.of(context)
                        ?.selectedUids
                        .contains(item.uid) ??
                    false;
                if (selected &&
                    !(_SelectionDataWidget.of(context)
                            ?.selectedItems
                            .contains(item) ??
                        false)) {
                  _SelectionDataWidget.of(context)?.addItem(item);
                }
                return ListItemWidget(
                    selected: selected, item: item, onSelect: _onSelect);
              },
              childCount: _data.length,
              onPositionChanged: _handlePositionChanged,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [_buildLoadMore()],
            ),
          ),
        ]);
      }
    }

    return GestureDetector(
      onTap: () => closeInput(),
      child: RefreshIndicatorFactory.of(
        key: _key,
        child: SafeArea(
          top: false,
          child: CustomScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: slivers,
          ),
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        base.K.no_result,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  void _onQueryChanged(String text) {
    setState(() {
      _loading = true;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  void _onLocaleQueryChanged(String text) {
    List results = [];

    for (var element in _origin) {
      FriendItem item = element;
      if (item.name?.toLowerCase().contains(text.toLowerCase()) ?? false)
        results.add(item);
    }
    _data.addAll(results);

    setState(() {});
  }

  /// [query] 搜索key
  void _search(String query) async {
    resetData();
    _searchKey = query;
    _load(1);
  }

  void _handlePositionChanged(int firstIndex, int lastIndex) {
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
  }

  /// 获取对应数据的用户或者群组的状态信息
  _loadOnline(Timer timer) async {
    if (!isCurrentTab) return;
    if (widget.type == FriendsListType.Companion) return;
    if (_firstIndex == -1 ||
        _lastIndex == -1 ||
        (_firstIndex == 0 && _lastIndex == 0)) {
      return;
    }

    List<String> uids = [];
    List<String> gids = [];
    for (int i = _firstIndex; i <= _lastIndex; i++) {
      if (_firstIndex < 0 || _lastIndex >= _data.length) continue;
      FriendItem item = _data[i];
      String id = item.uid.toString();
      if (item.isGroup) {
        gids.add(id);
      } else {
        uids.add(id);
        if (_configMap.containsKey(item.uid)) {
          _configMap.remove(item.uid);
        }
      }
    }

    if (uids.isNotEmpty || gids.isNotEmpty) {
      try {
        await BaseRequestManager.cloudAll(uids,
            groudIds: gids, roomConfig: _configMap);

        for (var element in uids) {
          int uid = Util.parseInt(element);
          if (!_hasRefreshUid.contains(uid)) {
            _hasRefreshUid.add(uid);
          }
        }

        if (!mounted) return;
        setState(() {});
      } catch (e) {
        Log.d(e);
      }
    }
  }
}

class ListItemWidget extends StatefulWidget {
  final FriendItem item;
  final bool selected;
  final Function(FriendItem item, bool selected) onSelect;

  const ListItemWidget(
      {super.key,
      required this.item,
      required this.selected,
      required this.onSelect});

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    FriendItem item = widget.item;
    String statusStr = '';
    int rid = item.room ?? 0;
    int online = item.online ?? 0;

    if (rid > 0) {
      statusStr = R.string('msg_patrying');
    } else if (online == 1) {
      statusStr = R.string('msg_online_text');
    } else if (online == 2) {
      statusStr = R.string('room_invisible');
    } else {
      statusStr = item.onlineDiffStr ?? '';
    }

    return GestureDetector(
      onTap: () => widget.onSelect(widget.item, !widget.selected),
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            top: 10, bottom: 10, start: 20, end: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StatusAvatar(
              userAvatar: item.icon,
              uid: item.uid,
              online: online == 1,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            item.markName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 17),
                          ),
                        ),
                        if (item.official == 1)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 4),
                            child: R.img(
                              BaseAssets.shared$ic_official_png,
                              width: 23,
                              height: 14,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    statusStr,
                    style: R.textStyle.regular14
                        .copyWith(color: R.color.secondTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            widget.selected
                ? CheckBoxChecked(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                    ),
                  )
                : R.img(
                    RoomAssets.chat_room$ic_unselect_svg,
                    width: 20,
                    height: 20,
                    color: R.color.thirdTextColor,
                  ),
          ],
        ),
      ),
    );
  }
}

class _SelectedUserList extends StatelessWidget {
  final List<FriendItem> data;
  final Function(FriendItem item) onTap;

  const _SelectedUserList({required this.data, required this.onTap});

  @override
  Widget build(context) {
    ScrollController controller = ScrollController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });
    return Container(
      height: 52,
      color: R.color.mainBgColor,
      padding: const EdgeInsetsDirectional.only(bottom: 4),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsetsDirectional.only(end: 16),
          child: CommonAvatar(
            path: data[index].icon,
            shape: BoxShape.circle,
            size: 48,
            onTap: () => onTap(data[index]),
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
