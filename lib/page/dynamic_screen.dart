import 'dart:math';
import 'dart:ui';

import 'package:shared/assets.dart';
import 'package:shared/dart_extensions/extensions_common.dart';

import '../k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/k.dart' as MomentK;
import 'package:rank/k.dart' as RankK;
import 'package:moment/moment.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:rank/rank.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:vip/vip.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:moment/src/model/pb/generated/square.pb.dart';
import 'package:provider/provider.dart' hide Selector;

class DynamicScreen extends StatefulWidget {
  final bool showAsHome;

  const DynamicScreen({Key? key, this.showAsHome = false}) : super(key: key);

  @override
  SlpDynamicScreenState createState() => SlpDynamicScreenState();
}

class SlpDynamicScreenState extends State<DynamicScreen>
    with
        AutomaticKeepAliveClientMixin<DynamicScreen>,
        TickerProviderStateMixin,
        TabStateMixin,
        ReloadStateMixin {
  GlobalKey _globalKey = GlobalKey();

  final ScrollController _mainscrollController = ScrollController();
  double _dynamicHeaderBottom = 0;
  String _topHeaderTag = '';

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 5 * 60 * 1000;
  bool isDialogLoading = false;
  static const String tag = "DynamicScreenState";

  RespGetCfg_GetCfgData? _weekStatisticEntranceData;

  @override
  bool get wantKeepAlive => true;

  List<GlobalKey> _keys = [];

  List<String> _tabs = [];

  List<Widget> _pages = [];

  ScrollController mainScrollcon = ScrollController();
  ExtendedTabController? _tabController;

  int _currentPageIndex = 0;

  final int _attentionTabIndex = 1;

  bool _loading = true;
  bool _isOperationAccount = false; // 是否运营账号
  List<HomeMatchItemData> _matchItems = [];

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();

    _mainscrollController.addListener(_refreshTopHeader);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener('DynamicScreen.ChangeTab', _onChangeTab);

    _initTab();
    // _loadWeekStatistic(isFirst: true);
    Tracker.instance.track(TrackEvent.firstpage_view);
  }

  @override
  void onTabChanged() {
    super.onTabChanged();
    if (isCurrentTab) {
      _showWeekStatistic();
    }
  }

  /// 加载一周情报局入口
  void _loadWeekStatistic({bool isFirst = false}) {
    // Future.delayed(const Duration(milliseconds: 500), () async {
    //   if (!mounted) return;
    //   RespGetCfg resp = await Api.getCfg();
    //   if (resp.success) {
    //     _weekStatisticEntranceData = resp.data;
    //     if (isFirst) {
    //       _showWeekStatistic();
    //     }
    //     refresh();
    //   }
    // });
  }

  /// 显示一周情报局弹窗
  /// 每周第二次点击动态tab时显示
  Future _showWeekStatistic() async {
    if (_weekStatisticEntranceData != null &&
        _weekStatisticEntranceData!.isOpen) {
      int count = await HiveUtil.putWeekCountAutoIncrement(
          'key_dynamic_tab_week_click');
      if (count == 2) {
        IMomentManager momentManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_MOMENT);
        momentManager.openMomentWeekStatisticDialog(
            context, _weekStatisticEntranceData!);
      }
    }
  }

  void _initTab() async {
    List resList = await Future.wait([
      BaseRequestManager.isOperatorAccount(),
      BaseRequestManager.getDynamicDefaultTabByServer(),
      BaseRequestManager.hasRecentTopic(),
      RankRequestManager.getHomeHot(),
    ]);

    _isOperationAccount = resList[0];
    int defaultTabByServer = resList[1];
    bool showFollowRedPoint = resList[2];
    ResHomeTabHot homeHot = resList[3];
    if (homeHot.success) {
      _matchItems = (homeHot.data.partyList)
          .map((e) => HomeMatchItemData.fromPb(e))
          .where((e) => e.matchIconWidth * e.matchIconHeight != 0)
          .toList();
      _topHeaderTag = _matchItems.isEmpty ? 'dynamic' : 'play';
      // 计算快速匹配区域的高度
      if (_matchItems.isNotEmpty) {
        double leftY = 0;
        double rightY = 0;
        double itemWidth = (Util.width - 32 - 8) / 2;
        for (HomeMatchItemData item in _matchItems) {
          double itemBottom =
              item.matchIconHeight * itemWidth / item.matchIconWidth + 8;
          if (leftY <= rightY) {
            leftY += itemBottom;
          } else {
            rightY += itemBottom;
          }
        }
        _dynamicHeaderBottom = max(leftY, rightY) - 8 + kToolbarHeight;
      }
    }

    _currentPageIndex = showFollowRedPoint ? 1 : 0;
    if (defaultTabByServer == 0 || defaultTabByServer == 1) {
      _currentPageIndex = defaultTabByServer;
    }

    _globalKey = GlobalKey();
    _loading = true;
    _refresh();
    _tabs = [MomentK.K.moment_square, MomentK.K.moment_tab_follow];

    _keys = [
      GlobalKey<RecommendPageState>(),
      GlobalKey<MomentListPageState>(),
    ];

    _pages = [
      RecommendPage(
        key: _keys[0],
        isTestPage: _isOperationAccount,
        pageKey: _getPageKey(0),
        autoPlayVideo: true,
        supportDark: true,
      ),
      if (Session.isLogined)
        MomentListPage(
          key: _keys[1],
          autoPlayVideo: true,
          supportDark: true,
        ),
      if (!Session.isLogined)
        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ILoginManager loginManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_LOGIN);
              loginManager.show(context);
            },
            child: Container(
              width: Util.width,
              height: double.infinity,
              alignment: AlignmentDirectional.center,
              child: Text(
                R.string('view_after_login'),
                style: R.textStyle.caption
                    .copyWith(color: R.colors.thirdTextColor),
              ),
            ),
          ),
        ),
    ];
    if (_isOperationAccount) {
      _tabs.add(K.dynamic_time_sort);
      _pages.add(RecommendPage(
          isTestPage: true, pageType: 'time', pageKey: _getPageKey(2)));
    }

    _tabController?.dispose();
    safeRun(
      () => _tabController = ExtendedTabController(
        initialIndex: _currentPageIndex,
        length: _tabs.length,
        vsync: this,
      )..addListener(_onTabChanged),
    );
    _loading = false;
    _refresh();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _mainscrollController.dispose();
    _tabController?.removeListener(_onTabChanged);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener('DynamicScreen.ChangeTab', _onChangeTab);
    super.dispose();
  }

  _onChangeTab(String type, dynamic data) {
    int subTabIndex = Util.parseInt(data, -1); // -1 => 不操作子tab
    if (_tabController != null &&
        subTabIndex != -1 &&
        subTabIndex < _tabController!.length) {
      _tabController!.index = subTabIndex;
    }
  }

  _onLogin(String type, dynamic data) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    _initTab();
    reload(force: true);
  }

  void _refreshTopHeader() {
    double offset = _mainscrollController.offset;
    String newTag;
    if (_matchItems.isNotEmpty) {
      if (offset >= _dynamicHeaderBottom) {
        newTag = 'dynamic';
      } else {
        newTag = 'play';
      }
    } else {
      newTag = 'dynamic';
    }
    if (newTag != _topHeaderTag) {
      _topHeaderTag = newTag;
      if (mounted) {
        setState(() {});
      }
    }
  }

  String _getPageKey(int index) {
    String key;
    if (index == 1) {
      key = 'home_follow';
    } else if (index == 0) {
      key = 'home_recommend';
    } else {
      key = 'home_recommend_1';
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: SafeArea(
          key: _globalKey,
          child: VisibilityDetector(
            key: const ValueKey("moment-page-key"),
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction == 0.0) {
              } else if (info.visibleFraction == 1.0) {
                // showSquarePopup(context);
              }
            },
            child: _buildBody(),
          )),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    return Stack(
      children: [
        Column(
          children: [
            _topHeader(),
            Expanded(
              child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  controller: _mainscrollController,
                  headerSliverBuilder: (context, b) {
                    return [
                      if (_matchItems.isNotEmpty) ...[
                        // SliverToBoxAdapter(child:_buildMatchs2()),
                        const SliverPadding(
                            padding: EdgeInsets.only(bottom: 4)),
                        // tabBar
                        SliverToBoxAdapter(
                          child: Consumer<ProfilePayload>(
                            builder: (_, bean, __) {
                              return _buildTab(bean.showFollowRedPoint, false);
                            },
                          ),
                        )
                      ],
                    ];
                  },
                  body: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollUpdateNotification) {
                        double offset = notification.metrics.pixels;
                        double screenWidth = MediaQuery.of(context).size.width;
                        _tabController!.scrollPosition = offset / screenWidth;
                      }

                      return false;
                    },
                    child: TabBarView(
                      physics: const ClampingScrollPhysics(),
                      controller: _tabController,
                      children: _pages,
                    ),
                  )),
            ),
          ],
        ),
        PositionedDirectional(
          end: 0,
          bottom: 0,
          child: _buildSendMoment(),
        ),
      ],
    );
  }

  final _hasActivityData = true.obs;

  Widget _topHeader() {
    if (_topHeaderTag == 'play') {
      return _renderTopBar();
    } else {
      return Obx(() {
        return Column(
          children: [
            if (_hasActivityData.value) _renderTopBar(),

            ///主要目的是有弹窗时刷新数据
            if (!_hasActivityData.value) _getActivityMiniWidget(),
            Consumer<ProfilePayload>(
              builder: (_, bean, __) {
                return Container(
                    height: kToolbarHeight - 6,
                    alignment: AlignmentDirectional.centerStart,
                    child: _buildTab(bean.showFollowRedPoint, true));
              },
            ),
          ],
        );
      });
    }
  }

  /// 一起玩标题栏
  Widget _renderTopBar() {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          R.img(BaseAssets.dy_tai_top_icon,
              width: 144 / 3, height: 102 / 3, package: BaseAssets.package),
          // _getActivityMiniWidget(),
          // if (_weekStatisticEntranceData?.isOpen == true)
          //   GestureDetector(
          //     onTap: () {
          //       IMomentManager? momentManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
          //       momentManager?.openMomentWeekStatisticDialog(context, _weekStatisticEntranceData!);
          //     },
          //     child: Rext.autoStyleImg(
          //       'discovery/btn_week_statistic_entrance.webp',
          //       width: 130.dp,
          //       height: 45.dp,
          //     ),
          //   ),
        ],
      ),
    );
  }

  //主要解决上下滑动时重新创建的问题
  GlobalKey activityMiniKey = GlobalKey();

  Widget _getActivityMiniWidget() {
    return ActivityMiniWidget(
      key: activityMiniKey,
      callBack: (bool hasData) {
        _hasActivityData.value = hasData;
      },
    );
  }

  Widget _buildMatchs2() {
    //330 204
    double width = ((Util.width / 3)).truncateToDouble() - 6;
    HomeMatchItemData? item = _matchItems.firstOrNull;
    Log.d("width:$width");
    double childAspectRatio = 204 / 330;
    double? height;
    if (item != null) {
      height = (width * childAspectRatio) * 2;
    }
    return Container(
      height: height,
      width: Util.width,
      child: GridView.builder(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 6,
            childAspectRatio: childAspectRatio),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          HomeMatchItemData item = _matchItems[index];
          Log.d('item.matchIcon:${item.matchIcon}');
          return CachedNetworkImage(
            imageUrl: item.matchIcon,
            supportDark: false,
            fit: BoxFit.fill,
          ).onTap(() {
            if ('fate_dialog' == item.type) {
              return;
            }
            FastMatchUtil.toFastMatch(context, item.type, item.title);
          });
        },
        itemCount: _matchItems.length,
      ),
    );
  }

  SliverWaterfallFlow _buildMatchs() {
    double width = ((Util.width - 32 - 8) / 2).truncateToDouble();

    // 快速匹配
    return SliverWaterfallFlow(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            HomeMatchItemData item = _matchItems[index];
            return GestureDetector(
              onTap: () {
                if ('fate_dialog' == item.type) {
                  return;
                }
                FastMatchUtil.toFastMatch(context, item.type, item.title);
              },
              child: SizedBox(
                width: width,
                height: width * item.matchIconHeight / item.matchIconWidth,
                child: CachedNetworkImage(
                  imageUrl: item.matchIcon,
                  supportDark: true,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          childCount: _matchItems.length,
        ),
        gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ));
  }

  Widget _buildSendMoment() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onSendMoment,
      child: SizedBox(
        width: 137,
        height: 70,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 105,
              height: 44,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: R.colors.mainBrandColor,
                      // gradient: LinearGradient(colors: [Color(0x2999FFBC), Color(0x2926C4FF), Color(0x29926AFF)]),
                    ),
                  ),
                ),
              ),
            ),
            // Rext.autoStyleImg(Assets.ic_home_fast_match_webp,
            //     width: 137, height: 70, package: ComponentManager.MANAGER_RANK),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(
                  'ic_topic_send_moment.webp',
                  width: 21,
                  height: 21,
                  color: Colors.black,
                  package: ComponentManager.MANAGER_MOMENT,
                ),
                const SizedBox(width: 4),
                Text(
                  K.app_send_moment,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(bool showFollowRedPoint, bool onTopHeader) {
    List<int> redDotIndex = [];
    if (showFollowRedPoint) {
      redDotIndex.add(_attentionTabIndex);
    }
    Log.d('onTopHeader:${onTopHeader}');
    return Container(
      height: 48,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AnimTabBar(
              controller: _tabController,
              titles: _tabs,
              marginStart: 6,
              marginEnd: 6,
              spacing: 10,
              selectedFontSize: onTopHeader ? 26 : 20,
              selectedFontColor: R.colors.mainTextColor,
              selectedFontWeight: FontWeight.bold,
              unselectedFontSize: onTopHeader ? 20 : 16,
              unselectedFontColor:
                  darkMode ? const Color(0xB3FFFFFF) : const Color(0xB3000000),
              unselectedFontWeight: FontWeight.normal,
              redDotIndex: redDotIndex,
              showIndicator: false,
              alignment: const Alignment(0, 0.35),
              notSelectedRedDotEnd: -11,
              notSelectedRedDotTop: 10,
              onTap: (index) {
                PulseLog.instance.event('click_event', properties: {
                  'click_tag': 'home_moment_tab_${_tabs[index]}',
                });
              },
            ),
          ),
          // _buildTopicAction(),
          // const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildTopicAction() {
    return GestureDetector(
      onTap: _onTopicSquareTaped,
      child: Container(
        height: 84,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Rext.autoStyleImg('tab_dynamic_tag_topic.webp',
                width: 16, height: 16),
            const SizedBox(
              width: 2,
            ),
            Text(K.dynamic_topic_enter,
                style: TextStyle(
                    fontSize: 12,
                    color: darkMode
                        ? const Color(0x80FFFFFF)
                        : const Color(0x80000000))),
            Rext.autoStyleImg('tab_dynamic_arrow_right_42.webp',
                width: 14, height: 14),
          ],
        ),
      ),
    );
  }

  /// 话题广场
  _onTopicSquareTaped() {
    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'topic_square',
    });
    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    momentManager.openTopicSquareScreen(context);
  }

  void _onSendMoment() async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    if (Session.dangerUser) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openHighRiskUsersInterceptDialog(context);
      return;
    }
    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    momentManager.openMomentPublishScreen(context, showPlaySelect: false);
  }

  @override
  void reload({bool force = true, animated = true}) {
    if (_tabController == null) {
      return;
    }
    ProfilePayload bean = context.read<ProfilePayload>();
    if (bean.showFollowRedPoint) {
      force = true;
      _tabController!.index = _attentionTabIndex;
    }

    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
    } else {
      return;
    }
    // _loadWeekStatistic();
    scrollToTop(animated: animated);
    int index = _currentPageIndex;
    Log.d('reload : $index');
    if (index > _keys.length - 1) return;
    if (_keys[index].currentState == null) return;
    if (_keys[index].currentState != null) {
      if (_keys[index].currentState is MomentListPageState) {
        (_keys[index].currentState as MomentListPageState).reload(force: force);
      } else if (_keys[index].currentState is RecommendPageState) {
        (_keys[index].currentState as RecommendPageState).reload(force: force);
      }
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    int index = _currentPageIndex;
    Log.d(tag: tag, 'scrollToTop : $index');
    if (index > _keys.length - 1) return;
    if (_keys[index].currentState == null) return;
    if (_keys[index].currentState != null) {
      if (_keys[index].currentState is MomentListPageState) {
        (_keys[index].currentState as MomentListPageState)
            .scrollToTop(animated: animated);
      } else if (_keys[index].currentState is RecommendPageState) {
        (_keys[index].currentState as RecommendPageState)
            .scrollToTop(animated: animated);
      }
    }
  }

  void _onTabChanged() {
    _currentPageIndex = _tabController!.index;
    if (!Session.isLogined && _tabController!.index == _attentionTabIndex) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
  }

  Future<bool> showSquarePopup(BuildContext context) async {
    int lastAlertTime = Config.getInt("lastShowSquareMasterTime", 0);
    int now = DateTime.now().millisecondsSinceEpoch;

    /// 每周弹一次
    bool isSameWeek =
        (lastAlertTime == 0) ? false : Utility.isSameWeek(lastAlertTime, now);
    // if (!isSameWeek && !isDialogLoading) {
    Log.d(
        tag: tag,
        "squareMasterDialog, show, last show time :$lastAlertTime ,now:$now");
    isDialogLoading = true;
    SquarePopupRsp res = await Api.getSquarePopup(lastAlertTime == 0 ? 0 : 1);
    isDialogLoading = false;
    if (res.success) {
      if (mounted) {
        Log.d(tag: tag, "squareMasterDialog real show dialog");
        IMomentManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_MOMENT);
        manager.showSquarePopup(context, res);
        Config.set("lastShowSquareMasterTime", "$now");
        return Future.value(true);
      } else {
        Log.d(tag: tag, "squareMasterDialog invisible ");
        return Future.value(false);
      }
    } else {
      Log.d(tag: tag, "squareMasterDialog request error");
      return Future.value(false);
    }
    // } else {
    //   Log.d(tag: tag, "squareMasterDialog,ignore,$isDialogLoading ,last show time :$lastAlertTime ,now:$now");
    //   isDialogLoading = false;
    //   return Future.value(false);
    // }
  }

  _onLogout(String type, dynamic data) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    _initTab();
    reload(force: true);
  }
}
