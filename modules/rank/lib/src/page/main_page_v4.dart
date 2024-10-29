import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/rankRequestManager.dart';
import 'tabs/follow_up/home_follow_up_sub_page.dart';
import 'tabs/home_friend_sub_page.dart';
import 'tabs/room_tab_page.dart';
import 'package:pulse_log/pulse_log.dart';
import 'main_page_controller.dart';
import 'package:get/get.dart';

class MainPageV4 extends StatefulWidget {
  const MainPageV4({super.key});

  @override
  MainPageV4State createState() {
    return MainPageV4State();
  }
}

class MainPageV4State extends State<MainPageV4> with TickerProviderStateMixin, ReloadStateMixin, RouteAware {
  ExtendedTabController? _tabController;
  int _initialIndex = 0;
  GlobalKey _tabBarViewKey = GlobalKey();
  GlobalKey _animTabBarKey = GlobalKey();

  HomeTabData? _homeTabData;
  final List<CommonHomeTab> _tabs = [];
  final List<String> _tabsTitle = [];

  bool isLoading = true;
  bool _loadingByApi = true; // 限制API反复请求
  String? _errorMsg;

  // 离线Push，跳转指定tab
  String? pushMatchKey;
  String? subPushMatchKey;

  Map<String, GlobalKey?>? firstTabKey;
  Map<String, GlobalKey?>? roomSubTabKey;

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  ISettingManager? _settingManager;
  final IGiftManager _giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  /// A/B测试新样式，
  /// 1.【首页】TAB修改：
  ///   1.1.banner在【快速加入】下面
  ///   1.2.【快速加入】滑出页面，出现一个简易样式的【快速加入】浮层
  ///   1.3.【首页】TAB不展示【我的派对】和【好友在玩】
  ///   1.4.【快速加入】title去掉
  /// 2.增加一个【好友】TAB：
  ///   2.1 好友在玩：创建派对+好友在玩房间
  ///   2.2 收藏房间/为你推荐
  bool newType = false;

  late MainPageController _logic;

