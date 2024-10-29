import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/page/reportRoomPage.dart';

import 'tabs/liveItemWidget.dart';

class RoomScreenArgs {
  final List<TabItem> tabs;
  @Deprecated('服务端已无人维护')
  final bool showHead;
  final String title;

  RoomScreenArgs(this.tabs, this.showHead, this.title);
}

/// 房间列表
class RoomScreen extends StatefulWidget {
  static const String routeName = '/RoomScreen';
  final List<TabItem>? tabs;
  final bool showHead;
  final String? title;
  final bool isHome;
  final Color? backgroundColor;
  final bool showAppBar;
  final String refer;
  final bool isThirdTab; // 首页第三级TAB

  const RoomScreen({
    super.key,
    this.tabs,
    this.backgroundColor,
    this.showHead = false,
    this.title,
    this.isHome = false,
    this.showAppBar = true,
    this.refer = '',
    this.isThirdTab = false,
  });

  @override
  RoomScreenState createState() => RoomScreenState();
}

class RoomScreenState extends State<RoomScreen>
    with
        AutomaticKeepAliveClientMixin<RoomScreen>,
        TickerProviderStateMixin<RoomScreen> {
  ExtendedTabController? _tabController;

  double _dragY = 0.0;
  double _dargYChanged = 0.0;

  late List<TabItem> _tabs;
  final List<GlobalKey<_RoomPageState>> _keys = [];
  final GlobalKey<_TopRankState> _rankKey = GlobalKey<_TopRankState>();

  final double _extendHeight = 100.0;

  final List<Widget> _normalTabs = [];

  @override
  bool get wantKeepAlive {
    return false;
  }

  @override
  void initState() {
    super.initState();
    Log.d("RoomScreenState init");
    _init();
    eventCenter.addListener("System.Verify.Changed", _onVerifyChanged);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    eventCenter.removeListener("System.Verify.Changed", _onVerifyChanged);
    super.dispose();
  }

  _init() {
    if (widget.tabs != null) {
      _tabs = widget.tabs!;
      if (Util.isVerify == true) {
        _tabs.removeWhere((element) {
          if (element.type == 'voicelove') {
            return true;
          }
          return false;
        });
      }
    } else {
      _tabs = [
        TabItem('newActive', R.string('room_config_hot')),
        TabItem('radio', R.string('room_config_radio')),
        TabItem('joy', R.string('room_config_joy')),
        TabItem('order', R.string('room_config_order')),
        TabItem('cp', R.string('room_config_cp')),
        TabItem('auto', R.string('room_config_chat')),
      ];
    }

    _keys.clear();
    for (int i = 0; i < _tabs.length; i++) {
      _keys.add(GlobalKey<_RoomPageState>());
    }
    _tabController?.removeListener(_onTabChanged);
    safeRun(
      () => _tabController =
          ExtendedTabController(length: _tabs.length, vsync: this)
            ..addListener(_onTabChanged),
    );

    if (widget.isThirdTab) {
      _buildTabs();
    }
  }

  _onVerifyChanged(String type, dynamic value) {
    if (mounted) {
      setState(() {
        _init();
      });
    }
  }

  void scrollToTop() {
    if (_tabController != null &&
        _keys[_tabController!.index].currentState != null) {
      _keys[_tabController!.index].currentState!.scrollToTop();
    }
  }

  reload() {
    if (_tabController != null &&
        _keys[_tabController!.index].currentState != null) {
      _keys[_tabController!.index].currentState!.reload();
    }
    if (_rankKey.currentState != null) _rankKey.currentState!.reload();
  }

  void _onTabChanged() {
    if (mounted && _tabController != null && !_tabController!.indexIsChanging) {
      if (_keys[_tabController!.index].currentContext != null) {
        Log.d("================= ${_tabController!.index}");
        _keys[_tabController!.index].currentState?.reload();
      }
    }

    if (widget.isThirdTab) {
      _buildTabs();
      if (mounted) {
        setState(() {});
      }
    }
  }

  _onAddClick() async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openInitOperateDisplay(context);
  }

  Widget _renderBody(BuildContext context) {
    int index = -1;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          double offset = notification.metrics.pixels;
          double screenWidth = MediaQuery.of(context).size.width;
          _tabController?.scrollPosition = offset / screenWidth;
        }
        return false;
      },
      child: TabBarView(
        controller: _tabController,
        children: _tabs.map((TabItem config) {
          index++;
          if (config.type == 'report') {
            //举报
            return ReportRoomPage(
                key: _keys[index],
                index: index,
                type: config.type,
                onScroll: _onScroll);
          }
          return RoomPage(
            key: _keys[index],
            index: index,
            type: config.type ?? '',
            onScroll: _onScroll,
            isFirstTab: index == 0,
            refer: widget.refer,
          );
        }).toList(),
      ),
    );
  }

  ScrollDirection? _direction;

  _onScroll(Notification e, ScrollController controller, int index) {
    if (_tabController?.index != index) return;
    if (e is ScrollUpdateNotification) {
      ScrollUpdateNotification event = e;
      if (_direction == ScrollDirection.forward) {
        //向下
        if (controller.offset <= 0 && (event.scrollDelta ?? 0) > 0) {
          //在回弹
          return;
        }
      } else if (_direction == ScrollDirection.reverse) {
        if (controller.offset >= controller.position.maxScrollExtent &&
            (event.scrollDelta ?? 0) < 0) {
          return;
        }
      }
      double value = _dragY - (event.scrollDelta ?? 0);
      if (value <= -_extendHeight) {
        value = -_extendHeight;
      } else if (value >= 0.0) {
        value = 0.0;
      }
      if (_dragY.toString() != value.toString()) {
        setState(() {
          _dragY = value;
        });
      }
    } else if (e is UserScrollNotification) {
      //ScrollDirection.
      //e.direction
      _dargYChanged = 0.0;
      _direction = e.direction;
      Log.d(e.direction);
    } else if (e is ScrollEndNotification) {
      Log.d("end");
    } else if (e is ScrollStartNotification) {
      Log.d("start");
    }
  }

  @override
  Widget build(BuildContext context) {
    Log.d("RoomScreen Build");
    super.build(context);

    if (widget.isThirdTab) {
      int index = -1;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (_tabs.length > 1) ? buildNormalTab() : Container(),
          Expanded(
            child: ExtendedTabBarView(
              controller: _tabController,
              children: _tabs.map((TabItem config) {
                index++;
                if (config.type == 'report') {
                  return ReportRoomPage(
                      key: _keys[index],
                      index: index,
                      type: config.type,
                      onScroll: _onScroll);
                }
                return RoomPage(
                  key: _keys[index],
                  index: index,
                  type: config.type ?? '',
                  onScroll: _onScroll,
                  isFirstTab: index == 0,
                  refer: widget.refer,
                );
              }).toList(),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: widget.showAppBar
          ? BaseAppBar.custom(
              showShape: widget.isHome ? false : true,
              backgroundColor: widget.isHome
                  ? (widget.backgroundColor ?? const Color(0xFFFFFD53))
                  : null,
              statusBrightness: widget.isHome ? Brightness.light : null,
              leading: widget.isHome
                  ? SizedBox(
                      width: kToolbarHeight,
                      child: RedPoint(
                          iconColor: Colors.black,
                          onClick: () {
                            if (Session.isLogined == false) {
                              ILoginManager loginManager = ComponentManager
                                  .instance
                                  .getManager(ComponentManager.MANAGER_LOGIN);
                              loginManager.show(context);
                              return;
                            }
                            Scaffold.of(context).openDrawer();
                          }),
                    )
                  : null,
              title: Text(
                widget.title ?? K.rank_hot_game,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              bottom: widget.showHead
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(
                          _extendHeight + _dragY + _dargYChanged),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 12.0),
                        height:
                            max(0.0, _extendHeight + _dragY + _dargYChanged),
                        child: Container(
                          decoration: BoxDecoration(
                              color: R.color.secondBgColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: R.color.secondBgColor,
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(0.0, 0.0),
                                )
                              ]),
                          child: TopRank(
                            key: _rankKey,
                          ),
                        ),
                      ))
                  : null,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4.0),
                  child: IconButton(
                      icon: IconTheme(
                          data: Theme.of(context).iconTheme,
                          child: const Icon(Icons.add)),
                      onPressed: () {
                        _onAddClick();
                      }),
                )
              ],
            )
          : null,
      body: ScaffoldBody(
        backgroundColor: widget.isHome
            ? (widget.backgroundColor ?? const Color(0xFFFFFD53))
            : null,
        shadowColor:
            widget.isHome ? const Color(0xffFCD01C).withOpacity(0.4) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tabs.length > 1
                ? Container(
                    height: 36.0,
                    padding: const EdgeInsets.only(left: 10.0),
                    margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
                    child: Util.isUseAnimTabBar()
                        ? AnimTabBar(
                            marginStart: 8 * Util.ratio,
                            controller: _tabController,
                            titles:
                                _tabs.map((tab) => tab.label ?? '').toList(),
                          )
                        : CommonTabBar(
                            tabs: _tabs.map((TabItem config) {
                              return Tab(child: Text(config.label ?? ''));
                            }).toList(),
                            isScrollable: true,
                            controller: _tabController,
                          ))
                : Container(),
            Expanded(
              child: _renderBody(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNormalTab() {
    return Container(
      height: 48.0,
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      margin: const EdgeInsetsDirectional.only(bottom: 3),
      child: CommonTabBar(
        showSplash: false,
        labelPadding: const EdgeInsetsDirectional.only(end: 12),
        controller: _tabController,
        isScrollable: true,
        labelColor: R.color.mainBrandColor,
        unselectedLabelColor: R.color.secondTextColor,
        tabs: _normalTabs,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: R.color.mainBgColor)),
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void _buildTabs() {
    _normalTabs.clear();
    for (int i = 0; i < (widget.tabs?.length ?? 0); i++) {
      Tab tab = Tab(
          icon: null,
          child: Container(
            height: 28,
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: R.color
                  .secondBgColor, // i == _tabController.index ? Color(0xFFF5F5F5) : Colors.transparent,
            ),
            child: Text(
              _tabs[i].label ?? '',
            ),
          ));
      _normalTabs.add(tab);
    }
  }
}

class TopRank extends StatefulWidget {
  const TopRank({
    super.key,
  });

  @override
  _TopRankState createState() => _TopRankState();
}

class _TopRankState extends State<TopRank> {
  Map? _res;
  bool _loading = true;

  @override
  initState() {
    super.initState();
    _load();
  }

  _load() async {
    try {
      XhrResponse response =
          await Xhr.getJson("${System.domain}room/toponevip");
      if (!mounted) return;
      setState(() {
        _res = response.value()['data'];
        _loading = false;
      });
    } catch (e) {
      Log.d(e);
    }
  }

  reload() {
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container();
    }
    int titleNew = Util.parseInt(_res?['title_new']);
    double width = 70;
    int index = (titleNew ~/ 10) - 1;
    width = Utility.titleNewBigLayout[index].width *
        70.0 /
        Utility.titleNewBigLayout[index].height;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                IRankManager rankManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_RANK);
                rankManager.showRank(context, 'love');
              },
              child: SizedBox(
                width: 64.0,
                height: 70.0,
                child: Stack(
                  children: <Widget>[
                    PositionedDirectional(
                        top: 12.0,
                        end: 0.0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(17.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${System.imageDomain}${_res?['zajztoicon']}",
                            suffix: '!head150',
                            width: 34.0,
                            height: 34.0,
                          ),
                        )),
                    PositionedDirectional(
                      top: 12.0,
                      start: 0.0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(17.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${System.imageDomain}${_res?['zajzuicon']}",
                          suffix: '!head150',
                          width: 34.0,
                          height: 34.0,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 4.0,
                      start: 26.0,
                      child: R.img(Assets.rank_top_icon4_png,
                          width: 13.0,
                          height: 13.0,
                          package: ComponentManager.MANAGER_RANK),
                    ),
                    PositionedDirectional(
                      top: 50.0,
                      start: (67.0 - 46.5) / 2,
                      child: R.img(Assets.rank_top_icon2_png,
                          width: 46.5,
                          height: 14.0,
                          package: ComponentManager.MANAGER_RANK),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                IRankManager rankManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_RANK);
                rankManager.showRank(context, 'title');
              },
              child: SizedBox(
                width: width,
                height: 70.0,
                child: Stack(
                  children: <Widget>[
                    if (!NobilityUtil.titleIsInvalid(titleNew))
                      PositionedDirectional(
                        top: 0.0,
                        start: 0.0,
                        child: UserNobilityWidget(
                          titleNew: titleNew,
                        ),
                      ),
                    PositionedDirectional(
                      top: 10.0,
                      start: (width - 34.0) / 2,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(17.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "${System.imageDomain}${_res?['gzicon']}",
                          suffix: '!head150',
                          width: 34.0,
                          height: 34.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  IRankManager rankManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_RANK);
                  rankManager.showRank(context, 'sweet');
                },
                child: SizedBox(
                  width: 64.0,
                  height: 70.0,
                  child: Stack(
                    children: <Widget>[
                      PositionedDirectional(
                          top: 12.0,
                          end: 0.0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(17.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${System.imageDomain}${_res?['tmshtoicon']}",
                              suffix: '!head150',
                              width: 34.0,
                              height: 34.0,
                            ),
                          )),
                      PositionedDirectional(
                        top: 12.0,
                        start: 0.0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(17.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${System.imageDomain}${_res?['tmshuicon']}",
                            suffix: '!head150',
                            width: 34.0,
                            height: 34.0,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 0.0,
                        start: -3.0,
                        child: R.img(
                          Assets.rank_top_icon3_png,
                          width: 21.0,
                          height: 18.0,
                          package: ComponentManager.MANAGER_RANK,
                        ),
                      ),
                      PositionedDirectional(
                        top: 50.0,
                        start: (67.0 - 46.0) / 2,
                        child: R.img(Assets.rank_top_icon1_png,
                            width: 46.0,
                            height: 14.0,
                            package: ComponentManager.MANAGER_RANK),
                      ),
                    ],
                  ),
                ),
              )),
        )
      ],
    );
  }
}

