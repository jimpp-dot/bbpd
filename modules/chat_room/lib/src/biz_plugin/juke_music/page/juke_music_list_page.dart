import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_music_my_order_song_list.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_music_order_shopping_widget.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_music_song_list.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_order_pay_mixin.dart';
import 'package:chat_room/src/protobuf/generated/juke_music.pb.dart';
import 'package:flutter/material.dart' hide SearchBar;

class JukeTabItem {
  String name;
  String type;

  JukeTabItem(this.name, this.type);
}

///歌单列表
class JukeMusicOrderPage extends StatefulWidget {
  final ChatRoomData room;
  final int? singerUid; // 选中指定歌手

  const JukeMusicOrderPage({Key? key, required this.room, this.singerUid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => JukeMusicOrderPageState();
}

class JukeMusicOrderPageState extends State<JukeMusicOrderPage>
    with
        TickerProviderStateMixin<JukeMusicOrderPage>,
        JukeOrderPayMixin<JukeMusicOrderPage> {
  ExtendedTabController? _tabController;

  final List<JukeTabItem> _tabs = [
    JukeTabItem(K.room_juke_ta_song, 'all'),
    JukeTabItem(K.room_juke_my_order, 'order')
  ];
  final List<GlobalKey> _keys = [
    GlobalKey<JukeMusicSongListState>(),
    GlobalKey<JukeMusicMyOrderSongListState>(),
  ];
  final List<Widget> _tabWidgets = [];
  final List<Widget> _pageWidgets = [];

  List<SingerData> singerList = [];

  SingerData? _curSinger;

  int get curSingerUid => _curSinger?.uid ?? 0;
  String get curSingerName {
    String name = _curSinger?.name ?? '';
    if (name.length > 6) {
      name = '${name.safeSubstring(0, 6)}...';
    }
    return name;
  }

  String _searchText = '';

  String get searchText => _searchText;

  List<Song> selectedList = [];
  int _totalPrice = 0;
  Map<int, int> singerPriceMap = {};

  final GlobalKey<SearchBarState> _searchBarKey = GlobalKey();
  final GlobalKey<JukeMusicSongListState> _searchResultKey = GlobalKey();
  Timer? _searchTimer;

  final Throttle _throttle = Throttle();

  bool _loading = true;
  String _errorStr = '';

  @override
  void initState() {
    super.initState();
    _loadSingerData();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _tabController?.dispose();
    super.dispose();
  }

  void _loadSingerData() async {
    _loading = true;
    _errorStr = '';
    refresh();
    RespQuerySingers resp =
        await JukeMusicRepos.querySingerList(rid: widget.room.realRid);
    _loading = false;
    if (resp.success) {
      if (resp.singers.isNotEmpty) {
        singerList.addAll(resp.singers
            .where((singer) =>
                (!ChatRoomUtil.isBossChairByPosition(singer.position) &&
                    !ChatRoomUtil.isReceptionChair(singer.position) &&
                    singer.uid > 0 &&
                    singer.uid != Session.uid)) //非Boss位，非接待位，非自己
            .toList());
        if (!Util.isCollectionEmpty(singerList)) {
          if (widget.singerUid != null && widget.singerUid! > 0) {
            for (SingerData item in singerList) {
              if (item.uid == widget.singerUid) {
                _curSinger = item;
                break;
              }
            }
          } else {
            _curSinger = singerList[0];
          }
          _initTabs();
          refresh();
          return;
        }
      }
      _errorStr = K.juke_music_empty_text;
    } else {
      _errorStr = resp.msg;
    }
    refresh();
  }

  void _initTabs() {
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabs.length, vsync: this),
    );
    _tabs.forEachIndexed((i, e) {
      _tabWidgets.add(Text(e.name));
      if (e.type == 'order') {
        _pageWidgets.add(JukeMusicMyOrderSongListWidget(
            key: _keys[i], rid: widget.room.realRid, parentState: this));
      } else {
        _pageWidgets.add(JukeMusicSongListWidget(
            key: _keys[i],
            rid: widget.room.realRid,
            type: e.type,
            parentState: this));
      }
    });
  }

  void _loadData() {
    for (var key in _keys) {
      State? state = key.currentState;
      if (state != null && state is JukeMusicSongListState) {
        state.loadData();
      }
      if (state != null && state is JukeMusicMyOrderSongListState) {
        state.loadData();
      }
    }
  }

  void refreshInner() {
    for (var key in _keys) {
      State? state = key.currentState;
      if (state != null && state is JukeMusicSongListState) {
        state.refresh();
      }
    }
  }

  void updateSingerPrice(SongConfig config) {
    singerPriceMap[config.uid] = config.giftCount * config.giftPrice;
    _calcTotalPrice();
  }

  bool inShopping(Song item) {
    return selectedList.indexWhere((e) => e.id == item.id) >= 0;
  }

  void addSongToShopping(Song item) {
    if (inShopping(item)) {
      selectedList.removeWhere((e) => e.id == item.id);
    } else {
      selectedList.add(item);
    }
    _calcTotalPrice();
  }

  int getSingerPrice(int singerId) {
    if (singerPriceMap.containsKey(singerId)) {
      return singerPriceMap[singerId] ?? 0;
    }
    return 0;
  }

