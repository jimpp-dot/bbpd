import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchBar;
import '../../../k.dart';
import '../../chatRoomData.dart';
import '../../protobuf/generated/tencent_music.pb.dart';
import '../utils/ktv_theme.dart';
import '../model/song_sheet_beans.dart';
import '../repo/ktv_repo.dart';
import '../song_manage/ktv_song_manage_screen.dart';
import '../utils/ktv_lrc_util.dart';
import '../widget/ktv_song_item.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:shared/k.dart' as BaseK;

/// KTV 歌曲推荐TAB
/// 点歌 page
///
class KtvRecommendSongTab extends StatefulWidget {
  final ChatRoomData room;
  final bool autoMic;

  const KtvRecommendSongTab(
      {super.key, required this.room, this.autoMic = true});

  @override
  State<KtvRecommendSongTab> createState() => _KtvRecommendSongTabState();
}

class _KtvRecommendSongTabState extends State<KtvRecommendSongTab>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<SongTapItem> _tabs = [];

  TabController? _tabController;
  bool _isInSearch = false;
  String _queryText = '';
  final _mineTabGlobalKey = Lazy<GlobalKey<PageLoadingListState>>(
      () => GlobalKey<PageLoadingListState>());
  final GlobalKey<SearchBarState> _searchBarKey = GlobalKey();
  bool _showSearch = false;

  String? _searchType;
  late KtvSearchRcmdRepository _repository;

  ScreenStatus _screenStatus = ScreenStatus.Loading;

  final GlobalKey<PageLoadingListState> _searchResultListKey = GlobalKey();

  final Throttle _searchAction =
      Throttle(duration: const Duration(milliseconds: 250));

  @override
  void initState() {
    super.initState();
    _repository = KtvSearchRcmdRepository(widget.room.rid);
    _loadTabs();
  }

  void _loadTabs() async {
    RepSongTap resp = await KtvRepo.getSongTabs(
        widget.room.rid, Util.parseInt(widget.room.ktvSourceType));
    if (resp.success) {
      if (!Util.isCollectionEmpty(resp.data)) {
        _screenStatus = ScreenStatus.Ready;
        _tabs = resp.data;
        _showSearch = resp.showSearch;
        _searchType = resp.searchType;
        _initTabController();
      } else {
        _screenStatus = ScreenStatus.Empty;
      }
    } else {
      _screenStatus = ScreenStatus.Error;
    }

    refresh();
  }

  @override
  void dispose() {
    _searchAction.dispose();
    _tabController?.dispose();
    _repository.dispose();
    super.dispose();
  }

  int? _curTabType;

  void _initTabController() {
    int selectedIndex = 0;
    if (Util.validList(_tabs) && _curTabType != null) {
      selectedIndex = _tabs.indexWhere((_) => _.type == _curTabType);
    }
    safeRun(() {
      _tabController = TabController(
          initialIndex: selectedIndex, length: _tabs.length, vsync: this);
      _tabController?.addListener(() {
        _curTabType = _tabs[_tabController?.index ?? 0].type;
      });
    });
  }

  void _onSearchTextChange(String query) {
    String curQuery = query;
    if (curQuery.isEmpty) {
      _queryText = query;
      setState(() {});
    } else {
      _onSearch(query);
    }
  }

  bool _isConfirmSearch = false;

  void _onSearch(String query, {bool isConfirm = false}) {
    _isConfirmSearch = isConfirm;

    if ((_queryText).isEmpty) {
      _queryText = query;
      setState(() {});
    } else {
      _queryText = query;
      if (isConfirm) {
        _searchResultListKey.currentState?.refresh();
      } else {
        _searchAction.call(() {
          _searchResultListKey.currentState?.refresh();
        });
      }
    }
  }

  Widget _buildSearch() {
    return Container(
      height: 36,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SearchBar(
              _onSearchTextChange,
              onSubmitted: (text) {
                _onSearch(text, isConfirm: true);
              },
              key: _searchBarKey,
              editable: _isInSearch,
              hintText: K.ktv_song_search_hint,
              autoFocus: true,
              showCancel: false,
              bgColor: KtvTheme.secondBgColor,
              searchIconColor: KtvTheme.mainTextColor.withOpacity(0.2),
              hintStyle: TextStyle(
                  color: KtvTheme.mainTextColor.withAlpha(66), fontSize: 15),
              textStyle: TextStyle(color: KtvTheme.mainTextColor, fontSize: 15),
              onTap: () async {
                Log.d('Search bar clicked, _isInSearch: $_isInSearch');
                if (!_isInSearch) {
                  _isInSearch = true;
                  setState(() {});
                }
              },
            ),
          ),
          if (_isInSearch)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (_isInSearch) {
                    _isInSearch = false;
                    setState(() {});
                  }
                },
                child: Text(
                  K.cancel,
                  style: TextStyle(fontSize: 15, color: KtvTheme.mainTextColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildRcmd() {
    if (Util.isCollectionEmpty(_tabs)) {
      return [const SizedBox.shrink()];
    }

    return [
      Container(
        height: 48,
        padding: const EdgeInsetsDirectional.only(start: 11, end: 20),
        child: CommonTabBar(
          tabs: _tabs.map((_) => Tab(text: _.title)).toList(),
          isScrollable: true,
          controller: _tabController,
          labelColor: KtvTheme.mainTextColor,
          unselectedLabelColor: KtvTheme.mainTextColor.withAlpha(99),
          showIndicatorTabCount: 2,
        ),
      ),
      Container(
        width: Util.width,
        height: 1,
        color: R.color.secondTextColor.withOpacity(0.1),
      ),
      Expanded(
        child: TabBarView(
            controller: _tabController, children: _buildSongPageList()),
      ),
    ];
  }

  List<Widget> _buildSongPageList() {
    List<Widget> list = [];
    for (var tabItem in _tabs) {
      bool mineTab = tabItem.type == RcmdTab.TYPE_MINE;
      Widget page = PageLoadingList(
        key: mineTab ? _mineTabGlobalKey.value : null,
        itemBuilder: (c, item, index) => SongItemWidget(
          key: ValueKey('rcm-${item.platform}-${item.id}'),
          room: widget.room,
          song: item,
          autoMic: widget.autoMic,
          showSingerName: tabItem.type != RcmdTab.TYPE_ROOM_HASSING,
          type: tabItem.type,
        ),
        loadData: (page) {
          return _loadSongList(page, tabItem);
        },
        onFirstPageData: (rsp) {
          if (rsp is RcmdSongListRsp && rsp.tabs.isNotEmpty) {
            _showSearch = rsp.showSearch;
            refresh();
          }
        },
      );

      /// 我的歌曲
      if (mineTab) {
        Widget minePage = Stack(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 72),
              child: page,
            ),
            PositionedDirectional(
              bottom: Util.iphoneXBottom,
              child: _buildBottomButton(),
            )
          ],
        );
        list.add(minePage);
      } else {
        list.add(page);
      }
    }
    return list;
  }

  Future<PageListResponse> _loadSongList(int page, SongTapItem item) {
    return KtvLrcUtil.songSheetGetTabSongList(
      widget.room.rid,
      item,
      page,
      userNewApi: widget.room.useNewRequestInKtvRoomWhenOrderSong,
      ktvSourceType: widget.room.ktvSourceType ?? 0,
    );
  }

  Widget _buildBottomButton() {
    List<Color> colors = KtvTheme.gradientColors;
    String text = K.ktv_my_song_manage;
    return Container(
      height: 48,
      margin: const EdgeInsetsDirectional.only(
          bottom: 12, start: 20, end: 20, top: 12),
      width: Util.width - 40,
      decoration: BoxDecoration(
        color: KtvTheme.mainBrandColor,
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: colors),
      ),
      child: InkWell(
        onTap: () async {
          bool reloadMineTabData = false;
          await KtvSongManageScreen.show(context);
          reloadMineTabData = true;
          if (reloadMineTabData == true) {
            Log.d('ktv return song_sheet reload mineTab.');
            _mineTabGlobalKey.value.currentState?.refresh();
          }
        },
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSearchHistory() {
    Log.d(
        'In song sheet, start to build search history page, _isInSearch: $_isInSearch');
    return [
      FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!Util.isCollectionEmpty(snapshot.data)) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          K.ktv_song_search_history,
                          style: TextStyle(
                              fontSize: 13,
                              color: KtvTheme.mainTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: clearSearchHistory,
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              R.img(
                                'grabmic/gmic_ic_del_small.png',
                                width: 14,
                                height: 14,
                                package: ComponentManager.MANAGER_BASE_ROOM,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                K.room_ktv_clear_search_history,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: R.color.secondTextColor,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    if (Util.validList(snapshot.data))
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: snapshot.data!
                            .map(
                              (_) => GestureDetector(
                                onTap: () {
                                  Log.d('Search history clicked, query: $_');
                                  _searchBarKey.currentState?.setText(_);
                                },
                                child: Container(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 16, end: 16, top: 7, bottom: 7),
                                  decoration: ShapeDecoration(
                                    shape: const StadiumBorder(),
                                    color: KtvTheme.searchCardBg,
                                  ),
                                  child: Text(
                                    _,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: KtvTheme.secondTextColor),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              );
            }
          }
          return const SizedBox.shrink();
        },
        future: KtvRepo.getSearchHistory(),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 42,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text(
              K.room_ktv_search_rcmd_title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
                height: 1.1,
              ),
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                /// 刷新好友在唱
                _repository.refresh();
                Tracker.instance.track(TrackEvent.click, properties: {
                  'click_page': 'click_changeagain',
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  R.img(
                    'music/hot_search_change.svg',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 16,
                    color: R.color.secondTextColor,
                  ),
                  Text(
                    K.change_another_hot,
                    style: TextStyle(
                      fontSize: 11,
                      color: R.color.secondTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
      Expanded(
        child: LoadingMoreList(
          ListConfig<Song>(
            itemBuilder: _itemBuilder,
            sourceList: _repository,
            indicatorBuilder: _indicatorBuilder,
            //isLastOne: false
          ),
        ),
      ),
    ];
  }

  Widget _itemBuilder(BuildContext context, Song item, int index) {
    return SongItemWidget(
      key: ValueKey('ktv-search-rcmd-${item.platform}-${item.id}'),
      room: widget.room,
      song: item,
      autoMic: widget.autoMic,
      type: RcmdTab.TYPE_SEARCH_RCMD,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  void clearSearchHistory() async {
    await KtvRepo.clearSearchHistory();
    refresh();
  }

  List<Widget> _buildSearchResult() {
    return [
      Expanded(
        child: PageLoadingList(
          key: _searchResultListKey,
          itemBuilder: (c, item, index) {
            if (item is Song) {
              return SongItemWidget(
                room: widget.room,
                song: item,
                autoMic: widget.autoMic,
                key: ValueKey('search-${item.platform}-${item.id}'),
                type: 0,
              );
            } else {
              return Text(
                item,
                style: TextStyle(
                    fontSize: 13,
                    color: KtvTheme.secondTextColor,
                    fontWeight: FontWeight.w600),
              );
            }
          },
          loadData: (page) => _searchRequest(page),
        ),
      ),
    ];
  }

  Future<PageListResponse> _searchRequest(int page) {
    KtvRepo.saveHistoryWord(_queryText);

    return KtvLrcUtil.songSheetSearchMusic(
      widget.room.rid,
      _queryText,
      _searchType ?? '',
      page,
      _isConfirmSearch,
      userNewApi: widget.room.useNewRequestInKtvRoomWhenOrderSong,
      ktvSourceType: widget.room.ktvSourceType ?? 0,
    );
  }

  List<Widget> _buildContent() {
    if (_screenStatus == ScreenStatus.Loading) {
      return [
        const Expanded(child: Center(child: CupertinoActivityIndicator()))
      ];
    } else if (_screenStatus == ScreenStatus.Error) {
      return [const Expanded(child: Center(child: ErrorData()))];
    } else if (_screenStatus == ScreenStatus.Empty) {
      return [const Expanded(child: Center(child: EmptyWidget()))];
    } else {
      if (!_isInSearch) return _buildRcmd();

      if (_queryText.isEmpty) return _buildSearchHistory();

      return _buildSearchResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (_showSearch == true) _buildSearch(),
        ..._buildContent(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class KtvSearchRcmdRepository extends LoadingMoreBase<Song> {
  int rid;
  int _page = 1;
  bool _hasMore = true;

  KtvSearchRcmdRepository(this.rid);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      RcmdSongListRsp res = await KtvRepo.getRcmdSongList(
          rid, '${RcmdTab.TYPE_SEARCH_RCMD}', _page);

      if (Util.validList(res.songs) && _page == 1) {
        clear();
      }

      bool hasData = Util.validList(res.songs);
      _hasMore = false;

      /// 支持换一批操作，不需要翻页

      if (hasData) {
        addAll(res.songs);
        _page++;
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
