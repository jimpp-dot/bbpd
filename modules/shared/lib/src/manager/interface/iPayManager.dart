import 'package:shared/shared.dart';
import 'package:shared/src/manager/iResourceLoader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef PayErrorCallback = void Function(bool isErrorCatch);

class IAPConfig {
  IAPConfig({
    required this.iapPrefix,
    required this.vipPrefix,
    required this.subscriptionPrefix,
    required this.autoSubPrefix,
    this.activityPrefix,
  });

  /// 商品前缀，如com.ly.bbpd.android
  final String iapPrefix;

  /// 爵位商品前缀, 如com.ly.bbpd.android.vip.1
  final String vipPrefix;

  /// 包月 季 年商品 如 com.ly.bbpd.android.sub.1
  final String subscriptionPrefix;

  /// 连续包月 季 年商品 如 com.ly.bbpd.android.subscription.1
  final String autoSubPrefix;

  /// 活动商品 如 com.ly.bbpd.android.activity
  final String? activityPrefix;
}

class PayManagerType {
  static const String weddingAppoint = 'wedding-date'; //预约婚礼
  static const String knightBuy = 'knight-buy'; //骑士守护
  static const String renewalArtist = 'renewal_artist'; //艺人续约
}

abstract class IPayManager extends IResourceLoader {
  static const String pTAvailable = 'available'; // 余额
  static const String pTA = 'ali'; // zhi +++  fu +++ bao
  static const String ptWd = 'wechat_sdk'; // 微信Skd
  static const String pTW = 'wechat'; // 微信小程序
  static const String pTWH5 = 'wechat_h5'; // 微信h5
  static const String pTRecharge = 'recharge'; // 充值
  static const String pTAums = 'aums.uac';

  /// yun +++++ shan +++++ fu

  /// 支付
  /// [key] 通过key缓存实例
  /// [type] 支付类型
  /// [args] 参数
  /// [productId] 内购商品id
  /// [onPayed]
  /// [onError]
  void pay(
    BuildContext context, {
    required String key,
    required String type,
    Map? args,
    String? productId,
    VoidCallback? onPayed,
    PayErrorCallback? onError,
    bool canUseCoin = true,
    String? refer,
    bool showLoading = true,
    VoidCallback? onPayAppOpen,
  });

  /// 销毁Pay实例
  void dispose(String key);

  /// 获取支付方式
  /// [accountType] 0：默认支付账户  1：下单账户，使用主app币支付
  Future<List<SheetItem>> getPTypes({@deprecated int accountType = 0});

  ///支付弹窗
  /// [onInterceptClose] 拦截close事件，true：关闭面板，false：不关闭面板
  Future<SheetCallback?> showPTSheet(
    BuildContext context,
    int price, {
    int accountType = 0,
    AsyncValueGetter<bool>? onInterceptClose,
    bool showBalance = true,
  });

  ///充值弹窗
  /// [onInterceptClose] 拦截close事件，true：关闭面板，false：不关闭面板
  /// [onlyRecharge]是否仅充值，true：仅充值，false：先判断余额是否足够支付，足够支付返回余额支付，余额不足展示充值弹窗
  /// [showDiamondRecharge] true; 余额不足时 先充值成钻石，然后再支付
  Future<SheetCallback?> showRechargeSheet(
    BuildContext context,
    int price, {
    int accountType = 0,
    AsyncValueGetter<bool>? onInterceptClose,
    String? title,
    String? tips,
    bool onlyRecharge = false,
    bool showDiamondRecharge = false,
  });

  /// 初始化内购
  void initIAP();

  /// 是否可以恢复内购
  Future<bool> canRestoreIAP();

  /// 恢复内购
  Future<bool> restoreIAP(BuildContext context);

  /// 获取iap配置
  IAPConfig getIAPConfig();

  List<Map> getAndroidPayData();

  /// 配置iap
  void setupIAPConfig(IAPConfig config);

  //配置android机器充值金额数据
  void setupAndroidPayData(List<Map>? data);

  ///使用金币支付头像礼物
  ///
  ///注意：dispose里面需要用传入的key把pay的instance也dispose掉
  void payAvatarGift(
      {required BuildContext context,
      required String key,
      required int money,
      required int rid,
      required List<int> uids,
      required int giftId,
      required int giftNum,
      VoidCallback? onPayed,
      PayErrorCallback? onPayError});

  /// 皮队友 - pay/create支付,会自动校验钻石是否足够进行支付.
  ///
  /// [platform] 支付类型,默认 available
  ///
  /// [type] 支付内容，比如弹幕 send-barrage
  ///
  /// [money] 支付金额
  ///
  /// [rid] 房间id,部分支付需要使用,可不传
  ///
  /// [params] 透传参数,内部会使用jsonEncode进行编码
  Future<NormalNull> matePayCreate(
    BuildContext context, {
    String platform = "available",
    required int money,
    required String type,
    int? rid,
    required Map params,
    String? refer,
  });
}