  void _calcTotalPrice() {
    int totalPrice = 0;
    for (var item in selectedList) {
      totalPrice += getSingerPrice(item.singerUid);
    }
    _totalPrice = totalPrice;
    refresh();
    refreshInner();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (searchText.isNotEmpty) {
          _searchText = '';
          _searchBarKey.currentState?.clearText();
          refresh();
        }
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildContent(),
        if (searchText.isNotEmpty)
          PositionedDirectional(
            start: 20,
            end: 20,
            top: 100,
            bottom: 76 + Util.iphoneXBottom,
            child: _buildSearchResultWidget(),
          ),
      ],
    );
  }

  Widget _buildSearchResultWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Color(0xFF2C103F),
      ),
      child: JukeMusicSongListWidget(
        key: _searchResultKey,
        rid: widget.room.realRid,
        type: 'search',
        parentState: this,
      ),
    );
  }

  Widget _buildContent() {
    Widget child;
    if (_loading) {
      child = const Loading();
    } else if (_errorStr.isNotEmpty) {
      child = ErrorData(
        error: _errorStr,
        fontColor: Colors.white.withOpacity(0.5),
        onTap: _loadSingerData,
      );
    } else {
      child = Column(
        children: [
          _buildSearch(),
          _buildSinger(),
          _buildTabs(),
          Divider(height: 1, color: Colors.white.withOpacity(0.1)),
          Expanded(child: _buildPages()),
          _buildBottomShopping(),
        ],
      );
    }
    return child;
  }

  Widget _buildBottomShopping() {
    return InkWell(
      onTap: () async {
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'selected_songslist',
        });
        bool? result = await JukeMusicOrderShoppingWidget.show(context, this);
        if (result == true) {
          gotoOrderPay();
        }
      },
      child: Container(
        width: double.infinity,
        height: 56 + Util.iphoneXBottom,
        color: const Color(0xFF2C103F),
        padding: EdgeInsetsDirectional.only(
            start: 16, end: 16, bottom: Util.iphoneXBottom),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            R.img('ic_room_juke_order_shopping.webp',
                width: 36,
                height: 36,
                package: ComponentManager.MANAGER_BASE_ROOM),
            const SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$totalPrice',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(width: 4),
                    R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      K.room_juke_song_shoping_count(
                          ['${selectedList.length}']),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    R.img('ic_juke_arrow_down.webp',
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                  ],
                ),
              ],
            ),
            const Spacer(),
            _buildGoPay(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoPay() {
    return InkWell(
      onTap: gotoOrderPay,
      child: Container(
        width: 68,
        height: 30,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_confirm,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPages() {
    return TabBarView(
      controller: _tabController,
      children: _pageWidgets,
    );
  }

  Widget _buildTabs() {
    return Container(
      width: double.infinity,
      height: 48,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: _tabWidgets,
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.white,
        onTap: (index) {
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': (index == 0
                ? 'top_songs'
                : (index == 1 ? "ta's_songlist" : "I_ordered_it")),
          });
        },
        unselectedLabelColor: Colors.white.withOpacity(0.6),
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
        indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 16,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      ),
    );
  }

  Widget _buildSinger() {
    return Container(
      width: double.infinity,
      height: 66,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          Text(
            K.ktv_report_singer,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemCount: singerList.length,
              itemBuilder: (context, index) {
                return _buildSingerIcon(singerList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingerIcon(SingerData item) {
    bool selected = curSingerUid == item.uid;
    return InkWell(
      onTap: () {
        _curSinger = item;
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'singer_portrait',
        });
        refresh();
        _loadData();
      },
      child: Container(
        width: 40,
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        alignment: AlignmentDirectional.topCenter,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CommonAvatar(
              path: item.icon,
              size: 40,
              shape: BoxShape.circle,
            ),
            if (selected) ...[
              Container(
                width: 40,
                height: 40,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(color: Color(0xFF926AFF), width: 1)),
                ),
              ),
              const Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: SelectedIcon(
                    size: 16,
                  )),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.center,
      child: SearchBar(
        _onSearchTextChange,
        key: _searchBarKey,
        height: 40,
        borderRadius: BorderRadius.circular(12),
        hintText: K.room_juke_music_order_search_hint([curSingerName]),
        bgColor: Colors.white.withOpacity(0.2),
        showSearchIcon: true,
        searchIcon: R.img(
          'ic_search.svg',
          width: 20,
          height: 20,
          color: Colors.white,
        ),
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
        textStyle: const TextStyle(color: Colors.white, fontSize: 15),
        onTap: () {
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': 'search_bar',
          });
        },
      ),
    );
  }

  void _onSearchTextChange(String? input) {
    _searchText = input?.trim() ?? '';
    _searchTimer?.cancel();
    _searchTimer = Timer(
        Duration(milliseconds: searchText.isEmpty ? 0 : 800), () => _search());
  }

  void _search() {
    State? state = _searchResultKey.currentState;
    if (state != null && state is JukeMusicSongListState) {
      state.loadData();
    }
    refresh();
  }

  /// 支付
  void _pay() {
    pay('available');
  }

  @override
  Map getPayParam() {
    return {
      'money': totalPrice,
      'type': 'slp-consume',
      'params': {
        'consume_type': 'music_order',
        'rid': widget.room.realRid,
        'order_songs': selectedList
            .map((e) => {'song_id': e.id, 'singer_id': e.singerUid})
            .toList(),
      }
    };
  }

  @override
  int get totalPrice => _totalPrice;

  void gotoOrderPay() async {
    _throttle.call(() async {
      if (selectedList.isNotEmpty) {
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'ok_button',
        });
        _pay();
      }
    });
  }
}
