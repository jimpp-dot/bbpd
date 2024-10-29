import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchBar;

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/model/friend_bean.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/k.dart';
import 'package:moment/src/api/friend_list_repo.dart';
import 'package:moment/src/model/publish_at_bean.dart';

typedef _OnItemSelected = bool Function(FriendItem item);

class _ATListTabUI {
  final GlobalKey<_AtListListWidgetState> key;
  final String tab;
  final String listType;

  _ATListTabUI({required this.key, required this.tab, required this.listType});
}

class ATListScreen extends StatefulWidget {
  final bool isCircleAtAccountWhiteList;
  final int maxATNum;

  static Future<List<PublishATBean>?> openAddATScreen(BuildContext context,
      {Key? key,
      required int maxATNum,
      required bool isCircleAtAccountWhiteList}) {
    return displayModalBottomSheet(
      maxHeightRatio: 1,
      context: context,
      builder: (BuildContext context) {
        return ATListScreen(
            key: key,
            maxATNum: maxATNum,
            isCircleAtAccountWhiteList: isCircleAtAccountWhiteList);
      },
    );
  }

  const ATListScreen(
      {Key? key,
      required this.maxATNum,
      required this.isCircleAtAccountWhiteList})
      : super(key: key);

  @override
  _ATListScreenState createState() => _ATListScreenState();
}

class _ATListScreenState extends State<ATListScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();
  final List<FriendItem> _selectFriends = []; // 已选择的标签
  final List<_ATListTabUI> _pageData = [];
  late GlobalKey<_AtListListWidgetState> _currentPageKey;
  ExtendedTabController? _tabController;
  int _pageIndex = 0;
  String? _searchKey;
  Timer? _cancelTimer;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _cancelTimer?.cancel();
    super.dispose();
  }

  void _initData() {
    if (widget.isCircleAtAccountWhiteList) {
      _pageData.add(_ATListTabUI(
          key: GlobalKey<_AtListListWidgetState>(),
          tab: base.K.base_follow,
          listType: FriendsListType.Follow));
      _pageData.add(_ATListTabUI(
          key: GlobalKey<_AtListListWidgetState>(),
          tab: base.K.base_fans,
          listType: FriendsListType.Fan));
      _pageData.add(_ATListTabUI(
          key: GlobalKey<_AtListListWidgetState>(),
          tab: K.moment_follow_each_other,
          listType: FriendsListType.Friend));
      _tabController = ExtendedTabController(
          initialIndex: _pageIndex, length: _pageData.length, vsync: this)
        ..addListener(_onTabChanged);
    } else {
      _pageData.add(_ATListTabUI(
          key: GlobalKey<_AtListListWidgetState>(),
          tab: '',
          listType: FriendsListType.Friend));
    }
    _currentPageKey = _pageData[_pageIndex].key;
  }

  _onTabChanged() {
    if (_pageIndex == _tabController?.index) {
      return;
    }
    _pageIndex = _tabController!.index;
    _currentPageKey = _pageData[_pageIndex].key;
    _currentPageKey.currentState?.refresh(_searchKey);
  }

  void _onSureTaped() {
    final List<PublishATBean> atBeans = _selectFriends.isNotEmpty
        ? _selectFriends
            .map((e) => PublishATBean(name: e.markName, uid: e.uid ?? 0))
            .toList()
        : [];
    Navigator.of(context).pop(atBeans);
  }

  void _onQueryChanged(String text) {
    setState(() {});
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  /// [query] 搜索key
  void _search(String query) async {
    if (!mounted) return;
    _searchKey = query;
    _currentPageKey.currentState?.refresh(_searchKey);
  }

  void _closeInput() {
    _inputKey.currentState?.close();
  }

  void _onTap(FriendItem item) {
    if (_selectFriends.contains(item)) {
      _selectFriends.remove(item);
    } else {
      if (_selectFriends.length >= widget.maxATNum) {
        Fluttertoast.showToast(
            msg: K.moment_add_at_max_num(['10']), gravity: ToastGravity.CENTER);
        return;
      } else {
        _selectFriends.add(item);
      }
    }
    setState(() {});
  }

  bool _onSelected(FriendItem item) {
    return _selectFriends.contains(item);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // 防止点击事件穿透
      child: Container(
        height: Util.height - kToolbarHeight,
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          color: R.colors.homeBgColor,
        ),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          _buildAppBar(),
          _buildSearch(),
          ...(_pageData.length > 1 ? _renderTab() : _buildBody()),
        ]),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: R.colors.thirdTextColor,
                borderRadius: const BorderRadius.all(Radius.circular(2.5)),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              NavigatorClose(
                alignment: AlignmentDirectional.centerStart,
                iconColor: R.colors.mainTextColor,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    K.moment_at_title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: R.colors.mainTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextButton(
                  onPressed: _onSureTaped,
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: Util.fontFamily,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: R.colors.mainBrandColor,
                    minimumSize: const Size(58, 32),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(K.moment_confirm),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          top: 6, bottom: 6, start: 20, end: 20),
      child: SearchBar(
        _onQueryChanged,
        key: _inputKey,
        height: 36,
        hintText: base.K.input_name_to_search,
        // hintStyle: TextStyle(color: R.colors.thirdTextColor, fontSize: 15),
        // textStyle: TextStyle(color: R.colors.mainTextColor, fontSize: 15),
        // bgColor: R.colors.homeSearchBgColor,
      ),
    );
  }

  List<Widget> _buildBody() {
    return [
      Expanded(
        child: GestureDetector(
          onTap: _closeInput,
          child: _AtListListWidget(
              key: _pageData[0].key,
              listType: _pageData[0].listType,
              onItemTap: _onTap,
              onSelected: _onSelected,
              searchKey: _searchKey),
        ),
      ),
    ];
  }

  List<Widget> _renderTab() {
    return [
      Container(
        height: 44,
        alignment: AlignmentDirectional.centerStart,
        child: CommonTabBar(
          tabs: _pageData
              .map((e) => Tab(
                    child: Text(e.tab),
                  ))
              .toList(),
          isScrollable: true,
          controller: _tabController,
          labelColor: R.colors.mainTextColor,
          unselectedLabelColor: R.colors.secondTextColor,
          labelStyle: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              TextStyle(color: R.colors.secondTextColor, fontSize: 14),
          indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 6),
            wantWidth: 12,
            draggingWidth: 12.0,
          ),
          indicatorWeight: 0,
          marginStart: 12,
          marginEnd: 12,
          labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: _closeInput,
          child: ExtendedTabBarView(
            controller: _tabController,
            physics: const ClampingScrollPhysics(),
            children: _pageData.map((e) {
              return _AtListListWidget(
                  key: e.key,
                  listType: e.listType,
                  onItemTap: _onTap,
                  onSelected: _onSelected,
                  searchKey: _searchKey);
            }).toList(),
          ),
        ),
      ),
    ];
  }
}