  @override
  void initState() {
    super.initState();
    _logic = Get.put(MainPageController());
    eventCenter.addListener(EventConstant.EventLogout, _logout);
    eventCenter.addListener('HomePage.JumpToHomeHotTab', _scrollToHotTab);
    eventCenter.addListener('HomePage.JumpToPushTab', _scrollToPushTab);
    eventCenter.addListener('HomePage.JumpToHomeTab', _scrollToTab);
    eventCenter.addListener('HomePage.JumpToHomeTabKol', _scrollToTab);
    eventCenter.addListener(EventConstant.EventJoinFansGroupChanged, _onFansGroupStatusChanged);
    eventCenter.addListener(EventConstant.EventConnectivityChanged, _onConnectivityChanged);

    _lastReloadTime = nowMilliSecs();
    _settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    _loadTabs();
    _showTransInviteIfNeed();
    _checkShowPrettyIdRewardDialog();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    eventCenter.removeListener(EventConstant.EventLogout, _logout);
    eventCenter.removeListener('HomePage.JumpToHomeHotTab', _scrollToHotTab);
    eventCenter.removeListener('HomePage.JumpToPushTab', _scrollToPushTab);
    eventCenter.removeListener('HomePage.JumpToHomeTab', _scrollToTab);
    eventCenter.removeListener('HomePage.JumpToHomeTabKol', _scrollToTab);
    eventCenter.removeListener(EventConstant.EventConnectivityChanged, _onConnectivityChanged);
    eventCenter.removeListener(EventConstant.EventJoinFansGroupChanged, _onFansGroupStatusChanged);
    routeObserver.unsubscribe(this); //取消订阅
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute? route = ModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void didPopNext() {
    Log.d('didPopNext');
  }

  _logout(String type, dynamic data) {
    Get.delete<MainPageController>();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Loading();
    }

    if (_errorMsg != null) {
      return Center(child: ErrorData(error: _errorMsg, onTap: _loadTabs, fontColor: R.colors.mainTextColor));
    }

    return GetBuilder<MainPageController>(builder: (logic) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopBar(),
          _buildTabs(),
          Expanded(
            child: Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollUpdateNotification) {
                      double offset = notification.metrics.pixels;
                      double screenWidth = MediaQuery.of(context).size.width;
                      _tabController?.scrollPosition = offset / screenWidth;
                    }
                    return false;
                  },
                  child: TabBarView(
                    key: _tabBarViewKey,
                    controller: _tabController,
                    children: buildSubPages(),
                  ),
                ),
                // PositionedDirectional(
                //   bottom: 0,
                //   end: 0,
                //   child: GetBuilder<MainPageController>(
                //     id: 'quick_match',
                //     builder: (logic) {
                //       if (Util.validStr(logic.matchFilter)) {
                //         return buildQuickMatch(logic.matchFilter);
                //       }
                //       return const SizedBox.shrink();
                //     },
                //   ),
                // ),
                _giftManager.getConstellationClapFloatBox(),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildTopBar() {
    return Container(
      height: 56,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          R.img("topbar/logo_text.webp", width: 258.0 * 0.4, height: 64.0 * 0.4, package: ComponentManager.MANAGER_RANK),
          const Spacer(),
          if (_homeTabData?.rookieCheckin.isShowEntrance ?? false) ...[
            const SizedBox(width: 5),
            _buildSignEntrance(),
          ],

          GestureDetector(
            onTap: () {
              IRankManager? rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
              rankManager?.showRank(context, 'all');
            },
            child: R.img(
              "topbar/rank.webp",
              width: 32,
              height: 32,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openInitOperateDisplay(context, refer: 'create_room_top_bar');
            },
            child: R.img(
              "topbar/create_room.svg",
              width: 32,
              height: 32,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ISearchManager searchManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SEARCH);
              searchManager.showSearch(context);
              Tracker.instance.track(TrackEvent.search_button_click);
            },
            child: R.img(
              "topbar/search.svg",
              width: 32,
              height: 32,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          // _buildHonorRank(),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  /// 搜索条
  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {
        ISearchManager searchManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SEARCH);
        searchManager.showSearch(context);
        Tracker.instance.track(TrackEvent.search_button_click);
      },
      child: Rext.themeTopBgContainer(
        width: double.infinity,
        height: 36,
        bgColor: R.colors.homeSearchBgColor,
        cornerRadius: 18,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        foregroundDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: R.colors.dividerColor, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          children: [
            R.img(
              Assets.ic_home_search_svg,
              width: 18,
              height: 18,
              color: R.colors.thirdTextColor,
              package: ComponentManager.MANAGER_RANK,
            ),
            const SizedBox(width: 4),
            Text(
              K.rank_search_hint_text,
              style: TextStyle(fontSize: 14, color: R.colors.thirdTextColor),
            ),
          ],
        ),
      ),
    );
  }

  ///新人签到
  Widget _buildSignEntrance() {
    Widget child;
    if (darkMode) {
      child = Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Rext.themeTopBgContainer(
            width: 36,
            height: 36,
            bgColor: R.colors.homeSearchBgColor,
            cornerRadius: 18,
            foregroundDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: R.colors.dividerColor, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            child: const SizedBox(),
          ),
          R.img(Assets.rank$ic_sign_dark_webp, width: 32, height: 32, fit: BoxFit.fill)
        ],
      );
    } else {
      child = R.img(Assets.rank$ic_sign_webp, width: 49, height: 49, fit: BoxFit.fill);
    }
    return GestureDetector(
      onTap: () {
        if (_homeTabData!.rookieCheckin.checkInUrl.isNotEmpty) {
          BaseWebviewScreen.show(System.context, url: _homeTabData!.rookieCheckin.checkInUrl);
        }
      },
      child: SizedBox(width: 49, height: 49, child: child),
    );
  }

  /// 荣耀殿堂
  Widget _buildHonorRank() {
    Widget child;
    if (darkMode) {
      child = Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Rext.themeTopBgContainer(
            width: 36,
            height: 36,
            bgColor: R.colors.homeSearchBgColor,
            cornerRadius: 18,
            foregroundDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: R.colors.dividerColor, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            child: const SizedBox(),
          ),
          MultiframeImage.network(
            Util.getRemoteImgUrl('static/core/ic_home_rank_dark.webp'),
            'home_rank',
            width: 49,
            height: 49,
            fit: BoxFit.fill,
          ),
        ],
      );
    } else {
      child = CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl('static/core/ic_home_rank.webp'),
        width: 49,
        height: 49,
      );
    }
    return GestureDetector(
      onTap: () {
        IRankManager? rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        rankManager?.showRank(context, 'all');
      },
      child: SizedBox(width: 49, height: 49, child: child),
    );
  }

  Widget _buildTabs() {
    return Container(
      width: double.infinity,
      height: kToolbarHeight,
      alignment: AlignmentDirectional.center,
      // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: R.colors.dividerColor))),
      child: AnimTabBar(
        key: _animTabBarKey,
        titles: _tabsTitle,
        isScrollable: true,
        controller: _tabController,
        selectedFontSize: 22,
        selectedFontColor: R.colors.mainTextColor,
        selectedFontWeight: FontWeight.bold,
        unselectedFontSize: 18,
        unselectedFontColor: R.colors.secondTextColor,
        unselectedFontWeight: FontWeight.normal,
        marginStart: 6,
        marginEnd: 6,
        spacing: 10,
        showIndicator: false,
        showTextIndicator: true,
        alignment: AlignmentDirectional.bottomCenter,
      ),
    );
  }

  List<Widget> buildSubPages() {
    List<Widget> pages = [];
    for (var homeTab in _tabs) {
      Widget page;
      GlobalKey? pageKey = homeTab.globalKey;
      if (homeTab.type == 'tabRoom') {
        List<CommonSubTab> childList = homeTab.subRoomTabs.where((item) => item.title == '全部').toList();
        // Log.d('childList:${childList.length}');
        // Log.d('childList:${homeTab.subRoomTabs.length}');
        page = RoomTabPage(
          childList,
          key: pageKey,
          tabId: homeTab.tabId,
          tabName: homeTab.title,
          bannerChannel: homeTab.bannerChannel,
          style: homeTab.style,
          type: homeTab.type ?? '',
          onSubTabChange: onSubTabChange,
        );
      } else if (homeTab.type == 'tabFriend') {
        ///热门标签
        page = HomeFriendSubPage(
          tabName: homeTab.title,
          key: pageKey,
          hideFastMatch: _homeTabData == null ? false : _homeTabData!.extend.hideQuickJoin,
          hideActiveFriends: _homeTabData == null ? false : _homeTabData!.extend.hideMyParty,
          newType: newType,
        );
      }
      /*else if (homeTab.type == 'tabKol') {
        page = GroupFansSubPage(groupId: homeTab.tabId, key: pageKey,);
      } */
      else if (homeTab.type == 'tabCollect') {
        //派对列表
        page = HomeFollowUpSubPage(key: pageKey);
      } else {
        page = Center(child: Text(homeTab.title));
      }
      pages.add(page);
    }
    return pages;
  }

  void onSubTabChange(int tabId, String filter) {
    if (_tabs.length > _tabController!.index) {
      if (tabId == _tabs[_tabController!.index].tabId) {
        _logic.setMatchFilter(filter);
      }
    }
  }

  void _onTabChanged() {
    refreshSelectTab(force: false, animated: false);
    updateShowQuickMatch();
    Log.d('_tabs[_tabController!.index].type:${_tabs[_tabController!.index].type}');

    if (_tabs.length > _tabController!.index && _tabs[_tabController!.index].type == 'tabKol') {
      Tracker.instance.track(TrackEvent.kol_exposure, properties: {
        'kol_uid': _tabs[_tabController!.index].tabId,
      });
    }
  }

  /// 更新快速匹配入口是否显示
  void updateShowQuickMatch() {
    if (_tabController != null && _tabs.length > _tabController!.index) {
      if ('tabRoom' == _tabs[_tabController!.index].type) {
        State? state = _tabs[_tabController!.index].globalKey?.currentState;
        if (state != null && state is RoomTabState) {
          String filter = state.getCurrentFilter();
          _logic.setMatchFilter(filter);
        } else {
          // state=null 说明当前tab首次初始化，直接从原始数据subTabs中取第一个filter
          List<CommonSubTab> subTabs = _tabs[_tabController!.index].subRoomTabs;
          String filter = '';
          if (!Util.isCollectionEmpty(subTabs)) {
            filter = subTabs[0].filter;
          }
          _logic.setMatchFilter(filter);
        }
      } else if ('tabFriend' == _tabs[_tabController!.index].type) {
        // 新增 热门也要显示快速匹配
        _logic.setMatchFilter('chat'); // 默认匹配-交友
      } else {
        _logic.setMatchFilter('');
      }
    }
  }

  void _loadTabs() async {
    if (!Session.isLogined) {
      /// 未登录态不请求，防止返回的isVerify有错
      return;
    }
    _giftManager.constellationClapInit();
    _loadingByApi = true;
    if (_tabs.isEmpty) {
      isLoading = true;
    }
    // HomeTabs
    HomeTabData? data = await RankRequestManager.getHomeTabs();
    _homeTabData = data;
    if (data != null && data.ok == false) {
      Util.isVerify = false;
      Util.isAndroidVerify = false;
    }
    newType = data?.showNew ?? false;

    _tabs.clear();

    for (var tab in data?.tab ?? []) {
      List<CommonSubTab> subTabs = [];
      for (var subTab in tab?.subTab ?? []) {
        subTabs.add(CommonSubTab(subTab: subTab));
      }
      if (tab.type != "tabKol") {
        _tabs.add(CommonHomeTab(homeTab: tab, subRoomTabs: subTabs));
      }
    }

    _tabsTitle.clear();
    if (_tabs.isEmpty) {
      _errorMsg = K.rank_net_error;
    } else {
      _errorMsg = null;
      firstTabKey ??= <String, GlobalKey?>{};
      roomSubTabKey ??= <String, GlobalKey?>{};
      _tabs.asMap().forEach((int index, CommonHomeTab tab) {
        _tabsTitle.add(tab.title);

        // 刷新使用key
        String firstKey = '${tab.type}_${tab.title}';
        if (firstTabKey!.containsKey(firstKey)) {
          tab.globalKey = firstTabKey![firstKey];
        } else {
          tab.globalKey = GlobalKey();
          firstTabKey![firstKey] = tab.globalKey;
        }
        if (tab.subRoomTabs.isNotEmpty) {
          for (var tab in tab.subRoomTabs) {
            String roomKey = '${firstKey}_${tab.filter}_${tab.title}';
            if (roomSubTabKey!.containsKey(roomKey)) {
              tab.globalKey = roomSubTabKey![roomKey];
            } else {
              tab.globalKey = GlobalKey();
              roomSubTabKey![roomKey] = tab.globalKey;
            }
          }
        }
      });

      if (_settingManager != null && _settingManager!.isAuthCheckFailed()) {
        // 防止卖号检测失败，首页成功拉取数据后需要重新检测
        _settingManager!.checkSecurity();
      }
    }
    _loadingByApi = false;
    isLoading = false;

    _initTabController();
    updateShowQuickMatch(); // 初始化 快速匹配的参数
    refresh();
  }

  void _initTabController() {
    if (_tabs.isEmpty) {
      return;
    }

    bool changeLength = ((_tabController?.length ?? 0) != _tabs.length);
    _getDefaultTabIndex();
    if (_tabController != null && _tabs.length > _tabController!.index) {
      _initialIndex = _tabController!.index;
    }
    _tabController?.removeListener(_onTabChanged);
    safeRun(
      () => _tabController = ExtendedTabController(initialIndex: _initialIndex, length: _tabs.length, vsync: this)
        ..addListener(_onTabChanged),
    );
    if (changeLength) {
      _tabBarViewKey = GlobalKey();
      _animTabBarKey = GlobalKey();
    }
  }

  void _getDefaultTabIndex() {
    subPushMatchKey = null;
    if (pushMatchKey != null) {
      // 优先跳转离线PUSH指定TAB
      for (int i = 0; i < _tabs.length; i++) {
        if (pushMatchKey == _tabs[i].matchKey) {
          _initialIndex = i;
          pushMatchKey = null;
          return;
        } else if (_tabs[i].subRoomTabs.isNotEmpty) {
          for (int j = 0; j < _tabs[i].subRoomTabs.length; j++) {
            if (pushMatchKey == _tabs[i].subRoomTabs[j].matchKey) {
              _initialIndex = i;
              subPushMatchKey = pushMatchKey;
              pushMatchKey = null;
              return;
            }
          }
        }
      }
    }
    pushMatchKey = null;

    for (int i = 0; i < _tabs.length; i++) {
      if (_tabs[i].isDefault) {
        _initialIndex = i;
        break;
      }
    }
  }

  void handleTabClickReport(int index) {
    if (_tabController!.length > index) {
      Tracker.instance.track(
        TrackEvent.party_page,
        properties: {'click_tab': _tabs[index].title, 'tab_class': '1'},
      );
      PulseLog.instance.event(
        'click_event',
        properties: {'click_tag': 'home_first_tab_${_tabs[index].title}'},
      );
    }
  }

  // 跳转到热门tab
  void _scrollToHotTab(String type, dynamic data) {
    if (_tabs.isEmpty) return;
    for (int i = 0; i < _tabs.length; i++) {
      CommonHomeTab tab = _tabs[i];
      if (tab.filter == 'rcmd') {
        // type = room
        _tabController!.index = i;
        return;
      }
    }
  }

  // 跳转到对应tab
  void _scrollToTab(String type, dynamic data) {
    if (_tabs.isEmpty) return;
    for (int i = 0; i < _tabs.length; i++) {
      CommonHomeTab tab = _tabs[i];
      if (tab.type == data) {
        // type = room
        _tabController!.index = i;
        return;
      }
    }
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force || _errorMsg != null) {
      _lastReloadTime = now;

      if (!_loadingByApi) {
        _loadTabs();
      }
      refreshSelectTab(force: force, animated: animated);
    }
  }

  void refreshSelectTab({bool force = true, animated = true}) {
    Log.d('main page refreshSelectTab');
    if (_tabController != null &&
        _tabs.length > _tabController!.index &&
        _tabs[_tabController!.index].globalKey?.currentState is ReloadStateMixin) {
      (_tabs[_tabController!.index].globalKey?.currentState as ReloadStateMixin).reload(force: force, animated: animated);
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_tabs.length > _tabController!.index && _tabs[_tabController!.index].globalKey?.currentState is ReloadStateMixin) {
      (_tabs[_tabController!.index].globalKey?.currentState as ReloadStateMixin).scrollToTop();
    }
  }

  // 离线Push，点击通知栏进指定TAB
  void _scrollToPushTab(String type, dynamic data) {
    if (data is! String) {
      return;
    }

    if (_tabs.isEmpty || _tabs.length < 2) {
      pushMatchKey = data;
      return;
    }
    for (int i = 0; i < _tabs.length; i++) {
      CommonHomeTab tab = _tabs[i];
      if (tab.matchKey == data) {
        _tabController!.index = i;
        return;
      }
    }
  }

  _onConnectivityChanged(String type, dynamic data) {
    bool isNetworkConnected = data;
    if (isNetworkConnected && !isLoading) {
      _loadTabs();
    }
  }

  void _onFansGroupStatusChanged(String type, dynamic data) {
    _loadTabs();
  }

  void _showTransInviteIfNeed() async {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      if (!Config.getBool(BBConfigKey.hasShowTransInviteToday())) {
        Config.setBool(BBConfigKey.hasShowTransInviteToday(), true);
        DataRsp<TransInviteInfo> dataRsp = await Api.getTransInviteInfo();
        if (dataRsp.success == true && dataRsp.data != null && dataRsp.data!.id > 0) {
          String idKey = BBConfigKey.hasShowTransInviteID(dataRsp.data!.id);
          int hasShowTimes = Config.getInt(idKey, 0);
          if (hasShowTimes < 3) {
            hasShowTimes = hasShowTimes + 1;
            Config.set(idKey, '$hasShowTimes');
            Tracker.instance.track(TrackEvent.home_customize_pop, properties: {
              'action_type': 'show',
            });
            UserActivityPackage.openActivityDialog(
              context,
              dataRsp.data!.image,
              width: dataRsp.data!.width.toDouble(),
              height: dataRsp.data!.height.toDouble(),
              onPress: () {
                Navigator.of(context).pop();
                Tracker.instance.track(TrackEvent.home_customize_pop, properties: {'action_type': 'click'});
                if (dataRsp.data!.isGroup) {
                  IGroupManager iGroupManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
                  iGroupManager.openUserApplyScreen(context, Util.parseInt(dataRsp.data!.groupId));
                } else {
                  String url = SchemeUrlHelper.instance().concatSchemeUrl(dataRsp.data!.redirect, SchemeUrlHelper.scheme_path_trans_invite);
                  SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, url);
                }
              },
            );
          }
        }
      }
    });
  }

  /// 获取靓号权益奖励弹框
  void _checkShowPrettyIdRewardDialog() {
    if (!Session.isLogined) return;
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      if (!mounted) return;
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openPrettyIdRewardReceiveDialog(context);
    });
  }

  Widget buildQuickMatch(String matchFilter) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Tracker.instance.track(TrackEvent.click, properties: {'click_quick_matching': Session.uid});
        IPremadeManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
        manager.openPremadeGameScreen(System.context, type: matchFilter, quick: 1);
      },
      child: Container(
          width: 86,
          height: 80,
          padding: const EdgeInsetsDirectional.only(bottom: 40, end: 16),
          child: R.img('float_quick_match.svg', width: 70, height: 40, package: ComponentManager.MANAGER_RANK)
          /*
        Stack(
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0x2999FFBC), Color(0x2926C4FF), Color(0x29926AFF)]),
                    ),
                  ),
                ),
              ),
            ),
            Rext.autoStyleImg(Assets.ic_home_fast_match_webp,
                width: 137, height: 70, package: ComponentManager.MANAGER_RANK),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(
                  Assets.ic_match_arrow_svg,
                  width: 21,
                  height: 21,
                  color: Colors.white,
                  package: ComponentManager.MANAGER_RANK,
                ),
                const SizedBox(width: 4),
                Text(
                  K.rank_quick_match,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      */
          ),
    );
  }
}
