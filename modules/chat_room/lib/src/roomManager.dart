// import 'package:agora/bbapi/agora_engine.dart';
import 'package:agora/agora.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/create_room/create.dart';
import 'package:chat_room/src/base/page/contactSelectScreen.dart';
import 'package:chat_room/src/base/page/contribute_word.dart';
import 'package:chat_room/src/base/page/data/room_search_rank_screen.dart';
import 'package:chat_room/src/base/page/room_invite_friend_widget.dart';
import 'package:chat_room/src/base/page/share_invite_screen.dart';
import 'package:chat_room/src/base/page/user_levelup_dialog.dart';
import 'package:chat_room/src/base/widget/bounce_scale_animation_widget.dart';
import 'package:chat_room/src/base/widget/controller_icon_button.dart';
import 'package:chat_room/src/base/widget/render_gift.dart';
import 'package:chat_room/src/base/widget/room_vap_overlay.dart';
import 'package:chat_room/src/base/widget/single_gift_button.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_result_dialog_v2.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_activity_page.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_music_user_order_list_widget.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/sweet_album_main_panel.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/sweet_album_page.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_page.dart';
import 'package:chat_room/src/confess_v2/confess_v2_activity_main.dart';
import 'package:chat_room/src/fans/fans_group_page.dart';
import 'package:chat_room/src/fans/fans_group_rank_page.dart';
import 'package:chat_room/src/guess_gift/guess_gift_page.dart';
import 'package:chat_room/src/live/knight/knight_buy_widget.dart';
import 'package:chat_room/src/live/talent_anchor_rank_widget.dart';
import 'package:chat_room/src/pretty_id/pretty_id_reward_receive_dialog.dart';
import 'package:chat_room/src/pretty_id/pretty_id_sell_page.dart';
import 'package:chat_room/src/rtc/dev/dev_room_rtc.dart';
import 'package:chat_room/src/rtc/dev/dev_room_zego_ans.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:zego_express_engine/common_api/zego_engine.dart';

import 'base/check_gs_onhook/views/check_gs_onhook_dialog.dart';
import 'base/create_room/create_party_screen.dart';
import 'base/message/messageNotifyItem.dart';
import 'base/moremenu/room_bottom_panel.dart';
import 'base/page/initOperate.dart';
import 'base/page/invite_more_screen.dart';
import 'base/page/start_party_service.dart';
import 'base/util/create_room_send_invite_helper.dart';
import 'base/widget/common_message_list/common_message_list_main_view.dart';
import 'base/widget/defendBuyPanel.dart';
import 'base/widget/emote/emote_panel.dart';
import 'base/widget/gift_red_envelope/gift_red_envelope_grab_panel.dart';
import 'base/widget/input_message.dart';
import 'base/widget/match_card_widget.dart';
import 'base/widget/topLive.dart';
import 'birthday_housekeeper/views/birthday_list_page.dart';
import 'birthday_housekeeper/views/profile_birthday_entry.dart';
import 'biz_plugin/evaluate/ka_app_evaluate_dialog.dart';
import 'biz_plugin/juke_music/page/juke_music_order_panel.dart';
import 'bonus/model/bonus_model.dart';
import 'chat_room_screen.dart';
import 'heartrace/widget/heart_race_rank_page.dart';
import 'horn/global_horn_panel.dart';
import 'invisible_man/views/invisible_man_suit_page.dart';
import 'kickroom_roommute/views/kick_room_room_mute_bottom_sheet.dart';
import 'live/knight/knight_rank_widget.dart';
import 'roomNavUtil.dart';

class RoomManager extends IRoomManager {
  RoomManager({bool addModel = true}) {
    RtcManager.inst.registerRtcEngine(
      [
        AgoraEngine(),
        ZegoEngine(),
      ],
    );

    _initRtcConfig();

    if (addModel == true) {
      RoomManager.addModel();
    }

    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    if (Session.isLogined) {
      appStateObserver.addListener(_onAppStateChanged);
    }
  }

