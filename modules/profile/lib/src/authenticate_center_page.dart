import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/k.dart';
import 'package:profile/src/profile_page.dart' hide ProfilePage, ProfilePageState;
import 'package:profile/src/reception_auth_page.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';

import 'welcome_hi_edit_page.dart';

/// 认证中心
///
class AuthenticateCenter extends StatefulWidget {
  final bool? supportGod; //是否支持申请主播相关
  final bool supportRed; //是否支持红人认证
  final bool supportQualification; //是否支持主播资质认证
  final bool needRecommendBroker; //是否显示推荐公会

  const AuthenticateCenter({
    super.key,
    this.supportGod,
    this.supportRed = true,
    this.supportQualification = false,
    this.needRecommendBroker = false,
  });

  @override
  State<StatefulWidget> createState() {
    return _AuthenticateCenterState();
  }

  static Future<ReloadType?> show(
    BuildContext context,
    bool supportGod, {
    bool supportRed = true,
    bool supportQualification = false,
    bool needRecommendBroker = false,
  }) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AuthenticateCenter(
        supportGod: supportGod,
        supportRed: supportRed,
        supportQualification: supportQualification,
        needRecommendBroker: needRecommendBroker,
      ),
    ));
  }
}

class _AuthenticateCenterState extends State<AuthenticateCenter> {
  int _godLicenseVersion = 0; // 主播协议版本
  int _agreedGodLicenseVersion = 0; // 已同意的主播协议版本

  bool _mobileCertified = false;
  bool _cardCertified = false;

  ReloadType? _reloadType;

  final ILoginManager _loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

