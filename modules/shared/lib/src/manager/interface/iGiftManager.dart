import 'package:shared/shared.dart';
import 'package:shared/src/manager/iResourceLoader.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

const int NewbieComingId = 19661; //萌新驾到礼物ID，for Killer
const int NewbieRoomWarmUpId = 19660; //萌新加热卡礼物ID，for Killer

abstract class IGiftManager extends IResourceLoader {
  /// 私人一对一打赏
  /// [uid] 对方的uid
  /// /// [defaultId] 初次展示默认选中礼物ID，不设置默认不用传参
  /// [gameWishGift] 是否通过心愿调起礼物面板送礼
  /// [defaultTab] 默认显示的tab页
  Future showPrivateGiftPanel(
    BuildContext context, {
    required int uid,
    bool fromChat = false,
    int defaultId = -1,
    bool toLovers = false,
    bool gameWishGift = false,
    int topicId = 0,
    DisplayPage? defaultTab,
    String? refer,
    GiftScene? giftScene,
  });

  /// 群聊打赏
  Future showGroupGiftPanel(
    BuildContext context, {
    required int groupId,
    int uid = 0,
    bool fromChat = false,
    int defaultId = -1,
    DisplayPage? defaultTab,
    GiftScene? giftScene,
  });

  /// 打开礼物面板跳转到背包tab
  Future showBagTabOnRoomGiftPanel(
    BuildContext context, {
    required dynamic room,
    int uid,
    int defaultId = -1,
    bool isCpLinkPromote = false,
    String? refer,
  });

  /// 房间内打赏
  /// [room] ChatRoomData
  /// [uid] 打赏给房间内的某个用户，如果为空，则全麦打赏
  /// [initialPage] 0：礼物面板 1：背包面包
  /// [defaultId] 初次展示默认选中礼物ID，不设置默认不用传参
  /// [isCpLinkPromote] 连连看房间麦位助力打赏
  /// [mysteryPositions] 蒙面互动，蒙面GS麦序
  /// [defaultTab] 默认显示的tab页，推荐使用此参数、不用initialPage参数
  /// [refer] 来源
  Future showRoomGiftPanel(
    BuildContext context, {
    required dynamic room,
    int uid = 0,
    @Deprecated('此参数容易出错，推荐用defaultTab') int initialPage = 0,
    int defaultId = -1,
    bool isCpLinkPromote = false,
    List<int>? mysteryPositions,
    List<int>? debatePKUsers,
    DisplayPage? defaultTab,
    String? refer,
  });

  /// 房间内打赏, 支持外部传递GiftScene
  /// [room] ChatRoomData
  /// [uid] 打赏给房间内的某个用户，如果为空，则全麦打赏
  /// [initialPage] 0：礼物面板 1：背包面包
  /// [defaultId] 初次展示默认选中礼物ID，不设置默认不用传参
  /// [supportUseCoin] 是否支持使用金币礼物，默认是从session中取值
  /// [giftScene] 打赏礼物的场景
  /// [defaultTab] 默认显示的tab页，推荐使用此参数、不用initialPage参数
  Future showGifPanel(
    BuildContext context, {
    dynamic room,
    int uid = 0,
    int initialPage = 0,
    int defaultId = -1,
    SupportUseCoin supportUseCoin = SupportUseCoin.BySession,
    GiftScene? giftScene,
    DisplayPage defaultTab = DisplayPage.gift,
  });

  /// 订单追加打赏
  /// [oid] 订单id
  Future showOrderGiftPanel(
    BuildContext context, {
    required int oid,
  });

  /// 打开赠送礼物页面
  /// [cid] 礼物cid
  /// [num] 数量
  /// [name] 礼物名字
  Future openSendGift(
    BuildContext context, {
    required int cid,
    required int num,
    required String name,
  });

  /// 选人直接使用守护
  /// [cid] 礼物cid
  /// [num] 数量
  /// [name] 礼物名字
  Future selectPersonUseDefendGift(
    BuildContext context, {
    required int cid,
    required int num,
    required String name,
  });

