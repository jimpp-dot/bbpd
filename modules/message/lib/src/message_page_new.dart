import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:message/k.dart';
import 'package:message/message.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/message_search_page.dart';
import 'package:message/src/model/message_beans.dart';
import 'package:message/src/model/pb/generated/slp_cloud_smart.pb.dart';
import 'package:message/src/small_account/small_account_msg_tip_widget.dart';
import 'package:message/src/small_account/small_account_msg_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/shared.dart';

import '../assets.dart';
import 'message_list_page_new.dart';
import 'model/pb/generated/slp_cloudbanner.pb.dart';

/// 新消息页
class NewMessagePage extends StatefulWidget {
  final bool needDrawer; // 是否展示侧边栏入口
  final Color? cardBg; // 卡片背景色，有卡片背景色不需要投影
  final Color? dividerColor; // 分隔线颜色
  final bool showOneKeyFollow;
  final bool showAccompanyRank; //是否显示陪伴榜
  final bool supportDark;

  const NewMessagePage(
      {this.needDrawer = false,
      this.supportDark = true,
      this.cardBg,
      this.dividerColor,
      this.showOneKeyFollow = true,
      this.showAccompanyRank = false,
      Key? key})
      : super(key: key);

  @override
  NewMessagePageState createState() => NewMessagePageState();
}

