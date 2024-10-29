import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:settings/k.dart';
import 'package:settings/src/libs/models.dart';
import 'package:settings/src/page/bindScreen.dart';

import '../libs/local_auth.dart';
import 'apply_cancellation.dart';
import 'bindChangeScreen.dart';
import 'id_auth.dart';

/// 账号与安全
class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AccountSettingScreen(),
        settings: const RouteSettings(name: '/accountSetting'),
      ),
    );
  }
}

class _State extends State<AccountSettingScreen> {
  final DialogLoadingController _controller = DialogLoadingController();

  String? _phone;
  String? _areaCode;
  List _ptdata = [];
  int _role = 0;
  Map? _money;
  int _idcard = 0;
  String? _safe_mobile;
  String? _safe_area_code;
  String? _bioLoginTitle;
  final ILoginManager _loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  bool _canPhoneAuth = false;

  final List<Widget> _thirdAccountsItems = [];

  SubscribeInfo? _subscribeInfo;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    _loginManager.checkEnvAvailable().then((value) => _canPhoneAuth = value);
    _load();
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    super.dispose();
  }

  _onPageChanged(String type, dynamic value) {
    Log.d("_onPageChanged $type $value");
    String pageName = value;
    Log.d('category:$pageName');
    if (pageName == '/accountSetting') {
      _load();
    }
  }

  void _load() async {
    try {
      _bioLoginTitle = await LocalAuth.bioLoginTitle();
    } catch (e) {
      Log.d(e.toString());
    }

    String url = "${System.domain}account/setinfo?v=6";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        Map data = res['data'];
        if (data['mobile'] != null && data['mobile'] is String) {
          _phone = Utility.splitPhone(data['mobile'])['phone'];
          _areaCode = Utility.splitPhone(data['mobile'])['area'];
        }

        if (data['safe_mobile'] != null && data['safe_mobile'] is String) {
          _safe_mobile = Utility.splitPhone(data['safe_mobile'])['phone'];
          _safe_area_code = Utility.splitPhone(data['safe_mobile'])['area'];
        }

        _role = Util.parseInt(data['role']);

        _ptdata = data['ptdata'] ?? [];

        _money = data['money'];

        _idcard = Util.parseInt(data['idcard']);

        if (data['guide_subscribe_info'] != null) _subscribeInfo = SubscribeInfo.fromJson(data['guide_subscribe_info']);

        _buildAccountItems();

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  void _buildAccountItems() {
    if (_thirdAccountsItems.isNotEmpty) {
      // 添加过第三方账号，不在重复添加
//      return;
      _thirdAccountsItems.clear();
    }
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    loginManager.getThirdPlatforms().forEach((platform) {
      platform.extraData['nickname'] = null;
      platform.extraData['key'] = null;

      if (platform.supportLogin()) {
        if (_ptdata.isNotEmpty) {
          for (Map item in _ptdata) {
            if (item['platform'] == platform.tag()) {
              platform.extraData['nickname'] = item['nickname'];
              platform.extraData['key'] = item['key'];
              break;
            }
          }
        }
        _thirdAccountsItems.add(SettingItemWidget(
          title: platform.getName(),
          trailingText: platform.extraData['nickname'],
          onClicked: () {
            _onTapAccount(platform);
          },
        ));
      }
    });
  }

  void _onTapAccount(IThirdPlatform platform) async {
    bool binded = platform.extraData['nickname'] != null;
    String key = platform.extraData['key'] ?? '';
    if (!binded) {
      platform.onLoginTap(context, 'bind', (result) {
        _onLoginComplete(result);
      }, (msg) {
        _onLoginError(msg);
      });
    } else {
      bool? r = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(title: K.setting_notice_unbind([platform.getName()]));
          });
      if (r != null && r == true) {
        _unbind(platform.tag(), key);
      }
    }
  }

  void _onLoginError(String message) {}

  bool _onLoginComplete(Object result) {
    Fluttertoast.showToast(msg: K.setting_bind_success, gravity: ToastGravity.CENTER);
    _load();
    return true;
  }

  void _onBioBindValueChanged(bool value) async {
    bool ret = await LocalAuth.authBio();
    if (!mounted) return;
    if (!ret) {
      Fluttertoast.showToast(msg: K.setting_check_failed_cant_modify, gravity: ToastGravity.CENTER);
      return;
    }
    if (value) {
      await LocalAuth.used(Session.uid);
    } else {
      LocalAuth.removeBio(Session.uid);
    }
    Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
    if (mounted) {
      setState(() {});
    }
  }