  /// 获取所有的可打赏麦坑
  /// [room] ChatRoomData
  /// return List<RoomPosition>
  List getGiftUsers(dynamic room, {List<int>? mysteryPositions});

  /// 打开礼物选择面板，返回选中的礼物
  /// 仅显示礼物图标、名称、原价
  /// [gifts] 面板初始数据，可选参数
  /// return [Gift]选中的礼物
  Future<Gift?> openGiftSelectPanel(BuildContext context, double height,
      [List<Gift>? gifts]);

  /// 狼人房快捷送礼礼物一行显示
  /// [room] ChatRoomData
  /// [uid] 打赏给房间内的某个用户
  Widget showGiftPanelRow(BuildContext context,
      {required dynamic room, int uid = 0});

  /// 伴侣页送礼
  /// [mid] 打赏伴侣id
  Future showMarryGiftPanel(BuildContext context, {int mid = 0});

  /// 好声音送礼
  /// [uid] 打赏id
  Future showGoodVoiceGiftPanel(
    BuildContext context, {
    required int tUid,
    required int vid,
    required int stageId,
  });

  /// 礼物皮肤解锁弹窗
  ///
  Future showGiftSkinUnlockDialog(
      BuildContext context, String icon, String name);

  /// 打开超值礼包页面
  Future<bool?> showSuperGiftPack(BuildContext context, {int from});

  /// 充值礼物聚合页面
  Future showRechargePackCenter(BuildContext context, String type);

  /// 半屏充值礼物聚合页面
  Future showBottomRechargePackCenter(BuildContext context);

  /// 打开超值礼包弹窗
  Future<bool> showSuperPackDialog(BuildContext context);

  /// 超值礼包弹窗是否已经显示过了
  bool superPackDialogShowed();

  /// 显示获取超值礼包弹窗
  Future<bool?> showSuperGiftReceiveDialog(
      BuildContext context, Map<String, dynamic> jsonData);

  Future<SelectGiftInfo?> showChooseGiftPanel(
    BuildContext context, {
    dynamic room,
    double maxHeight = 0,
    String? title,
    bool showNum = true,
    String? subTitle,
    String? cancelDialogContent,
    int selectNum = 10,
  });

  /// 显示心愿礼物编辑面板(only for 管理员，接待，房主)
  Future<dynamic> showWishGiftEditPanel(BuildContext context, {dynamic room});

  /// 显示送心愿礼物面板
  Future<dynamic> showWishGiftSendPanel(BuildContext context, {dynamic room});

  /// 打开限时礼包弹窗
  Future<bool?> showLimitPackageDialog(BuildContext context,
      {ActivityPackData? data, int index = 0});

  /// 打开亲密互动发送邀请弹窗
  Future showIntimateInteractInviteDialog(BuildContext context);

  /// 公屏上方亲密互动提示条
  Widget getIntimateInteractPublicScreenWidget(int status, String name);

  void oneKeySendNewbieComing(BuildContext context, int cid);

  Future<bool?> openPrivateRoomGiftSelectPanel({
    BuildContext? context,
    int giftId = 0,
    int giftNum = 0,
    int uid = 0,
    int rid = 0,
  });

  Future openCombineGiftDialog(
      {BuildContext? context,
      int combineId = 0,
      int combineType = 0,
      String? combineName});

  /// 房间内 拍卖送欧气 打赏
  /// [rid] 房间ID
  /// [uid] 打赏给房间内的某个用户
  Future showRoomAuctionBlessGiftPanel(
    BuildContext context, {
    required int rid,
    required int uid,
    required String name,
    required String icon,
  });

  /// 设置进房门票礼物选择栏/房间门票礼物更换选择栏
  Widget getEnterRoomTicketGiftWidget(
    BuildContext context, {
    bool open = false,
    int selectGiftId = 0,
    Function(int giftId) onGiftItemTap,
  });

