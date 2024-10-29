import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/k.dart';
import 'package:profile/src/authenticate_center_page.dart';
import 'package:profile/src/gs_tools_page.dart';
import 'package:profile/src/invite_fot_gift_page.dart';
import 'package:profile/src/launch_audio/launch_audio_group_page.dart';
import 'package:profile/src/model/profile_service_item.dart';
import 'package:profile/src/new_user_ranking_page.dart';
import 'package:profile/src/nl_friend_recommend_screen.dart';
import 'package:profile/src/pretty_id_select_page.dart';
import 'package:profile/src/widget/account_center.dart';
import 'package:profile/src/widget/function_center.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart' hide SliverAppBar;

import '../assets.dart';
import 'anchor_task/anchor_task_screen.dart';
import 'api/api.dart';
import 'exchange/cd_key_screen.dart';
import 'gift_code/gift_code_dialog.dart';
import 'model/pb/generated/account_frame.pb.dart';
import 'model/profile_config_model.dart';
import 'widget/personality_labels_dialog.dart';
import 'widget/profile_banner_widget.dart';

typedef OnReloadTypeChanged = Function(ReloadType type);

/// 我的tab
class ProfilePage extends StatefulWidget {
  final bool showVisitor; //是否展现访客
  final bool showBanner; // 是否展现banner
  final Brightness defaultBrightness;
  final bool supportGod; //是否支持申请主播相关
  final bool supportRed; //是否支持红人认证
  final bool supportQualification; //是否支持主播资质认证
  final bool needRecommendBroker; //是否显示推荐公会
  final bool showSkill;
  final bool isTopPage; //是否顶层页面

  const ProfilePage({
    super.key,
    this.showVisitor = false,
    this.showBanner = false,
    this.defaultBrightness = Brightness.light,
    this.supportGod = true,
    this.supportRed = true,
    this.supportQualification = false,
    this.needRecommendBroker = false,
    this.showSkill = true,
    this.isTopPage = false,
  });

  @override
  ProfilePageState createState() {
    return ProfilePageState();
  }
}

/// 点击进入二级页，返回【我的】需要刷新的数据
enum ReloadType {
  All, // 刷新所有
  None, // 不用刷新
  RelationNum, // 刷新数量关系
  FirstBanner, // 刷新活动
  OderService, // 邀约
  GodLicenseVersion, // 刷新主播
  AppReview, // 刷新好评
  Money, // 刷新money
  Sign, // 刷新任务中心
  Bag, // 刷新背包
  TaskCenter, // 任务中心
  AccountCenter, // 我的账户
  FunctionCenter, // 功能中心
  ProfileIntegrity, // 资料完善
  BindPhone, // 绑定手机号
  UserInfo, // 用户信息
}

class ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin<ProfilePage> {
  final ISettingManager _settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
  final IChatManager _chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  final ILoginManager _loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  final IPersonalDataManager _personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
  final ICertificateManager _certificateManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CERTIFICATE);
  final IRankManager _rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
  final IMessageManager _messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
  final IRoomManager _roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
  final IProfileManager _profileManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);

  final ScrollController _scrollController = ScrollController();

  bool _servicePause = false; // 暂停接单
  int _serviceRecover = 0; // 自动恢复时间

  int _godLicenseVersion = 0; // 主播协议版本
  int _agreedGodLicenseVersion = 0; // 已同意的主播协议版本
  Map _kaInfo = {}; // 我的页面KA建联数据
  bool _mobileCertified = false;
  bool _cardCertified = false;

  bool _isSuper = false; //是否超管，显示超管入口
  List<TabItem> _superTabs = []; //超管tab
  List<ServiceItem> _services = []; //在线客服
  String _brokerUrl = '';
  bool _showProfileComplete = false; // 显示完善资料按钮
  bool _showNLFriendRecommend = false; // 新贵NL转化 优质好友推荐
  bool _showNewUserRanking = false; // 新人榜

  late bool _showVipLevel; // 是否显示vip等级

  static const double STICKER_HEIGHT = 90 + 52.0;
  static const double HEADER_HEIGHT = 280 + 52.0 - 20;
  static const double PADDING_BOTTOM = 76 + 52.0 - 52;

  /// 点击进入二级页，返回【我的】需要刷新的数据
  ReloadType _reloadType = ReloadType.All;

  /// 是否需要绑定手机号
  bool _shouldBindPhone = false;

  @override
  bool get wantKeepAlive => true;

  /// 头像框
  String? frame;

  /// 粉丝牌名
  int? liveOnly;
  String? liveLabel;

  bool _roomDataSearch = false;

  final GlobalKey<ProfileBannerWidgetState> _bannerKey = GlobalKey();

  ProfileConfigModel? _config;

  /// 快乐星球单独接口判断是否展示搭讪配置入口
  bool showSlpGsSayHi = false;

  /// 快乐星球主播中心是否展示
  bool anchorShow = false;

  /// 主播任务平台是否展示
  bool anchorTaskShow = false;

  /// 邀请有礼是否走新的页面（之前是h5，现在是flutter）
  bool gotoNewInvite = false;

  /// 礼物图鉴入口
  GiftBookBriefInfo? briefInfo;

  /// 启动音入口
  bool _showTone = false;

  /// 缓存的用户靓号id
  int _cachedPrettyId = -1;

  final ValueNotifier<double> _opacity = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _refreshBalance);
    eventCenter.addListener(EventConstant.EventRefreshLevelInfo, _refreshLevelInfo);

    ProfilePayload.profileTabShowVisitor = widget.showVisitor;

    _godLicenseVersion = Util.parseInt(Session.getValue('godlicense.version'));
    _agreedGodLicenseVersion = Util.parseInt(Session.getValue('agreement_version'));
    _showVipLevel = Util.parseInt(Session.getValue('level_type')) == 0;
    if (Session.isLogined) {
      _cardCertified = Session.idAuthenticated;
      _mobileCertified = Util.parseInt(Session.getValue('_mobile')) > 0;
      _servicePause = Session.servicePause;
      _serviceRecover = Session.serviceRecover;
    }
    _scrollController.addListener(_onScroll);
    _reloadType = ReloadType.All;
    reload();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _refreshBalance);
    eventCenter.removeListener(EventConstant.EventRefreshLevelInfo, _refreshLevelInfo);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onLogin(String type, dynamic value) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    scrollToTop();
    _reloadType = ReloadType.All;
    reload();
  }

  void _onLogout(String type, dynamic value) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    scrollToTop();
    Provider.of<ProfilePayload>(context, listen: false).reset();
    setState(() {
      _isSuper = false;
    });
  }

  Future<void> _refreshLevelInfo(String event, dynamic data) async {
    await Session.sync();
    _showVipLevel = Util.parseInt(Session.getValue('level_type')) == 0;
    refresh();
  }

  void _refreshBalance(String event, dynamic data) {
    String name = data is Map ? data['name'] : null;
    if (name == 'onBalanceChanged' && mounted) {
      reload();
    }
  }

  reload({home = false}) async {
    _cachedPrettyId = -1;
    if (widget.showBanner && _bannerKey.currentState != null) {
      _bannerKey.currentState?.reload();
    }
    if (home == true) {
      // 在首页切换TAB，刷新所有
      _reloadType = ReloadType.All;
    }
    if (!Session.isLogined) {
      _reloadType = ReloadType.All;
      return;
    }

    Map<String, bool>? options;
    if (_reloadType == ReloadType.None) {
      // 从其他页面返回，无需刷新
      _reloadType = ReloadType.All;
      return;
    }

    if (_reloadType == ReloadType.AppReview) {
      // 刷新好评
      options = <String, bool>{};
      options = {
        'app_review': true,
      };
    } else if (_reloadType == ReloadType.FirstBanner) {
      // 刷新活动
      Provider.of<ProfilePayload>(context, listen: false).loadFirstBanner();
    } else if (_reloadType == ReloadType.RelationNum) {
      // 刷新数量关系
      Provider.of<ProfilePayload>(context, listen: false).loadRelationNum();
    } else if (_reloadType == ReloadType.Bag) {
      Provider.of<ProfilePayload>(context, listen: false).loadBagRedPoint();
    } else if (_reloadType == ReloadType.OderService) {
      // 刷新邀约
      options = <String, bool>{};
      options = {
        'orderservice': true,
        'money': true,
        'point': true,
      };
    } else if (_reloadType == ReloadType.GodLicenseVersion) {
      // 刷新申请主播
      _certificateManager.getGodLicenseVersion().then((data) {
        _godLicenseVersion = Util.parseInt(Session.getValue('godlicense.version'));
        if (mounted) setState(() {});
      });
      options = <String, bool>{};
      options = {
        'orderservice': true,
        'point': true,
        'mobile': true,
      };
    } else if (_reloadType == ReloadType.Money) {
      // 刷新Money
      options = <String, bool>{};
      options = {
        'money': true,
      };
    } else if (_reloadType == ReloadType.Sign) {
      // 刷新任务中心
      options = <String, bool>{};
      options = {
        'get_sign': true,
      };
    } else if (_reloadType == ReloadType.TaskCenter) {
      options = <String, bool>{};
      options = {'task_center': true, 'get_sign': true};
    } else if (_reloadType == ReloadType.AccountCenter) {
      options = <String, bool>{};
      options = {
        'account_center': true,
        'benefit_vip_read': true,
        'benefit_popular_read': true,
      };
    } else if (_reloadType == ReloadType.FunctionCenter) {
      options = <String, bool>{};
      options = {
        'function_center': true,
      };
    } else if (_reloadType == ReloadType.ProfileIntegrity) {
      options = <String, bool>{};
      options = {'profile_integrity': true};
    } else if (_reloadType == ReloadType.BindPhone) {
      options = <String, bool>{};
      options = {'safemobile': true};
    } else {
      bool showTaskCenter = true;

      // 刷新所有
      Provider.of<ProfilePayload>(context, listen: false).reload();
      options = <String, bool>{};
      options = {
        'money': true,
        'orderservice': true,
        'mobile': true,
        'point': true,
        'setting': true,
        'al' 'icard': true,
        'ban' 'kcard': true,
        'banner': true,
        'get_sign': true,
        'auth': true,
        'app_review': true,
        'broker': true,
        'task_center': showTaskCenter,
        'account_center': true,
        'function_center': true,
        'benefit_vip_read': true,
        'benefit_popular_read': true,
        'profile_integrity': true,
        'safemobile': true,
      };
    }
    await _loadConfig();
    await _loadFrame();

    // 同步账户信息
    XhrResponse? response;
    if (options != null) {
      response = await Session.sync(options);
    }

    if (response != null && response.error == null) {
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        if (mounted) {
          Provider.of<ProfilePayload>(context, listen: false).loadPopularityRedPoint();
          Provider.of<ProfilePayload>(context, listen: false).loadVipRedPoint();
          Provider.of<ProfilePayload>(context, listen: false).loadAcitvityLevelRedPoint();
          Provider.of<ProfilePayload>(context, listen: false).functionCenterHasRedDot();
          Provider.of<ProfilePayload>(context, listen: false).taskCenterShowRedDot();
        }
        Map data = res['data'];

        if (data['ka_info'] != null) {
          _kaInfo = data['ka_info'] ?? {};
        } else {
          _kaInfo = {};
        }

        if (data['agreement_version'] != null) {
          _agreedGodLicenseVersion = Util.parseInt(data['agreement_version']);
        }

        if (data['_idcard'] != null) {
          _cardCertified = Util.parseInt(res['data']['_is_auth']) == 1;
        }

        if (data['_mobile'] != null) {
          _mobileCertified = Util.parseInt(data['_mobile']) > 0;
        }

        if (_reloadType == ReloadType.BindPhone || _reloadType == ReloadType.All) {
          _shouldBindPhone = Util.isNullOrEmpty(data['_safemobile']);
        }

        if (data['_is_sign'] != null) {
          Session.showSignInRedPoint = Util.parseInt(data['_is_sign'], -1) == 0;
        }

        ///超管
        if (data['super'] != null && data['super'] is Map && data['super']['display'] == true) {
          _isSuper = true;
          Map<String, dynamic> joy = Map<String, dynamic>.from(data['super']['tab']);
          _superTabs = [];
          List<String> keys = joy.keys.toList();
          for (var key in keys) {
            TabItem tab = TabItem(key, joy[key]);
            _superTabs.add(tab);
          }
          TabItem reportTab = TabItem('report', K.profile_report);
          _superTabs.add(reportTab);
          TabItem encounterTab = TabItem('encounter', K.profile_8m_encounter);
          _superTabs.add(encounterTab);
        } else {
          _isSuper = false;
          _superTabs = [];
        }

        dynamic list = data['service'];
        if (list != null && list is List && list.isNotEmpty) {
          _services = [];
          for (var item in list) {
            ServiceItem service = ServiceItem.fromJson(item);
            _services.add(service);
          }
        }

        if (data['broker_url'] != null) {
          _brokerUrl = data['broker_url'];
        }
        _showNewUserRanking = Util.parseBool(data['rank_new']);
        _showVipLevel = Util.parseInt(data['level_type']) == 0;
      }
    }
    _servicePause = Session.servicePause;
    _serviceRecover = Session.serviceRecover;

    //是否展示已转化及NL新贵转化好友推荐
    ResTransferShow showUserTransferResponse = await Api.getTransferShow();

    Session.setValue('show_user_transfer', '0');
    Session.setValue('show_nl_friend_recommend', '0');

    if (showUserTransferResponse.success) {
      TransferShowData data = showUserTransferResponse.data;
      Session.setValue('show_user_transfer', data.showTransfer ? '1' : '0');

      Session.setValue('show_nl_friend_recommend', data.showNlFriendRecommend ? '1' : '0');
      _showNLFriendRecommend = data.showNlFriendRecommend;

      _roomDataSearch = Util.parseBool(data.showRoomData);
    }

    _reloadType = ReloadType.All;
    if (mounted) {
      setState(() {});
    }
  }

  Future _loadFrame() async {
    ResAccountFrame res = await Api.getAccountFrame([Session.uid]);
    if (res.success) {
      frame = res.data['${Session.uid}'];
      if (!Util.isCollectionEmpty(res.headers)) {
        for (var e in res.headers) {
          if (e.uid == Session.uid) {
            liveOnly = e.liveOnly;
            liveLabel = e.liveLabel;
          }
        }
      }
    } else {
      Log.d('_loadFrame error: ${res.msg}');
    }
  }

  _loadConfig() async {
    final config = await Api.getBbConfig();
    if (config != null) {
      showSlpGsSayHi = config.gsSayhi > 0;
      anchorShow = config.anchorShow == 1;
      gotoNewInvite = config.isNewInvite == 1;
      anchorTaskShow = config.anchorMatchShow > 0;
      briefInfo = config.briefInfo;
      _showTone = config.isTone;
    }

    if (mounted) setState(() {});
    if ((_config?.gsSayhi ?? 0) > 0) {
      context.read<ProfilePayload>().setAutoAccostRedPoint(_config?.gsWarning ?? false);
    }
  }

  /// 所有条件都满足的主播
  bool _godCertified() {
    return _agreedGodLicenseVersion > 0 && _agreedGodLicenseVersion >= _godLicenseVersion && _cardCertified && _mobileCertified;
  }

  bool _checkBind() {
    var isGod = Session.role == UserRole.DISABLED || Session.role == UserRole.GOD;
    if (!isGod) return true;
    if (Session.getInt('_mobile', 0) > 0 && Session.idAuthenticated) return true;
    return false;
  }

  /// 开启邀约
  _onServiceChanged(bool value) async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'home_profile_service_change_$value',
    });
    if (value == true && Session.serviceForbidden > 0) {
      Toast.show(System.context, BaseK.K.blocked_by_the_administrator + Utility.formatDate(Session.serviceForbidden));
      return;
    }

    if (value == true && !_checkBind()) {
      _reloadType = ReloadType.GodLicenseVersion;
      bool? r = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: BaseK.K.notice,
              content: BaseK.K.invite_condition,
            );
          });
      if (r == true) {
        _reloadType = ReloadType.GodLicenseVersion;
        _settingManager.openIdAuth(context);
      }
    } else {
      try {
        XhrResponse response = await Xhr.postJson(
            "${System.domain}account/certSettingSimple",
            {
              'service_pause': value ? '0' : '1',
            },
            throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          setState(() {
            _servicePause = !value;
          });

          Session.sync({
            'money': true,
            'orderservice': true,
            'mobile': true,
            'point': true,
            'al' 'icard': true,
            'ban' 'kcard': true,
          });
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    }
  }

  /// 自动恢复
  _onSetAutoTime() async {
    if (Session.serviceForbidden > 0) {
      Toast.showCenter(System.context, BaseK.K.blocked_by_the_administrator + Utility.formatDate(Session.serviceForbidden));
      return;
    }

    if (!_checkBind()) {
      _reloadType = ReloadType.GodLicenseVersion;
      bool? r = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: BaseK.K.notice,
              content: BaseK.K.invite_condition,
            );
          });
      if (r == true) {
        _reloadType = ReloadType.GodLicenseVersion;
        _settingManager.openIdAuth(context);
      }
    } else {
      List<SheetItem> sheetItems = [
        SheetItem(BaseK.K.not_automatically_recover, '${0}'),
        SheetItem(BaseK.K.one_hour, '${3600}'),
        SheetItem(BaseK.K.two_hours, '${3600 * 2}'),
        SheetItem(BaseK.K.six_hours, '${3600 * 6}'),
        SheetItem(BaseK.K.twn_hours, '${3600 * 12}'),
        SheetItem(BaseK.K.one_day, '${86400}'),
        SheetItem(BaseK.K.three_days, '${86400 * 3}'),
        SheetItem(BaseK.K.seven_days, '${86400 * 7}'),
      ];
      _reloadType = ReloadType.None;
      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return RadioBottomSheet(
              title: K.profile_choose_time_to_recover,
              data: sheetItems,
            );
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int recover = Util.parseInt(result.value?.key) != 0 ? ((Util.parseInt(result.value?.key) + now) / 900).ceil() * 900 : 0;

      try {
        XhrResponse response = await Xhr.postJson("${System.domain}account/certSettingSimple",
            {'service_pause': _servicePause ? '1' : '0', 'service_recover': recover.toString()},
            throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          setState(() {
            _serviceRecover = recover;
          });
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    }
  }

  String _getAutoTime() {
    if (_serviceRecover == 0) {
      return BaseK.K.not_automatically_recover;
    } else {
      return Utility.formatDate(_serviceRecover);
    }
  }

  scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;

    double r = _scrollController.offset / 150;
    if (r < 0) {
      r = 0;
    }
    if (r > 1) {
      r = 1;
    }
    _opacity.value = r;
  }

  Widget _renderTopWidget() {
    return PositionedDirectional(
      child: Container(
        width: Util.width,
        height: Util.statusHeight + kToolbarHeight,
        padding: EdgeInsetsDirectional.only(top: Util.statusHeight),
        color: R.colors.appBarColor.withOpacity(_opacity.value),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 126),
              child: Text(
                Session.isLogined ? Session.name : K.profile_not_login,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.colors.mainTextColor.withOpacity(_opacity.value), fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            PositionedDirectional(
              end: 16,
              child: Container(
                height: 36,
                alignment: AlignmentDirectional.center,
                // bgColor: R.colors.homeSearchBgColor,
                // cornerRadius: 18,
                // foregroundDecoration: BoxDecoration(
                //   color: Colors.transparent,
                //   border: Border.all(color: R.colors.dividerColor, width: 0.5),
                //   borderRadius: const BorderRadius.all(Radius.circular(18)),
                // ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // if (_shouldBindPhone)
                    //   GestureDetector(
                    //     behavior: HitTestBehavior.opaque,
                    //     onTap: () async {
                    //       ILoginManager loginManager =
                    //           ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
                    //       bool? success = await loginManager.bindPhone(context, isSafeBind: true);
                    //       if (success == true) {
                    //         _reloadType = ReloadType.BindPhone;
                    //       }
                    //     },
                    //     child: Container(
                    //       margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                    //       child: Stack(
                    //         alignment: AlignmentDirectional.topEnd,
                    //         children: [
                    //           Rext.autoStyleImg(Assets.profile$ic_home_bind_phone_webp, width: 28, height: 28),
                    //           const RedDot(width: 10, height: 10, showBorder: false),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Tracker.instance.track(TrackEvent.mine_page, properties: {
                          'mine_page_click': 'account_set',
                        });
                        if (!Session.isLogined) {
                          _loginManager.show(context);
                          return;
                        }
                        _reloadType = ReloadType.All;
                        _settingManager.openSettingScreen(context);
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                        child: R.img(Assets.profile$ic_home_settings_png, width: 28, height: 28),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.isTopPage)
              PositionedDirectional(
                start: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: kToolbarHeight,
                    height: kToolbarHeight,
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16),
                      child: R.img(
                        'ic_titlebar_back.svg',
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 24,
                        height: 24,
                        color: R.colors.mainTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            PositionedDirectional(
              start: 0.0,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                // child: text18('我的', textColor: Colors.white),
                child: R.img(Assets.mine_icon_top_left, width: 144 / 3, height: 102 / 3, package: Assets.package),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            _buildBody(),
            ValueListenableBuilder<double>(
                valueListenable: _opacity,
                builder: (context, value, child) {
                  return _renderTopWidget();
                })
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    IPersonalDataManager personalManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: Util.statusHeight + kToolbarHeight),
              _buildUserInfo(),
              _buildRelation(),
              _buildKaInfo(), //Ka与个性标签业务上互斥
              _buildPersonalityLbs(),
            ],
          ),
        ),
        if (widget.showBanner)
          SliverToBoxAdapter(
            child: ProfileBannerWidget(key: _bannerKey),
          ),
        SliverToBoxAdapter(
          child: AccountCenter(
            isShowVipLevel: _showVipLevel,
            bean: AccountCenter.getBean(),
            changed: (ReloadType type) => _reloadType = type,
          ),
        ),
        SliverToBoxAdapter(
          child: FunctionCenter(
            bean: FunctionCenterUtil.getFunctionCenterBean(),
            changed: (ReloadType type) {
              _reloadType = type;
            },
          ),
        ),
        // if (briefInfo != null)
        //   SliverToBoxAdapter(
        //       child: personalManager.getGiftWallPanelWidget(Session.uid, briefInfo?.lightNum ?? 0,
        //           briefInfo?.total ?? 0, briefInfo?.rank ?? 0, briefInfo?.icon ?? "", briefInfo?.levelList ?? [],
        //           refer: 'home_profile')),
        SliverToBoxAdapter(
          child: _buildServiceCenter(),
        ),
      ],
    );
  }

  List<Color> useInfoColors = [const Color(0xFF27252D), const Color(0xFF27252D)];

  // List<Color> useInfoColors=[Colors.red, Colors.red];

  /// 个人信息
  Widget _buildUserInfo() {
    _showProfileComplete = Util.parseBool(Session.getInt('profile_integrity'));
    int prettyIdInUse = _cachedPrettyId >= 0 ? _cachedPrettyId : Session.getInt('pretty_uid', 0);
    bool hasPrettyId = Util.parseBool(Session.getValue('has_pretty_id'), false);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
          padding: const EdgeInsets.only(left: 84),
          decoration: commonBoxDecorationWithParamsAndBorderRadiusBeginAndEnd(
            useInfoColors,
            const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            Alignment.topCenter,
            Alignment.bottomCenter,
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _openProfilePage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text(
                            Session.isLogined ? Session.name : K.profile_not_login,
                            style: TextStyle(
                              fontSize: 18,
                              color: R.colors.mainTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (Session.isLogined) const SizedBox(width: 12),
                        // 我的页面靓号ID展示
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (prettyIdInUse <= 0) ...[
                              IDWidget(
                                imagePath: null,
                                uid: Session.uid != 0 ? Session.uid : null,
                                fontSize: 13,
                                fontColor: R.colors.secondTextColor,
                                fontWeight: FontWeight.w500,
                                dark: darkMode,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 8),
                                child: Text(
                                  K.profile_copy,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: R.colors.thirdTextColor,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                            if (prettyIdInUse > 0)
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: _openPrettyIdPage,
                                child: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 3.5, top: 8, bottom: 8),
                                    child: PrettyIdWidget(prettyId: '$prettyIdInUse', height: 17)),
                              ),
                            if (hasPrettyId)
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: _openPrettyIdPage,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 8, end: 14, top: 8, bottom: 8),
                                    child: R.img(Assets.profile$ic_pretty_id_add_webp, width: 17, height: 17),
                                  ))
                          ],
                        ).onTap(() {
                          if (Session.isLogined) {
                            Clipboard.setData(ClipboardData(text: '${Session.uid}'));
                            Toast.show(context, K.profile_id_copied);
                          }
                        })
                      ],
                    ).toCenter(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text14('个人主页', textColor: Colors.white.withOpacity(0.5)),
                    R.img(Assets.profile$right_arrow_png, width: 24, height: 24),
                  ],
                ).paddingOnly(right: 20).toVisible(show: Session.isLogined).onTap(() {
                  _openProfilePage();
                }),
              ],
            ).paddingOnly(top: 16, bottom: 12),
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            CommonAvatarWithFrame(
              childWidget: CommonAvatar(
                path: Session.icon,
                size: 70,
                shape: BoxShape.circle,
              ),
              framePath: Util.getFullFramePath(frame),
              overflow: -5.0,
              headerFrameSize: 70 + 5.0 * 2,
              liveOnly: liveOnly,
              liveLabel: liveLabel,
            ),
            if (_showProfileComplete)
              PositionedDirectional(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 6, end: 6, top: 2, bottom: 2),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                      colors: R.colors.mainBrandGradientColors,
                    ),
                  ),
                  //完善资料
                  child: text12(K.profile_complete_info,
                      textStyle: TextStyle(color: R.colors.brightTextColor, fontSize: 11, fontWeight: FontWeight.w600)),
                ),
              ),
          ],
        ).onTap(() {
          if (_showProfileComplete) {
            _reloadType = ReloadType.ProfileIntegrity;
            _personalDataManager.openImageModifyScreen(context);
          } else {
            _openProfilePage();
          }
        }).paddingOnly(right: 10, left: 20, top: 10),
      ],
    );
  }

  void _openPrettyIdPage() async {
    _reloadType = ReloadType.UserInfo;
    List<int>? res = await PrettyIdSelectPage.show(context);
    if (res?.length == 2) {
      int type = res![0];
      if (type == 0) {
        _cachedPrettyId = res[1];
      } else if (type == 1) {
        _cachedPrettyId = 0;
      }
      refresh();
    }
  }

  void _openProfilePage() {
    Tracker.instance.track(TrackEvent.mine_page, properties: {'mine_page_click': 'profile'});
    if (Session.isLogined) {
      _reloadType = ReloadType.None;
      _personalDataManager.openImageScreen(context, Session.uid, refer: const PageRefer('ProfilePage'));
    } else {
      _loginManager.show(context);
    }
  }

  /// 关系数量
  Widget _buildRelation() {
    return Consumer<ProfilePayload>(
      builder: (context, bean, _) {
        return Container(
          margin: const EdgeInsets.only(top: 0, left: 12, right: 12),
          decoration: commonBoxDecorationWithParamsAndBorderRadiusBeginAndEnd(
            useInfoColors,
            const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            Alignment.topCenter,
            Alignment.bottomCenter,
          ),
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildFriendItem(bean),
              _buildFollowItem(bean),
              _buildFansItem(bean),
              if (widget.showVisitor) _buildVisitorsItem(bean) else _buildGroupItem(bean),
            ],
          ),
        );
      },
    );
  }

  /// 好友
  Widget _buildFriendItem(ProfilePayload bean) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'friends',
          });
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          _reloadType = ReloadType.RelationNum;
          _messageManager.openContactPage(context, initialPage: ContactTab.friend);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NumText(
              '${bean.friends}',
              style: TextStyle(
                fontSize: 18,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                BaseK.K.base_friend,
                style: TextStyle(color: R.colors.thirdTextColor, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 关注
  Widget _buildFollowItem(ProfilePayload bean) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'follows',
          });
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          _reloadType = ReloadType.RelationNum;
          _messageManager.openContactPage(context, initialPage: ContactTab.follow);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NumText(
              '${bean.follows}',
              style: TextStyle(
                fontSize: 18,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                BaseK.K.base_follow,
                style: TextStyle(
                  color: R.colors.thirdTextColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 粉丝
  Widget _buildFansItem(ProfilePayload bean) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'fans',
          });
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          bean.resetFansIncre();
          _reloadType = ReloadType.RelationNum;
          _messageManager.openContactPage(context, initialPage: ContactTab.fans);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                NumText(
                  '${bean.fans}',
                  style: TextStyle(
                    fontSize: 18,
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (bean.fansIncre > 0)
                  PositionedDirectional(
                    end: _getEndPixel(bean.fansIncre),
                    top: -10,
                    child: RedDot(
                      num: bean.fansIncre,
                      width: 30,
                      height: 20,
                      borderRadius: BorderRadius.circular(9),
                      showBorder: false,
                      showPlus: true,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                BaseK.K.base_fans,
                style: TextStyle(
                  color: R.colors.thirdTextColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 访客
  Widget _buildVisitorsItem(ProfilePayload bean) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'visitors',
          });
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          _reloadType = ReloadType.RelationNum;
          _messageManager.openVisitorPage(context, bean.visitorTime);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                NumText(
                  '${bean.visitorTotal ?? 0}',
                  style: TextStyle(
                    fontSize: 18,
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (bean.visitorNew > 0)
                  PositionedDirectional(
                    end: _getEndPixel(bean.visitorNew),
                    top: -10,
                    child: RedDot(
                      num: bean.visitorNew,
                      borderRadius: BorderRadius.circular(9),
                      width: 30,
                      height: 20,
                      showBorder: false,
                      showPlus: true,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                K.profile_visitor,
                style: TextStyle(
                  color: R.colors.thirdTextColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 【我的】页面常驻气泡提示显示条件：在KA名单中，但未在建联名单的用户
  /// 入口消失条件：用户已经进入到“已建联名单”，入口消失  或  15天后消失
  Widget _buildKaInfo() {
    if (_kaInfo.isEmpty) return const SizedBox.shrink();
    int type = Util.parseInt(_kaInfo['type']);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 16.0),
      child: GestureDetector(
        onTap: () {
          Map extra = {'ref': 'profile_page'};
          extra.addAll(_kaInfo);
          if (type == 1 || type == 2) {
            KAUserDialog.show(context, extra);
            return;
          }
          _roomManager.openAddSVipStewardDialog(context, extra, alwaysShow: true);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: R.colors.mainBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              R.img(
                Assets.profile$ic_svip_ka_png,
                width: 32,
                height: 32,
                package: ComponentManager.MANAGER_PROFILE,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  type == 1 ? K.profile_yz_noti : (type == 2 ? K.profile_vip_noti : K.profile_svip_noti),
                  style: TextStyle(color: R.colors.mainTextColor, fontSize: 12),
                ),
              ),
              Container(
                width: 50,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
                ),
                child: Text(
                  K.profile_sign_get,
                  style: TextStyle(color: R.colors.brightTextColor, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  /// 个性标签
  Widget _buildPersonalityLbs() {
    if (!Session.showGsTagsEntrance) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 16.0),
      child: GestureDetector(
        onTap: () {
          PersonalityLbsDialog.show(context);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: R.colors.mainBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              R.img(
                Assets.profile$ic_svip_noti_webp,
                width: 32,
                height: 32,
                package: ComponentManager.MANAGER_PROFILE,
              ),
              const SizedBox(width: 4),
              Expanded(child: Text(K.profile_tips_personality_lbs, style: TextStyle(color: R.colors.mainTextColor, fontSize: 12))),
              Container(
                width: 50,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: R.colors.mainBrandGradientColors,
                  ),
                ),
                child: Text(
                  K.profile_sign_go,
                  style: TextStyle(color: R.colors.brightTextColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  /// 陪伴榜
  Widget _buildGroupItem(ProfilePayload bean) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          _reloadType = ReloadType.RelationNum;
          IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
          rankManager.showCompanionRankPage(context, Session.uid, 'personal center');
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NumText(
              '${bean.accompany}',
              style: TextStyle(
                fontSize: 18,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                K.profile_companion_ranking,
                style: TextStyle(
                  color: R.colors.thirdTextColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getEndPixel(int num) {
    if (num < 10) {
      return -25;
    } else if (num < 100) {
      return -28;
    } else {
      return -31;
    }
  }

  Widget _buildServiceCenter() {
    bool isGod = Session.role == UserRole.DISABLED || Session.role == UserRole.GOD;
    bool godCertified = _godCertified();
    if (Util.isAndroidVerify) isGod = false;

    List<Widget> items = [];

    if (Util.isAndroidVerify == false && widget.supportGod && Session.showSkill) {
      if (!godCertified) {
        //do nothing
      } else {
        if (isGod) {
          // 开启邀约
          items.add(_renderSwitch(
            K.profile_start_invite,
            'ic_open_invite.svg',
            !_servicePause,
            _onServiceChanged,
          ));
          // 自动恢复
          if (_servicePause) {
            items.add(_renderItem(
              K.profile_auto_recover,
              'ic_restore.svg',
              _onSetAutoTime,
              notice: Text(
                _getAutoTime(),
                style: TextStyle(
                  fontSize: 14,
                  color: R.colors.thirdTextColor,
                ),
              ),
            ));
          }
        }
      }
    }

    /// 信誉
    if (Constant.creditExitRoom) {
      items.add(_renderItem(K.profile_credit, 'ic_profile_credit.svg', () async {
        _reloadType = ReloadType.None;
        _personalDataManager.openCreditRecordScreen(context);
      }));
    }

    if (anchorShow) {
      /// 主播中心
      items.add(_renderItem(K.profile_anchor_center, 'ic_profile_anchor_center.svg', () async {
        BaseWebviewScreen.show(context, url: '${System.getWebDomain("page")}/tools/back-stage/gs/home?uid=${Session.uid}');
      }));

      /// 新用户转化
      // items.add(_renderItem(K.profile_new_user_pay_gs, 'ic_profile_new_user_pay.svg', () async {
      //   NewUserPayCollectGsPage.show(context);
      // }));
    }

    /// 主播任务平台
    if (anchorTaskShow == true) {
      items.add(_renderItem(K.profile_anchor_task_title, 'ic_profile_anchor_task.svg', () async {
        AnchorTaskScreen.show(context);
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'gsPlatformEntrance',
        });
      }));
    }

    /// 认证中心
    items.add(_renderItem(K.profile_authenticate_center, 'ic_profile_auth_center.svg', () async {
      _reloadType = ReloadType.GodLicenseVersion;
      AuthenticateCenter.show(context, widget.supportGod,
          supportRed: widget.supportRed,
          supportQualification: widget.supportQualification,
          needRecommendBroker: widget.needRecommendBroker);
    }));

    /// 启动音
    if (_showTone) {
      items.add(_renderItem(K.launch_audio, 'ic_launch_audio.png', () async {
        Tracker.instance.track(TrackEvent.open_tone_enter, properties: {'uid': Session.uid});
        LaunchAudioGroupPage.show(context);
      }));
    }

    /// 公会入驻
    // if (AppConfig.showTradeUnion) {
    //   items.add(_renderItem(
    //       K.profile_trade_union_settled,
    //       'ic_profile_trade_union_settled.webp',
    //       () => BaseWebviewScreen.show(context,
    //           url: '${System.getWebDomain("page")}/tools/back-stage/gs/guildSettled?uid=${Session.uid}')));
    // }

    /// 兑换
    if (BaseConfig.instance.showCdKeyEntry && !Util.isVerify) {
      items.add(_renderItem(K.profile_exchange_code, 'ic_profile_key.svg', () => CdKeyScreen.show(context)));
    }

    // 专属福利
    if (!Util.isStringEmpty(_config?.benefitUrl)) {
      items.add(_renderItem(K.profile_exclusive_benefit, 'ic_profile_exclusive_benefit.svg',
          () => BaseWebviewScreen.show(context, url: _config!.benefitUrl)));
    }

    // 自动搭讪
    if ((showSlpGsSayHi)) {
      items.add(_renderItem(K.profile_auto_accost, 'ic_profile_accost.svg', () => _messageManager.openAccostConfigPage(context),
          redPoint: Provider.of<ProfilePayload>(context).showAutoAccostRedPoint));
    }

    // 主播工具中心
    if (_config?.gsShowTool ?? false) {
      items.add(_renderItem(K.profile_gs_tool_center, 'ic_profile_accost.svg', () => GsToolsPage.show(context),
          redPoint: Provider.of<ProfilePayload>(context).showAutoAccostRedPoint));
    }

    // 公会/主播工作台
    if (_brokerUrl.isNotEmpty) {
      items.add(
          _renderItem(K.profile_admin_dashboard, 'ic_profile_admin_dashboard.svg', () => BaseWebviewScreen.show(context, url: _brokerUrl)));
    }

    // 新人榜
    if (_showNewUserRanking) {
      items.add(_renderItem(
        K.profile_new_user_ranking,
        'ic_new_user_rank.svg',
        () {
          NewUserRankScreen.launch(context);
        },
      ));
    }

    // NL转化 好友推荐
    if (_showNLFriendRecommend) {
      items.add(_renderItem(
        K.profile_nl_friend_recommend,
        'nl_friend_recommend.webp',
        () {
          NLFriendRecommendScreen.show(context);
        },
      ));
    }

    // 在线客服
    items.add(_renderItem(
      BaseK.K.online_service,
      'ic_service.svg',
      () async {
        if (!Session.isLogined) {
          _loginManager.show(context);
          return;
        }
        List<SheetItem> res = [];
        if (!Util.isVerify) {
          if (_services.isEmpty) {
            if (Session.vipNew >= 10 && Util.isVerify == false) {
              res.add(SheetItem(BaseK.K.super_vip_service, '100000022'));
            } else {
              res.add(SheetItem(BaseK.K.advisory_service, '100000016'));
            }
          } else {
            for (var item in _services) {
              res.add(SheetItem(item.label, item.targetId.toString()));
            }
          }
        }
        res.add(SheetItem(BaseK.K.feedback, 'feedback')); // 意见反馈
        // res.add(SheetItem(BaseK.K.base_fixed_line_telephone, '')); // 客服热线
        _reloadType = ReloadType.None;
        SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) => RadioBottomSheet(data: res),
        );
        _reloadType = ReloadType.None;
        if (result != null && result.value != null && Util.validStr(result.value?.key)) {
          if (result.value?.key == 'feedback') {
            Tracker.instance.track(TrackEvent.click, properties: {
              'click_page': 'feedbackEntrance_profile',
            });
            BaseWebviewScreen.show(context, url: Constant.feedbackUrl);
            return;
          }
          IPremadeManager preMadeManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
          bool intercept = await preMadeManager.checkMatchAndIntercept();
          if (intercept) return;
          _chatManager.openUserChatScreen(
            context,
            type: 'private',
            targetId: Util.parseInt(result.value?.key),
            title: result.value?.label ?? '',
          );
        }
      },
    ));
    //帮助
    items.add(_renderItem(
      K.profile_help,
      'ic_help.svg',
      () {
        if (Session.isLogined) {
          _reloadType = ReloadType.None;
          _settingManager.openHelpScreen(context);
        } else {
          _loginManager.show(context);
        }
      },
    ));

    // 联系我们
    items.add(_renderItem(
      K.profile_contact_us,
      'ic_contact.svg',
      () {
        if (Session.isLogined) {
          _reloadType = ReloadType.None;
          _settingManager.openAboutScreen(context);
        } else {
          _loginManager.show(context);
        }
      },
    ));
    //TODO 关闭活动
    var isOpen = false;
    if (!Util.needHideAllTitle() && isOpen) {
      // 活动
      items.add(_renderItem(
        K.profile_activity,
        'ic_activity.svg',
        () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'activity',
          });
          Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'enter_activity'});
          _reloadType = ReloadType.FirstBanner;
          BannerScreen.show(context);
        },
        notice: Provider.of<ProfilePayload>(context).activityTitle != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200.0),
                  child: Text(
                    Provider.of<ProfilePayload>(context).activityTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: R.colors.thirdTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            : null,
        redPoint: Provider.of<ProfilePayload>(context).showActivityPoint(),
      ));
    }

    // 礼包码
    bool showGiftCode = Util.isVerify == false && Session.showGiftCode;
    if (showGiftCode) {
      items.add(_renderItem(
        K.profile_gift_code,
        'ic_gift_code.webp',
        () {
          if (Session.isLogined) {
            Tracker.instance.track(
              TrackEvent.click,
              properties: {'click_page': 'giftPackageCodeEntrance'},
            );
            GiftCodeDialog.show(context);
          } else {
            _loginManager.show(context);
          }
        },
      ));
    }

    // 邀请有礼
    if (!Platform.isIOS) {
      /// 该平台不展示
      if (_loginManager.getShowInviteCode() && _profileManager.showInviteCode) {
        items.add(_renderItem(
          K.profile_invite_for_gift,
          'ic_invite.svg',
          () {
            Tracker.instance.track(TrackEvent.mine_page, properties: {
              'mine_page_click': 'invite',
            });
            if (!Session.isLogined) {
              _loginManager.show(context);
              return;
            }
            _reloadType = ReloadType.None;
            if (gotoNewInvite) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const InviteForGiftPage();
              }));
            }
          },
        ));
      } else {
        // items.add(_renderItem(
        //   K.profile_invite_for_share,
        //   'ic_invite.svg',
        //   () {
        //     if (!Session.isLogined) {
        //       _loginManager.show(context);
        //       return;
        //     }
        //     _reloadType = ReloadType.None;
        //     _settingManager.share(context, Session.uid);
        //   },
        // ));
      }
    }

    // 去好评
    if (Util.isAndroid) {
      items.add(_renderItem(
        Util.isAndroid ? BaseK.K.app_review_android : BaseK.K.app_review,
        'ic_app_review.svg',
        () {
          Tracker.instance.track(TrackEvent.mine_page, properties: {
            'mine_page_click': 'rank',
          });
          if (!Session.isLogined) {
            _loginManager.show(context);
            return;
          }
          _reloadType = ReloadType.AppReview;
          AppReviewDialog.doAppReview();
        },
      ));
    }

    if (Util.isLocale) {
      // 语言设置
      items.add(_renderItem(
        K.profile_set_language,
        'ic_language.svg',
        () {
          _reloadType = ReloadType.None;
          _settingManager.openLanguageScreen(context);
        },
      ));
    }

    //超管入口
    if (_isSuper) {
      // 新老版本兼容
      items.add(_renderItem(
        K.super_tube,
        'ic_super_admin.svg',
        () {
          _reloadType = ReloadType.None;
          _rankManager.showRoomList(context, tabs: _superTabs, title: K.super_tube);
        },
      ));

      // 新超管列表
      items.add(_renderItem(
        K.super_tube,
        'ic_super_admin.svg',
        () {
          _reloadType = ReloadType.None;
          _rankManager.showSuperAdminPatrolPage(context);
        },
      ));
    }

    if (_roomDataSearch) {
      items.add(_renderItem(
        K.profile_room_data_check,
        'ic_room_data.svg',
        () {
          _reloadType = ReloadType.None;
          _roomManager.openRoomSearchRankScreen(context);
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'home_profile_RoomSearchRank',
          });
        },
      ));
    }

    return Rext.themeCardContainer(
      margin: const EdgeInsetsDirectional.only(top: 12, bottom: 40, start: 16, end: 16),
      cornerRadius: 16,
      child: Column(
        children: items,
      ),
    );
  }

  Widget _renderItem(
    String title,
    String icon,
    GestureTapCallback onTap, {
    Widget? notice,
    bool redPoint = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children: <Widget>[
            if (icon.trim().isNotEmpty) ...[
              R.img(
                icon,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                color: R.colors.mainTextColor,
                package: ComponentManager.MANAGER_PROFILE,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 15),
              ),
            ),
            if (notice != null) notice,
            if (redPoint) _renderRedPoint(),
            _renderNextIcon(),
          ],
        ),
      ),
    );
  }

  Widget _renderSwitch(
    String title,
    String icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Container(
      height: 56,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          if (icon.trim().isNotEmpty) ...[
            R.img(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              color: R.colors.mainTextColor,
              package: ComponentManager.MANAGER_PROFILE,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 15,
              ),
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeColor: Theme.of(context).primaryColor,
            trackColor: R.colors.dividerColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _renderNextIcon({bool isTop = false}) {
    return R.img(
      'ic_next.svg',
      color: R.colors.thirdTextColor,
      width: 16,
      height: 16,
      package: ComponentManager.MANAGER_PROFILE,
    );
  }

  Widget _renderRedPoint({double size = 10, Border? border}) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: R.color.thirdBrightColor, border: border),
    );
  }
}
