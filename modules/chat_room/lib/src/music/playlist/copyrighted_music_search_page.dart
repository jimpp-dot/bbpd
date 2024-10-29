import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchBar;

import '../../../chat_room.dart';
import '../../../k.dart';
import '../../ktv/model/song_sheet_beans.dart';
import '../../ktv/repo/ktv_repo.dart';
import '../../ktv/utils/ktv_lrc_util.dart';
import '../../ktv/utils/ktv_theme.dart';
import '../../ktv/widget/ktv_song_item.dart';
import '../../protobuf/generated/tencent_music.pb.dart';

/// 一起听：声网版权音乐推荐/搜索页
/// zego v2 版权音乐
///
class CopyrightedMusicSearchPage extends StatefulWidget {
  final ChatRoomData room;

  const CopyrightedMusicSearchPage({super.key, required this.room});

  @override
  State<CopyrightedMusicSearchPage> createState() =>
      _CopyrightedMusicSearchState();

  static Future show(
      {required BuildContext context, required ChatRoomData room}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CopyrightedMusicSearchPage(room: room),
        settings: const RouteSettings(name: '/CopyrightedMusicSearchPage'),
      ),
    );
  }
}

class _CopyrightedMusicSearchState extends State<CopyrightedMusicSearchPage>
    with TickerProviderStateMixin {
  List<SongTapItem> _tabs = [];

  TabController? _tabController;
  bool _isInSearch = false;
  String _queryText = '';
  late GlobalKey<SearchBarState> _searchBarKey;
  bool _showSearch = false;

  ScreenStatus _screenStatus = ScreenStatus.Loading;

  final GlobalKey<PageLoadingListState> _searchResultListKey = GlobalKey();

  final Throttle _searchAction =
      Throttle(duration: const Duration(milliseconds: 250));

  @override
  void initState() {
    super.initState();
    _searchBarKey = GlobalKey();
    _loadTabs();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _searchAction.dispose();
    super.dispose();
  }

  void _loadTabs() async {
    RepSongTap resp = await KtvRepo.getSongTabs(
      widget.room.rid,
      Util.parseInt(widget.room.ktvSourceType),
      filterCommon: 1,
    );

    if (resp.success) {
      if (!Util.isCollectionEmpty(resp.data)) {
        _screenStatus = ScreenStatus.Ready;
        _tabs = resp.data;
        _showSearch = resp.showSearch;
        safeRun(() {
          _tabController =
              TabController(initialIndex: 0, length: _tabs.length, vsync: this);
        });
      } else {
        _screenStatus = ScreenStatus.Empty;
      }
    } else {
      _screenStatus = ScreenStatus.Error;
    }

    refresh();
  }

  void _onSearchTextChange(String query) {
    Log.d('On search bar text changed, query: $query');
    String curQuery = query;

    if (curQuery.isEmpty) {
      _queryText = query;
      refresh();
    } else {
      _onSearch(query);
    }
  }

  void _onSearch(String query, {bool isConfirm = false}) {
    if (_queryText.isEmpty) {
      _queryText = query;
      refresh();
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
            )
        ],
      ),
    );
  }

  List<Widget> _buildRcmd() {
    Log.d('In song sheet, start to build rcmd page');

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
      Expanded(
        child: TabBarView(
            controller: _tabController, children: _buildSongPageList()),
      ),
    ];
  }

  List<Widget> _buildSongPageList() {
    List<Widget> list = [];
    for (var tabItem in _tabs) {
      Widget page = PageLoadingList(
        itemBuilder: (c, item, index) => SongItemWidget(
          key: ValueKey('agora-rcm-${item.platform}-${item.id}'),
          room: widget.room,
          song: item,
          autoMic: true,
          showSingerName: tabItem.type != RcmdTab.TYPE_ROOM_HASSING,
          type: tabItem.type,
          isMusicRoom: true,
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
      list.add(page);
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

  List<Widget> _buildSearchHistory() {
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
                    const SizedBox(height: 18),
                    Text(
                      K.ktv_song_search_history,
                      style: TextStyle(
                          fontSize: 13,
                          color: KtvTheme.mainTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 14),
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
      )
    ];
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
                autoMic: true,
                key: ValueKey('agora-search-${item.platform}-${item.id}'),
                type: 0,
                isMusicRoom: true,
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
      '',
      page,
      false,
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
    return Scaffold(
      appBar: BaseAppBar(K.ktv_music_order),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_showSearch) _buildSearch(),
          ..._buildContent(),
        ],
      ),
    );
  }
}
