import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../iResourceLoader.dart';

typedef ContactSelectSubmitCallback = Function(BuildContext context, List<int> uidList, List<bool> isGroupList, Map room);

typedef ControllerButtonClick = Function(BuildContext context, bool selected);
typedef ControllerOpenBagPannel = Function(BuildContext context);

abstract class IRoomManager extends IResourceLoader {
  void init({bool withEnterPreCheck, bool canScrollChangeRoom = true});

  bool get withEnterPreCheck;

  /// 根据rid打开房间,额外单例处理
  /// [autoJoin] 自动上麦 rid == matchRid 才会上麦
  /// [autoMatch] 自动开启征召
  /// [cloudGame] 云游戏建房选择的游戏
  /// [inviterUid] 邀请进房消息的邀请者uid
  /// [isBiz] 是否商业化推荐
  /// [isNewCover] 是否新版直播封面
  void openChatRoomScreenShow(
    BuildContext context,
    int rid, {
    RoomFrom? from,
    int autoMatch = 0,
    int autoJoin = 0,
    int matchRid = -1,
    String? refer,
    String? source,
    int? uid,
    String? searchString,
    int inviterUid = 0,
    bool isBiz = false,
    bool newCreation = false,
    bool checkVideoGuide = false,
    int recommendUid = 0,
    int callDmUid = 0,
    bool isNewCover = false,
    int targetUid = 0,
    bool showKeyboardAfterLoaded = false,
    VoidCallback? onPageLoad,
    int? mainRid, // 关联的主房间rid，从主房间跳转到关联子房间时,会携带此参数,用于返回主房间
  });

  Future openAccompanyRoom(BuildContext context, List<int>? targetIds, List<String>? targetNames, String? partyType, String? roomType);

  Future openUserLevelUpDialog(BuildContext context,
      {String? type, String? title, String? imageURL, double percent = 0, String? subTitle, String? btnTitle, int level = 0});

  /// 清除最后一次展示的level数据,在App进行切换账号时需要
  void clearUserLevelUpLastBean();

  void topLiveToolDestroy();

  ///靓号售卖页
  void openPrettyIDSellPage(BuildContext context);

  void openInitOperateDisplay(BuildContext context, {String? refer, bool fromWolfHomePage = false});

  void openRoomModifyScreen(BuildContext context, {required int rid, bool showRoom = false});

  void openRoomIncomeScreen(BuildContext context, {required int rid});

  void openRoomAdminScreen(BuildContext context,
      {required int rid, dynamic purview, dynamic types, int? pos, int? uid, bool fullScreenDialog = false, String? defaultTab});

  /// 打开贡献题目页面
  void openContributeWordScreen(BuildContext context);

  int getTimestamp();

  int getServerTime();

  bool chatRoomDataExists();

  // 当前用户是否在麦上
  bool isMic();

  int getRid();

  ///获取消息列表界面视图
  Widget getMessageList({dynamic room, bool isNewWolfRoom = false});

  ///获取消息列表type == MessageType.Message的item视图
  Widget getMessageListItem(BuildContext context, {dynamic message, dynamic room});

  void setFirstRid(int rid);

  ///进房前检查弹窗
  ///返回值：true 进入， false 不进入
  Future<bool> checkToEnterRoom(BuildContext context,
      {required int rid, String? type, VoidCallback? onNegative, VoidCallback? onPositive, bool withOpenCheck = false});

  Future showContactSelectScreen(BuildContext context, ContactSelectSubmitCallback callback,
      {int? rid, int? preSelectUid, bool? hideRecentTab, bool? hideFriendTab, bool? hideGroupTab, bool? onlySelectOne, String? title});

  Future showWolfTestScreen(BuildContext context, {int mode = 1});

  ///剧本房切换到个人房
  ///打开显示个人房面板;
  ///点击对应的房间item时,如果当前操作用户没有个人房,则创建;如果当前操作用户有个人房,则修改为对应类型
  ///然后根据返回的rid刷新当前的剧本房间为个人房
  void openJubenToPersonalRoomDisplay(BuildContext context, {required int rid});

  //以弹层的方式调起个人资料  菜单只有 关注/邀约/打赏/看资料
  void goToImageScreenDialog(BuildContext context, dynamic roomPosition, dynamic room, {int? userId, Widget? topWidget});

  Widget getDefendBuyPanel({dynamic room, int? to, String? toName, int? type, List? config});

  Widget getInputMessage(BuildContext context, {dynamic room});

  Future openRoomGiftPanel(BuildContext context, {int? defaultGiftId, int? targetUid, String? defaultTab});

  Future<int> createWolfRoom(BuildContext context, String? title, String? type, int rid);

  Widget getShareInviteScreen(BuildContext context, {required int rid, int? musicId});

  /// 邀请更多好友
  Future inviteMoreFriendsScreen(BuildContext context, {Function(List<int> uids)? onFinish, List<int>? uids});

