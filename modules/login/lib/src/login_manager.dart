import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_popup.pb.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/src/high_risk_users_intercept/high_risk_users_goto_voice_verify_dialog.dart';
import 'package:login/src/phone/douyin_login_page.dart';
import 'package:login/src/phone/phone_login_verify.dart';
import 'package:login/src/phone/voice_code_button.dart';
import 'package:login/src/profile/complete_gender_age_widget.dart';
import 'package:login/src/profile/tag_set.dart';
import 'package:login/src/third/third_login.dart';

import 'account_auth/auth_dialog.dart';
import 'account_auth/verify_page.dart';
import 'easy_login.dart';
import 'login_help.dart';
import 'login_help_with_id_auth.dart';
import 'phone/phone_code.dart';

class LoginManager extends ILoginManager {
  List<IThirdPlatform> _thirdPlatforms = [];

  @override
  Future show(BuildContext context, {bool isBarrierDismissible = true}) {
    if (Util.isLoginBeforeBoot()) {
      return openLoginPrepare(context);
    }
    return EasyLogin.show(
        context: context, isBarrierDismissible: isBarrierDismissible);
  }

  @override
  Future openLoginProfile(BuildContext context,
      {bool replace = false, bool canBack = true}) {
    Tracker.instance.user_setOnce({
      'channel': DeviceInfo.channel,
    });
    PageRoute route = MaterialPageRoute(
      builder: (context) => ImproveProfile(
        canBack: canBack,
      ),
      settings: const RouteSettings(name: '/loginProfile'),
    );
    if (replace == true) {
      return Navigator.of(context).pushReplacement(route);
    }
    return Navigator.of(context).push(route);
  }

  @override
  Widget getLoginProfile({bool fromBoot = false}) {
    return ImproveProfile(canBack: !fromBoot);
  }

  @override
  Widget getLoginPage(bool isFromBoot) {
    return LoginLoadingPage(isFromBoot: isFromBoot);
  }