class _AtListListWidget extends StatefulWidget {
  final ValueChanged<FriendItem> onItemTap;
  final _OnItemSelected onSelected;
  final String? searchKey;
  final String listType;

  const _AtListListWidget(
      {super.key,
      required this.listType,
      required this.onItemTap,
      required this.onSelected,
      this.searchKey});

  @override
  State<_AtListListWidget> createState() => _AtListListWidgetState();
}

class _AtListListWidgetState extends State<_AtListListWidget>
    with AutomaticKeepAliveClientMixin {
  late FriendListRepo _repository;
  String? _errorMessage;
  String? _searchKey;

  @override
  void initState() {
    _repository =
        FriendListRepo(listType: widget.listType, searchKey: widget.searchKey);
    super.initState();
  }

  void refresh(String? searchKey) {
    _searchKey = searchKey;
    _repository.searchKey = _searchKey;
    _repository.refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildFriendList();
  }

  Widget _buildFriendList() {
    return LoadingMoreList(
      ListConfig<FriendItem>(
        cacheExtent: 0,
        itemBuilder: _itemBuilder,
        physics: const AlwaysScrollableScrollPhysics(),
        sourceList: _repository,
        indicatorBuilder: _indicatorBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, FriendItem friend, int index) {
    String subTitle = friend.sign ?? '';
    final hasSubTitle = subTitle.isNotEmpty;
    return InkWell(
      onTap: () {
        widget.onItemTap(friend);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          _renderImage(context, friend),
          const SizedBox(
            width: 12,
            height: 72,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Util.width - 140,
                  child: Text(
                    friend.markName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: Util.fontFamily,
                      color: R.colors.mainTextColor,
                    ),
                  ),
                ),
                if (hasSubTitle)
                  const SizedBox(
                    height: 6,
                  ),
                if (hasSubTitle)
                  SizedBox(
                    width: Util.width - 140,
                    child: Text(
                      subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: Util.fontFamily,
                        color: R.colors.thirdTextColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          R.img(
            widget.onSelected(friend)
                ? 'moment_at_selected.svg'
                : 'moment_at_unSelected.png',
            package: ComponentManager.MANAGER_MOMENT,
            color: widget.onSelected(friend) ? null : R.colors.mainTextColor,
            key: UniqueKey(),
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _renderImage(BuildContext context, FriendItem item) {
    return CommonAvatar(
      path: item.icon,
      size: 52,
      shape: BoxShape.circle,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: R.colors.thirdTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container(
        height: 0,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage,
          textColor: R.colors.thirdTextColor,
          loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      final searchIsEmpty = _searchKey == null || _searchKey!.isEmpty;
      if (searchIsEmpty) {
        return ErrorData(
          error: K.moment_no_data,
          fontColor: R.colors.secondTextColor,
          onTap: () {
            _repository.refresh();
          },
        );
      } else {
        return _buildEmpty();
      }
    }
    return LoadingFooter(
      hasMore: true,
      textColor: R.colors.thirdTextColor,
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        base.K.no_result,
        style: TextStyle(color: R.colors.secondTextColor, fontSize: 15),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