  static void _initRtcConfig() {
    int serverValue = Util.parseInt(Config.get(SER_KEY, '0'));

    /// debug 环境key
    if (serverValue == 2 || serverValue == 3) {
      // FIXME: use a speical appid which is only for dev
      RtcBizConfig.initConfig(
        agoraConfig: EngineConfig(appId: 'ab397047e21c4a2a8530414c44710db8'),
        zegoConfig: EngineConfig(appId: '2036141278', appSign: '2394faf8548802aa8b74036689a5d37f35a6146a24850c0084b02822e3125f6d'),
        debugLog: true,
      );
    } else {
      RtcBizConfig.initConfig(
        agoraConfig: EngineConfig(appId: 'ab397047e21c4a2a8530414c44710db8'),
        zegoConfig: EngineConfig(
            enableMultiRoom: false, appId: '2036141278', appSign: '2394faf8548802aa8b74036689a5d37f35a6146a24850c0084b02822e3125f6d'),
        debugLog: false,
      );
    }
  }

  static void addModel() {
    globalProviders.add(ChangeNotifierProvider(create: (_) => GiftMediaModel(), lazy: false));
    globalProviders.add(ChangeNotifierProvider(create: (_) => BonusModel(), lazy: true));
  }

  _onLogin(String type, dynamic value) {
    AddSVipStewardSingleton.trigger();
    clearUserLevelUpLastBean();
  }

  _onLogout(String type, dynamic data) {
    AddSVipStewardSingleton.cancel();
  }

  ///app是否在前台
  bool isResumed = true;

  /// 应用前后台切换
  void _onAppStateChanged() {
    AppLifecycleState state = appStateObserver.value;
    bool resumed = state == AppLifecycleState.resumed;
    if (isResumed != resumed) {
      isResumed = resumed;
      Log.d('roomManager._onAppStateChanged _isResumed = $isResumed');
      if (isResumed) {
        AddSVipStewardSingleton.trigger();
      } else {
        AddSVipStewardSingleton.cancel();
      }
    }
  }

  bool _withEnterPreCheck = false;

  bool _canScrollChangeRoom = true;

  @override
  void init({bool withEnterPreCheck = false, bool canScrollChangeRoom = true}) {
    _withEnterPreCheck = withEnterPreCheck;
    _canScrollChangeRoom = canScrollChangeRoom;
  }

  @override
  bool get withEnterPreCheck {
    return _withEnterPreCheck;
  }