  @override
  Future openLoginPrepare(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginLoadingPage(),
        settings: const RouteSettings(name: '/login'),
      ),
      ModalRoute.withName('/'),
    );
  }

  @override
  Future openPhoneLogin(BuildContext context,
      {String type = 'login',
      bool isFromBoot = false,
      String? title,
      String? path}) {
    if ('login' == type) {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginPhonePage(
              isFromBoot: isFromBoot,
            ),
            settings: const RouteSettings(name: '/login'),
          ),
          ModalRoute.withName('/'));
    }
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPhonePage(isFromBoot: isFromBoot, type: type),
      settings: const RouteSettings(name: '/login'),
    ));
  }

  @override
  void loginByWechat(
    BuildContext context, {
    String type = 'login',
    OnLoginComplete? onComplete,
    OnLoginError? onError,
  }) {
    ThirdLogin.instance().login(
      context,
      ConnType.Wechat,
      loginType: type,
      onComplete: onComplete,
      onError: onError,
    );
  }

  @override
  void loginByQQ(
    BuildContext context, {
    String type = 'login',
    OnLoginComplete? onComplete,
    OnLoginError? onError,
  }) {
    ThirdLogin.instance().login(
      context,
      ConnType.QQ,
      loginType: type,
      onComplete: onComplete,
      onError: onError,
    );
  }

  ///是否在注册流程中的昵称界面显示邀请码输入
  bool _showInviteCode = false;

  @override
  void setShowInviteCode(bool show) {
    _showInviteCode = show;
  }

  @override
  bool getShowInviteCode() {
    return _showInviteCode;
  }

  bool _showInterestSetPage = false;

  @override
  bool get showInterestSetPage => _showInterestSetPage;

  @override
  set showInterestSetPage(bool show) {
    _showInterestSetPage = show;
  }

  @override
  void setupThirdPlatforms(List<IThirdPlatform> platforms) {
    _thirdPlatforms = platforms;
    for (var platform in _thirdPlatforms) {
      platform.initialize();
    }
  }

  @override
  Future<T?> share<T>(
    BuildContext context,
    ShareInfo? info, {
    int rid = 0,
    bool needInApp = false,
    bool newShareInRoom = false,
    String? title,
    int uid = 0,
    int topicId = 0,
    String? url,
    String? refer,
    Map? extra,
  }) {
    return Share.show(
      context,
      info,
      rid: rid,
      needInApp: needInApp,
      newShareInRoom: newShareInRoom,
      title: title,
      uid: uid,
      topicId: topicId,
      url: url,
      refer: refer,
      extra: extra,
    );
  }

  @override
  Future<T?> shareStyleA<T>(
    BuildContext context,
    ShareInfo info, {
    int rid = 0,
    int musicId = 0,
    bool needInApp = false,
    bool newShareInRoom = false,
    String? title,
    int uid = 0,
    int topicId = 0,
    String? url,
  }) {
    return ShareStyleA.show(
      context,
      info,
      rid: rid,
      musicId: musicId,
      needInApp: needInApp,
      newShareInRoom: newShareInRoom,
      title: title,
      uid: uid,
      topicId: topicId,
      url: url,
    );
  }

  @override
  Future<List<IThirdPlatform>> getValidPlatform() async {
    List<IThirdPlatform> thirdItems = [];
    for (IThirdPlatform platform in _thirdPlatforms) {
      if (platform.supportLogin()) {
        bool isInstalled = await platform.isInstalled();
        if (isInstalled) {
          thirdItems.add(platform);
        }
      }
    }
    return thirdItems;
  }

  @override
  List<IThirdPlatform> getThirdPlatforms() {
    return _thirdPlatforms;
  }

  @override
  Future<String?> selectPhoneAreaCode(BuildContext context) {
    return PhoneAreaCode.show(context);
  }

  bool _isNoviceGuide = false;

  @override
  set isNoviceGuide(bool show) {
    _isNoviceGuide = show;
  }

  @override
  bool get isNoviceGuide => _isNoviceGuide;

  @override
  Future initOneKey(String key) {
    return OneKeyLogin.init(key);
  }

  @override
  Future quitOneKey() {
    return OneKeyLogin.quitAuthPage();
  }

  @override
  Future<bool> checkEnvAvailable() {
    return OneKeyLogin.checkEnvAvailable();
  }

  @override
  Future<bool> openAccountList(List<AccountItem> account) async {
    bool suc = await Navigator.of(System.context)
        .push(MaterialPageRoute(builder: (context) {
      return LoginHelpWithIDAuth(
        accountItems: account,
      );
    }));
    return suc;
  }

  @override
  Future<String?> openTagSetPage(bool isModify, bool aboutSelf) async {
    return Navigator.of(System.context).push(MaterialPageRoute(
      builder: (context) => TagSet(
        isModify: isModify,
        aboutSelf: aboutSelf,
      ),
      fullscreenDialog: true,
      settings: const RouteSettings(name: '/tagSet'),
    ));
  }

  @override
  Future<bool?> bindPhone(BuildContext context,
      {bool isSafeBind = false,
      bool onlyAuthOwnPhone = false,
      bool isAutoBind = false,
      bool canSkip = false}) async {
    bool canPhoneAuth = await checkEnvAvailable();
    canPhoneAuth = false;

    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool hiddenBack = (isAutoBind && !canSkip);

    // 一键绑定失败的处理逻辑
    Future<bool?> oneKeyFailed() async {
      if (onlyAuthOwnPhone == false) {
        return settingManager.openBindScreen(context,
            type:
                isAutoBind ? 'auto_bind' : (isSafeBind ? 'safe_bind' : 'bind'),
            hiddenBack: hiddenBack);
      } else {
        Fluttertoast.showToast(
            msg: R.string('bind_failed_try_later'),
            gravity: ToastGravity.CENTER);
        return false;
      }
    }

    if (isAutoBind) {
      Tracker.instance.track(TrackEvent.mobileBindEntrance);
      int dateNow = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
      Config.set(
          BBConfigKey.lastTimeShowBindSafePhoneAlert, dateNow.toString());
    }

    if (canPhoneAuth) {
      Completer<bool> completer = Completer();
      OneKeyLoginResult? result = await OneKeyLogin.getLoginToken(
        uiConfig: OneKeyLoginUiConfig.auto()
          ..showChangeBtn = !onlyAuthOwnPhone
          ..isPhoneBind = true,
        oneKeyLoginListener: (result) async {
          if (result.success) {
            if (isAutoBind) {
              Tracker.instance.track(TrackEvent.mobileBindConfirm,
                  properties: {'is_auto': true});
            }
            // 获取登录授权码成功
            String? token = result.token;
            bool res = await _oneKeyBind(
              context,
              isAutoBind
                  ? 'auto_bind'
                  : (isSafeBind ? 'safe_bind' : 'mobile_bind'),
              token ?? '',
            ); // bind 已经在反作弊逻辑中使用，这里使用mobile_bind
            if (res == true) {
              return completer.complete(true);
            } else {
              return completer.complete(await oneKeyFailed());
            }
          } else if (result.shouldSwitch) {
            // 用户切换登录方式
            return completer.complete(await oneKeyFailed());
          } else if (result.cancel) {
            // 用户取消
            return completer.complete(false);
          } else if (result.navMoreViewClick) {
            // 用户跳过
            Log.d('navMoreViewClick');
            if (isAutoBind) {
              Tracker.instance.track(TrackEvent.mobileBindSkip);
            }
            return completer.complete(false);
          } else {
            Log.d(result.getMessage());
            return completer.complete(await oneKeyFailed());
          }
        },
      );
      if (!(result?.success ?? false)) {
        // 授权页调起失败
        return oneKeyFailed();
      } else {
        return completer.future;
      }
    } else {
      return oneKeyFailed();
    }
//    return false;
  }

  Future<bool> _oneKeyBind(
      BuildContext context, String type, String token) async {
    final DialogLoadingController controller = DialogLoadingController();
    controller.show(context: System.context);
    OneKeyLoginBean bean =
        await OneKeyLogin.verifyToken(token: token, type: type);
    controller.close();
    if (!(bean.success == true)) {
      Toast.show(context, bean.msg ?? R.string('commom_bind_failed'));
      return false;
    }
    Fluttertoast.showToast(msg: R.string('common_bind_succ'));
    Config.set('_is_auth', '1');

    return true;
  }

  @override
  Future<bool> openAuthDialog(BuildContext context,
      {required int type, required int newType, String? refer}) async {
    Tracker.instance.track(TrackEvent.dialog_spam_identity, properties: {
      'refer': refer ?? '/',
    });

    bool suc = false;
    if (newType < 0 && type >= 1 && type <= 3) {
      // 允许后台回退到老的认证方案
      suc = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AuthDialog(type: type),
      );
    } else {
      // 新认证方案
      if (newType == 7) {
        /// 人脸-新
        ResHomePopUpAuth resp = await BaseApi.loadFaceAuth();
        if (resp.success && resp.data.show) {
          ISettingManager? settingManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          suc = await settingManager?.showFaceRecognitionDialog2(
                  firstTip: resp.data.firstTips,
                  secondTip: resp.data.secondTips,
                  canSkip: resp.data.supportCancel) ??
              false;
        }
      } else {
        suc = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => NewAuthDialog(
            type: newType,
          ),
        );
      }
    }

    return Util.parseBool(suc, false);
  }

  @override
  Future<String?> showPhoneLoginVerify(
      BuildContext context, String mobile, String areaCode,
      {String type = 'login'}) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PhoneLoginVerify(
            mobile: mobile,
            areaCode: areaCode,
            type: type,
          );
        },
        settings: const RouteSettings(name: '/loginVerify'),
      ),
    );
  }

  @override
  Future showLoginHelp(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginHelp()));
  }

  /// 一键登录splash和一键登录样式设置（slp shadow）
  bool _slpShadow = false;

  @override
  bool get slpShadow => _slpShadow;

  @override
  set slpShadow(bool shadow) {
    _slpShadow = shadow;
  }

  ///完善资料流程的标题是否需要加粗
  bool _bold = false;

  @override
  bool get bold => _bold;

  @override
  void showBold(bool showBold) {
    _bold = showBold;
  }

  /// 分享样式
  bool _showShareStyleA = false;

  @override
  bool get showShareStyleA => _showShareStyleA;

  @override
  set showShareStyleA(bool shareStyleA) {
    _showShareStyleA = shareStyleA;
  }

  @override
  Future showCompleteInfoWidget(BuildContext context, {bool check = true}) {
    if (check) {
      if (((Util.validStr(Session.birthday)) && Session.sex > 0) ||
          Config.getBool(BBConfigKey.hasShowCompleteInfoToday(), false)) {
        return Future.value();
      }
      Config.setBool(BBConfigKey.hasShowCompleteInfoToday(), true);
    }

    return showModalBottomSheet(
        context: context,
        backgroundColor: R.color.mainBgColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        )),
        builder: (BuildContext context) {
          return const EditGenderAgeWidget();
        });
  }

  /// 快乐星球抖音渠道
  bool _isDouyinChannel = false;

  @override
  bool get isDouyinChannel => _isDouyinChannel;

  @override
  set isDouyinChannel(bool isDouyin) {
    _isDouyinChannel = isDouyin;
  }

  /// 是否安装了抖音
  @override
  Future<bool> isDouyinInstalled() async {
    List<IThirdPlatform> platforms = await getValidPlatform();
    IThirdPlatform? douyin =
        platforms.firstWhereOrNull((e) => e.tag() == 'douyin');
    return douyin != null;
  }

  @override
  Future openDouyinLogin(BuildContext context, bool douyinOnly,
      {String type = 'login'}) async {
    if (type == 'login') {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => DouyinLoginPage(douyinOnly: douyinOnly),
            settings: const RouteSettings(name: '/login'),
          ),
          ModalRoute.withName('/'));
    }
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DouyinLoginPage(douyinOnly: douyinOnly),
      settings: const RouteSettings(name: '/login'),
    ));
  }

  @override
  Future openOneKeyLogin(BuildContext context, {String type = 'login'}) {
    return OneKeyLogin.request(type: type);
  }

  @override
  Future openVerifyPage(BuildContext context, int type,
      {String certifyType = '',
      String secondTip = '',
      bool canSkip = true,
      bool auto = false}) async {
    return await VerifyPage.show(
        context: context,
        type: type,
        certifyType: certifyType,
        secondTip: secondTip,
        canSkip: canSkip,
        auto: auto);
  }

  @override
  Widget getVoiceCodeButton(VoidCallback onTapSend) {
    return VoiceCodeButton(
      onTapSend: onTapSend,
    );
  }

  @override
  void openHighRiskUsersInterceptDialog(BuildContext context) {
    if (Session.hasMobile) {
      HighRiskUsersGotoVoiceVerifyDialog.show(context);
    } else {
      ISettingManager settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.openIdAuth(context, certifyType: CertifyType.security);
    }
  }
}