  /// 发起派对
  Future<int> openStartParty(BuildContext context, String type, {bool noPartyType = false, String? refer});

  ///新用户房间匹配卡片
  void openMatchCard(Map map);

  ///海龟汤-直接切换到或者创建个人房
  void openPersonalRoomDisplayDirect(BuildContext context, int puzzleId, {Map<String, String>? postData});

  ///滑动切换房间
  bool canScrollChangeRoom();

  ///粉丝团
  void openFansGroupPage(BuildContext context, int rid, int roomCreatorUid);

  ///粉丝团排名
  void openFansGroupRankPage(BuildContext context, int rid);

  /// 根据UID查找对应的RoomPosition的position
  int getPositionByUid(int uid);

  /// 指定用户是否在麦位上
  bool isUidOnPosition(int uid);

  /// 在通讯里页面点击邀请进房间按钮时候调用
  void createRoomAndInviteFriend(BuildContext context, int uid, {String? partyType, String? refer});

  /// 能否展示点唱标签
  bool isCanShowJukeboxLabel(String label);

  /// 打开房间表情面板
  Future openEmotePanel(BuildContext context, dynamic room, {Color? defineBarrierColor, VoidCallback? onSendSuccess, int? pubMsgInterval});

  /// 打开全服喇叭面板
  void openGlobalHornPanel(BuildContext context);

  ///房间数据查询
  void openRoomSearchRankScreen(BuildContext context);

  /// 打开房间分享面板
  void openRoomShareDialog(BuildContext context);

  Future<int?> openCreatePartyScreen(BuildContext context, {String? partyType, String? refer, bool openRoomScreen = true});

  ///购买骑士守护团
  Future openBuyKnightScreen(BuildContext context, {int level = 0});

  /// 房间底部工具栏按钮
  Widget getControllerIconButton({
    String? normalIcon,
    String? normalIconUrl,
    String? disabledIcon,
    String? selectedIcon,
    bool disabled = false,
    bool selected = false,
    bool isNewStyle = false,
    Color? backgroundColor,
    int buttonType = 0,
    String? buttonText,
    double textSize = 11.0,
    Color? normalIconColor,
    ControllerButtonClick? onClick,
    VoidCallback? onDisabledClick,
    String? type,
    ControllerOpenBagPannel? onOpenBag,
    bool iconShowRedPoint = false,
    Color? textColor,
    List<Color>? bgGradientColors,
  });

  ///
  Widget getBounceScaleAnimationWidget(
    Widget child, {
    int animation1Duration = 400,
    int animation2Duration = 200,
    double width = 0.0,
    double height = 0.0,
    bool useScaleTransition = true,
  });

  ///  房间底部工具栏礼物按钮
  Widget renderGift(dynamic room);

  /// 房间底部更多菜单
  Future<void> openRoomBottomMenu(BuildContext context, dynamic room);

  /// 房间左上角征召按钮
  Widget getLeftTopRecruitWidget(dynamic room, {EdgeInsetsGeometry? margin, dynamic state});

  /// 点唱房 用户点歌列表
  Future<void> openJukeMusicUserOrderList(BuildContext context, int rid, int uid);

  /// 是否在房间页面里
  bool isInRoomPage();

  /// 房间类型
  String getRoomFactoryType();

  /// 获取room_version参数值
  int getRoomVersionParaValue();

  /// 打开守护榜弹框页面
  void openKnightRankBottomSheet(BuildContext context, int rid, int uid, {String entryType = '', bool showBuyEntry = false});

  /// 退出房间 enforce : true 强制退房（不小窗）
  void exitRoom({bool enforce = false});

  /// 优质才艺主播展示
  void openTalentAnchorRankWidget(BuildContext context, {required int type});

  /// 心跳竞速：排行榜
  void openHeartRaceRank(BuildContext context);

  /// 开发者选项房间RTC类型选择
  Future<int?> showDevRoomRtcSelectDialog(BuildContext context);

  /// 开发者选项房间RTC类型名称
  String getDevCurRoomRtcDes(int type);

  /// 开发者选项房间即构ans类型选择
  Future<int?> showDevRoomZegoAnsSelectDialog(BuildContext context);

  /// 开发者选项房间即构ans类型名称
  String getDevCurRoomZegoAnsDes();

  /// 初始化Rtc SDK配置
  void initRtcSDKConfig();

  /// 房间表白面板
  /// [from] 0 - 默认展示麦上所有用户 1 - 只展示传入的[uid]用户
  void openVindicateActivityBottomSheetPage(BuildContext context, int uid, {int from = 0});

  /// 房间表白面板v2
  Future openConfessV2BottomSheet(BuildContext context);

  /// 甜蜜相册房间半弹层主操作面板
  Future openSweetAlbumMainPanel(BuildContext context);

  /// 甜蜜相册
  Future openSweetAlbum(BuildContext context, int targetUid, {String? refer});

