import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bugly/bugly.dart';
import 'package:message/message.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/controller/pop_up_controller.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/licenseDialogV2.dart';
import 'package:uni_links/uni_links.dart';
import 'package:bbpd/page/dynamic_screen.dart';
import 'package:bbpd/persistence_data_checker.dart';

import '../k.dart';
import 'home/bottom_bar.dart';
import 'home/bottom_bar_center_activity_btn.dart';
import 'main_screen.dart';

class Boot extends StatefulWidget {
  final bool isFromLogin;

  const Boot({Key? key, this.isFromLogin = false}) : super(key: key);

  @override
  BootState createState() => BootState();
}

typedef OnPageChange = Function(int index);

class BootState extends State<Boot> implements HomePageState {
  final GlobalKey _pageViewKey = GlobalKey();
  final List<LyBottomBarItem> _tabs = [];

  late PageController _pageViewController;
  int _currentPageIndex = 0;
  late MainScreen _screenMain; // 首页
  late NewMessagePage _screenMessage; // 消息页
  late ProfilePage _screenProfile; // 个人页
  late DynamicScreen _screenRecommend; // 动态页
  bool sIsShowRoom = true; // 是否展示直播间

  List<String> _tabNames = ['home', 'dynamic', 'message', 'profile'];
  late List<Widget> _pages;
  late List<GlobalKey> _keys;

  List<Map<String, dynamic>>? tabList;

  ActBarData? _activityBarData;

  int _checkRegUserTimer = 0;

  int _remainTimeInHome = 0; // 在首页停留的时间

  Timer? _timer;

  int _closeNum = 0;

  DateTime? _dateTime;

  bool _hasStartQeqInRecRoom = false; // 登陆/启动app后30s请求新厅流量推荐是否请求

  ///app是否在前台
  bool _isResumed = true;

  StreamSubscription? _sub;

  PopupController? _popupController;

  static bool isFirstBoot = true;