class NewMessagePageState extends State<NewMessagePage>
    with AutomaticKeepAliveClientMixin<NewMessagePage>, SingleTickerProviderStateMixin, TabStateMixin {
  bool _shouldRecheck = false; // 是否应该再次检查通知消息权限
  bool _notificationEnabled = true;
  bool _locationEnable = true;
  bool _showFate = false;
  NearbyUserList? _nearbyUserList;
  CloudBannerData? _cloudBannerData;

  final GlobalKey<NewMessagePageScreenState> _keyMessage = GlobalKey();
  final GlobalKey _addKey = GlobalKey();
  final GlobalKey<SmallAccountMsgTipState> _smallAccountTipKey = GlobalKey();

  /// 私聊保护
  bool hasClosePrivateChatProtect = false;

  static String hasShowFateInMsg = 'has_show_fate_in_msg';

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  initState() {
    super.initState();
    appStateObserver.addListener(_onAppStateChanged);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventLocationUpdated, _onLocationUpdate);
    _loadMessagePageTopBannerData();
    _loadHeaderInfo();
    // _showFateDialog();
    _checkPermission();
    if (widget.showOneKeyFollow) {
      _showOneKeyFollow();
    }
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      _loadAutoCallTip();
    });
  }

  Future _loadAutoCallTip() async {
    ResImCloudTips resp = await MessageRepo.getCloudSmartTips();
    if (!mounted) return;
    if (resp.success) {
      if (resp.data.smartGreet.showPop) {
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.showAutoCallRemindDialog(context);
      }
      if (resp.data.showFate != _showFate) {
        _showFate = resp.data.showFate;
        refresh();
      }
    }
  }

  /// 今日缘分：7日内注册的男女用户，每日首次进入消息页5s后在消息一级页面主动弹出
  void _showFateDialog() async {
    if (!Util.is7DayNew) {
      return;
    }
    int today = DateTime.now().day;

    /// 7日内注册,用day即可
    bool hasShowToday = Config.getBool('$hasShowFateInMsg-$today', false);
    if (!hasShowToday) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        String lastPage = appNavigatorObserver.getLast();
        int appBootTabIndex = appNavigatorObserver.appBootTabIndex;
        if (appBootTabIndex == 2 && lastPage == '/') {
          /// 今日缘分
          Log.d('show FateDialog in msg page');
          IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
          manager.openFateDialog(context);
          Config.setBool('$hasShowFateInMsg-$today', true);
        }
      });
    }
  }

  _checkPermission() async {
    if (!PermissionUtil.hasRequestLocationPermission) {
      await PermissionUtil.checkAndRequestPermissions(context, Permission.locationWhenInUse);
    }

    if (!Util.hasLocation) {
      PermissionStatus status = await Permission.locationWhenInUse.status;
      _locationEnable = status == PermissionStatus.granted;
    }

    if (_locationEnable) {
      _notificationEnabled = await SharedAppPlugin.areNotificationEnabled();
    }

    Log.d('_locationEnable = $_locationEnable and _notificationEnabled = $_notificationEnabled');

    if (mounted) {
      setState(() {});
    }
  }

  void _onLocationUpdate(String type, dynamic data) {
    if (Util.hasLocation && _locationEnable == false && mounted) {
      setState(() {
        _locationEnable = true;
      });
    }

    if (mounted && Util.hasLocation) {
      _loadPlayingInfo();
    }
  }

  //一键关注
  _showOneKeyFollow() {
    int showed = Config.getInt('onekey.follow.showed', 1);
    Log.d('Start to show recommend users, lastShowtime: $showed');
    if (showed > 0) return;

    // 推荐用户，一键关注
    UserRecommend.show(context);
    Config.set('onekey.follow.showed', '1');
  }

  @override
  dispose() {
    appStateObserver.removeListener(_onAppStateChanged);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(EventConstant.EventLocationUpdated, _onLocationUpdate);
    super.dispose();
  }

  _onLogin(String type, dynamic data) {
    if (Util.isLoginBeforeBoot()) {
      return;
    }
    // 重新登录后刷新列表
    _clearData();
    reload();
  }

  _onAppStateChanged() {
    if (appStateObserver.value == AppLifecycleState.resumed) {
      if (_shouldRecheck == true) {
        _shouldRecheck = false;
        _checkPermission();
      }
    }
  }

  reload() {
    _keyMessage.currentState?.reload(true);
    _loadMessagePageTopBannerData();
    _loadHeaderInfo();
    _loadAutoCallTip();
    _smallAccountTipKey.currentState?.loadData();
  }

  void _clearData() {}

  //重置所有页面数据
  resetDataAll() {
    _clearData();
    _keyMessage.currentState?.resetData();
  }

  scrollToTop() {}

  _loadHeaderInfo() async {
    if (!Session.isLogined) {
      return;
    }
    // 刷新访客数据
    context.read<ProfilePayload>().loadRelationNum();
    if (Util.hasLocation) {
      _loadPlayingInfo();
    }
  }

  /// 附近在房的人
  _loadPlayingInfo() async {
    NearbyUserListResp resp = await MessageRepo.getNearbyUserList();
    if (resp.success == true) {
      _nearbyUserList = resp.data;
      if (mounted) {
        setState(() {});
      }
    }
  }

  /// 消息页顶部横幅
  void _loadMessagePageTopBannerData() async {
    if (!Session.isLogined) {
      return;
    }
    ResCloudBanner resCloudBanner = await MessageRepo.getMessagePageTopBanner();
    if (resCloudBanner.success && resCloudBanner.data.show) {
      _cloudBannerData = resCloudBanner.data;
    } else {
      _cloudBannerData = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void onTabChanged() {
    _keyMessage.currentState?.setCurrentBootTab(isCurrentTab);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        AnnotatedRegion<SystemUiOverlayStyle>(
          value: darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                _buildTopBar(),
                _buildNotificationNotice(),
                //   NearByPersonWidget(data: _nearbyUserList, showFate: _showFate),
                if (Session.showPrivateChatProtect && !hasClosePrivateChatProtect) _buildPrivateChatProtect(),
                Flexible(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(top: 6, bottom: 6),
                    child: NewMessagePageScreen(key: _keyMessage, itemPandding: 10),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// 小号消息 气泡提示
        if (BaseConfig.instance.smallAccount) SafeArea(child: SmallAccountMsgTipWidget(key: _smallAccountTipKey)),
      ],
    );
  }

  /// 已开启私聊保护提示（华为渠道服务端默认开启的，非用户手动开启的）
  Widget _buildPrivateChatProtect() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: R.colors.mainBgColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              K.msg_private_chat_protect,
              style: TextStyle(
                fontSize: 13,
                color: R.colors.mainTextColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              _onMsgSwitchValueChanged(false);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 40,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12),
                gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.msg_chat_close,
                style: TextStyle(
                  fontSize: 11,
                  color: R.colors.brightTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          R.img(Assets.title_mesage_icon, width: 144 / 3, height: 102 / 3, package: Assets.package),
          //
          // Text(
          //   K.msg_message,
          //   style: TextStyle(
          //     fontSize: 26,
          //     color: R.colors.mainTextColor,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          const Spacer(),
          Container(
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
                /// 搜索
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    MessageSearchPage.show(context);
                    PulseLog.instance.event('click_event', properties: {
                      'click_tag': 'home_message_search_button',
                    });
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                    child: Rext.autoStyleImg(
                      'ic_home_search.webp',
                      width: 28,
                      height: 28,
                      package: ComponentManager.MANAGER_RANK,
                    ),
                  ),
                ),

                /// 小号管理入口
                if (BaseConfig.instance.smallAccount)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _smallAccountTipKey.currentState?.onTapHide();
                      SmallAccountMsgPage.show(context);
                      PulseLog.instance.event('click_event', properties: {
                        'click_tag': 'home_message_small_account_button',
                      });
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                      child: Rext.autoStyleImg('ic_small_account.webp', width: 28, height: 28, package: ComponentManager.MANAGER_MESSAGE),
                    ),
                  ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'msg_contact'});
                    ContactPage.show(context).then((value) => refresh);
                    PulseLog.instance.event('click_event', properties: {
                      'click_tag': 'home_message_contact_button',
                    });
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Rext.autoStyleImg('ic_contact.webp', width: 28, height: 28, package: ComponentManager.MANAGER_MESSAGE),
                        if (!Config.getBool(BBConfigKey.hasShowContactsRedDot, false))
                          const RedDot(width: 12, height: 12, showBorder: false),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    CommonPopupWindow.showPopWindow(context, '', _addKey, popWidget: const CommonMessagePopWindow());
                    PulseLog.instance.event('click_event', properties: {
                      'click_tag': 'home_message_add_button',
                    });
                  },
                  child: Container(
                    key: _addKey,
                    margin: const EdgeInsetsDirectional.only(start: 7.5, end: 7.5),
                    padding: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
                    child: Rext.autoStyleImg('ic_add.webp', width: 28, height: 28, package: ComponentManager.MANAGER_MESSAGE),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 消息页顶部横幅
  Widget _buildTopBannerWidget() {
    if (_cloudBannerData?.bannerImg != null && _cloudBannerData?.bannerImg.isNotEmpty == true) {
      Tracker.instance.track(
        TrackEvent.im_toppush_pv,
        properties: {'uid': Session.uid, 'toppush_type': '3', 'is_banner': '1'},
      );
      return GestureDetector(
        onTap: () async {
          Tracker.instance.track(
            TrackEvent.im_toppush_click,
            properties: {'uid': Session.uid, 'toppush_type': '3', 'is_banner': '1'},
          );
          if (_cloudBannerData?.bannerUrl != null && _cloudBannerData?.bannerUrl.isNotEmpty == true) {
            BaseWebviewScreen.show(context, url: _cloudBannerData!.bannerUrl);
          }
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'home_message_banner_${_cloudBannerData?.bannerText}',
          });
        },
        child: Container(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12, bottom: 0),
          child: CachedNetworkImage(imageUrl: Util.getRemoteImgUrl(_cloudBannerData?.bannerImg ?? '')),
        ),
      );
    } else {
      Tracker.instance.track(
        TrackEvent.im_toppush_pv,
        properties: {'uid': Session.uid, 'toppush_type': '3', 'is_banner': '0'},
      );
      return Container(
        height: 50,
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: BoxDecoration(
          color: widget.cardBg ?? R.colors.mainBgColor,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: widget.cardBg != null
          //     ? null
          //     : [
          //         BoxShadow(
          //           color: Color(0x0A000000),
          //           offset: Offset(0, 4),
          //           blurRadius: 8,
          //           spreadRadius: 2,
          //         ),
          //       ],
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: R.img(
                'ic_message_get_gift_tips.webp',
                package: ComponentManager.MANAGER_MESSAGE,
              ),
            ),
            Expanded(
              child: Text(
                _cloudBannerData?.bannerText ?? '',
                style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GradientButton(
              K.msg_goto_draw,
              width: 50,
              height: 24,
              textStyle: TextStyle(
                color: R.colors.brightTextColor,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              onTap: () async {
                Tracker.instance.track(
                  TrackEvent.im_toppush_click,
                  properties: {'uid': Session.uid, 'toppush_type': '3', 'is_banner': '0'},
                );
                if (_cloudBannerData?.bannerUrl != null && _cloudBannerData?.bannerUrl.isNotEmpty == true) {
                  BaseWebviewScreen.show(context, url: _cloudBannerData!.bannerUrl);
                }
                PulseLog.instance.event('click_event', properties: {
                  'click_tag': 'home_message_banner_${_cloudBannerData?.bannerText}',
                });
              },
            ),
          ],
        ),
      );
    }
  }

  /// 提示打开消息通知
  Widget _buildNotificationNotice() {
    /// 如果定位权限未开，则提醒去开启定位权限
    /// 暂时关闭定位权限
    // if (_locationEnable == false) {
    //   return _buildPermissionTips(true);
    // }

    /// 如果通知权限未开，则提醒去开启通知权限
    if (_notificationEnabled == false) {
      return _buildPermissionTips(false);
    }

    /// 如果配置了活动提示横幅，则展示横幅
    if (_cloudBannerData != null) {
      return _buildTopBannerWidget();
    }
    return const SizedBox.shrink();
  }

  Widget _buildPermissionTips(bool location) {
    Tracker.instance.track(
      TrackEvent.im_toppush_pv,
      properties: {'uid': Session.uid, 'toppush_type': location ? '2' : '1', 'is_banner': '0'},
    );

    String icon = '';
    String text = '';
    if (location) {
      icon = 'message_ic_location.webp';
      text = K.msg_open_location_notice;
    } else {
      icon = 'ic_open_notification.webp';
      text = K.msg_open_notification_notice;
    }

    return Rext.themeCardContainer(
      height: 50,
      cornerRadius: 12,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Rext.autoStyleImg(
              icon,
              width: 32,
              height: 32,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 13, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GradientButton(
            K.msg_goto_open,
            colors: R.colors.mainBrandGradientColors,
            width: 50,
            height: 24,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            onTap: () {
              _shouldRecheck = true;
              Tracker.instance.track(
                TrackEvent.im_toppush_click,
                properties: {'uid': Session.uid, 'toppush_type': location ? '2' : '1', 'is_banner': '0'},
              );
              if (location) {
                PermissionUtil.checkAndRequestPermissions(context, Permission.locationWhenInUse);
              } else {
                SharedAppPlugin.openNotificationSettings();
              }
              PulseLog.instance.event('click_event', properties: {
                'click_tag': 'home_message_tip_${location ? 'location' : 'push'}_button',
              });
            },
          ),
        ],
      ),
    );
  }

  bool strangerMsg = false;

  void _onMsgSwitchValueChanged(bool value) async {
    if (strangerMsg) {
      return;
    }
    strangerMsg = true;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/strangermsg",
          {
            'value': value ? "0" : "1",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        hasClosePrivateChatProtect = true;
        if (mounted) {
          setState(() {});
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    strangerMsg = false;
  }
}
