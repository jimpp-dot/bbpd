import 'package:flutter/material.dart';
import 'package:settings/src/page/balance/exchangeScreen.dart';
import 'package:settings/src/page/balance/recharge_activity_send_dialog.dart';
import 'package:settings/src/page/balance/recharge_screen.dart';
import 'package:settings/src/page/drawer_setting_account_widget.dart';
import 'package:settings/src/page/generalSetting.dart';
import 'package:settings/src/page/information_collected.dart';
import 'package:settings/src/page/messageSetting.dart';
import 'package:settings/src/page/privacySetting.dart';
import 'package:settings/src/page/security/accountSecurity.dart';
import 'package:settings/src/page/trade_history_screen.dart';
import 'package:settings/src/page/unionSetScreen.dart';
import 'package:settings/src/page/userHotScreen.dart';
import 'package:settings/src/page/web_auth_login_screen.dart';
import 'package:settings/src/widget/auto_call_remind_dialog.dart';
import 'package:shared/shared.dart';

import 'libs/local_auth.dart';
import 'model/pb/generated/general_setting.pb.dart';
import 'model/setting_repository.dart';
import 'page/aboutScreen.dart';
import 'page/accountSettingScreen.dart';
import 'page/balance/balanceScreen.dart';
import 'page/balance/banner/recommend_top_dialog.dart';
import 'page/balance/exchange_bean_screen.dart';
import 'page/bindSafeMobileDialog.dart';
import 'page/bindScreen.dart';
import 'page/face_recognition/face_recognition_secondary_dialog.dart';
import 'page/helpScreen.dart';
import 'page/id_auth.dart';
import 'page/juveniles/juvenilesGuideDialog.dart';
import 'page/juveniles/juveniles_mode.dart';
import 'page/languageScreen.dart';
import 'page/safeMobileCheckScreen.dart';
import 'page/safeMobileInputScreen.dart';
import 'page/settingScreen.dart';
import 'page/statementScreen.dart';

class SettingsManager implements ISettingManager {
  @override
  void openSettingScreen(BuildContext context) {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    SettingScreen.show(context);
  }

  @override
  void openAccountSettingScreen(BuildContext context) {
    AccountSettingScreen.show(context);
  }

  @override
  void openBalanceScreen(BuildContext context, {String? refer}) {
    BalanceScreen.show(context, refer: refer);
  }

  @override
  void openHelpScreen(BuildContext context) {
    HelpScreen.showHelpScreen(context);
  }

  @override
  void openAboutScreen(BuildContext context) {
    AboutScreen.show(context);
  }

  @override
  void loadStrings() {
//    initStrMap();
//    R.putLangStringMap(strMap);
  }

  @override
  void openSafeMobileInputScreen(BuildContext context, {String? type, String? uid}) {
    SafeMobileInputScreen.show(context, type: type, uid: uid);
  }

  @override
  void openSafeMobileCheckScreen(BuildContext context, {String? type, String? uid, String? phone, String? icon}) {
    SafeMobileCheckScreen.show(context, type: 'check', uid: uid.toString(), phone: phone, icon: icon);
  }

  @override
  void showJuvenilesGuideDialog() {
    JuvenilesGuideDialog.show();
  }

  @override
  Future<bool> showKillerCreateRoomCheckDialog() async {
    return true;
  }

  @override
  bool isJuvenilesModeActive() {
    return JuvenilesMode.isActive();
  }

  @override
  Future<bool> authBio() async {
    return LocalAuth.canUseBioLogin();
  }

  @override
  Future<bool> canUseBioLogin() async {
    return LocalAuth.authBio();
  }

  @override
  bool isUsed(int uid) {
    return LocalAuth.isUsed(uid);
  }