  ISettingManager get _settingManager => ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);

  bool get isServerTabBar => tabList != null && tabList!.length == 4;

  @override
  void initState() {
    super.initState();
    _popupController = PopupController(this);
    if (Util.isFirstLaunch && Constant.newRegisterUserTabs.isNotEmpty) {
      // 首次安装并新注册的用户，首页不展示动态页
      _tabNames = Constant.newRegisterUserTabs;
    }

    _initPages();

    appStateObserver.addListener(_onAppStateChanged);
    eventCenter.addListener('Navigator.Page.Pop', _onPagePop);
    eventCenter.addListener('Navigator.Route.Push', _onRoutePush);
    eventCenter.addListener('Room.Exit.Event', _onRoomExitEvent);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener('System.Verify.Changed', _onVerifyChanged);
    eventCenter.addListeners([
      Im.EventUnreadChanged,
      Im.EventConnChanged,
    ], _onImChanged);

    eventCenter.addListener('HomePage.JumpToFanList', _onJumpToFanList);
    eventCenter.addListener('HomePage.JumpToHomePage', _onJumpToHomePage);
    eventCenter.addListener('HomePage.JumpToFollowList', _onJumpToFollowList);
    eventCenter.addListener('HomePage.JumpToMomentPage', _onJumpToMomentPage);
    eventCenter.addListener('HomePage.JumpToMatchPage', _onJumpToMatchPage);
    eventCenter.addListener('HomePage.JumpToMessagePage', _onJumpToMessagePage);
    eventCenter.addListener('HomePage.JumpProfilePage', _onJumpToProfilePage);
    eventCenter.addListener(EventConstant.EventHomeGreyChange, _onHomeGreyChange);
    eventCenter.addListener(EventConstant.EventHomeTabChange, _onHomeTabChange);
    eventCenter.addListener('HomePage.showKa', _showKA);
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onSocketMessage);

    Future.delayed(const Duration(milliseconds: 1000)).then((dynamic val) {
      if (!mounted) return;

      initPlatformStateForStringUniLinks();
      PushUtils.getLocalNotification();
      _changeBadge();
      AppConfig.deviceLeveInit();

      SharedAppPlugin.cancelOngoingNotification();

      AppConfig.sync(type: [
        AppConfig.image_domain,
        AppConfig.song_domain,
        AppConfig.live_reward_all_user,
        AppConfig.cdn_image_domain,
        AppConfig.open_upload_aac,
        AppConfig.upload_aac_rids,
        AppConfig.music_trie,
        AppConfig.face_recognition,
        AppConfig.gift_pack,
        AppConfig.travel_gift,
        AppConfig.device_report_domain,
        AppConfig.use_bblog,
        AppConfig.close_new_vap,
        AppConfig.close_live_activity,
        AppConfig.high_potential_steward,
        AppConfig.show_trade_union,
        AppConfig.ka_evaluate,
      ]).then((value) {
        PulseLog.toggle(AppConfig.useBBlog);
        // 持久化数据版本迭代逻辑，一些配置数据和缓存在登录后才会初始化，所以持久化数据在此处才检查
        PersistenceDataChecker.check();
        refresh();
        // 隐私协议
        if (Platform.isAndroid) {
          return;
        }
        if (mounted && Platform.isIOS) {
          LicenseDialogV2.show(context);
        }
      });

      /// 获取榜单配置
      CommonRankStrategyConfig.getRankStrategy();

      if (!widget.isFromLogin) {
        // 数据上报:启动
        Xhr.reportVersion();
        appNavigatorObserver.onPageChange('Boot', null);

        // 启动记录一下，后面数据上报后删除
        Config.set('boot.report.first', '1');
      }

      Config.set('boot.time', '${DateTime.now().millisecondsSinceEpoch}');

      if (_checkRegUserTimer > 0) JsTimer.clearTimeout(_checkRegUserTimer);
      if (Session.isLogined && Session.role == UserRole.REG) {
        if (_checkRegUserTimer > 0) JsTimer.clearTimeout(_checkRegUserTimer);
        _checkRegUserTimer = JsTimer.setTimeout(() {
          ILoginManager? loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
          loginManager?.openLoginProfile(context);
        }, 2000);
      }

      Session.sync().then((response) {
        if (response.error == null) {
          Map res = response.value();
          if (res['success'] == true) {
            _popupController?.checkShowBindSafePhoneIfNeed(context);
          }
        }

        if (Session.showGsTagsDialog) {
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted && Session.isLogined) {
              IProfileManager profileManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
              profileManager.showPersonallyTagsPage(context);
            }
          });
        }
      });

      ///动态差异化色值
      IMomentManager momentManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
      momentManager.initThemeConfig(MomentThemeConfig(
        likeColor: R.color.secondTextColor,
        replyColor: R.color.mainBrandColor,
        tagBackground: const Color(0xFF313131).withOpacity(0.04),
        tagTextColor: R.color.mainTextColor,
        audioProgressColor: R.color.thirdBrightColor,
        showComment: false,
        showSayHiV2: true,
        showNormalTag: false,
      ));

      if (isFirstBoot == true) {
        // 如果直接放在initState中，会发生context为null的情况，这时候需要对这个使用context的方法做一个延时的动作
        Future.delayed(Duration.zero).then((value) async {
          Provider.of<ProfilePayload>(context, listen: false).firstLoad();
        });

        /// Im封控反诈
        Util.setListenImFirstReceiveMsg(true);
        AudioPlayHelper.instance();

        /// 通用TAG初始化
        initTagDb();
        DeviceInfo.initDelay();
      }

      isFirstBoot = false;

      // 防止卖号，检测是否需要做实人认证
      _settingManager.checkSecurityDelay();
      _setIconNumProperty();
      Location.updateLocation();
      Bugly.setUserId('${Session.uid}');

      Log.d('Boot _onRoomExitEvent checkFaceAuth0');

      //push开关状态上报
      if (Session.isLogined) {
        SharedAppPlugin.areNotificationEnabled().then((value) {
          String url = '${System.domain}go/yy/account/pushReport?uid=${Session.uid}&status=${value ? 1 : 2}';
          Xhr.getJson(url, formatJson: true);
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      onPageInit();
      if (isFirstBoot) {
        initImAndBbDb();
      }

      if (widget.isFromLogin) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _onLogin(EventConstant.EventLogin, null);
          }
        });
      }

      if (_settingManager.isJuvenilesModeActive()) {
        _settingManager.showJuvenilesModeScreen(context);
        return;
      }
    });

    /// 登陆/启动app后30s判断用户是否在房，不在房间则触发（全局弹）
    Future.delayed(const Duration(seconds: 30)).then((dynamic val) async {
      if (await checkCloseCount() && Session.isLogined) {
        ResHomeRecommendEnterRoom rsp = await RecommendConfigRepo.getRecommendConfig();
        _hasStartQeqInRecRoom = true;
        if (rsp.success) {
          eventCenter.emit(EventConstant.EventRecommendRoom, rsp.data);
        }
      }
    });

    final IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.constellationClapInit(firstLaunch: true);
  }

  /// 是否当日已关闭过两次弹窗
  Future<bool> checkCloseCount() async {
    Map? closeInfo = await HiveUtil.get<Map>('${Session.uid}_${HiveBoxConstant.recRoomCloseInfo}');
    if (closeInfo?.isNotEmpty == true) {
      _closeNum = closeInfo?['count'] ?? 0;
      _dateTime = closeInfo?['date'] ?? DateTime.now();
      DateTime now = DateTime.now();
      if (now.day > _dateTime!.day) {
        _closeNum = 0;
        HiveUtil.put<Map>(
          '${Session.uid}_${HiveBoxConstant.recRoomCloseInfo}',
          {'count': _closeNum, 'date': DateTime.now()},
        );
      }
      if (_closeNum >= 2) return false;
    }
    return true;
  }

  void initTagDb() async {
    await TagConfigDb.init();

    /// 应用启动更新房间公屏/个人页通用标签配置表
    TagConfigRepo.updateTagConfig();
  }

  void initImAndBbDb() async {
    Im.init();
    await LocalStorage.init();
    FamiliarCache.instance.init();
  }

  // 更新数数公共属性icon_number，未登录态启动main取不到账号下的未读消息
  void _setIconNumProperty() async {
    int num = 0;
    Map<String, dynamic> superProperties = {};
    if (Platform.isIOS) {
      /// 这个能申请IOS通知栏权限，不要轻易删除
      num = await PushUtils.getBadge();
    } else if (Platform.isAndroid) {
      num = await Im.getTotalUnreadCount().catchError((e) {
        Log.d('Init Tracker super properties, getTotalUnreadCount error: $e');
      });
    }
    superProperties['icon_number'] = num;

    //极光拉活需要userID可以通过这取到
    superProperties.addAll({'userId': Session.uid});

    await Tracker.instance.setSuperProperties(superProperties);
  }

  // 应用前后台切换
  void _onAppStateChanged() async {
    AppLifecycleState state = appStateObserver.value;
    bool resumed = state == AppLifecycleState.resumed;
    if (_isResumed != resumed) {
      _isResumed = resumed;

      // bugly跟踪日志
      Bugly.infoLog('Lifecycle: appStateChange: ${appStateObserver.value.toString()}');

      if (_isResumed) {
        onAppVisible();
      } else {
        onAppInvisible();
      }
      //push开关状态上报
      if (_isResumed && Session.isLogined) {
        SharedAppPlugin.areNotificationEnabled().then((value) {
          String url = '${System.domain}go/yy/account/pushReport?uid=${Session.uid}&status=${value ? 1 : 2}';
          Xhr.getJson(url, formatJson: true);
        });
        await Location.updateLocation();
        Location.shutdown();
      }
    }
  }

  // bootState是否在栈顶，是否在首页
  bool isBootStateTop() {
    bool isTop = ModalRoute.of(Constant.context)?.isCurrent ?? false;
    return isTop;
  }

  /// An implementation using a [String] link
  initPlatformStateForStringUniLinks() async {
    Log.d('initPlatformStateForStringUniLinks');
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String? link) {
      Log.d(' getLinksStream, link: $link $mounted');
      if (!mounted) return;
      if (link != null) {
        Log.d(' getLinksStream, link: $link');
        SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, link);
        resetLink();
      }
    }, onError: (err) {
      if (!mounted) return;
    });

    // Get the latest link
    String? initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      if (Util.isAndroid) {
        initialLink = await getLatestLink();
      } else {
        initialLink = await getInitialLink();
      }
      Log.d('initial link: $initialLink $mounted');
    } on PlatformException {
      Log.d('Failed to get initial link.');
    } on FormatException {
      Log.d('Failed to parse the initial link as Uri.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    if (initialLink != null) {
      ///检查scheme
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, initialLink);
      resetLink();
    }
  }

  void _initPages() {
    _keys = [];
    _pages = [];
    _pageViewController = PageController(initialPage: _currentPageIndex);

    initTabs();

    for (String tabName in _tabNames) {
      switch (tabName) {
        case 'home':
          GlobalKey key = GlobalKey<MainScreenState>();
          _screenMain = MainScreen(key: key);
          _keys.add(key);
          _pages.add(_screenMain);
          break;
        case 'dynamic':
          GlobalKey key = GlobalKey<SlpDynamicScreenState>();
          _screenRecommend = DynamicScreen(key: key);
          _keys.add(key);
          _pages.add(_screenRecommend);
          break;
        case 'message':
          GlobalKey key = GlobalKey<NewMessagePageState>();
          _screenMessage = NewMessagePage(key: key, showOneKeyFollow: false, showAccompanyRank: true);
          _keys.add(key);
          _pages.add(_screenMessage);
          break;
        case 'profile':
          GlobalKey key = GlobalKey<ProfilePageState>();
          _screenProfile = ProfilePage(key: key, showVisitor: true);
          _keys.add(key);
          _pages.add(_screenProfile);
          break;
      }
    }
  }

  Future<void> initTabs() async {
    _tabs.clear();

    // _activityBarData = BottomBarActivity.parseData();

    String tabJsonStr = Config.get('home_tab_server', '');
    if (Util.validStr(tabJsonStr)) {
      try {
        tabList = List<Map<String, dynamic>>.from(jsonDecode(tabJsonStr));
      } catch (e) {
        Log.d('initTabs, jsonDecode error: $e');
      }

      if (isServerTabBar) {
        // 服务端下发的tab不考虑本地的tab交换逻辑
        Log.d('initTabs, use server data');
        for (String tabName in _tabNames) {
          switch (tabName) {
            case 'home':
              _tabs.add(LyBottomBarItem(
                unselectedImgPath: tabList![0]['unclickedIcon'],
                animPath: tabList![0]['clickedIcon'],
                label: tabList![0]['copyWriting'],
                width: 39,
                height: 28,
                isServerImg: true,
              ));
              break;
            case 'dynamic':
              _tabs.add(
                LyBottomBarItem(
                  unselectedImgPath: tabList![1]['unclickedIcon'],
                  animPath: tabList![1]['clickedIcon'],
                  label: tabList![1]['copyWriting'],
                  width: 39,
                  height: 28,
                  isServerImg: true,
                  isMoment: true,
                ),
              );
              break;
            case 'message':
              _tabs.add(
                LyBottomBarItem(
                  unselectedImgPath: tabList![2]['unclickedIcon'],
                  animPath: tabList![2]['clickedIcon'],
                  label: tabList![2]['copyWriting'],
                  width: 39,
                  height: 28,
                  isServerImg: true,
                  isMessage: true,
                ),
              );
              break;
            case 'profile':
              _tabs.add(
                LyBottomBarItem(
                  unselectedImgPath: tabList![3]['unclickedIcon'],
                  animPath: tabList![3]['clickedIcon'],
                  label: tabList![3]['copyWriting'],
                  width: 39,
                  height: 28,
                  isServerImg: true,
                  isProfile: true,
                ),
              );
              break;
            default:
          }
        }
        return;
      }
    }

    Log.d('initTabs, use default data');
    for (String tabName in _tabNames) {
      switch (tabName) {
        case 'home':
          _tabs.add(
            LyBottomBarItem(
              unselectedImgPath: 'tab/home.webp',
              unselectedDarkImgPath: 'tab/home.webp',
              selectedImgPath: 'tab/home_highlight.webp',
              selectedDarkImgPath: 'tab/home_highlight.webp',
              label: K.app_tab_home,
              width: 32,
              height: 32,
            ),
          );
          break;
        case 'dynamic':
          _tabs.add(
            LyBottomBarItem(
              unselectedImgPath: 'tab/moment.webp',
              unselectedDarkImgPath: 'tab/moment.webp',
              selectedImgPath: 'tab/moment_highlight.webp',
              selectedDarkImgPath: 'tab/moment_highlight.webp',
              label: K.app_tab_moment,
              width: 32,
              height: 32,
              isMoment: true,
            ),
          );
          break;
        case 'message':
          _tabs.add(
            LyBottomBarItem(
              unselectedImgPath: 'tab/msg.webp',
              unselectedDarkImgPath: 'tab/msg.webp',
              selectedImgPath: 'tab/msg_highlight.webp',
              selectedDarkImgPath: 'tab/msg_highlight.webp',
              label: K.app_tab_message,
              width: 32,
              height: 32,
              isMessage: true,
            ),
          );
          break;
        case 'profile':
          _tabs.add(
            LyBottomBarItem(
              unselectedImgPath: 'tab/me.webp',
              unselectedDarkImgPath: 'tab/me.webp',
              selectedImgPath: 'tab/me_highlight.webp',
              selectedDarkImgPath: 'tab/me_highlight.webp',
              label: K.app_tab_me,
              width: 32,
              height: 32,
              isProfile: true,
            ),
          );
          break;
        default:
      }
    }
  }

  void _onVerifyChanged(String type, dynamic params) => refresh();

  @override
  void dispose() {
    HiveUtil.closeAll();
    _pageViewController.dispose();
    appStateObserver.removeListener(_onAppStateChanged);
    eventCenter.removeListener('Navigator.Page.Pop', _onPagePop);
    eventCenter.removeListener('Navigator.Route.Push', _onRoutePush);
    eventCenter.removeListener('Room.Exit.Event', _onRoomExitEvent);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener('System.Verify.Changed', _onVerifyChanged);
    eventCenter.removeListeners([
      Im.EventUnreadChanged,
      Im.EventConnChanged,
    ], _onImChanged);

    eventCenter.removeListener('HomePage.JumpToFanList', _onJumpToFanList);
    eventCenter.removeListener('HomePage.JumpToHomePage', _onJumpToHomePage);
    eventCenter.removeListener('HomePage.JumpToFollowList', _onJumpToFollowList);
    eventCenter.removeListener('HomePage.JumpToMomentPage', _onJumpToMomentPage);
    eventCenter.removeListener('HomePage.JumpToMatchPage', _onJumpToMatchPage);
    eventCenter.removeListener('HomePage.JumpToMessagePage', _onJumpToMessagePage);
    eventCenter.removeListener('HomePage.JumpProfilePage', _onJumpToProfilePage);
    eventCenter.removeListener(EventConstant.EventHomeGreyChange, _onHomeGreyChange);
    eventCenter.removeListener(EventConstant.EventHomeTabChange, _onHomeTabChange);
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onSocketMessage);

    if (_checkRegUserTimer > 0) JsTimer.clearTimeout(_checkRegUserTimer);
    _sub?.cancel();
    _timer?.cancel();
    _timer = null;
    Location.shutdown();
    super.dispose();
  }

  /// 首页置灰变化
  _onHomeGreyChange(String type, dynamic data) {
    Log.d('_onHomeGreyChange');
    _refresh();
  }

  /// 首页置灰变化
  _onHomeTabChange(String type, dynamic data) {
    Log.d('_onHomeTabChange');
    initTabs();
    _refresh();
  }

  /// 双十一，爵位，惺惺相惜购买弹窗
  _onSocketMessage(String name, dynamic data) async {
    if (name != EventConstant.WebsocketEventMessage) return;
    try {
      Map content = data as Map;
      String type = content['name'];
      if (type == 'gift.bag.title') {
        IVipManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        manager.openNobilityActivityDialog(context);
      } else if (type == 'gift.bag.11') {
        IVipManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        manager.openDoubleElevenActivityDialog(context);
      } else if (type == 'gift.bag.cherish') {
        IVipManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        manager.openX4PackageDialog(context);
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _showKA(String type, dynamic data) {
    if (!isHomePageShowing || !mounted) return;
    _popupController?.checkShowSVipStewardDialog(context, againShowSVipStewardDialog);
  }

  void _onLogout(String type, dynamic value) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    _onTabItemClick(0);
  }

  void _onLogin(String type, dynamic data) {
    /// 切换账号后停留在消息tab页
    if (data != null && data is Map && data['origin'] != data['now']) {
      /// 清空回退栈，仅保留首页
      Navigator.of(context).popUntil((route) {
        Log.d("_onLogin_Boot route => $route");
        Log.d("_onLogin_Boot name => ${route.settings.name}");
        String? name = route.settings.name;
        if (name == null) return false;
        if (name.startsWith('/room/')) {
          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.exitRoom(enforce: true);
        }
        if (name.startsWith('/setting') || name.startsWith('/smallAccount') || route.isFirst) {
          /// 小号消息助手 和 设置  切换账号时不清当前栈
          return true;
        }
        return false;
      });
      // 切换账号 刷新数据
      _reloadAll();
      _onJumpToMessagePage("HomePage.JumpToMessagePage", null);
    }
    if (Util.isLoginBeforeBoot() && !widget.isFromLogin) {
      return;
    }
    Session.sync({
      'money': true,
      'banner': true,
      'auth': true,
    });
    Xhr.reportVersion();

    // 登录，获取消息通知设置
    MsgNotify.loadConfig();

    //重置聊天tab的数据   重置发现数据
    for (var key in _keys) {
      if (key.currentState != null) {
        if (key.currentState is NewMessagePageState) {
          (key.currentState as NewMessagePageState).resetDataAll();
        }
      }
    }
    if (!widget.isFromLogin) {
      // 防止卖号，检测是否需要做实人认证
      _settingManager.checkSecurityDelay();
    }
  }

  void _onImChanged(String type, dynamic data) {
    if (type == Im.EventUnreadChanged) {
      if (data is Map) {
        Map res = data;
        int left = res['left'];
        if (left == 0) _changeBadge();
      }
    } else if (type == Im.EventConnChanged) {
      Log.d("------------> EventConnChanged $data");
      _changeBadge();
    }
  }

  _changeBadge() async {
    try {
      int num = await Im.getTotalUnreadCount();
      if (num >= 0) {
        if (Platform.isIOS) {
          await PushUtils.setBadge(num);
        } else if (Platform.isAndroid) {
          SharedAppPlugin.setBadgeNumber(num);
        }
      }
    } catch (e) {}
  }

  _onRoomExitEvent(String type, dynamic data) {
    Log.d('Boot _onRoomExitEvent checkFaceAuth2');
    _reload(home: false, force: false, byPagePop: false);
    _popupController?.checkFaceAuth(context);
    _popupController?.showKaEvaluateDialog(context);
  }

  _onRoutePush(String type, dynamic value) {
    Log.d("Boot onPagePush $value");
  }

  void _onAddClicked() {
    if (Session.isLogined == false) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'main_tab_match'});
    IPremadeManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    manager.openPremadeGameScreen(context);
  }

  void _onTabItemClick(int index) async {
    bool needLoginIndex = false;
    if (_pages[index] is NewMessagePage) {
      needLoginIndex = true;
    }

    if (Session.isLogined == false && needLoginIndex) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    appNavigatorObserver.setBootIndex(index);

    // bugly跟踪日志
    Bugly.infoLog('Router: tabBarSelect: $index');

    // tab点击埋点
    if (_keys[index] is GlobalKey<MainScreenState>) {
      Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'main_tab_home'});
    } else if (_keys[index] is GlobalKey<NewMessagePageState>) {
      Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'main_tab_msg'});
    } else if (_keys[index] is GlobalKey<SlpDynamicScreenState>) {
      Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'main_tab_moment'});
    } else if (_keys[index] is GlobalKey<ProfilePageState>) {
      Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'main_tab_profile'});
    }

    if (_currentPageIndex != index) {
      _setUnTop(_currentPageIndex);
      _currentPageIndex = index;
      _refresh();
      _pageViewController.jumpToPage(index);
      _reload(home: true, force: false);
    } else {
      _reload(home: true, force: true);
    }

    for (int i = 0; i < _keys.length; i++) {
      State<StatefulWidget>? currentState = _keys[i].currentState;
      if (currentState != null && currentState is TabStateMixin) {
        (currentState as TabStateMixin).isCurrentTab = i == index;
      }
    }

    eventCenter.emit('On.Tab.Changed');

    if (_keys[index].currentState is NewMessagePageState) {
      Utility.pushReq(context);
    }
  }

  void startTimer() {
    // 登陆/启动app后30s请求成功后，才走回到首页，10s逻辑
    if (_hasStartQeqInRecRoom) {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
        _remainTimeInHome++;
        if (_remainTimeInHome == 10 && await checkCloseCount()) {
          ResHomeRecommendEnterRoom rsp = await RecommendConfigRepo.getRecommendConfig();
          if (rsp.success) {
            eventCenter.emit(EventConstant.EventRecommendRoom, rsp.data);
          }
          timer.cancel();
          _remainTimeInHome = 0;
        }
      });
    }
  }

  _setUnTop(int index) {}

  _reloadAll() {
    for (int i = 0; i < _keys.length; i++) {
      _reload(force: true, i: i);
    }
  }

  final _maxReloadDurationInMilliSecs = 20 * 1000;
  int _lastReloadTime = 0;

  _reload({home = true, force = false, byPagePop = false, int? i}) {
    int index = i ?? _currentPageIndex;
    Log.d("Boot _reload $index");
    int now = DateTime.now().millisecondsSinceEpoch;
    if (force || now - _lastReloadTime > _maxReloadDurationInMilliSecs) {
      _lastReloadTime = now;
      if (_keys[index].currentState == null) return;
      if (_keys[index].currentState != null) {
        if (_keys[index].currentState is MainScreenState) {
          if (!byPagePop) {
            (_keys[index].currentState as MainScreenState).reload(force: force);
          }
        } else if (_keys[index].currentState is NewMessagePageState) {
          (_keys[index].currentState as NewMessagePageState).reload();
        } else if (_keys[index].currentState is ProfilePageState) {
          (_keys[index].currentState as ProfilePageState).reload(home: home);
        } else if (_keys[index].currentState is SlpDynamicScreenState && home) {
          (_keys[index].currentState as SlpDynamicScreenState).reload(force: force);
        }
      }
    }
    // 上面有间隔20s的条件，单独拎出来
    if (!byPagePop) {
      _resetStartTimer(index);
    }
  }

  // 返回派对 + 切换到派对请求，切换到其他tab停止请求
  void _resetStartTimer(int index) {
    if (_keys[index].currentState != null) {
      if (_keys[index].currentState is MainScreenState) {
        startTimer();
      } else {
        _remainTimeInHome = 0;
        if (_timer != null) {
          _timer?.cancel();
          _timer = null;
        }
      }
    }
  }

  void _refresh() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget child = WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          SharedAppPlugin.backToHome();
          return false;
        }
        return true;
      },
      child: Stack(
        // alignment: AlignmentDirectional.topCenter,
        children: [
          Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              bottomNavigationBar: LyBottomBar(
                height: isServerTabBar ? 50 : 54,
                items: _tabs,
                currentIndex: _currentPageIndex,
                onBottomTabClicked: _onTabItemClick,
                activityBar: _activityBarData?.subBars.length == _tabs.length ? _activityBarData : null,
              ),
              body: PageView(
                key: _pageViewKey,
                controller: _pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              )).withCommonBg(),
          if (_activityBarData?.subBars.length == _tabs.length && _activityBarData!.middleBar.icon.isNotEmpty)
            PositionedDirectional(
              bottom: (Util.isIphoneX ? Util.iphoneXBottom - 2 : 8),
              child: BottomBarCenterActivityBtn(data: _activityBarData!.middleBar),
            ),
        ],
      ),
    );
    // Log.d('AppConfig.homeGrey ${AppConfig.homeGrey}');
    return AppConfig.homeGrey ? _buildGrayContent(child) : child;
  }

  Widget _buildGrayContent(Widget child) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
      child: child,
    );
  }

  _onJumpToFanList(String type, dynamic data) {
    int messageIndex = 0;

    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenMessage) {
        messageIndex = i;
        break;
      }
    }

    _onTabItemClick(messageIndex);

    ContactPage.show(context, initialPage: ContactTab.fans);
  }

  _onJumpToHomePage(String type, dynamic data) {
    int homeIndex = 0;

    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenMain) {
        homeIndex = i;
        break;
      }
    }

    _onTabItemClick(homeIndex);
  }

  _onJumpToFollowList(String type, dynamic data) {
    int messageIndex = 0;

    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenMessage) {
        messageIndex = i;
        break;
      }
    }

    _onTabItemClick(messageIndex);

    ContactPage.show(context, initialPage: ContactTab.follow);
  }

  // 跳转到动态
  _onJumpToMomentPage(String type, dynamic data) {
    int discoverIndex = 1;
    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenRecommend) {
        discoverIndex = i;
        break;
      }
    }
    _onTabItemClick(discoverIndex);
    int subTabIndex = Util.parseInt(data, -1); // -1 => 不操作子tab
    Log.d('Boot._onJumpToMomentPage subTabIndex: $subTabIndex');
    if (subTabIndex != -1) {
      eventCenter.emit('DynamicScreen.ChangeTab', subTabIndex);
    }
  }

  // 跳转到匹配
  _onJumpToMatchPage(String type, dynamic data) {
    _onAddClicked();
  }

  // 跳转消息TAB
  _onJumpToMessagePage(String type, Object? data) {
    int messageIndex = 0;

    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenMessage) {
        messageIndex = i;
        break;
      }
    }

    _onTabItemClick(messageIndex);
  }

  // 跳转我的TAB
  _onJumpToProfilePage(String type, dynamic data) {
    int profileIndex = 0;

    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i] == _screenProfile) {
        profileIndex = i;
        break;
      }
    }

    _onTabItemClick(profileIndex);
  }

  @override
  bool get isHomePageShowing => _isResumed && isBootStateTop();

  ///首页初始化
  @override
  void onPageInit() {
    Log.d(tag: "BootState", "onPageInit:");
    _popupController?.loadActivityConfig(context);

    _popupController?.checkFaceAuth(context);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        //TODO test dialog
        // FaceLiveLicenseDialog.show(context);

        _popupController?.showJuvenilesGuideDialog();
        //TODO  签到弹窗
        Log.d('BootState onPageInit showSignPanel');
        Future.delayed(const Duration(seconds: 2), () {
          _popupController?.showSignPanel(context);
        });
        _popupController?.showIosPreviewDialog(context);
      }
    });
  }

  /// 应用从前台到后台
  @override
  void onAppInvisible() {
    Log.d(tag: "BootState", "onPageInvisible");
    OpenScreenAd.prepareAd(); //拉取广告，主要用于图片的预加载
  }

  ///应用从后台到前台
  @override
  void onAppVisible() {
    bool isHome = isHomePageShowing;
    Log.d(tag: "BootState", "onPageVisible,isHome:$isHome");
    OpenScreenAd.launch(context); //拉取广告并展示
    TagConfigRepo.updateTagConfig(); //更新房间公屏/个人页通用标签配置表
    CommonRankStrategyConfig.getRankStrategy(); // 获取榜单配置
    if (isHome) {
      _reload(home: true); // 应用从后台切到前台，且应用在首页，刷新首页当前TAB
      _popupController?.checkFaceAuth(context);
    }
  }

  ///应用退回到首页
  _onPagePop(String type, dynamic value) {
    String pageName = value;
    if (pageName == '/') {
      Log.d(tag: "BootState", "onPagePop,$pageName");
      _reload(home: false, force: false, byPagePop: true);
      _popupController?.checkShowSVipStewardDialog(context, againShowSVipStewardDialog);
    }
  }
}
