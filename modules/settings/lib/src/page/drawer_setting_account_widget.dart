import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/page/bindScreen.dart';
import 'package:settings/src/page/generalSetting.dart';

import 'accountSettingScreen.dart';
import 'juveniles/juveniles_mode.dart';
import 'messageSetting.dart';
import 'privacySetting.dart';
import 'safeMobileInputScreen.dart';

/// 账号设置
class DrawerAccountSettingWidget extends StatefulWidget {
  const DrawerAccountSettingWidget({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const DrawerAccountSettingWidget(),
      settings: const RouteSettings(name: '/setting'),
    ));
  }
}

class _State extends State<DrawerAccountSettingWidget> {
  bool _showMsgSetting = false;
  bool _enableStrangerMsg = false;
  int _push_wakeup_chat = 0;
  bool nearbyInvisible = false; // 附近隐身
  int _showDistance = 1; //距离显示 1 对所有人可见 2 仅对好友可见 3 对所有人隐藏
  int _close_box_receive = 0;
  bool _closeEmoticon = false;
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
  bool _displayAllAccounts = false;
  DialogLoadingController? _controller;
  String _safe_mobile = '';
  bool _notAutoCreateGroup = false;
  bool _notAutoJoinGroup = false;
  ILoginManager? _loginManager;

  bool _service_pause = false;

  @override
  void initState() {
    super.initState();

    _service_pause = Session.servicePause;

    _loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

    _load();

    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
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

  void _load() async {
    String url = "${System.domain}account/setinfo?v=9";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        Map? data = res['data'];
        if (data?['mobile'] != null && data!['mobile'] is String) {
          _phone = data['mobile'];
        }

        if (data?['stranger_msg_show'] != null) {
          _showMsgSetting = Util.parseInt(data!['stranger_msg_show']) > 0;
        }

        if (data?['stranger_msg'] != null) {
          _enableStrangerMsg = Util.parseInt(data!['stranger_msg']) <= 0;
        }

        if (data?['push_wakeup_chat'] != null) {
          _push_wakeup_chat = Util.parseInt(data!['push_wakeup_chat']);
        }

        if (data?['nearby_invisible'] != null) {
          nearbyInvisible = Util.parseInt(data!['nearby_invisible']) > 0;
        }

        if (data?['distance_privacy'] != null) {
          _showDistance = Util.parseInt(data!['distance_privacy']);
        }

        if (data?['close_box_receive'] != null) {
          _close_box_receive = Util.parseInt(data!['close_box_receive']);
        }

        if (data?['small_accounts'] != null &&
            data!['small_accounts'] is List) {
          _smallAccounts = data['small_accounts'];
        }

        _role = Util.parseInt(data?['role']);

        _ptdata = data?['ptdata'] ?? [];

        _money = data?['money'];

        _idcard = Util.parseInt(data?['idcard']);

        _bcard = Util.parseInt(data?['ban' 'kcard']);

        _acard = Util.parseInt(data?['al' 'icard']);

        _bid = Util.parseInt(data?['bid']);

        _brokerAdmin = Util.parseInt(data?['brokerAdmin']);

        _brokerUrl = data?['brokerUrl'];

        if (data?['safe_mobile'] != null && data!['safe_mobile'] is String) {
          _safe_mobile = data['safe_mobile'];
        }

        _notAutoCreateGroup =
            Util.parseInt(data?['close_create_room_group']) > 0;
        _notAutoJoinGroup = Util.parseInt(data?['close_join_room_group']) > 0;
        _closeEmoticon = Util.parseInt(data?['close_emoticon']) > 0;

        _displayAllAccounts = false;

        if (mounted) {
          setState(() {});
        }
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

  void showLoading(String message) {
    if (_controller != null) {
      _controller!.setLabel(message);
      return;
    }

    _controller = DialogLoadingController();
    _controller!.show(context: context, message: message);
  }

  void hideLoading() {
    _controller?.close();
    _controller = null;
  }

  void _onSwitchAccount(int uid) async {
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

        _goToLogin(uid);
      }
    } catch (e) {
      hideLoading();

      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);

      _goToLogin(uid);
    }
  }

  void _goToLogin(int uid) {
    //success为false(账号未在设备登录过,需要进入安全手机号验证流程)
    SafeMobileInputScreen.show(context, type: 'check', uid: uid.toString());
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

    widgets.addAll([
      ListSection(
        isEnd: false,
        children: [
          SettingItemWidget(
            title: K.account_setting_title,
            height: 52,
            onClicked: () {
              AccountSettingScreen.show(context);
            },
          ),
          if (!Util.isLocale)
            const SettingDividerWidget(
                margin: EdgeInsetsDirectional.only(start: 18, end: 18)),
          if (!Util.isLocale)
            SettingItemWidget(
              title: K.juveniles_protect_title,
              height: 52,
              onClicked: () {
                JuvenilesMode.show(context);
              },
            ),
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
          margin: EdgeInsetsDirectional.only(start: 18, end: 18)));
    }

    if (!Util.isAndroidVerify || _showMsgSetting || _push_wakeup_chat > 0) {
      // 隐私设置
      widgets.add(SettingItemWidget(
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

      widgets.add(const SettingDividerWidget(
          margin: EdgeInsetsDirectional.only(start: 18, end: 18)));
    }

    // 通用设置
    widgets.add(SettingItemWidget(
      title: K.settings_general_setting,
      height: 52,
      onClicked: () {
        GeneralSetting.show(context, _notAutoCreateGroup, _notAutoJoinGroup,
            _close_box_receive, _closeEmoticon);
      },
    ));
    widgets.add(const SettingDividerWidget(
        margin: EdgeInsetsDirectional.only(start: 18, end: 18)));
    // 消息设置
    widgets.add(SettingItemWidget(
      title: K.settings_message_setting,
      height: 52,
      onClicked: () {
        MessageSetting.show(context);
      },
    ));
    // widgets.add(InkWell(
    //     onTap: _logout,
    //     child: Container(
    //       alignment: Alignment.center,
    //       height: 52,
    //       child: Text(K.setting_logout,
    //           style: TextStyle(
    //             fontSize: 16.0,
    //             color: R.color.mainTextColor,
    //           )),
    //     )));
    return Container(
        color: R.color.mainBgColor,
        child: Column(
          children: widgets,
        ));
  }
}

class ListSection extends StatelessWidget {
  final List<Widget> children;
  final bool? isEnd;

  const ListSection({super.key, required this.children, this.isEnd});

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
