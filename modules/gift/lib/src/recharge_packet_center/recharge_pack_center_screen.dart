import 'package:gift/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:gift/src/super_pack/super_pack_screen.dart';
import 'package:gift/src/repo/gift_activity_repo.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/src/recharge_packet_center/recharge_daily_pack_page.dart';

class RechargeTabEnum {
  static String get tabNew => "new";
  static String get tabDaily => "daily";
  static String get tabH5 => "h5";
}

typedef SubTabScrollCallback = void Function(double offset);

class RechargePackCenterScreen extends StatefulWidget {
  final bool fullScreen;
  final String type;

  const RechargePackCenterScreen(
      {required this.fullScreen, required this.type, Key? key})
      : super(key: key);

  @override
  State<RechargePackCenterScreen> createState() =>
      _RechargePackCenterScreenState();

  static Future<bool> show(BuildContext context, String type) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RechargePackCenterScreen(
        fullScreen: true,
        type: type,
      ),
      settings: const RouteSettings(name: '/rechargePackCenterScreen'),
    ));
    return true;
  }

  static Future<bool?> showBottom(BuildContext context) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.7,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ).resolve(Directionality.of(context)),
          child: const RechargePackCenterScreen(
            fullScreen: false,
            type: '',
          ).onTap(() {
            // action
          }),
        );
      },
    );
  }
}

