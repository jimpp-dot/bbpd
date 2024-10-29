import 'dart:math';

import 'package:shared/shared.dart' hide RoomListItem;
import 'package:flutter/material.dart'
    hide NestedScrollView, NestedScrollViewState;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rank/assets.dart';
import 'package:rank/rank.dart';

import '../../k.dart';

/// 列表item builder，对外提供了自定义item样式的功能
typedef RoomListItemBuilder = RoomListItem Function(
    RoomItemModel model, RoomFrom from);

class LiveScreen extends StatefulWidget {
  final String title;
  final RoomListItemBuilder? itemBuilder;
  final Widget? topBarWidget; //定制的topBar,高度需要为kToolbarHeight
  final Brightness brightness; //定制的brightness

  const LiveScreen(this.title,
      {super.key,
      this.itemBuilder,
      this.topBarWidget,
      this.brightness = Brightness.light});

  @override
  LiveScreenState createState() {
    return LiveScreenState();
  }
}

class LiveScreenState extends State<LiveScreen>
    with AutomaticKeepAliveClientMixin<LiveScreen>, TickerProviderStateMixin {
  TabController? _tabController;
  final ScrollController _customScrollViewController = ScrollController();
  final GlobalKey<NestedScrollViewState> _nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  final List<GlobalKey<LiveListState>> _tabRefreshKeys =
      <GlobalKey<LiveListState>>[];

  static const double bannerPaddingLeft = 16;
  static final double bannerWidth = Util.width - (2 * bannerPaddingLeft);
  static final double bannerHeight = bannerWidth * 0.2566;
  static const double bannerPaddingTop = 8;
  static const double bannerPaddingBottom = 12;

  // banner
  final List<BannerBean> _banner = <BannerBean>[];

  // TAB
  List<TabItem> _tab = <TabItem>[];
  bool _showDefaultTab = true;
  String? _defaultTab; // 初次加载时默认显示的tab

  bool _loading = true;
  String? _errorMessage;

  int initialIndex = 0;

  @override
  bool get wantKeepAlive => true;

  Future<void> tableViewScrollTop() async {
    Log.d('tableViewScrollTop');
    try {
      if (_nestedScrollKey.currentState != null &&
          _nestedScrollKey.currentState!.currentInnerPosition.extentBefore >
              0) {
        Log.d('tableViewScrollTop, animateTo 0');
        // inner view不在顶部，移动到顶部
        _nestedScrollKey.currentState!.currentInnerPosition.animateTo(0.0,
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      }
    } catch (e) {
      Log.d('tableViewScrollTop error: $e');
    }
  }

  scrollToTop() {
    if (!_customScrollViewController.hasClients) return;
    _customScrollViewController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );

    // tabview滑动到顶部
    tableViewScrollTop();
  }

  reload() {
    if (!_customScrollViewController.hasClients) return;
    _customScrollViewController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );

    bool reload = true;
    if (_loading || _errorMessage != null) {
      reload = false;
    }

    _loadData(reload: reload);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData({bool reload = false}) async {
    try {
      String url = '${System.domain}banner/live';

      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        _errorData();
        return;
      }
      Map res = response.response as Map;
      if (res['success'] == false) {
        _errorData();
        return;
      }

      Map? data = res['data'];

      if (data == null || data['tab'] == null) {
        _errorData();
        return;
      }

      _banner.clear();

      if (data['banner'] != null && data['banner'].length > 0) {
        for (int i = 0; i < data['banner'].length; i++) {
          Map item = data['banner'][i];
          try {
            BannerBean tmpItem = BannerBean.fromJson(item);
            _banner.add(tmpItem);
          } catch (e) {
            Log.d(e);
          }
        }

        // swiper展示第一帧时不回调onIndexChanged
        if (_banner.isNotEmpty) {
          _reportBannerExpose(_banner[0]);
        }
      }

      List<TabItem> newTab = <TabItem>[];

      _defaultTab = data['tab']['default'];
      List tabKeys = data['tab']['list'];
      for (var map in tabKeys) {
        if (map is Map) {
          map.forEach((key, value) {
            TabItem tab = TabItem(key, value);
            newTab.add(tab);
          });
        }
      }

      bool needChangeTab = true;
      if (reload && _tab.isNotEmpty && _tab.length == newTab.length) {
        needChangeTab = false;
        for (int i = 0; i < _tab.length; i++) {
          if (_tab[i].type != newTab[i].type) {
            needChangeTab = true;
          }
        }
      }

      _refreshUi(needChangeTab, newTab);

      _errorMessage = null;

      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      Log.d('liveScreen loadData error: ${e.toString()}');
      String message = e.toString();
      if (e is XhrError && e.code == XhrErrorCode.Domain) {
        message = R.string('network_unavailable');
      }
      if (mounted) {
        setState(() {
          _loading = false;
          _errorMessage = message;
        });
      }
    }
  }

  _errorData() {
    if (mounted) {
      setState(() {
        _loading = false;
        _errorMessage = K.rank_no_data;
      });
    }
  }

  _refreshUi(bool needChangeTab, List<TabItem> newTab) {
    if (!needChangeTab) {
      // 非初次加载，且TAB未发生改变
      Log.d('liveScreen loadData tab isnt change');
      if (_tabController != null &&
          _tabController!.index >= 0 &&
          _tabRefreshKeys.length > _tabController!.index) {
        if (_tabRefreshKeys[_tabController!.index].currentState != null) {
          _tabRefreshKeys[_tabController!.index].currentState?.refresh();
        }
      }
    } else {
      Log.d('liveScreen loadData tab is changed');

      _tab = newTab;
      _tabRefreshKeys.clear();

      for (int i = 0; i < _tab.length; i++) {
        _tabRefreshKeys
            .add(GlobalKey<LiveListState>(debugLabel: 'refreshTab_$i'));
      }

      initialIndex = 0;
      if (_tabController != null) {
        initialIndex = min(_tabController!.index, _tab.length - 1);
      }
      if (_showDefaultTab == true) {
        int index = _tab.indexWhere((item) => item.type == _defaultTab);
        if (index >= 0) {
          initialIndex = index;
        }
        _showDefaultTab = false;
      }

      _tabController = TabController(
          initialIndex: initialIndex, length: _tab.length, vsync: this);
      _tabController!.addListener(_onTabChanged);
    }
  }

  _onTabChanged() {
    // 切换TAB
    if (mounted &&
        _tabController != null &&
        !_tabController!.indexIsChanging &&
        _tabController!.index >= 0 &&
        _tabRefreshKeys.length > _tabController!.index) {
      if (_tabRefreshKeys[_tabController!.index].currentState != null) {
        _tabRefreshKeys[_tabController!.index].currentState?.refresh();
      }
    }
  }

  /// --- begin: 外部可重写的部分 ---
  Color get backgroundColor => R.color.mainBgColor;

  Color get titleColor => R.color.mainTextColor;

  Color get labelColor => R.color.mainTextColor;

  Color get unselectedLabelColor => R.color.secondTextColor;

  Brightness get brightness => widget.brightness;

  EdgeInsetsGeometry? get listPadding => null;

  /// --- end: 外部可重写的部分 ---

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            end: 0,
            child: CommonNestedScrollView(
              key: _nestedScrollKey,
              controller: _customScrollViewController,
              pinnedHeaderSliverHeightBuilder: () {
                return MediaQuery.of(context).padding.top + kToolbarHeight;
              },
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (context, boxIsScrolled) {
                return [
                  _buildSliverAppBar(context),
                ];
              },
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (_tab.isNotEmpty) _renderTab(),
                  Expanded(
                    child: _buildBody(),
                  ),
                ],
              ),
              innerScrollPositionKeyBuilder: () {
                return Key('live_${_tab[_tabController?.index ?? 0].type}');
              },
            ),
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: _buildAppBar(),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    double flexibleHeight = _banner.isNotEmpty
        ? bannerHeight + bannerPaddingBottom + bannerPaddingTop
        : 0.01;

    return SliverAppBar(
      // brightness: brightness,
//      backgroundColor: R.color.mainBgColor,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      expandedHeight: kToolbarHeight + flexibleHeight,
      pinned: true,
      floating: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: _banner.isNotEmpty ? _buildBanner() : Container(),
      ),
    );
  }

  Widget _buildAppBar() {
    if (widget.topBarWidget != null) {
      return widget.topBarWidget!;
    }

    InheritedWidget appBar = MediaQuery(
      data: MediaQuery.of(context).copyWith(
          padding: MediaQuery.of(context).padding.copyWith(bottom: 0)),
      child: AppBar(
        automaticallyImplyLeading: false,
        // brightness: brightness,
//      backgroundColor: R.color.mainBgColor,
        backgroundColor: backgroundColor,
        title: Text(
          widget.title,
          style: R.textStyle.title.copyWith(fontSize: 22, color: titleColor),
        ),
        centerTitle: false,
        actions: _buildActions(),
        elevation: 0,
      ),
    );
    return appBar;
  }

  Widget _buildBanner() {
    double top =
        bannerPaddingTop + MediaQuery.of(context).padding.top + kToolbarHeight;
    return Padding(
        padding: EdgeInsetsDirectional.only(
            start: bannerPaddingLeft,
            top: top,
            end: bannerPaddingLeft,
            bottom: bannerPaddingBottom),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Swiper(
            containerHeight: bannerHeight,
            containerWidth: bannerWidth,
            itemBuilder: (BuildContext context, int index) {
              BannerBean banner = _banner[index];
              return _buildBannerItem(banner);
            },
            itemCount: _banner.length,
            pagination: _banner.length > 1
                ? SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsetsDirectional.only(bottom: 3),
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.white.withOpacity(0.4),
                      size: 6.0,
                      activeSize: 6.0,
                    ),
                  )
                : null,
            autoplay: _banner.length > 1,
            loop: _banner.length > 1,
            duration: 500,
            autoplayDelay: 5000,
            autoplayDisableOnInteraction: false,
            onIndexChanged: (int index) {
              if (index < _banner.length) {
                _reportBannerExpose(_banner[index]);
              }
            },
          ),
        ));
  }

  Widget _buildBannerItem(BannerBean banner) {
    return InkWell(
      child: Center(
        child: CachedNetworkImage(
          width: bannerWidth,
          height: bannerHeight,
          imageUrl: banner.image,
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        _goBanner(banner);
      },
    );
  }

  void _reportBannerExpose(BannerBean banner) async {
    if (!banner.hasReport) {
      banner.hasReport = true;
      Tracker.instance.track(TrackEvent.banner_expose,
          properties: {'adid': banner.id, 'banner_position': banner.position});
    }
  }

  void _reportBannerClick(BannerBean banner) async {
    Tracker.instance.track(TrackEvent.banner_click,
        properties: {'adid': banner.id, 'banner_position': banner.position});
  }

  _goBanner(BannerBean banner) {
    String url = banner.url;
    String title = banner.title;
    BaseWebviewScreen.show(context, url: url, title: title);

    _reportBannerClick(banner);
  }

  Widget _renderTab() {
    List<Widget> tabs = <Widget>[];
    for (int i = 0; i < _tab.length; i++) {
      tabs.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(_tab[i].label ?? ''),
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6, bottom: 4),
      child: CommonTabBar(
        tabs: tabs,
        controller: _tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: R.color.mainTextColor,
        labelColor: labelColor,
        unselectedLabelColor: unselectedLabelColor,
        indicatorWeight: 1,
        indicatorPadding: const EdgeInsets.only(top: 0),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) return const Loading();
    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          _loading = true;
          _errorMessage = null;
          _loadData();
        },
      );
    }

    List<Widget> tabViews = <Widget>[];

    for (int i = 0; i < _tab.length; i++) {
      tabViews.add(LiveList(
        _tab[i].type ?? '',
        _tabRefreshKeys[i],
        tableViewScrollTop,
        initialIndex == i,
        listPadding: listPadding,
        itemBuilder: widget.itemBuilder,
      ));
    }

    return TabBarView(
      controller: _tabController,
      children: tabViews,
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 8),
        iconSize: 24,
        icon: R.img(Assets.ic_room_create_svg,
            width: 24, package: ComponentManager.MANAGER_RANK),
        onPressed: () {
          _onAddClick();
        },
      ),
      IconButton(
        iconSize: 24,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
        icon: R.img(Assets.ic_rank_entrance_png,
            width: 24, package: ComponentManager.MANAGER_RANK),
        onPressed: () {
          _onRankClick();
        },
      )
    ];
  }

  _onAddClick() async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openInitOperateDisplay(context);
  }

  _onRankClick() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RankScreen(
        type: 'all',
      ),
      settings: const RouteSettings(name: '/rank'),
    ));
  }
}

class BannerBean {
  final String title;
  final String image;
  final String url;
  final String position;
  final String id;
  bool hasReport = false;

  BannerBean(
      {this.title = '',
      this.image = '',
      this.url = '',
      this.position = '',
      this.id = ''});

  BannerBean.fromJson(Map data)
      : title = Util.parseStr(data['title']) ?? '',
        image = Util.parseStr(data['image']) ?? '',
        url = Util.parseStr(data['url']) ?? '',
        position = Util.parseStr(data['position'] ?? 'live') ?? '',
        id = Util.parseStr(data['id']) ?? '';
}
