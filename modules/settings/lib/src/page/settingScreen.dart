import 'package:settings/k.dart';
import 'package:shared/assets.dart';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/page/api/settings_repo.dart';
import 'package:settings/src/page/bindScreen.dart';
import 'package:settings/src/page/generalSetting.dart';
import 'package:settings/src/page/information_collected.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';

import '../../assets.dart';
import 'accountSettingScreen.dart';
import 'juveniles/juveniles_mode.dart';
import 'messageSetting.dart';
import 'backgroundSetting.dart';
import 'privacySetting.dart';
import 'safeMobileInputScreen.dart';
import 'safeMobileCheckScreen.dart';
import 'package:shared/dart_extensions/extensions_common.dart';

/// 账号设置
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingScreen(),
      settings: const RouteSettings(name: '/setting'),
    ));
  }
}

class _State extends State<SettingScreen> {
  bool _showMsgSetting = false;
  bool _enableStrangerMsg = false;
  int _push_wakeup_chat = 0;
  bool nearbyInvisible = false; // 附近隐身
  int _showDistance = 1; //距离显示 1 对所有人可见 2 仅对好友可见 3 对所有人隐藏
  int _close_box_receive = 0;
  String _phone = '';
  int _bid = 0; //公会ID
  int _brokerAdmin = 0; //公会管理员 0，不是公会管理员；1，是公会管理员
  String? _brokerUrl; //公会url
  List _ptdata = [];
  int _role = 0;
  Map? _money;
  int? _idcard;
  int _bcard = 0;
  int _acard = 0;
  List _smallAccounts = [];
  List<SmallAccountList> _smallAccountsNew = [];
  bool _displayAllAccounts = false;
  DialogLoadingController? _controller;
  String _safe_mobile = '';
  bool _notAutoCreateGroup = false;
  bool _notAutoJoinGroup = false;
  bool _closeEmoticon = false;
  ILoginManager? _loginManager;

  bool _service_pause = false;

  @override
  void initState() {
    super.initState();

    _service_pause = Session.servicePause;

    _loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

    _load();
    _loadSmallAccount();

    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    super.dispose();
  }

  _onPageChanged(String type, dynamic value) {
    Log.d("_onPageChanged $type $value");
    String pageName = value;
    Log.d('category$pageName');
    if (pageName == '/setting') {
      _load();
    }
  }

  _onLogin(String type, dynamic value) {
    Log.d("_onLogin type:$type, value:$value");
    if (value == null || !Session.isLogined) return;
    if (value['origin'] != value['now']) {
      _load();
      _loadSmallAccount();
    }
  }