class _RechargePackCenterScreenState extends State<RechargePackCenterScreen>
    with TickerProviderStateMixin {
  List<GiftPackCenterTab> tabs = [];
  final List<String> _names = [];
  final List<GlobalKey> _keys = [];
  final List<Widget> _tabsWidget = [];

  final List<Widget> _pages = [];
  ExtendedTabController? _tabController;

  int _currentTabIndex = 0;
  Map<String, double> subTabScrollOffset = {};
  double appBarHeight = 140;
  double maxScroll = 80;

  /// appBar背景变化

  bool _loading = true;
  bool noTab = false;

  void _initTab() async {
    GiftPackCenterRepo.getCenterTab().then((resp) {
      if (resp.tabs.isNotEmpty) {
        resp.tabs.removeWhere((element) => element.type == 'h5');
        tabs = resp.tabs;
        resp.tabs.forEachIndexed((index, tab) {
          _names.add(tab.name);
          _tabsWidget.add(Tab(
            height: 30,
            child: Text(tab.name),
          ));

          subTabScrollOffset[tab.type] = 0;
          switch (tab.type) {
            case 'new':
              _keys.add(GlobalKey<SuperPackScreenState>());
              _pages.add(
                SuperPackScreen(
                  key: _keys[index],
                  needAppBar: false,
                  scrollCallback: newTabScrollCallback,
                  appBarHeight: appBarHeight,
                ),
              );
              break;
            case 'daily':
              _keys.add(GlobalKey<RechargeDailyPackPageState>());
              _pages.add(RechargeDailyPackPage(
                key: _keys[index],
                scrollCallback: dailyTabScrollCallback,
                appBarHeight: appBarHeight,
              ));
              break;
            case 'h5':
              subTabScrollOffset[tab.type] = maxScroll;
              _pages.add(
                Column(
                  children: [
                    SizedBox(
                      height: appBarHeight,
                    ),
                    Expanded(
                      child: BaseWebviewScreen(
                        url: addScreenSuffix(tab.url),
                        embeddedWidget: true,
                        eagerGesture: true,
                      ),
                    ),
                  ],
                ),
              );
              break;
          }
        });

        if (Util.validStr(widget.type)) {
          for (int i = 0; i < tabs.length; i++) {
            if (widget.type == tabs[i].type) {
              _currentTabIndex = i;
            }
          }
        }

        safeRun(
          () => _tabController = ExtendedTabController(
            initialIndex: _currentTabIndex,
            length: _tabsWidget.length,
            vsync: this,
          )..addListener(_onTabChanged),
        );
      } else {
        noTab = true;
      }

      _loading = false;
      if (mounted) setState(() {});
    });
  }

  String addScreenSuffix(String url) {
    if (!Util.validStr(url)) {
      return url;
    }

    if (widget.fullScreen == true) {
      return url;
    }

    return '$url${url.contains("?") ? '&' : '?'}half=1';
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  void _onTabChanged() {
    if (_tabController?.indexIsChanging ?? true) return;
    _currentTabIndex = _tabController?.index ?? 0;
    _refresh();
  }

  @override
  void initState() {
    super.initState();
    _initTab();
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = widget.fullScreen == true
        ? (MediaQuery.of(context).padding.top + kToolbarHeight + 32)
        : 42;
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            bottom: 0,
            child: _buildBody(),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            child: _buildAppBar(),
          ),
        ],
      ),
    );
  }

  /// type=new的tab滑动回调
  void newTabScrollCallback(double offset) {
    subTabScrollCallback('new', offset);
  }

  /// type=daily的tab滑动回调
  void dailyTabScrollCallback(double offset) {
    subTabScrollCallback('daily', offset);
  }

  /// TAB滑动回调
  void subTabScrollCallback(String type, double offset) {
    if (subTabScrollOffset.containsKey(type)) {
      if (offset < 0) {
        subTabScrollOffset[type] = 0;
      } else if (offset <= maxScroll) {
        subTabScrollOffset[type] = offset;
      } else {
        subTabScrollOffset[type] = maxScroll;
      }

      String currentTab = tabs[_currentTabIndex].type;
      if (currentTab == type && offset <= maxScroll && offset >= 0) {
        _refresh();
      }
    }
  }

  Color get appBarBgColor {
    if (tabs.isEmpty) {
      return const Color(0x662D0C66);
    }

    String currentTab = tabs[_currentTabIndex].type;
    double opacity = (subTabScrollOffset[currentTab] ?? 0) / maxScroll;
    if (_currentTabIndex == 0) {
      return const Color(0xFF230740);
    } else if (_currentTabIndex == 1) {
      return const Color(0xFF6650F2);
    }
    return Util.parseColor(
            tabs[_currentTabIndex].color, const Color(0x662D0C66))!
        .withOpacity(opacity);
  }

  Widget _buildAppBar() {
    return Container(
      height: appBarHeight,
      color: appBarBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fullScreen == true)
            BaseAppBar(
              K.gift_recharge_pack_center_title,
              titleColor: Colors.white,
              backColor: Colors.white,
              backgroundColor: Colors.white.withOpacity(0),
            ),
          if (widget.fullScreen == false)
            const SizedBox(
              height: 10,
            ),
          if (!_loading && !noTab)
            CommonTabBar(
              // key: _centerTabKey,
              tabs: _tabsWidget,
              isScrollable: true,
              labelColor: Colors.white,
              controller: _tabController,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.white),
                insets: EdgeInsetsDirectional.only(bottom: 0),
                wantWidth: 16,
                draggingWidth: 12.0,
              ),
              indicatorWeight: 0,
              marginStart: 10,
              labelPadding:
                  const EdgeInsetsDirectional.only(start: 10, end: 10),
              onTap: handleTabClickReport,
            ),
        ],
      ),
    );
  }

  void handleTabClickReport(int index) {
    if ((_tabController?.length ?? 0) > index) {
      GiftPackCenterTab tab = tabs[index];

      if (tab.type == 'new') {
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'package_center_tab_recharge'});
      } else if (tab.type == 'daily') {
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'package_center_tab_daily'});
      } else if (tab.type == 'h5' && tab.name == K.gift_pack_advanced_packet) {
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'package_center_tab_advanced'});
      }
    }
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (noTab) {
      return Container(
        width: Util.width,
        height: Util.height,
        color: R.color.mainBgColor,
        child: Center(
          child: ErrorData(error: R.string('data_error')),
        ),
      );
    }

    return TabBarView(
      controller: _tabController,
      children: _pages,
    );
  }
}