  /// [uid] 从某个uid用户踩房进来的
  /// [isBiz] 是否商业化推荐
  @override
  void openChatRoomScreenShow(
    BuildContext context,
    int rid, {
    RoomFrom? from,
    int autoMatch = 0,
    int autoJoin = 0,
    int matchRid = -1,
    String? refer,
    String? source,
    int? backRoomId,
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
    int? mainRid,
  }) async {
    if (AppConfig.isLowSideDevice) {
      /// 低端机，进房前清空页面堆栈
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
    ChatRoomScreen.show(
      context,
      rid,
      from: from ?? RoomFrom.default_from,
      autoMatch: autoMatch,
      refer: refer,
      source: source,
      backRoomId: backRoomId,
      autoJoin: autoJoin,
      matchRid: matchRid,
      uid: uid,
      searchString: searchString,
      inviterUid: inviterUid,
      isBiz: isBiz,
      newCreation: newCreation,
      checkVideoGuide: checkVideoGuide,
      recommendUid: recommendUid,
      callDmUid: callDmUid,
      targetUid: targetUid,
      showKeyboardAfterLoaded: showKeyboardAfterLoaded,
      onPageLoad: onPageLoad,
      mainRid: mainRid,
    );
  }

  @override
  Future openAccompanyRoom(BuildContext context, List<int>? targetIds, List<String>? targetNames, String? partyType, String? roomType) {
    return RoomAccompanyManager.openAccompanyRoom(context, targetIds ?? [], targetNames ?? [], partyType ?? '', roomType ?? '');
  }

  @override
  Future openUserLevelUpDialog(
    BuildContext context, {
    String? type,
    String? title,
    String? imageURL,
    double percent = 0,
    String? subTitle,
    String? btnTitle,
    int level = 0,
  }) {
    return UserLevelUpDialog.show(
      context,
      type: type ?? '',
      title: title ?? '',
      imageURL: imageURL ?? '',
      percent: percent,
      subTitle: subTitle ?? '',
      btnTitle: btnTitle ?? '',
      level: level,
    );
  }

  @override
  void clearUserLevelUpLastBean() => UserLevelUpDialog.clearLastBean();

  @override
  void topLiveToolDestroy() {
    TopLiveTool.destroy();
  }

  @override
  void openInitOperateDisplay(BuildContext context, {String? refer, bool fromWolfHomePage = false}) async {
    await RoomNavUtil.openInitOperateDisplay(context, refer: refer, fromWolfHomePage: fromWolfHomePage);
  }

  @override
  void openRoomModifyScreen(BuildContext context, {required int rid, bool showRoom = false}) {
    RoomNavUtil.openRoomModifyScreen(context, rid: rid, showRoom: showRoom);
  }

  @override
  void openRoomIncomeScreen(BuildContext context, {required int rid}) {
    RoomNavUtil.openRoomIncomeScreen(context, rid: rid);
  }

  @override
  void openRoomAdminScreen(BuildContext context,
      {required int rid, purview, types, int? pos, int? uid, bool fullScreenDialog = false, String? defaultTab}) {
    RoomNavUtil.openRoomAdminScreen(context,
        rid: rid, purview: purview, types: types, pos: pos, uid: uid ?? 0, fullScreenDialog: fullScreenDialog, defaultTab: defaultTab);
  }

  @override
  Future openBuyKnightScreen(BuildContext context, {int level = 0}) {
    if (!ChatRoomData.exists()) {
      return Future.value();
    }
    ChatRoomData roomData = ChatRoomData.getInstance()!;
    bool receptionOnMic = false;
    if (roomData.config?.property == RoomProperty.Business && roomData.positions.first.uid > 0) {
      receptionOnMic = true;
    }
    int? uid = roomData.createor?.uid;
    if (receptionOnMic) {
      uid = roomData.positions.first.uid;
    }
    return KnightBuyWidget.show(context, roomData.rid, uid ?? 0, roomData.isLiveRoom, level: level);
  }

  @override
  void openContributeWordScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ContributeWord(),
      settings: const RouteSettings(name: 'contributeWord'),
    ));
  }

  @override
  Widget getMessageList({room, bool isNewWolfRoom = false}) {
    return CommonMessageListMainVew(room: room, isNewWolfRoom: isNewWolfRoom);
  }

  @override
  Widget getMessageListItem(BuildContext context, {message, room}) {
    MessageContent msg = message;
    if (msg.type == MessageType.Notify) {
      return MessageNotifyItem(message: msg, room: room);
    }
    return MessageItem(message: msg, room: room);
  }

  @override
  int getServerTime() {
    return ChatRoomData.exists() ? ChatRoomData.getInstance()!.serverTime : 0;
  }

  @override
  bool chatRoomDataExists() {
    return ChatRoomData.exists();
  }

  @override
  bool isMic() {
    return ChatRoomUtil.isMic;
  }

  @override
  int getRid() {
    if (ChatRoomData.exists() && ChatRoomData.getInstance() != null) {
      return Util.parseInt(ChatRoomData.getInstance()!.rid, 0);
    }

    return 0;
  }

  @override
  int getTimestamp() {
    if (ChatRoomData.getInstance() != null) {
      return ChatRoomData.getInstance()!.timestamp;
    } else {
      return 0;
    }
  }

  @override
  void setFirstRid(int rid) {
    ChatRoomData.isFirstRid = rid;
  }

  @override
  Future<bool> checkToEnterRoom(BuildContext context,
      {required int rid, String? type, onNegative, onPositive, bool withOpenCheck = false}) async {
    if (!withEnterPreCheck) return true;
    return await ChatRoomUtil.checkToEnter(context,
        rid: rid, type: type, onNegative: onNegative, onPositive: onPositive, withOpenCheck: withOpenCheck);
  }

  @override
  Future showContactSelectScreen(BuildContext context, ContactSelectSubmitCallback callback,
      {int? rid, int? preSelectUid, bool? hideRecentTab, bool? hideFriendTab, bool? hideGroupTab, bool? onlySelectOne, String? title}) {
    return ContactSelectScreen.show(context, callback,
        rid: rid,
        preSelectUid: preSelectUid,
        hideFriendTab: hideFriendTab,
        hideRecentTab: hideRecentTab,
        hideGroupTab: hideGroupTab,
        onlySelectOne: onlySelectOne ?? false,
        title: title ?? '');
  }

  @override
  Future inviteMoreFriendsScreen(BuildContext context, {List<int>? uids, Function(List<int> uids)? onFinish}) {
    return InviteMoreScreen.show(context, onFinish: onFinish, uids: uids);
  }

  @override
  Future showWolfTestScreen(BuildContext context, {int mode = 1}) {
    IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
    return wereWolfManager.openWolfTestScreen(context, mode: mode);
  }

  @override
  void openJubenToPersonalRoomDisplay(BuildContext context, {required int rid}) async {
    await InitOperate.openJubenToPersonalRoomDisplay(context, rid: rid);
  }

  @override
  void goToImageScreenDialog(BuildContext context, roomPosition, room, {int? userId, Widget? topWidget}) {
    RoomNavUtil.goToImageScreenDialog(context, roomPosition, room, userId: userId, topWidget: topWidget);
  }

  @override
  Widget getDefendBuyPanel({room, int? to, String? toName, int? type, List? config}) {
    return DefendBuyPanel(room: room, to: to, toName: toName, type: type, config: config);
  }

  @override
  Widget getInputMessage(BuildContext context, {room}) {
    return InputMessage(room: room);
  }

  @override
  Future<int> createWolfRoom(BuildContext context, String? title, String? type, int rid) async {
    int result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return CreateRoomStep2(type: type, label: title, rid: rid);
    }));
    return result;
  }

  @override
  Future openRoomGiftPanel(BuildContext context, {int? defaultGiftId, int? targetUid, String? defaultTab}) async {
    if (!ChatRoomData.exists()) {
      return Future.value(null);
    }
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    List<RoomPosition> res = giftManager.getGiftUsers(ChatRoomData.getInstance()) as List<RoomPosition>;
    if (res.isEmpty && (targetUid == null || targetUid == 0)) {
      Fluttertoast.showToast(msg: K.room_no_one_to_reward, gravity: ToastGravity.CENTER);
      return Future.value(null);
    }
    await giftManager.showRoomGiftPanel(
      context,
      room: ChatRoomData.getInstance(),
      defaultId: defaultGiftId ?? -1,
      uid: targetUid ?? 0,
      defaultTab: parseDisplayPage(defaultTab),
    );
  }

  @override
  Widget getShareInviteScreen(BuildContext context, {required int rid, int? musicId}) {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    bool shareStyleA = loginManager.showShareStyleA;
    if (!shareStyleA) {
      return RoomInviteFriendWidget(rid: rid);
    } else {
      return ShareInviteScreen(rid: rid, musicId: musicId ?? 0);
    }
  }

  @override
  Future<int> openStartParty(BuildContext context, String type, {bool noPartyType = false, String? refer}) {
    return StartPartyService.start(context: context, partyType: type, refer: refer, noPartyType: noPartyType);
  }

  @override
  void openMatchCard(Map map) {
    MatchCardWidget.show(map);
  }

  @override
  void openPersonalRoomDisplayDirect(BuildContext context, int puzzleId, {Map<String, String>? postData}) async {
    await RoomNavUtil.openPersonalRoomDisplayDirect(context, puzzleId, postData: postData);
  }

  @override
  bool canScrollChangeRoom() {
    return _canScrollChangeRoom;
  }

  @override
  void openFansGroupPage(BuildContext context, int rid, int roomCreatorUid) {
    FansGroupPage.show(context, rid, roomCreatorUid);
  }

  @override
  void openFansGroupRankPage(BuildContext context, int rid) {
    FansGroupRankPage.show(context, rid);
  }

  @override
  Future<int?> openCreatePartyScreen(BuildContext context, {String? partyType, String? refer, bool openRoomScreen = true}) {
    double maxHeightRatio = 0.78;
    return displayModalBottomSheet(
      context: System.context,
      isBarrierDismissible: true,
      fullscreenDialog: false,
      disableTapDismissible: true,
      maxHeightRatio: maxHeightRatio,
      builder: (BuildContext context) {
        return Material(child: CreatePartyScreen(partyType: partyType, refer: refer, openRoomScreen: openRoomScreen));
      },
    );
  }

  @override
  int getPositionByUid(int uid) {
    RoomPosition? p = ChatRoomUtil.getPositionByUid(uid);
    if (p == null) {
      return -1;
    }
    return p.position;
  }

  @override
  bool isUidOnPosition(int uid) {
    return ChatRoomUtil.isUidOnPosition(uid);
  }

  @override
  void createRoomAndInviteFriend(BuildContext context, int uid, {String? partyType, String? refer}) {
    RoomHelper helper = RoomHelper(context, uid, partyType: partyType, refer: refer ?? '');
    helper.inviteToRoom();
  }

  @override
  bool isCanShowJukeboxLabel(String label) => ChatRoomUtil.isCanShowJukeboxLabel(label);

  @override
  Future openEmotePanel(
    BuildContext context,
    dynamic room, {
    Color? defineBarrierColor,
    VoidCallback? onSendSuccess,
    int? pubMsgInterval,
  }) async {
    return EmotePanel.show(
      context,
      room,
      defineBarrierColor: defineBarrierColor,
      onSendSuccess: onSendSuccess,
      pubMsgInterval: pubMsgInterval ?? 0,
    );
  }

  @override
  void openGlobalHornPanel(BuildContext context) {
    GlobalHornPanel.show(context);
  }

  @override
  void openRoomSearchRankScreen(BuildContext context) {
    RoomSearchRankScreen.show(context);
  }

  @override
  void openRoomShareDialog(BuildContext context) {
    if (!ChatRoomData.exists()) {
      return;
    }
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(
      context,
      ChatRoomData.getInstance()!.rid,
      tp: 1,
      needInApp: true,
      newShareInRoom: true,
      rid: ChatRoomData.getInstance()!.rid,
    );
  }

  @override
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
  }) {
    return ControllerIconButton(
      normalIcon: normalIcon,
      normalIconUrl: normalIconUrl,
      disabledIcon: disabledIcon,
      selectedIcon: selectedIcon,
      disabled: disabled,
      selected: selected,
      isNewStyle: isNewStyle,
      backgroundColor: backgroundColor,
      buttonType: buttonType,
      buttonText: buttonText,
      textSize: textSize,
      normalIconColor: normalIconColor,
      onClick: onClick,
      onDisabledClick: onDisabledClick,
      type: type,
      onOpenBag: onOpenBag,
      iconShowRedPoint: iconShowRedPoint,
      textColor: textColor,
      bgGradientColors: bgGradientColors,
    );
  }

  @override
  Widget getBounceScaleAnimationWidget(
    Widget child, {
    int animation1Duration = 400,
    int animation2Duration = 200,
    double width = 0.0,
    double height = 0.0,
    bool useScaleTransition = true,
  }) {
    return BounceScaleAnimationWidget(
      animation1Duration: animation1Duration,
      animation2Duration: animation2Duration,
      width: width,
      height: height,
      useScaleTransition: useScaleTransition,
      child: child,
    );
  }

  @override
  Widget renderGift(dynamic room) {
    return RenderGift(room: room);
  }

  @override
  Future<void> openRoomBottomMenu(BuildContext context, dynamic room) {
    return RoomBottomPanel.openRoomBottomMenu(context, room);
  }

  @override
  Widget getLeftTopRecruitWidget(dynamic room, {EdgeInsetsGeometry? margin, dynamic state}) {
    return LeftTopRecruitWidget(
      room: room,
      margin: margin,
      state: state,
    );
  }

  @override
  Future<void> openJukeMusicUserOrderList(BuildContext context, int rid, int uid) async {
    JukeMusicUserOrderListWidget.open(context, rid, uid);
  }

  @override
  bool isInRoomPage() {
    bool inRoomPage = false;
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    for (int i = 0; i < 20; i++) {
      int index = mainManager.appNavigatorObserverGetIndex("/room/");
      if (index > -1) {
        inRoomPage = true;
      } else {
        inRoomPage = false;
        break;
      }
    }

    return inRoomPage;
  }

  @override
  String getRoomFactoryType() {
    return ChatRoomData.getInstance()?.config?.originalRFT ?? '';
  }

  @override
  int getRoomVersionParaValue() {
    return RoomConstant.roomVersion;
  }

  @override
  void openKnightRankBottomSheet(BuildContext context, int rid, int uid, {String entryType = '', bool showBuyEntry = false}) {
    KnightRankWidget.show(context, rid, uid, true, entryType: entryType, showBuyEntry: showBuyEntry);
  }

  @override
  void exitRoom({bool enforce = false}) {
    ChatRoomScreen.disposeRoom = enforce;
  }

  @override
  void openTalentAnchorRankWidget(BuildContext context, {required int type}) {
    TalentAnchorRankWidget.show(context, type);
  }

  /// 心跳竞速：排行榜
  @override
  void openHeartRaceRank(BuildContext context) {
    HeartRaceRankPage.show(context: context);
  }

  @override
  Future<int?> showDevRoomRtcSelectDialog(BuildContext context) {
    return showRoomRtcSelectDialog(context);
  }

  @override
  String getDevCurRoomRtcDes(int type) {
    return getCurRoomRtcDes(type);
  }

  @override
  Future<int?> showDevRoomZegoAnsSelectDialog(BuildContext context) {
    return showZegoAnsSelectDialog(context);
  }

  @override
  String getDevCurRoomZegoAnsDes() {
    return getCurZegoAnsDes();
  }

  @override
  void initRtcSDKConfig() {
    RoomManager._initRtcConfig();
  }

  @override
  void openVindicateActivityBottomSheetPage(BuildContext context, int uid, {int? from}) {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room != null) {
      RoomNavUtil.openVindicateActivityBottomSheetPage(context, room, uid: uid, from: from ?? 0);
    }
  }

  @override
  Future openConfessV2BottomSheet(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return ConfessV2ActivityMain(room: ChatRoomData.getInstance()!);
      },
    );
  }

  @override
  Future openSweetAlbumMainPanel(BuildContext context) {
    return SweetAlbumMainPanel.show(context);
  }

  @override
  Future openSweetAlbum(BuildContext context, int targetUid, {String? refer}) {
    return SweetAlbumPage.show(context, targetUid, refer: refer);
  }

  @override
  void openGuessGiftBottomSheetPage(BuildContext context) {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room != null) {
      GuessGiftPage.show(context, room);
    }
  }

  /// 打开点歌页面
  @override
  void openJukeMusicOrderV2Page(BuildContext context) {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room != null) {
      JukeMusicOrderPanel.show(context, room);
    }
  }

  @override
  void openAddSVipStewardDialog(BuildContext context, Map extra, {bool oneOnly = false, bool alwaysShow = false}) {
    AddSVipStewardDialog.show(context, extra, oneOnly: oneOnly, alwaysShow: alwaysShow);
  }

  /// 打开上座底部弹窗面板(选择普通位或老板位的面板)
  @override
  Future openMicUpWaitListBottomPanel(
    BuildContext context, {
    dynamic room,
    bool isBoss = false,
    bool isAuction = false,
    bool isAdmin = false,
  }) async {
    var room0 = room;
    room0 ??= ChatRoomData.getInstance();

    return MicUpWaitList.show(
      context: context,
      builder: (BuildContext context) {
        return MicUpWaitList(
          room: room0,
          isBoss: isBoss,
          isAuction: isAuction,
          admin: isAdmin,
        );
      },
    );
  }

  @override
  void openPrettyIdRewardReceiveDialog(BuildContext context) {
    PrettyIdRewardReceiveDialog.show(context);
  }

  /// 购买热度
  @override
  Future showBuyHotPage(BuildContext context, {int? rid}) async {
    var rid0 = rid;
    rid0 ??= ChatRoomData.getInstance()?.rid;
    IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    vipManager.openBuyRoomHotPanel(context, rid0 ?? 0);
  }

  /// 亲密互动
  @override
  Future showIntimatePage(BuildContext context) async {
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showIntimateInteractInviteDialog(context);
  }

  /// 投票
  @override
  Future showVotePage(BuildContext context) async {
    var room = ChatRoomData.getInstance();
    VoteCreatePage.open(context, room!);
  }

  @override
  Future showHatRank(BuildContext context) async {
    return await HatActivityPage.launch(context);
  }

  @override
  Widget getProfileBirthdayEntryWidget({required int uid, String? rankTopName}) {
    return ProfileBirthdayEntry(uid, rankTopName ?? '');
  }

  @override
  void openBirthdayListPage(BuildContext context) {
    BirthdayListPage.show(context);
  }

  @override
  Future<void> openCheckGsOnHookDialog(BuildContext context, Map<String, dynamic> data) async {
    if (CheckGsOnHookDialog.isDisplayed) return;
    return CheckGsOnHookDialog.show(context, data);
  }

  @override
  Future<void> openInvisibleManSuitPage(BuildContext context) {
    return InvisibleManSuitPage.show(context);
  }

  @override
  Widget singleGiftButton(String? refer, int giftId, String? giftName, String? giftType, int price, List<int>? positions, int position,
      List<int>? uids, Function(bool success)? completion, Widget child,
      {Key? key}) {
    if (!ChatRoomData.exists()) {
      return const SizedBox.shrink();
    }

    ChatRoomData roomData = ChatRoomData.getInstance()!;

    return SingleGiftButton(
        roomData, refer ?? '', giftId, giftName ?? '', giftType ?? '', price, positions ?? [], position, uids ?? [], completion, child,
        key: key);
  }

  @override
  Future<void> openKickRoomRoomMuteBottomSheet(BuildContext context,
      {int uid = 0, String name = '', String avatarUrl = '', int rid = 0, bool isOfficial = false}) async {
    KickRoomRoomMuteBottomSheet.show(context, uid: uid, name: name, avatarUrl: avatarUrl, rid: rid, isOfficial: isOfficial);
  }

  @override
  void showShowCrossPKResultDialog(BuildContext context, int pkId, int rid) async {
    CrossPKResultDialogV2.showByRecord(context, pkId, rid);
  }

  @override
  void openPrettyIDSellPage(BuildContext context) {
    PrettyIDSellPage.show(context);
  }

  @override
  Future<void> showAnimOverlay(
      {BuildContext? context,
      required String vapUrl,
      required int vapSize,
      List<String>? textList,
      List<String>? imageList,
      VoidCallback? onStartPlay,
      VoidCallback? onComplete,
      bool onlyShowInRoom = false}) async {
    RoomVapOverlay.show(
        context: context,
        vapUrl: vapUrl,
        vapSize: vapSize,
        textList: textList,
        imageList: imageList,
        onStartPlay: onStartPlay,
        onComplete: onComplete,
        onlyShowInRoom: onlyShowInRoom);
  }

  /// 页面栈退出到房间
  @override
  Future<void> popUtilRoom() async {
    bool roomScreenExist = ChatRoomScreen.roomScreenExist;
    Log.d('RoomManager popUtilRoom roomScreenExist=$roomScreenExist');
    if (roomScreenExist) {
      Navigator.of(System.context).popUntil(
        (route) {
          return route.settings.name?.startsWith('/room/') ?? false;
        },
      );
    }
  }

  @override
  Future showInputMessage(BuildContext context, {room}) {
    return InputMessage.show(context, room ?? ChatRoomData.getInstance());
  }

  @override
  void openRoomWithSingerOrder(BuildContext context, int rid, int uid) {
    openChatRoomScreenShow(
      context,
      rid,
      onPageLoad: () {
        if (ChatRoomData.exists()) {
          ChatRoomData roomData = ChatRoomData.getInstance()!;
          if (roomData.config?.factoryType == RoomFactoryType.BusinessMusic) {
            JukeMusicOrderPanel.show(context, roomData, singerUid: uid);
          }
        }
      },
    );
  }

  @override
  void openRoomWithGiftPanel(BuildContext context, int rid, {int giftId = -1, DisplayPage? tab}) {
    openChatRoomScreenShow(
      context,
      rid,
      onPageLoad: () {
        IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(System.context, room: ChatRoomData.getInstance(), defaultId: giftId, defaultTab: tab);
      },
    );
  }

  @override
  void showKaEvaluateDialog(BuildContext context) {
    KaAppEvaluateDialog.checkAndShow(context);
  }

  @override
  void openRoomWithHornPanel(BuildContext context, int rid, {int hornId = 0}) {
    openChatRoomScreenShow(
      context,
      rid,
      onPageLoad: () {
        GlobalHornPanel.show(context, hornId: hornId);
      },
    );
  }

  @override
  Future showGiftRedEnvelopeGrabPanel(BuildContext context, int rid) async {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room?.rid != rid) return;
    return GiftRedEnvelopeGrabPanel.show(context, room!);
  }
}