  @override
  Future<bool?> openBindScreen(BuildContext context, {String type = 'bind', bool hiddenBack = false}) async {
    bool? suc = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BindScreen(
        type: type,
        hiddenBack: hiddenBack,
      ),
      settings: const RouteSettings(name: '/bind'),
    ));
    return suc;
  }

  @override
  Future openIdAuth(BuildContext context, {CertifyType? certifyType, bool godCertifySupportSkill = true}) {
    return IdAuth.show(context, certifyType: certifyType, godCertifySupportSkill: godCertifySupportSkill);
  }

  @override
  Future openRechargeScreen(BuildContext context, {String refer = '', bool goToDetail = false}) {
    return RechargeScreen.show(context, refer: refer);
  }

  /// [uid] 值随tp标志含义不同 ： tp为1时,uid即为rid  (暂时,服务端逻辑)
  /// [cid] 技能id
  /// [tp] 1，是房间分享 2，是凶手的房间分享 3，是凶手的app分享 4-7，在非快乐星球的app是用户的分享
  /// 快乐星球的app里
  /// 5，是皮队友的分享 6，是陪玩CP的分享 7，是年终盛典的分享 8, 朋友圈分享 15, 赛事分享
  /// 19-战队邀请分享
  /// [jid] 剧本id-剧本专属
  /// [rid] 房间id
  /// [needInApp] 是否需要站内分享-即站内邀请好友,该功能需要rid参数
  /// [title] 分享顶部标题
  /// [source] 只有首页分享用到
  /// [topicId] 朋友圈分享动态id
  /// [webViewTp] webView分享使用单独url，只需要tp参数
  /// [tagId]话题Id
  @override
  void share(BuildContext context, int uid,
      {int? tp,
      int? cid,
      int? jid,
      int? rid,
      int? musicId,
      int? ptp,
      bool needInApp = false,
      bool newShareInRoom = false,
      String? title,
      String? source,
      int? topicId,
      int? competitionId,
      int? webViewTp,
      int? teamId,
      String? refer,
      int? tagId,
      int? lineId,
      Map? extra,
      dynamic shareInfo}) async {
    String url = '${System.domain}cloud/shareparams?uid=$uid';
    if (tp != null) {
      url += '&tp=$tp';
    }
    if (cid != null) {
      url += '&cid=$cid';
    }
    if (jid != null) {
      url += '&jid=$jid';
    }
    if (rid != null) {
      url += '&rid=$rid';
    }
    if (ptp != null) {
      url += '&ptp=$ptp';
    }
    if (source != null) {
      url += '&source=$source';
    }

    if (topicId != null) {
      url += '&topicid=$topicId';
    }

    if (competitionId != null) {
      url += '&competition_id=$competitionId';
    }

    if (teamId != null) {
      url += '&team_id=$teamId';
    }

    if (webViewTp != null && webViewTp > 0) {
      url = '${System.domain}mate/share/parameters?tp=$webViewTp';
    }

    if (tagId != null) {
      url += '&tagid=$tagId';
    }

    if (lineId != null) {
      url += '&line_id=$lineId';
    }

    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    bool shareStyleA = loginManager.showShareStyleA;
    if (!shareStyleA) {
      await loginManager.share(context, shareInfo, //info为null，走url获取
          rid: rid ?? 0,
          needInApp: needInApp,
          newShareInRoom: newShareInRoom,
          title: title,
          uid: uid,
          topicId: topicId ?? 0,
          url: url,
          refer: refer,
          extra: extra);
    } else {
      await loginManager.shareStyleA(
        context,
        shareInfo, //info为null，走url获取
        rid: rid ?? 0,
        musicId: musicId ?? 0,
        needInApp: needInApp,
        newShareInRoom: newShareInRoom,
        title: title,
        uid: uid,
        topicId: topicId ?? 0,
        url: url,
      );
    }
  }

  @override
  void shareDirect(BuildContext context, int uid, String type, {int? tp, int? cid, String? base64Str, String? params}) async {
    String url = '${System.domain}cloud/shareparams?uid=$uid';
    if (tp != null) {
      url += '&tp=$tp';
    }
    if (cid != null) {
      url += '&cid=$cid';
    }

    if (params != null) {
      url += '&params=${Uri.encodeComponent(params)}';
    }

    // h5直接带了base64Str时，不需要向服务器请求直接作为Base64解码成图片分享
    if (base64Str != null) {
      String localImgPath = await Util.base64ToFile(base64Str, true);
      ShareInfo info = ShareInfo(type: 3, localImgPath: localImgPath);
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      for (IThirdPlatform platform in loginManager.getThirdPlatforms()) {
        if (platform.tag() == type) {
          platform.onShareTap(context, info, null, null);
          break;
        }
      }
      return;
    }

    XhrResponse response = await Xhr.getJson(url);
    XhrError? error = response.error;
    if (error == null) {
      Map res = response.response as Map;
      if (res['success'] == true && res['data'] is Map) {
        ShareInfo info = ShareInfo.fromJson(res['data']);
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        for (IThirdPlatform platform in loginManager.getThirdPlatforms()) {
          if (platform.tag() == type) {
            platform.onShareTap(context, info, null, null);
            break;
          }
        }
      }
    }
  }

  @override
  void openBindSafeMobileDialog(BuildContext context) {
    BindSafeMobileDialog.openBindSafeMobileDialog(System.context);
  }

  bool _showInvite = false;
  bool _showTempGroup = true;

  @override
  void init({
    bool showInvite = false,
    bool showTempGroup = true,
  }) {
    _showInvite = showInvite;
    _showTempGroup = showTempGroup;
  }

  @override
  bool showInvite() {
    return _showInvite;
  }

  @override
  bool showTempGroup() {
    return _showTempGroup;
  }

  @override
  void openLanguageScreen(BuildContext context) {
    LanguageScreen.show(context);
  }

  @override
  void checkSecurity() {
    AccountSecurity.checkSecurity();
  }

  @override
  void checkSecurityDelay() {
    AccountSecurity.checkSecurityDelay();
  }

  @override
  bool isAuthCheckFailed() {
    return AccountSecurity.checkFailed;
  }

  @override
  Future<bool?> showFaceRecognitionDialog2({String firstTip = '', String secondTip = '', bool canSkip = true}) async {
    return await AccountSecurity.showFaceRecognitionDialog2(firstTip: firstTip, secondTip: secondTip, canSkip: canSkip);
  }

  @override
  void showFaceRecognitionDialog({String firstTip = '', String secondTip = '', bool canSkip = true, bool auto = false}) {
    AccountSecurity.showFaceRecognitionDialog(firstTip: firstTip, secondTip: secondTip, canSkip: canSkip, auto: auto);
  }

  @override
  void showExchangeScreen(BuildContext context, {String? refer}) {
    ExchangeScreen.show(context, refer: refer);
  }

  @override
  void showExchangeBeanScreen(BuildContext context, {String? refer}) {
    ExchangeBeanScreen.show(context, refer: refer);
  }

  @override
  void showGeneralSetting(BuildContext context, bool notAutoCreateGroup, bool notAutoJoinGroup, bool closeEmoticon, int closeBoxReceive,
      {bool showBoxSetting = true}) {
    GeneralSetting.show(context, notAutoCreateGroup, notAutoJoinGroup, closeBoxReceive, closeEmoticon, showBoxSetting: showBoxSetting);
  }

  @override
  void showMsgSetting(BuildContext context) {
    MessageSetting.show(context);
  }

  @override
  void showJuvenilesModeScreen(BuildContext context) {
    JuvenilesMode.show(context);
  }

  @override
  void openPrivarySettingScreen(BuildContext context,
      {bool? enableStrangerMsg, int? push_wakeup_chat, bool? nearbyInvisible, int? showDistance}) {
    PrivacySetting.show(context, enableStrangerMsg, push_wakeup_chat, nearbyInvisible, showDistance);
  }

  @override
  void openTradeHistoryScreen(BuildContext context) {
    TradeHistoryScreen.show(context);
  }

  @override
  Widget getJuvenilesModeScreen(BuildContext context) {
    return const JuvenilesMode();
  }

  @override
  void openUnionSetScreen(BuildContext context, {bool needRecommendBroker = false}) {
    UnionSetScreen.show(context, needRecommendBroker: needRecommendBroker);
  }

  @override
  void openUserHotScreen(BuildContext context) {
    UserHotScreen.show(context);
  }

  @override
  void openWebAuthLogin(BuildContext context, String url) {
    WebAuthLoginScreen.show(context, url);
  }

  @override
  Widget getDrawerAccountSettingWidget() {
    return const DrawerAccountSettingWidget();
  }

  @override
  Widget getRechargeWidget({String? refer, int totalPrice = 0, bool isPaySheet = false}) {
    return RechargeWidget(refer: refer, totalPrice: totalPrice, isPaySheet: isPaySheet);
  }

  @override
  Future openRecommendTopDialog(BuildContext context) {
    return RecommendTopDialog.openRecommendTopDialog(context);
  }

  @override
  void openStatementScreen(BuildContext context) {
    StatementScreen.show(context);
  }

  @override
  void openInformationCollectedScreen(BuildContext context) {
    InformationCollectedScreen.show(context);
  }

  @override
  void openFaceRecognitionSecondaryDialog(BuildContext context,
      {String secondTip = '', VoidCallback? onConfirmCloseCallback, VoidCallback? onCancelCallback}) {
    showDialog(
      context: System.context,
      barrierDismissible: false,
      builder: (context) {
        return FaceRecognitionSecondaryDialog(
          tip: secondTip,
          onConfirmCloseCallback: () {
            Navigator.of(context).pop();
            // 点击"确认关闭"则调用brokersafe/confirmClose，无参数
            AccountSecurity.sendBrokerSafeConfirmCloseRequest();
            if (onConfirmCloseCallback != null) {
              onConfirmCloseCallback();
            }
          },
          onCancelCallback: () {
            Navigator.of(context).pop();
            // 点击"取消"按钮时，再次弹人脸识别弹框
            if (onCancelCallback != null) {
              onCancelCallback();
            }
          },
        );
      },
    );
  }

  @override
  Future<NormalNull> setGeneralSetting(int settingType, int on) async {
    return await SettingRepository.setGeneralSetting(settingType, on);
  }

  @override
  Future<bool> getCloseSpecialEffectsSceneFromGeneralSetting() async {
    ResGetGeneralSetting resp = await SettingRepository.getGeneralSetting();
    return resp.data.closeSpecialEffectsScene == 1;
  }

  @override
  Future<bool> getCloseBirthdayReminderFromGeneralSetting() async {
    ResGetGeneralSetting resp = await SettingRepository.getGeneralSetting();
    return resp.data.closeBirthdayRemind == 1;
  }

  @override
  void showAutoCallRemindDialog(BuildContext context) {
    AutoCallRemindDialog.show(context);
  }

  @override
  Future<bool> getOpenTitleExclusiveMicFromGeneralSetting() async {
    ResGetGeneralSetting resp = await SettingRepository.getGeneralSetting();
    return resp.data.openTitleExclusiveMic == 1;
  }

  @override
  Future showRechargeActivitySendDialog(BuildContext context, {String refer = ''}) {
    return Future.value();

    // return RechargeActivitySendDialog.show(context);
  }
}