  void _load() async {
    String url = "${System.domain}account/setinfo?v=9";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        Map data = res['data'];
        if (data['mobile'] != null && data['mobile'] is String) {
          _phone = data['mobile'];
        }

        if (data['stranger_msg_show'] != null) {
          _showMsgSetting = Util.parseInt(data['stranger_msg_show']) > 0;
        }

        if (data['stranger_msg'] != null) {
          _enableStrangerMsg = Util.parseInt(data['stranger_msg']) <= 0;
        }

        if (data['push_wakeup_chat'] != null) {
          _push_wakeup_chat = Util.parseInt(data['push_wakeup_chat']);
        }

        if (data['nearby_invisible'] != null) {
          nearbyInvisible = Util.parseInt(data['nearby_invisible']) > 0;
        }

        if (data['distance_privacy'] != null) {
          _showDistance = Util.parseInt(data['distance_privacy']);
        }

        if (data['close_box_receive'] != null) {
          _close_box_receive = Util.parseInt(data['close_box_receive']);
        }

        if (data['small_accounts'] != null && data['small_accounts'] is List) {
          _smallAccounts = data['small_accounts'];
        }

        _role = Util.parseInt(data['role']);

        _ptdata = data['ptdata'] ?? [];

        _money = data['money'];

        _idcard = Util.parseInt(data['idcard']);

        _bcard = Util.parseInt(data['ban' 'kcard']);

        _acard = Util.parseInt(data['al' 'icard']);

        _bid = Util.parseInt(data['bid']);

        _brokerAdmin = Util.parseInt(data['brokerAdmin']);

        _brokerUrl = data['brokerUrl'];

        if (data['safe_mobile'] != null && data['safe_mobile'] is String) {
          _safe_mobile = data['safe_mobile'];
        }

        _notAutoCreateGroup =
            Util.parseInt(data['close_create_room_group']) > 0;
        _notAutoJoinGroup = Util.parseInt(data['close_join_room_group']) > 0;
        _closeEmoticon = Util.parseInt(data['close_emoticon']) > 0;

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  void _loadSmallAccount() async {
    if (BaseConfig.instance.smallAccount) {
      ResSmallAccountList res = await SettingRepo.getSmallAccountList();
      if (res.success) {
        _smallAccountsNew = res.list;
        refresh();
        Future.delayed(const Duration(milliseconds: 100), () {
          eventCenter.emit(EventConstant.EventSmallAccountUpdate, null);
        });
      } else {
        _smallAccountsNew.clear();
        refresh();
      }
    }
  }

  void _onServiceSwitchValueChanged(bool value) async {
    if (value == true && Session.serviceForbidden > 0) {
      Toast.showCenter(
          System.context,
          R.string('blocked_by_the_administrator') +
              Utility.formatDate(Session.serviceForbidden));
      return;
    }

    //TODO 身份认证
    if (value == true && !_isInviteEnabled()) {
      bool? r = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text(R.string('notice')),
                content: Text(R.string('invite_condition')),
                actions: <Widget>[
                  CupertinoButton(
                      child: Text(R.string('cancel')),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  CupertinoButton(
                      child: Text(R.string('sure')),
                      onPressed: () {
                        Navigator.of(context).pop();
                        ISettingManager settingManager = ComponentManager
                            .instance
                            .getManager(ComponentManager.MANAGER_SETTINGS);
                        settingManager.openIdAuth(context);
                      }),
                ]);
          });
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
            _service_pause = !value;
          });

          await Session.sync({
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

  bool _isInviteEnabled() {
    var isGod =
        Session.role == UserRole.DISABLED || Session.role == UserRole.GOD;
    if (!isGod) return true;
    if (Session.getInt('_mobile', 0) > 0 && Session.idAuthenticated)
      return true;
    return false;
  }

  void _logout() {
    if (JuvenilesMode.isActive()) {
      Toast.show(context, K.setting_close_juveniles_to_logout);
    } else {
      Session.logout();
      if (Util.isLoginBeforeBoot()) {
        eventCenter.emit('System.Need.Login', context);
      } else {
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    }
  }

  void showLoading(String message) async {
    if (!mounted) return;
    CommonLoading.show(status: message);
  }

  void hideLoading() {
    if (!mounted) return;
    CommonLoading.dismiss();
  }

  void _onSwitchAccount(int uid, {String? icon, String? phone}) async {
    if (JuvenilesMode.isActive()) {
      Toast.show(context, K.setting_close_juveniles_to_logout);
      return;
    }
    String dtoken = Session.getString('dtoken', '');

    showLoading(K.setting_requesting);
    //发送验证码
    String method = "account/smallaccountlogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'dtoken': dtoken,
      'target': uid.toString(),
    };

    Log.d(post);

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.response as Map;
      bool success = res['success'];

      hideLoading();
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);
        eventCenter.emit(EventConstant.EventLogin,
            {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
        Tracker.instance.track(TrackEvent.change_small_account, properties: {
          'uid': origin,
          'status': 1,
        });

        if (Session.role == UserRole.REG) {
          _loginManager?.openLoginProfile(context);
        }

        Fluttertoast.showToast(
            msg: K.setting_change_account_success,
            gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }

        _goToLogin(uid, icon: icon, phone: phone);
      }
    } catch (e) {
      hideLoading();

      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);

      _goToLogin(uid, icon: icon, phone: phone);
    }
  }

  void _goToLogin(int uid, {String? icon, String? phone}) {
    Tracker.instance.track(TrackEvent.change_small_account, properties: {
      'uid': Session.uid,
      'status': 0,
    });

    //success为false(账号未在设备登录过,需要进入安全手机号验证流程)
    if (BaseConfig.instance.smallAccount) {
      // 小号切换 输入验证码 新
      if (phone?.isNotEmpty == true) {
        SafeMobileCheckScreen.show(context,
            type: 'check', uid: uid.toString(), phone: phone, icon: icon);
      } else {
        // 跳转添加
        _loginManager?.openPhoneLogin(context, type: 'small_account');
      }
    } else {
      SafeMobileInputScreen.show(context, type: 'check', uid: uid.toString());
    }
  }

  void _onBindSafePhone() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(""),
            content: Text(K.setting_bind_safephone_useful_notice),
            actions: <Widget>[
              CupertinoButton(
                  child: Text(K.cancel),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                child: Text(K.sure),
                onPressed: () {
                  Navigator.pop(context);
                  BindScreen.show(context, type: 'safe_bind');
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String qqName;
    String qqKey;
    String wxName;
    String wxKey;
    if (_ptdata.isNotEmpty) {
      for (var item in _ptdata) {
        if (item['platform'] == 'wechat') {
          wxName = item['nickname'];
          wxKey = item['key'];
        } else if (item['platform'] == 'qq') {
          qqName = item['nickname'];
          qqKey = item['key'];
        }
      }
    }

    bool isGod =
        Session.role == UserRole.DISABLED || Session.role == UserRole.GOD;

    List<Widget> widgets = [];

    if (BaseConfig.instance.smallAccount) {
      /// 小号 新
      widgets.add(_buildSmallAccountList());

      if (_smallAccountsNew.length > 3) {
        widgets.add(_buildSmallAccountExpand());
      }
      widgets.add(const SizedBox(height: 12));
      widgets.add(_buildSmallAccountAdd());
    } else {
      /// 小号 旧
      for (var item in (_displayAllAccounts
          ? _smallAccounts
          : _smallAccounts.sublist(0, min(3, _smallAccounts.length)))) {
        Map config = item;

        String onlineStatus = (Session.uid == Util.parseInt(item['uid']))
            ? K.setting_current_account
            : (Util.parseInt(item['online']) > 0
                ? K.setting_current_online
                : item['online_diff']);

        widgets.add(
          InkWell(
            onTap: () async {
              if (Session.uid != Util.parseInt(item['uid'])) {
                //非当前账号,才切换
                _onSwitchAccount(Util.parseInt(item['uid']));
              }
            },
            child: Rext.themeCardContainer(
                margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
                cornerRadius: 8,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20.0, right: 20),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(27.5),
                          child: CachedNetworkImage(
                            imageUrl: "${System.imageDomain}${config['icon']}",
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 55.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                config['name'],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: R.colors.mainTextColor,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // 设置页面靓ID展示
                                  if (item != null &&
                                      Util.parseInt(item['pretty_uid']) > 0)
                                    Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 10),
                                        child: Row(
                                          children: [
                                            R.img(
                                              BaseAssets
                                                  .shared$bb_pretty_id_webp,
                                              width: 16,
                                              height: 16,
                                              package: ComponentManager
                                                  .MANAGER_BASE_CORE,
                                              fit: BoxFit.fitHeight,
                                            ),
                                            const SizedBox(width: 4),
                                            ColorfulNickName(
                                              isPrettyId: true,
                                              textBuild: (bool show,
                                                  {Key? key, Paint? paint}) {
                                                return NumText(
                                                  item['pretty_uid']
                                                          ?.toString() ??
                                                      '',
                                                  key: key,
                                                  softWrap: true,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    color: Color(0xFFFD7B08),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        )),

                                  IDWidget(
                                      uid: Util.parseInt(item['uid']),
                                      fontSize: 13,
                                      fontColor: R.colors.mainTextColor
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                      dark: darkMode)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 6, top: 1, right: 6, bottom: 4),
                        decoration: const BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Text(
                          onlineStatus,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: (Session.uid != Util.parseInt(item['uid']))
                                  ? R.color.secondTextColor
                                  : R.color.mainTextColor,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
        widgets.add(const SizedBox(height: 12));
      }

      if (_smallAccounts.length > 3) {
        widgets.add(InkWell(
          onTap: () {
            setState(() {
              _displayAllAccounts = !_displayAllAccounts;
            });
          },
          child: SizedBox(
            height: 48.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _displayAllAccounts ? K.setting_collapse : K.setting_look_all,
                  style: TextStyle(color: R.colors.mainTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: R.img(
                    _displayAllAccounts
                        ? BaseAssets.shared$ic_switch_up_svg
                        : BaseAssets.shared$ic_switch_down_svg,
                    width: 9.0,
                    height: 6.0,
                    color: R.colors.secondTextColor,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                )
              ],
            ),
          ),
        ));
      }

      if (_smallAccounts.isNotEmpty && _safe_mobile.isEmpty) {
        widgets.add(InkWell(
            onTap: () async {
              _onBindSafePhone();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 11.5, bottom: 13.5, left: 20.0, right: 23.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27.5),
                      child: R.img(
                        Assets.settings$ic_account_add_png,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        package: ComponentManager.MANAGER_SETTINGS,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 55.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            K.setting_add_account,
                            style: TextStyle(
                                fontSize: 16.0, color: R.colors.mainTextColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
      }
    }

    widgets.addAll([
      ListSection(
        isEnd: false,
        children: [
          SettingItemWidget(
            supportDark: true,
            title: K.account_setting_title,
            height: 52,
            onClicked: () {
              AccountSettingScreen.show(context);
            },
          ),
          if (!Util.isLocale)
            SettingDividerWidget(
                margin: const EdgeInsets.only(left: 18, right: 18),
                color: R.colors.mainBgColor),
          if (!Util.isLocale)
            SettingItemWidget(
              supportDark: true,
              title: K.juveniles_protect_title,
              height: 52,
              onClicked: () {
                JuvenilesMode.show(context);
              },
            ),
          SettingDividerWidget(
              margin: const EdgeInsets.all(0),
              height: 8,
              color: R.colors.mainBgColor)
        ].where((it) => it != null).toList(),
      ),
    ].where((it) => it != null).toList());

    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    if (isGod && settingManager.showInvite()) {
      widgets.add(SettingItemWithSwitchWidget(
        title: K.setting_open_invite,
        subTitle: K.setting_not_receive_invite,
        value: !_service_pause,
        onChanged: _onServiceSwitchValueChanged,
      ));
      widgets.add(const SettingDividerWidget(
          margin: EdgeInsets.only(left: 18, right: 18)));
    }

    if (!Util.isAndroidVerify || _showMsgSetting || _push_wakeup_chat > 0) {
      // 隐私设置
      widgets.add(SettingItemWidget(
        supportDark: true,
        title: K.settings_privacy_setting,
        height: 52,
        onClicked: () {
          PrivacySetting.show(
              context,
              _showMsgSetting ? _enableStrangerMsg : null,
              _push_wakeup_chat,
              nearbyInvisible,
              _showDistance);
        },
      ));

      widgets.add(SettingDividerWidget(
          margin: const EdgeInsets.only(left: 18, right: 18),
          color: R.colors.mainBgColor));
    }

    // 通用设置
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_general_setting,
      height: 52,
      onClicked: () {
        GeneralSetting.show(context, _notAutoCreateGroup, _notAutoJoinGroup,
            _close_box_receive, _closeEmoticon);
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));
    // 消息设置
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_message_setting,
      height: 52,
      onClicked: () {
        MessageSetting.show(context);
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));
    // 背景设置
    // widgets.add(SettingItemWidget(
    //   supportDark: true,
    //   title: K.settings_bg_setting,
    //   height: 52,
    //   onClicked: () {
    //     BackgroundSetting.show(context);
    //   },
    // ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.all(0),
        height: 8,
        color: R.colors.mainBgColor));

    /// 隐私政策
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_privacy_policy,
      height: 52,
      onClicked: () {
        BaseWebviewScreen.show(context,
            url: Util.licenseUrl(LicenseType.PRIVACY_AGREEMENT));
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));

    /// 应用权限
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_app_permission,
      height: 52,
      onClicked: () {
        BaseWebviewScreen.show(context,
            url: Util.licenseUrl(LicenseType.APPS_PERMISSIONS));
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));

    /// 个人信息收集类型
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_information_collection,
      height: 52,
      onClicked: () {
        BaseWebviewScreen.show(context,
            url: Util.licenseUrl(LicenseType.INFORMATION_COLLECTION));
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));

    /// 已收集个人信息清单
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_information_collected,
      height: 52,
      onClicked: () {
        InformationCollectedScreen.show(context);
      },
    ));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.only(left: 18, right: 18),
        color: R.colors.mainBgColor));

    /// 第三方SDK列表
    widgets.add(SettingItemWidget(
      supportDark: true,
      title: K.settings_third_sdk,
      height: 52,
      onClicked: () {
        BaseWebviewScreen.show(context,
            url: Util.licenseUrl(LicenseType.THIRD_SDK));
      },
    ));

    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.all(0),
        height: 8,
        color: R.colors.mainBgColor));

    widgets.add(InkWell(
        onTap: _logout,
        child: Container(
          alignment: Alignment.center,
          height: 52,
          child: Text(K.setting_logout,
              style: TextStyle(
                fontSize: 16.0,
                color: R.colors.mainTextColor,
              )),
        )));
    widgets.add(SettingDividerWidget(
        margin: const EdgeInsets.all(0),
        height: 50,
        color: R.colors.mainBgColor));

    return Scaffold(
        appBar: BaseAppBar(
          K.setting,
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backgroundColor: Colors.transparent,
          backColor: R.colors.mainTextColor,
          titleColor: R.colors.mainTextColor,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    // color: R.colors.mainBgColor,
                    child: Column(
          children: widgets,
        ))))).withCommonBg();
  }

  Widget _buildSmallAccountList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _displayAllAccounts
          ? _smallAccountsNew.length
          : min(3, _smallAccountsNew.length),
      itemBuilder: (context, index) {
        return _buildSmallAccountItem(_smallAccountsNew[index], index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 12,
        );
      },
    );
  }

  Widget _buildSmallAccountItem(SmallAccountList item, int index) {
    String onlineStatus = (index == 0) // 第一个 即 当前账号
        ? K.setting_current_account
        : (item.state) == 1
            ? item.onlineDiff
            : K.setting_out_time;
    return InkWell(
      onTap: () async {
        if (Session.uid != item.uid) {
          //非当前账号,才切换
          _onSwitchAccount(item.uid, icon: item.icon, phone: item.mobile);
        }
      },
      child: Slidable(
        endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.22,
            children: [
              if (Session.uid != item.uid)
                SlidableAction(
                  label: K.setting_delete,
                  icon: Icons.delete,
                  backgroundColor: const Color(0xFFEA4334),
                  onPressed: (context) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            width: 312,
                            title: K.small_account_delete_title,
                            titleTextColor: const Color(0xFF202020),
                            negativeButton: const NegativeButton(
                              width: 130,
                              height: 48,
                              textColor: Color(0xB3202020),
                            ),
                            positiveButton: PositiveButton(
                              width: 130,
                              height: 48,
                              useGradientBg: true,
                              gradientBg: R.color.mainBrandGradientColors,
                              text: K.setting_delete,
                              onPressed: () {
                                _onTapDeleteSmallAccount(item.uid, index);
                                Navigator.of(context).pop(true);
                              },
                            ),
                          );
                        });
                  },
                ),
            ]),
        child: Rext.themeCardContainer(
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            cornerRadius: 8,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  top: 12, bottom: 12, start: 20, end: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: "${System.imageDomain}${item.icon}",
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 54.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: R.colors.mainTextColor,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // 设置页面靓ID展示
                              if (item.prettyUid > 0)
                                Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 10),
                                    child: Row(
                                      children: [
                                        R.img(
                                          BaseAssets.shared$bb_pretty_id_webp,
                                          width: 16,
                                          height: 16,
                                          package: ComponentManager
                                              .MANAGER_BASE_CORE,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        const SizedBox(width: 4),
                                        ColorfulNickName(
                                          isPrettyId: true,
                                          textBuild: (bool show,
                                              {Key? key, Paint? paint}) {
                                            return NumText(
                                              '${item.prettyUid}',
                                              key: key,
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: R.colors.mainTextColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      Util.numFontFamily,
                                                  package: ComponentManager
                                                      .MANAGER_BASE_CORE),
                                            );
                                          },
                                        )
                                      ],
                                    )),

                              IDWidget(
                                  uid: item.uid,
                                  fontSize: 13,
                                  fontColor: R.colors.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  dark: darkMode)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 8, end: 8, top: 4, bottom: 4),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        color: R.colors.mainTextColor.withOpacity(0.05),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      onlineStatus,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: R.colors.mainTextColor
                              .withOpacity((index == 0) ? 0.5 : 0.4),
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void _onTapDeleteSmallAccount(int targetUid, int index) async {
    NormalNull res = await SettingRepo.deleteSmallAccount(targetUid);
    if (res.success) {
      _smallAccountsNew.removeAt(index);
      refresh();
    } else {
      Fluttertoast.showToast(msg: res.msg);
    }
  }

  Widget _buildSmallAccountExpand() {
    return InkWell(
      onTap: () {
        setState(() {
          _displayAllAccounts = !_displayAllAccounts;
        });
      },
      child: SizedBox(
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayAllAccounts ? K.setting_collapse : K.setting_look_all,
              style: TextStyle(color: R.colors.mainTextColor),
            ),
            const SizedBox(width: 4),
            R.img(
              _displayAllAccounts
                  ? BaseAssets.shared$ic_switch_up_svg
                  : BaseAssets.shared$ic_switch_down_svg,
              width: 9.0,
              height: 6.0,
              color: R.colors.secondTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSmallAccountAdd() {
    return InkWell(
        onTap: () async {
          // 添加小号
          if (_smallAccountsNew.length < 50) {
            _loginManager?.openOneKeyLogin(context, type: 'small_account');
          } else {
            Fluttertoast.showCenter(msg: K.setting_small_account_limit_tip);
          }
        },
        child: Rext.themeCardContainer(
            cornerRadius: 8,
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  top: 12, bottom: 12, start: 20.0, end: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Rext.autoStyleImg(
                      Assets.settings$ic_account_add_png,
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                      package: ComponentManager.MANAGER_SETTINGS,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            K.setting_add_account,
                            style: TextStyle(
                                fontSize: 16.0, color: R.colors.mainTextColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ListSection extends StatelessWidget {
  final List<Widget> children;
  final bool? isEnd;

  const ListSection({super.key, this.children = const <Widget>[], this.isEnd});

  @override
  Widget build(BuildContext context) {
    bool end = isEnd != null && isEnd!;
    return end
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children)
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children);
  }
}
