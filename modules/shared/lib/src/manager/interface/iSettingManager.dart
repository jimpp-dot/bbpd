import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../iResourceLoader.dart';

enum CertifyType {
  find,
  god,
  modify,
  security,
  youngmode,
  check,
  IdOnly, //仅认证"身份证号码和姓名"
  unbind, //解除实人认证
}

abstract class ISettingManager extends IResourceLoader {
  void openSettingScreen(BuildContext context);

  void openAccountSettingScreen(BuildContext context);

  void openBalanceScreen(BuildContext context, {String? refer});

  void openHelpScreen(BuildContext context);

  void openAboutScreen(BuildContext context);

  void openSafeMobileInputScreen(BuildContext context, {String? type, String? uid});

  void openSafeMobileCheckScreen(BuildContext context, {String? type, String? uid, String? phone, String? icon});

  void openLanguageScreen(BuildContext context);

  void showJuvenilesGuideDialog();

  Future<bool> showKillerCreateRoomCheckDialog();

  bool isJuvenilesModeActive();

  Future<bool> canUseBioLogin();

  Future<bool> authBio();

  bool isUsed(int uid);

  Future<bool?> openBindScreen(BuildContext context, {String type = 'bind', bool hiddenBack = false});

  Future openIdAuth(BuildContext context, {CertifyType? certifyType, bool godCertifySupportSkill = true});

  bool isAuthCheckFailed();

  Future openRechargeScreen(BuildContext context, {String refer = '', bool goToDetail = false});

  /// shareByUrl
  /// uid 值随tp标志含义不同 ： tp为1时,uid即为rid  (暂时,服务端逻辑)
  /// cid
  /// jid 剧本id-剧本专属
  /// rid 房间id
  /// needInApp 是否需要站内分享-即站内邀请好友,该功能需要rid参数
  /// title 分享顶部标题
  /// [topicId] 朋友圈分享动态id
  /// [competitionId] 赛事分享赛事id
  /// [teamId] 战队分享team_id
  /// [webViewTp] webView分享使用单独url，只需要tp参数
  /// [lineId] 画猜分享线条id
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
      dynamic shareInfo});

  ///shareByUrl
  void shareDirect(BuildContext context, int uid, String type, {int? tp, int? cid, String? base64Str, String? params});

  void openBindSafeMobileDialog(BuildContext context);

  void init({
    bool showInvite = false,
    bool showTempGroup = true,
  });

  bool showInvite();

  bool showTempGroup();

  void checkSecurityDelay();

  void checkSecurity();

  /// 人脸识别 新 带返回值
  Future<bool?> showFaceRecognitionDialog2({String firstTip = '', String secondTip = '', bool canSkip = true});

  /// 人脸识别 新 不带返回值
  void showFaceRecognitionDialog({String firstTip = '', String secondTip = '', bool canSkip = true, bool auto = false});

  void showExchangeScreen(BuildContext context, {String? refer});

  void showExchangeBeanScreen(BuildContext context, {String? refer});

  void showGeneralSetting(BuildContext context, bool notAutoCreateGroup, bool notAutoJoinGroup, bool closeEmoticon, int closeBoxReceive,
      {bool showBoxSetting = true});

  void showMsgSetting(BuildContext context);

  void showJuvenilesModeScreen(BuildContext context);

  Widget getJuvenilesModeScreen(BuildContext context);

  void openPrivarySettingScreen(BuildContext context, {bool? enableStrangerMsg, int? push_wakeup_chat, bool? nearbyInvisible});

  void openTradeHistoryScreen(BuildContext context);

  /// 设置公会ID(加入工会)
  void openUnionSetScreen(BuildContext context, {bool needRecommendBroker = false});

  /// 红人认证
  void openUserHotScreen(BuildContext context);

  ///授权登录
  void openWebAuthLogin(BuildContext context, String url);

  Widget getDrawerAccountSettingWidget();

  Widget getRechargeWidget({String? refer, int totalPrice = 0, bool isPaySheet = false});

  Future openRecommendTopDialog(BuildContext context);

  /// 账目明细
  void openStatementScreen(BuildContext context);

  /// 已收集个人信息清单
  void openInformationCollectedScreen(BuildContext context);

  /// 人脸识别二次确认弹框
  void openFaceRecognitionSecondaryDialog(BuildContext context,
      {String secondTip = '', VoidCallback onConfirmCloseCallback, VoidCallback onCancelCallback});

  /// 通用设置
  /// on  设置选项 0代表关闭关闭特效【开启特效】，1代表开启关闭特效【关闭特效】
  /// setting_type  需要设置的设置类型 0代表礼物特效
  Future<NormalNull> setGeneralSetting(int settingType, int on);

  /// 是否关闭了特效场景
  Future<bool> getCloseSpecialEffectsSceneFromGeneralSetting();

  /// 是否关闭生日提醒
  Future<bool> getCloseBirthdayReminderFromGeneralSetting();

  /// 主动招呼提醒弹框
  void showAutoCallRemindDialog(BuildContext context);

  /// 是否开启贵族专属麦座
  Future<bool> getOpenTitleExclusiveMicFromGeneralSetting();

  /// 打开限时充值大礼包
  Future showRechargeActivitySendDialog(BuildContext context, {String refer = ''});
}