typedef PageValueChanged = Function(
    Notification notify, ScrollController controller, int index);

/// 房间列表page
class RoomPage extends StatefulWidget {
  const RoomPage({
    super.key,
    this.index,
    required this.type,
    this.onScroll,
    this.isFirstTab,
    this.refer,
  });

  final int? index;
  final String type;
  final PageValueChanged? onScroll;
  final bool? isFirstTab;
  final String? refer;

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with AutomaticKeepAliveClientMixin<RoomPage> {
  final List<RoomItemModel> _data = [];
  bool _loading = true;
  bool _first = true;
  String? _errorMessage;
  late ScrollController _controller;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _load();
    if (widget.isFirstTab == true) {
      _first = false;
    }
  }

  void scrollToTop() {
    if (_controller.hasClients) {
      _controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> reload() async {
    if (_first) {
      _first = false;
      return;
    }

    if (!mounted) return;
    _load();
  }

  Future<void> _load() async {
    try {
      _errorMessage = null;
      String url = '${System.domain}room/list/?type=${widget.type}&v=3';

      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.response as Map;
      Log.d(res);
      _data.clear();
      List list = res['data'];
      for (int i = 0; i < list.length; i++) {
        Map item = list[i];
        try {
          _data.add(RoomItemModel.fromJson(item));
        } catch (e) {
          Log.d(e);
        }
      }
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      Log.d(widget.type);
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage = e.toString();
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Loading();
    }
    if (_errorMessage != null) {
      Log.d(_errorMessage);
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load();
        },
      );
    }
    if (!_loading && (_data.isEmpty)) {
      return ErrorData(
        error: K.rank_no_data,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load();
        },
      );
    }
    return RefreshIndicatorFactory.of(
      child: NotificationListener(
        onNotification: (Notification e) {
          if (widget.onScroll != null)
            widget.onScroll!(e, _controller, widget.index ?? 0);
          return false;
        },
        child: ListView.builder(
          padding: EdgeInsets.only(
              top: 5.0 * Util.ratio, bottom: Util.iphoneXBottom),
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _data.length,
          itemExtent: (90.0 + 10.0) * Util.ratio,
          addAutomaticKeepAlives: false,
          itemBuilder: (BuildContext context, int index) {
            RoomItemModel room = _data.elementAt(index);
            return LiveItemWidget(
              item: room,
              roomFrom: RoomFrom(widget.type, RoomFrom.home),
              refer: widget.refer,
            );
          },
        ),
      ),
      onRefresh: () async {
        return _load();
      },
    );
  }
}