  /// 礼物猜猜乐
  void openGuessGiftBottomSheetPage(BuildContext context);

  /// 打开点歌页面
  void openJukeMusicOrderV2Page(BuildContext context);

  /// 打开SVIP管家弹框
  void openAddSVipStewardDialog(BuildContext context, Map extra, {bool oneOnly = false, bool alwaysShow = false});

  /// 打开上座底部弹窗面板(选择普通位或老板位的面板)
  Future openMicUpWaitListBottomPanel(BuildContext context,
      {dynamic room, bool isBoss = false, bool isAuction = false, bool isAdmin = false});

  /// 打开靓号权益领取弹框
  void openPrettyIdRewardReceiveDialog(BuildContext context);

  /// 购买热度
  Future showBuyHotPage(BuildContext context, {int? rid});

  /// 亲密互动
  Future showIntimatePage(BuildContext context);

  /// 投票
  Future showVotePage(BuildContext context);

  /// 帽子榜单
  Future showHatRank(BuildContext context);

  /// 个人主页生日提醒入口
  Widget getProfileBirthdayEntryWidget({required int uid, String? rankTopName});

  /// 生日列表
  void openBirthdayListPage(BuildContext context);

  /// Gs排挡挂机弹框
  Future<void> openCheckGsOnHookDialog(BuildContext context, Map<String, dynamic> data);

  /// 隐形侠
  Future<void> openInvisibleManSuitPage(BuildContext context);

  /// 快捷送礼按钮
  Widget singleGiftButton(String? refer, int giftId, String? giftName, String? giftType, int price, List<int>? positions, int position,
      List<int> uids, Function(bool success)? completion, Widget child,
      {Key? key});

  /// 踢房/禁言技能库面板
  Future<void> openKickRoomRoomMuteBottomSheet(BuildContext context,
      {int uid = 0, String name = '', String avatarUrl = '', int rid = 0, bool isOfficial = false});

  /// PK记录-详情
  void showShowCrossPKResultDialog(BuildContext context, int pkId, int rid);

  /// 播放全屏动效
  Future<void> showAnimOverlay(
      {BuildContext? context,
      required String vapUrl,
      required int vapSize,
      List<String>? textList,
      List<String>? imageList,
      VoidCallback? onStartPlay,
      VoidCallback? onComplete,
      bool onlyShowInRoom = false});

  /// 页面栈退出到房间
  Future<void> popUtilRoom();

  Future showInputMessage(BuildContext context, {dynamic room});

  /// 跳转房间，如果是点唱房，打开点歌弹窗
  void openRoomWithSingerOrder(BuildContext context, int rid, int uid);

  /// 跳转房间并打开礼物面板
  /// [rid] 房间Id
  /// [tab] 礼物面板Tab
  /// [giftId] 礼物Id/商品cid(如果tab是背包)
  void openRoomWithGiftPanel(BuildContext context, int rid, {int giftId = -1, DisplayPage? tab});

  void showKaEvaluateDialog(BuildContext context);

  void openRoomWithHornPanel(BuildContext context, int rid, {int hornId = 0});

  /// 打开抢礼物红包列表面板
  Future showGiftRedEnvelopeGrabPanel(BuildContext context, int rid);
}

class RoomFrom extends PageRefer {
  static const RoomFrom default_from = RoomFrom('default');
  static const RoomFrom create = RoomFrom('create');
  static const RoomFrom globalMsg = RoomFrom('global_message');
  static const RoomFrom home = RoomFrom('home');
  static const RoomFrom home_nearby = RoomFrom('nearby', home);
  static const RoomFrom home_playing = RoomFrom('playing', home);
  static const RoomFrom live = RoomFrom('live');
  static const RoomFrom message = RoomFrom('message');
  static const RoomFrom notification = RoomFrom('notification');
  static const RoomFrom friend_list = RoomFrom('friend_playing_list');
  static const RoomFrom fans_list = RoomFrom('fans_list');
  static const RoomFrom follow_list = RoomFrom('follow_list');
  static const RoomFrom companion_list = RoomFrom('companion_list'); //陪伴榜
  static const RoomFrom message_nearby = RoomFrom('nearby', message);
  static const RoomFrom online_notification = RoomFrom('online_notification'); // 在线通知
  static const RoomFrom gift_panel = RoomFrom('gift_panel');
  static const RoomFrom fans_label_panel = RoomFrom('fans_label_panel');
  static const RoomFrom pub_club = RoomFrom('pub_club');
  static const RoomFrom room_tab_friend = RoomFrom('room_tab_friends'); //房间好友列表
  static const RoomFrom image_hot_user = RoomFrom('image_hot_user');
  static const RoomFrom new_room_recommend = RoomFrom('new_room_recommend'); // 新厅流量推荐
  static const RoomFrom awake_float_screen = RoomFrom('awake_float_screen'); // 觉醒全局飘屏
  const RoomFrom(String name, [RoomFrom? parent]) : super(name, parent);
}