  /// 打开印象标记弹窗页
  Future openImpressTagGiftScreen(BuildContext context);

  /// 打开星座拍拍主弹窗
  Future openConstellationClapMainDialog(BuildContext context);

  /// 打开星座拍拍结果弹窗
  Future openConstellationClapResultDialog(BuildContext context);

  /// 首页星座拍拍倒计时浮窗
  Widget getConstellationClapFloatBox();

  /// 星座拍拍初始化判断
  void constellationClapInit({bool firstLaunch = false});

  /// 涂鸦礼物动效
  Widget getGraffitiGiftEffect(
      String icon, List<Offset> points, VoidCallback onComplete);

  /// 打开边框和角标设置面板（房间管理菜单的"房间设置"点击打开）
  Future openBorderAndCornerSettingPanel(BuildContext context, int rid);

  Future<int> getOneKeyWakeNum(int giftId);
}

/// 直播间打赏功能是否允许普通用户,默认为false
/// 为true时，所有用户均能打赏
///
/// 为false时
/// 直播间：
///      1.普通用户只能打赏主播
///      2.房主可以给所有用户打赏
bool get liveRewardAllUserSwitch {
  return AppConfig.getConfig(AppConfig.live_reward_all_user) == '1';
}

///是否支持金币礼物
enum SupportUseCoin { YES, NO, BySession }

/// 打赏场景
enum GiftScene {
  private, // 一对一打赏
  room_public, // 房间内全麦打赏，点击底部礼物按钮
  room_private, //房间内一对一打赏，点击个人资料打赏

  @deprecated
  order, // 下单追加打赏
  auction, //拍卖竞拍打赏
  theOneSpecialGift, //非诚勿扰，特殊礼物打赏
}

/// 展示哪一页
enum DisplayPage {
  gift,
  bag,
  shop,
  privilege, // 特权
  decorate, // 装扮
  pk, // 直播pk道具
  pubDrink, // 卡座酒桌
  luckyGift, // 幸运礼物
  interact, // 互动
  special_play, // 玩法
  relationship, // 守护者
  tower, // laya塔防
}

bool needShowMicUserPage(DisplayPage page) {
  return page == DisplayPage.pubDrink ||
      page == DisplayPage.special_play ||
      page == DisplayPage.gift ||
      page == DisplayPage.privilege ||
      page == DisplayPage.decorate ||
      page == DisplayPage.tower;
}

DisplayPage? parseDisplayPage(String? type) {
  if (type == null) return null;
  var list = DisplayPage.values
      .where((e) => e.name.toLowerCase() == type.toLowerCase())
      .toList();
  return list.isEmpty ? null : list.first;
}

bool isGiftSceneInRoom(GiftScene giftScene) {
  return giftScene == GiftScene.room_private ||
      giftScene == GiftScene.room_public ||
      giftScene == GiftScene.auction ||
      giftScene == GiftScene.theOneSpecialGift;
}

void jumpToVipScreen(BuildContext context, int rid) {
  Tracker.instance.track(TrackEvent.room_gift_control, properties: {
    'room_gift_click': 'vip',
    'rid': rid,
  });
  IVipManager manager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
  manager.showMyLevelScreen(context, initialTab: MyLevelTab.Vip);
}

void jumpToPrivilegeScreen(BuildContext context, int rid) {
  Tracker.instance.track(TrackEvent.room_gift_control, properties: {
    'room_gift_click': 'privilege_hook',
    'rid': rid,
  });
  IVipManager manager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
  manager.showMyLevelScreen(context, initialTab: MyLevelTab.Title);
}

void jumpToChatService() {
  int serviceId;
  String title;
  if (Session.vipNew >= 10 && Util.isVerify == false) {
    serviceId = 100000022;
    title = K.vip_service;
  } else {
    serviceId = 100000016;
    title = K.advisory_service;
  }

  IChatManager chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  chatManager.openUserChatScreen(
    Constant.context,
    type: 'private',
    targetId: serviceId,
    title: title,
  );
}
