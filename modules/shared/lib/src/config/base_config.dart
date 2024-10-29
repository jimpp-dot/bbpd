import 'package:shared/shared.dart';
import 'dart:io';

/// 部分差异化功能的配置开关，可以重写
class BaseConfig {
  static BaseConfig instance = BaseConfig();

  /// 可以在init.dart的initComponents中调用此方法改变配置，例如：BaseConfig.config(TeammateConfig());
  static void config(BaseConfig data) {
    instance = data;
  }

  String mainDomain = 'happyxq.cc.cn';

  /// 启动下发oss域名
  String initDomain = 'happyxq.cc.cn';

  // 以下是各功能配置开关：

  /// 本地服务器地址
  String get localDomain => '192.168.11.46';

  bool get roomSwitchPartyStyle => true;

  /// 个人资料页是否展现红人教程入口
  bool get showImageHotCourseEnter => false;

  /// 个人tab cdKey兑换入口
  bool get showCdKeyEntry => false;

  /// 房间礼物面板是否显示专属礼物提示banner
  bool get showGiftPanelBanner => false;

  /// 数数appId
  String get trackerAppId => System.isDevHost ? '4135588af6af4645a222978cdaeda0cf' : '317fc9f6d48f342d33cd039222b165c2';

  /// 房间私聊消息红点展现 数字样式
  bool get roomMsgShowNum => false;

  /// 自动搭讪
  bool get autoAccost => false;

  /// 订单钻石显示为召唤券，目前1券等于100钻，仅皮队友及马甲包使用
  bool get diamondShowCoupon => false;

  /// 小号消息助手
  bool get smallAccount => true;

  /// 是否使用music模块(MusicManager)
  bool get useMusicPkg => true;

  /// 爵位是否显示自动续费协议入口
  bool showAutoBuyProtocol = true;

  /// 是否显示语音验证码入口
  bool showVoiceCode = false;

  /// 是否使用avatar模块(AvatarManager)
  bool get userAvatarPkg => false;

  bool get showAvatarKtv => false;

  /// 是否展现资质列表
  bool get showCategoryList => true;

  String get mailAddress => 'kefu@happyxq.cc.cn';

  /// 签名文件（android/app/slp.keystore）对应的Sha1值。ps：若其他APP有变动则在其对应的config中复写。https://github.com/olaola-chat/cli-debug_limit
  String get sha1 => "1A:F0:41:AC:EF:F7:6A:02:FA:49:F2:3A:80:A5:3F:EB:80:A5:A1:40";

  /// 一键登录密钥
  String get oneKeySecret => Platform.isAndroid
      ? 'LQQRmWIcB298NBxbBBAyqif6uPr5pyGwzM3cqaK26PWSCmYqEjyJj27lCphwkTER+aa0s+i6fd1nNsaH2SBnGZHtwyWMQSzLmVQ3Lkq/c5n4fArwpODskrRQIfWwlnpElw7IIH87khTnJxyj9uBv7x2gu8RuqL2m5e/Cqx/j0i9CRt/oXeJiCSufq/qjuCCtMurqgT89JcLw3Tp9Bga0qLpXTPMtPCWn+8zq1JLskw5H2JB/vpvtiG0lpJmSgURpUka8vjqI26QaiEYvVSmPYQJUSrONz4hw00SaItbDjbd1F+7YIW1Xq8v7lLn+Musc'
      : 'clAqjz24ZhQ1m518Hl8SS+IRGQjhqeJD5xKXLLqGG3nWY9QytNghnx5iLWOeuNI0RBjphlEbVZuEOlomWgm+DrDwURIbu67V9fUZws+2vUG5HKNP0pqucLDZsVzd5zYMCu1Xh5SbdWvgd3F05RbVkDC7lL9sH95d+eSJhbcK2Xm1zUiWlYgg9l/EmuyYCTQdvpPRb69DyOD2ADl3J2EO/m6OFcPMMlrpucBg0a3AWZTqwJLvRW8FZ7vpOx7cWpcj';
}