  final ISettingManager _settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);

  final ICertificateManager? _certificateManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CERTIFICATE);

  int _bid = 0; //公会ID
  // int _brokerAdmin = 0; //公会管理员 0，不是公会管理员；1，是公会管理员
  // String _brokerUrl; //公会url
  String? _receptionAuthUrl; //接待认证的链接
  String? _joinUnionUrl; // 加入工会链接

  bool _showWelcome = false;
  String _welcomeType = K.profile_welcome_state_none;
  String? _welcomeText;

  bool? _needVerify;

  @override
  void initState() {
    super.initState();

    _godLicenseVersion = Util.parseInt(Session.getValue('godlicense.version'));
    _agreedGodLicenseVersion = Util.parseInt(Session.getValue('agreement_version'));
    if (Session.isLogined) {
      _cardCertified = Session.idAuthenticated;
      _mobileCertified = Util.parseInt(Session.getValue('_mobile')) > 0;
    }

    _load();
  }

  Future _load() async {
    String url = "${System.domain}account/setinfo?v=9";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        Map data = res['data'];

        _bid = Util.parseInt(data['bid']);

        // _brokerAdmin = Util.parseInt(data['brokerAdmin']);
        //
        // _brokerUrl = data['brokerUrl'] ?? null;

        _receptionAuthUrl = data['reception_auth_url'];

        _joinUnionUrl = data['join_union_url'];

        _needVerify = !Util.isIdAuthenticated(idCard: Util.parseInt(data['idcard']));

        var welcome = data['welcome'];
        if (welcome is Map) {
          _showWelcome = Util.parseInt(welcome['show'], 0) == 1;
          _welcomeText = welcome['wel_text'];
          int state = Util.parseInt(welcome['state'], 0);
          _welcomeType = K.profile_welcome_state_none;
          if (state == 1) {
            _welcomeType = K.profile_welcome_state_check;
          } else if (state == 2) {
            _welcomeType = K.profile_welcome_state_done;
          }
        }

        if (mounted) {
          setState(() {});
        }
      }
    }

    _certificateManager?.getGodLicenseVersion().then((data) {
      _godLicenseVersion = Util.parseInt(Session.getValue('godlicense.version'));
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.profile_authenticate_center,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        onBackPressedCallback: () {
          Navigator.of(context).pop(_reloadType);
        },
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: _getSettings(),
          ),
        ),
      ),
    ).withCommonBg();
  }

  List<Widget> _getSettings() {
    List<Widget> items = [];

    bool isGod = Session.role == UserRole.DISABLED || Session.role == UserRole.GOD;
    bool godCertified = _godCertified();
    if (Util.isAndroidVerify) isGod = false;

    if (Util.isAndroidVerify == false && widget.supportGod == true) {
      if (godCertified && widget.supportQualification) {
        //认证了主播且支持认证资质的

        /// 资质
        items.add(
          SettingItemWidget(
            title: isGod ? K.profile_qualification : K.profile_add_qualification,
            nextIconColor: R.color.mainTextColor.withOpacity(0.2),
            height: 52,
            onClicked: () {
              _onQualificationClick();
            },
          ),
        );
      } else {
        if (!godCertified) {
          /// 进入申请主播界面
          items.add(SettingItemWidget(
            title: K.profile_god_authentication,
            nextIconColor: R.color.mainTextColor.withOpacity(0.2),
            height: 52,
            onClicked: _onGodAuthenticClick,
          ));
        }
      }
    }

    // /// 红人认证
    // if (!Util.isAndroidVerify && widget.supportRed) {
    //   items.add(
    //     SettingItemWidget(
    //       title: K.profile_hot_user_auth,
    //       nextIconColor: R.color.mainTextColor.withOpacity(0.2),
    //       height: 52,
    //       onClicked: () {
    //         _settingManager.openUserHotScreen(context);
    //       },
    //     ),
    //   );
    // }

    /// 加入工会
    items.add(
      SettingItemWidget(
        title: K.profile_join_union,
        trailingText: _bid > 0 ? '$_bid' : null,
        nextIconColor: R.color.mainTextColor.withOpacity(0.2),
        height: 52,
        onClicked: () {
          _onJoinUnionClicked();
        },
        onLongPressed: () {
          if (_bid > 0) {
            Clipboard.setData(ClipboardData(text: '$_bid'));
            Fluttertoast.showToast(msg: K.profile_already_copy_id([_bid.toString()]), gravity: ToastGravity.CENTER);
          }
        },
      ),
    );

    /// 接待认证(只在快乐星球和快乐星球马甲包出现)
    if (!Util.isStringEmpty(_receptionAuthUrl)) {
      items.add(SettingItemWidget(
        title: K.profile_reception_auth,
        nextIconColor: R.color.mainTextColor.withOpacity(0.2),
        height: 52,
        onClicked: () {
          ReceptionAuthPage.show(context);
        },
      ));
    }

    if (_showWelcome) {
      items.add(SettingItemWidget(
        title: K.profile_welcome_hi_title,
        trailingText: _welcomeType,
        nextIconColor: R.color.mainTextColor.withOpacity(0.2),
        height: 52,
        onClicked: () async {
          bool? suc = await WelcomeHiEditPage.show(context, _welcomeText);
          if (suc == true) {
            _load();
          }
        },
      ));
    }

    /// 人脸识别 _needVerify：0是已认证，1是待识别
    if (_needVerify != null) {
      items.add(
        SettingItemWidget(
          title: K.profile_face_recognition_title,
          trailingText: _needVerify! ? K.profile_not_authenticated_status : K.profile_authenticated_status,
          nextIconColor: R.color.mainTextColor.withOpacity(0.2),
          height: 52,
          onClicked: () async {
            if (_needVerify!) {
              ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
              bool result = await loginManager.openVerifyPage(context, 2, certifyType: 'broker');
              if (result == true) {
                Navigator.of(context).pop();
              }
            } else {
              Fluttertoast.showToast(msg: K.profile_authenticated_toast_text, gravity: ToastGravity.CENTER);
            }
          },
        ),
      );
    }

    // items.add(
    //   SettingItemWidget(
    //     title: K.profile_voice_auth,
    //     nextIconColor: R.color.mainTextColor.withOpacity(0.2),
    //     height: 52,
    //     onClicked: () {
    //       VoiceAuthPage.show(context);
    //     },
    //   ),
    // );

    return items;
  }

  /// 所有条件都满足的主播
  bool _godCertified() {
    Log.d('_cardCertified:$_cardCertified');
    Log.d('_mobileCertified:$_mobileCertified');
    Log.d('_godLicenseVersion:$_godLicenseVersion');
    Log.d('_agreedGodLicenseVersion:$_agreedGodLicenseVersion');
    return _agreedGodLicenseVersion > 0 && _agreedGodLicenseVersion >= _godLicenseVersion && _cardCertified && _mobileCertified;
  }

  /// 申请主播
  void _onGodAuthenticClick() async {
    Tracker.instance.track(TrackEvent.mine_page, properties: {
      'mine_page_click': 'apply_gs',
    });
    Log.d("=====>");
    if (!Session.isLogined) {
      _loginManager.show(context);
      return;
    }
    Log.d("====22=>");
    if (_settingManager.isJuvenilesModeActive()) {
      Fluttertoast.showCenter(msg: BaseK.K.under_minor_auth_notice);
      return;
    }
    Log.d("====33=>");
    if (_needVerify != null && _needVerify!) {
      bool? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: K.profile_hint,
              content: K.profile_god_must_certification,
            );
          });
      if (result != null && result) {
        _reloadType = ReloadType.GodLicenseVersion;
        await _settingManager.openIdAuth(context, certifyType: CertifyType.god, godCertifySupportSkill: widget.supportQualification);
        await _load();
        if (_needVerify != null && _needVerify!) {
          return;
        }
      }
    }

    _reloadType = ReloadType.GodLicenseVersion;
    if (_godLicenseVersion > 0 && _agreedGodLicenseVersion < _godLicenseVersion) {
      Log.d("====55=>");
      bool? agreed = await _certificateManager?.openGodLicenseDialog(context, _agreedGodLicenseVersion);
      if (agreed != true) return;
    }
    _reloadType = ReloadType.GodLicenseVersion;
    if (!_mobileCertified) {
      dynamic bindSuccess = await _settingManager.openBindScreen(context, type: 'bind');
      if (bindSuccess != true) return;
    }
  }

  /// 资质
  void _onQualificationClick() {
    if (!Session.isLogined) {
      _loginManager.show(context);
      return;
    }
    _reloadType = ReloadType.GodLicenseVersion;
    _certificateManager?.openCertificateVerifyScreen(context);
  }

  /// 加入工会
  void _onJoinUnionClicked() {
    if (_joinUnionUrl != null && _joinUnionUrl!.isNotEmpty) {
      String token = Session.getString('game_login_token', '');
      String url = _joinUnionUrl!.contains("?") ? '$_joinUnionUrl&token=$token' : '$_joinUnionUrl?token=$token';
      BaseWebviewScreen.show(context, url: url);
    } else {
      if (_bid > 0) {
        Clipboard.setData(ClipboardData(text: '$_bid'));
        Fluttertoast.showToast(msg: K.profile_already_copy_id([_bid.toString()]), gravity: ToastGravity.CENTER);
        return;
      }
      _settingManager.openUnionSetScreen(context, needRecommendBroker: widget.needRecommendBroker);
    }
  }
}