//  void _onTapWechat(bool binded, String key) async {
//    if (!binded) {
//      _loginManager.loginByWechat(context, type: 'bind', onComplete: _onLoginComplete, onError: _onLoginError);
//    } else {
//      bool r = await showDialog(
//          context: this.context,
//          builder: (BuildContext context) {
//            return ConfirmDialog(
//              title: "是否要解绑该微信号？",
//            );
//          });
//      if (r != null && r == true) {
//        _unbind('wechat', key);
//      }
//    }
//  }

//  void _onTapQQ(bool binded, String key) async {
//    if (!binded) {
//      _loginManager.loginByQQ(context, type: 'bind', onComplete: _onLoginComplete, onError: _onLoginError);
//    } else {
//      bool r = await showDialog(
//          context: this.context,
//          builder: (BuildContext context) {
//            return ConfirmDialog(title: "是否要解绑该QQ号？");
//          });
//      if (r != null && r == true) {
//        _unbind('qq', key);
//      }
//    }
//  }

  bool bindingPhone = false;
  void _onTapPhone() async {
    if (_phone == null || _phone!.isEmpty) {
      if (bindingPhone) {
        Log.d('binding phone, do nothing');
        return;
      }
      bindingPhone = true;
      await _loginManager.bindPhone(context);
      bindingPhone = false;
    } else {
      bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.setting_notice_change_phone,
          );
        },
      );

      if (result != null && result) {
        BindChangeScreen.showBindChangeScreen(context, phone: _phone, areaCode: _areaCode, type: BindType.BIND);
      }
    }
  }

  void _onTapSafePhone() async {
    if (_safe_mobile == null || _safe_mobile!.isEmpty) {
      if (bindingPhone) {
        Log.d('binding safe phone, do nothing');
        return;
      }
      bindingPhone = true;
      if (_canPhoneAuth) {
        OneKeyLoginResult? result = await OneKeyLogin.getLoginToken(
            uiConfig: OneKeyLoginUiConfig.auto()..isPhoneBind = true,
            oneKeyLoginListener: (result) {
              if (result.success) {
                // 获取登录授权码成功
                _oneKeyBind('safe_bind', result.token ?? '');
              } else if (result.shouldSwitch) {
                // 用户切换登录方式
                BindScreen.show(context, type: 'safe_bind');
              } else if (result.cancel) {
                // 用户取消
              } else {
//              Toast.show(context, result.getMessage());
                BindScreen.show(context, type: 'safe_bind');
              }
            });
        if (!(result?.success ?? false)) {
          BindScreen.show(context, type: 'safe_bind');
        }
      } else {
        await BindScreen.show(context, type: 'safe_bind');
      }
      bindingPhone = false;
    } else {
      bool? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(title: K.setting_notice_change_safe_phone);
          });

      if (result != null && result) {
        if (!Util.isLocale && Session.idAuthenticated) {
          // 实人认证通过，只能实人认证改安全手机号
          dynamic map = await IdAuth.show(context, certifyType: CertifyType.modify, bindType: 'safe_bind');

          if (map is Map) {
            String? token = map['token'];
            List? accounts = map['users'];
            if (token != null && token.isNotEmpty) {
              // 展示实人认证下的所有账号列表
              if (accounts == null || accounts.isEmpty) {
                Fluttertoast.showToast(msg: K.settings_no_account_found);
                return;
              }
              List<AccountItem> items = [];
              try {
                for (var json in accounts) {
                  items.add(AccountItem.fromJson(json));
                }
              } catch (e) {
                Log.d(e);
              }
              bool suc = await _loginManager.openAccountList(items);
              if (suc == true) {
                // 实人认证成功返回token
                BindChangeScreen.showBindChangeScreen(context,
                    phone: _safe_mobile, areaCode: _safe_area_code, type: BindType.SAFE_BIND, token: token);
              }
            }
          }
        } else {
          // 海外或未实人认证过，走原手机号换绑
          BindChangeScreen.showBindChangeScreen(context, phone: _safe_mobile, areaCode: _safe_area_code, type: BindType.SAFE_BIND);
        }
      }
    }
  }

  /// 使用token一键绑定
  _oneKeyBind(String type, String token) async {
    _controller.show(context: System.context);
    OneKeyLoginBean bean = await OneKeyLogin.verifyToken(token: token, type: type);
    _controller.close();
    if (!(bean.success == true)) {
      Toast.show(context, bean.msg ?? R.string('commom_bind_failed'));
      return;
    }

    Fluttertoast.showToast(msg: R.string('common_bind_succ'));
  }

  void _unbind(String type, String key) async {
    try {
      XhrResponse response = await Xhr.postJson("${System.domain}account/setunbind", {'type': type, 'key': key}, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        _load();
        Fluttertoast.showToast(msg: K.setting_unbind_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onTapSubscribe() {
    if (_subscribeInfo?.url == null || _subscribeInfo!.url.isEmpty) return;
    BaseWebviewScreen.show(context, url: _subscribeInfo!.url);
  }

  ///关注微信公众号
  void _addSubscribeItem(List<Widget> widgets) {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    IThirdPlatform? wechatPlatform = loginManager.getThirdPlatforms().firstWhereOrNull((e) => e.tag() == 'wechat');
    if ((_subscribeInfo?.show ?? false) && wechatPlatform != null && wechatPlatform.supportLogin()) {
      widgets.add(SettingItemWidget(
        title: K.setting_follow_wechat,
        trailingWidget: Text(
          (_subscribeInfo?.subscribed ?? false) ? K.setting_follow_wechat_done : K.setting_follow_wechat_desc,
          style: TextStyle(
            fontSize: 15,
            color: (_subscribeInfo?.subscribed ?? false) ? R.color.secondTextColor : R.color.mainBrandColor,
          ),
        ),
        onClicked: _onTapSubscribe,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var isGod = _role == Util.parseInt(UserRole.DISABLED) || _role == Util.parseInt(UserRole.GOD);
    var isCard = isGod || _money != null;
    var isIncome = isCard && Util.isIdAuthenticated(idCard: _idcard) && !Util.isVerify && Util.isAndroid;

    List<Widget> children = [
      SettingItemWidget(
        title: K.setting_cellphone,
        trailingText: (_phone == null || _phone!.isEmpty) ? K.setting_unbind : Utility.formatPhone(_areaCode, _phone!),
        onClicked: _onTapPhone,
      )
    ];

    //关注公众号
    _addSubscribeItem(children);

    children.addAll(_thirdAccountsItems);
    if (_bioLoginTitle != null) {
      children.add(SettingItemWithSwitchWidget(
        title: _bioLoginTitle!,
        value: LocalAuth.isUsed(Session.uid),
        onChanged: _onBioBindValueChanged,
      ));
    }
    children.addAll([
      const SettingDividerWidget(),
      // SettingItemWidget(
      //   title: K.setting_safe_cellphone,
      //   trailingText: (_safe_mobile == null || _safe_mobile!.isEmpty)
      //       ? K.setting_unbind
      //       : Utility.formatPhone(_safe_area_code, _safe_mobile!),
      //   onClicked: _onTapSafePhone,
      // ),
      if (!Util.isLocale && isCard)
        SettingItemWidget(
            title: K.setting_user_auth,
            trailingText: _getVerifyStr(),
            onClicked: () {
              IdAuth.show(context);
            }),
      if (isCard || isIncome) const SettingDividerWidget(),
      SettingItemWidget(
        title: K.setting_delete_account,
        trailingText: null,
        onClicked: () {
          ApplyCancellation.show(context);
        },
      )
    ]);

    return Scaffold(
      appBar: BaseAppBar(K.account_setting_title),
      body: ListView(
        children: children,
      ),
    );
  }

  String _getVerifyStr() {
    String idCardStr = K.setting_un_auth;
    if (Util.isIdAuthenticated(idCard: _idcard)) {
      idCardStr = K.setting_already_auth;
    } else if (_idcard == 1) {
      idCardStr = K.setting_waiting_check;
    }

    return idCardStr;
  }
}
