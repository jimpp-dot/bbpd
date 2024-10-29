import 'package:shared/shared.dart';
import 'package:flutter/widgets.dart';

import '../iResourceLoader.dart';

typedef OnLoginComplete = bool Function(Object result);

typedef OnLoginError = void Function(String message);

class AccountItem {
  final String icon;
  final String name;
  final int uid;

  AccountItem.fromJson(Map json)
      : icon = Util.notNullStr(json['icon']),
        name = Util.notNullStr(json['name']),
        uid = Util.parseInt(json['uid']);
}

abstract class ILoginManager extends IResourceLoader {
  /// 打开登录面板
  Future show(BuildContext context, {bool isBarrierDismissible = true});

  /// 通过手机验证码登录
  ///
  /// [type] login/bind/...
  /// [title] 标题
  /// [path] 来源路径
  Future openPhoneLogin(
    BuildContext context, {
    String type = 'login',
    String title,
    String path,
  });

  /// 微信登录
  void loginByWechat(
    BuildContext context, {
    String type = 'login',
    OnLoginComplete onComplete,
    OnLoginError onError,
  });

  /// QQ登录
  void loginByQQ(
    BuildContext context, {
    String type = 'login',
    OnLoginComplete onComplete,
    OnLoginError onError,
  });

  /// 打开完善注册资料页面
  ///
  /// [replace] push or replace
  Future openLoginProfile(BuildContext context,
      {bool replace = false, bool canBack = true});

  Widget getLoginProfile({bool fromBoot = false});

  /// 邀请码
  void setShowInviteCode(bool show);

  bool getShowInviteCode();

  void setupThirdPlatforms(List<IThirdPlatform> platforms);

  List<IThirdPlatform> getThirdPlatforms();

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
  });

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
  });

  /// 是否展示兴趣标签页面
  bool get showInterestSetPage;

  set showInterestSetPage(bool show);

  /// 选择手机区号页面
  Future<String?> selectPhoneAreaCode(BuildContext context);

  /// 是否展示新手引导
  bool get isNoviceGuide;

  set isNoviceGuide(bool show);

  /// 初始化
  Future initOneKey(String key);

  Future quitOneKey();

  /// 检查环境是否支持一键登录、认证，目前阿里云提供了检测接口
  Future<bool> checkEnvAvailable();

//  /// 获取login token，需要调用该方法的模块建议依赖login模块
//  /// [uiConfig] OneKeyLoginUiConfig
//  /// return OneKeyLoginResult
//  Future<dynamic> getPhoneLoginToken({dynamic uiConfig});

  // 展示安全手机号下的账号列表
  Future<bool> openAccountList(List<AccountItem> account);

  // 展示标签选择页面
  Future<String?> openTagSetPage(bool isModify, bool aboutSelf);

  /// [onlyAuthOwnPhone] 是否只允许一键绑定
  /// [isSafeBind] 是否为绑定安全手机号
  /// [isAutoBind] 是否为自动绑定优先绑定手机号 绑定不了绑定安全手机号
  /// [canSkip] autoBind模式下是否显示跳过按钮
  /// 返回值：true 绑定成功； false：绑定失败； null：用户取消操作
  Future<bool?> bindPhone(BuildContext context,
      {bool onlyAuthOwnPhone = false,
      bool isSafeBind = false,
      bool isAutoBind = false,
      bool canSkip = false});

  ///以showDialog方式打开AuthDialog
  Future<bool> openAuthDialog(BuildContext context,
      {required int type, required int newType, String? refer});

  /// 展示验证码界面
  Future<String?> showPhoneLoginVerify(
      BuildContext context, String mobile, String areaCode,
      {String type = 'login'});

  /// 登录遇到问题
  Future showLoginHelp(BuildContext context);

  Future<List<IThirdPlatform>> getValidPlatform();

  //前置登录，将该widget加入boot展示
  Widget getLoginPage(bool isFromBoot);

  /// 登录Loading页
  Future openLoginPrepare(BuildContext context);

  /// 一键登录splash和一键登录样式设置（slp shadow）
  bool get slpShadow;

  set slpShadow(bool shadow);

  ///完善资料流程的标题是否需要加粗
  bool get bold;

  void showBold(bool textbold);

  /// 分享样式
  bool get showShareStyleA;

  set showShareStyleA(bool shareStyleA);

  Future showCompleteInfoWidget(BuildContext context, {bool check = true});

  /// 抖音渠道
  bool get isDouyinChannel;

  set isDouyinChannel(bool isDouyin);

  /// 是否安装抖音
  Future<bool> isDouyinInstalled();

  /// 打开抖音登录
  Future openDouyinLogin(BuildContext context, bool douyinOnly,
      {String type = 'login'});

  /// 打开一键登录
  Future openOneKeyLogin(BuildContext context, {String type = 'login'});

  /// 打开人脸识别
  Future openVerifyPage(BuildContext context, int type,
      {String certifyType = '',
      String secondTip = '',
      bool canSkip = true,
      bool auto = false});

  /// 语音验证码按钮
  Widget getVoiceCodeButton(VoidCallback onTapSend);

  /// 打开高危风险用户弹框
  void openHighRiskUsersInterceptDialog(BuildContext context);
}
