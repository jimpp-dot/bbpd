import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:chat_room/src/base/widget/bottom_follow_dialog.dart';
import 'package:chat_room/src/base/widget/cpMatchResult.dart';
import 'package:chat_room/src/base/widget/mic_closed_dialog.dart';
import 'package:chat_room/src/base/widget/room_loading_page.dart';
import 'package:chat_room/src/base/widget/room_vap_overlay.dart';
import 'package:chat_room/src/base/widget/room_welcome_dialog.dart';
import 'package:chat_room/src/chat_room_page.dart';
import 'package:chat_room/src/protobuf/generated/room.screen.welcome.pb.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../chat_room.dart';
import '../k.dart';
import 'base/widget/common_message_list/message_tab_logic.dart';
import 'base/widget/common_message_list/new_message_logic.dart';
import 'base/widget/common_message_list/welcome_user_list_logic.dart';
import 'base/widget/notice_fans_widget.dart';
import 'base/widget/topLive.dart';

class _RoomArgs {
  final int rid;
  final int? autoMatch;
  final int? autoJoin;
  final int? matchRid;
  final int? uid;
  final RoomFrom? from;
  String? refer;
  String? source;
  final int? backRoomId;
  final String? searchString;
  final int? inviterUid;
  final bool isBiz;
  final bool newCreation;
  final int? callDmUid;
  final bool isNewCover;
  final int? targetUid;
  final bool showKeyboardAfterLoaded;
  final VoidCallback? onPageLoad;
  final int? mainRid;

  _RoomArgs(
    this.rid,
    this.autoMatch,
    this.autoJoin,
    this.matchRid,
    this.from,
    this.refer,
    this.source,
    this.backRoomId,
    this.uid,
    this.searchString,
    this.inviterUid,
    this.isBiz,
    this.newCreation,
    this.callDmUid,
    this.isNewCover,
    this.targetUid,
    this.showKeyboardAfterLoaded,
    this.onPageLoad,
    this.mainRid,
  );

  @override
  String toString() =>
      'RoomArgs(rid: $rid, autoMatch: $autoMatch, autoJoin: $autoJoin, matchRid: $matchRid, uid: $uid, from: $from, refer: $refer, source: $source, mainRid: $mainRid)';
}

const String LOG_TAG = "ChatRoomScreen";

class ChatRoomScreen extends StatefulWidget {
  /// 打开新的房间
  static const String eventOpenRoom = "event.room.open";
  static int lastRid = 0;
  static int openingRid = -1;

  final int rid;
  final int? autoMatch;
  final int? autoJoin;
  final int? matchRid;
  final int? uid; //点击好友进入房间的
  final RoomFrom? from;
  final String? refer;
  final String? source;
  final int? backRoomId;
  final String? searchString; //通过搜索进房间时搜索内容
  final int? inviterUid;
  final bool isBiz;

  ///是否商业化推荐
  final bool isNewCover;

  ///是否来自新版直播封面
  final bool newCreation;
  final int? callDmUid; //呼叫DM Uid
  final int? targetUid;
  final bool showKeyboardAfterLoaded;
  final VoidCallback? onPageLoad;
  final int? mainRid;

  static List<int>? ridList;
  static bool disposeRoom = false;
  static RoomFrom? lastFrom;
  static bool isLoading = false;
  static bool isLast = false;
  static bool isFirst = false;

  const ChatRoomScreen({
    Key? key,
    required this.rid,
    this.autoMatch,
    this.autoJoin,
    this.matchRid,
    this.from,
    this.refer,
    this.source,
    this.backRoomId,
    this.uid,
    this.searchString,
    this.inviterUid = 0,
    this.isBiz = false,
    this.newCreation = false,
    this.callDmUid,
    this.isNewCover = false,
    this.targetUid,
    this.showKeyboardAfterLoaded = false,
    this.onPageLoad,
    this.mainRid,
  }) : super(key: key);

  static bool showing = false;

  static show(
    BuildContext context,
    int rid, {
    RoomFrom from = RoomFrom.default_from,
    int autoMatch = 0,
    int autoJoin = 0,
    int matchRid = -1,
    String? refer,
    String? source,
    int? backRoomId,
    int? uid,
    int? vrid,
    String? searchString,
    int? inviterUid,
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
    Log.d('room: $showing, rid: $rid, refer: $refer', tag: LOG_TAG);
    if (showing) return;

    BuildContext systemContext = System.context;
    showing = true;
    try {
      if (Session.isLogined == false) {
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        loginManager.show(systemContext);
        return;
      }

      if (Session.getInt('deleted', 0) >= 2) {
        Fluttertoast.showToast(msg: K.room_cant_join_chat_room, gravity: ToastGravity.CENTER);
        return;
      }

      bool checkResult = await ChatRoomUtil.preCheck(systemContext, rid, checkVideoGuide: checkVideoGuide, recommendUid: recommendUid);
      if (!checkResult) return;
      _RoomArgs args = _RoomArgs(rid, autoMatch, autoJoin, matchRid, from, refer, source, backRoomId, uid, searchString, inviterUid, isBiz,
          newCreation, callDmUid, isNewCover, targetUid, showKeyboardAfterLoaded, onPageLoad, mainRid);
      _clearTopAndPushRoomScreen(systemContext, args);
    } finally {
      showing = false;
    }
  }

  static ModalRoute _createRoomRoute(_RoomArgs roomArgs) {
    String? refer = roomArgs.refer;
    if (refer == null) {
      if (ModalRoute.of(System.context) != null) {
        refer = ModalRoute.of(System.context)?.settings.name;
      } else {
        refer = '';
      }
    }
    return MaterialPageRoute(
      builder: (context) => ChatRoomScreen(
        rid: roomArgs.rid,
        autoMatch: roomArgs.autoMatch,
        autoJoin: roomArgs.autoJoin,
        matchRid: roomArgs.matchRid,
        from: roomArgs.from,
        refer: refer,
        source: roomArgs.source,
        backRoomId: roomArgs.backRoomId,
        uid: roomArgs.uid,
        searchString: roomArgs.searchString,
        inviterUid: roomArgs.inviterUid,
        isBiz: roomArgs.isBiz,
        newCreation: roomArgs.newCreation,
        callDmUid: roomArgs.callDmUid,
        isNewCover: roomArgs.isNewCover,
        targetUid: roomArgs.targetUid,
        showKeyboardAfterLoaded: roomArgs.showKeyboardAfterLoaded,
        onPageLoad: roomArgs.onPageLoad,
        mainRid: roomArgs.mainRid,
      ),
      settings: RouteSettings(name: '/room/${roomArgs.rid}', arguments: {'rid': roomArgs.rid}),
    );
  }

  static bool get roomScreenExist {
    bool hasRoom = false;
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex("/room/");
    if (index > -1) {
      hasRoom = true;
    }
    Log.d('Get room from navigator observer with index: $index, hasRoom: $hasRoom', tag: LOG_TAG);
    return hasRoom;
  }

  static bool get isTop => ModalRoute.of(System.context)?.settings.name?.startsWith('/room/') ?? false;

  static _clearTopAndPushRoomScreen(BuildContext context, _RoomArgs args) async {
    Log.d('Clear top router and navigate to ChatRoomScreen, args: $args', tag: LOG_TAG);
    if (roomScreenExist) {
      Log.d('RoomScreen exist, pushAndRemoveUntil...', tag: LOG_TAG);
      Navigator.of(context).popUntil(
        (route) {
          return route.settings.name?.startsWith('/room/') ?? false;
        },
      );
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        eventCenter.emit(ChatRoomScreen.eventOpenRoom, args);
      });
    } else {
      Log.d('RoomScreen not exist, push...', tag: LOG_TAG);
      Navigator.of(context).push(
        _createRoomRoute(args),
      );
    }
  }

  static updateStealth(ChatRoomData roomData) async {
    int stealth = await RoomRepository.updateRoomStealth(roomData.realRid);
    if (stealth >= 0) roomData.stealth = stealth;
  }

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> with WidgetsBindingObserver {
  int _rid = 0;
  int? _autoMatch;
  int? _autoJoin;
  int? _matchRid;
  int? _uid; //////从某个uid用户踩房进来的
  ChatRoomData? _room;
  int? _inviterUid;
  bool _newCreation = false; //创建的新房
  int? _mainRid;

  String? _lastNotificationIconPath;
  String? _lastOwnerName;

  late GlobalKey<ChatRoomPageState> roomPageKey;
  late GlobalKey leftPageKey;
  late GlobalKey rightPageKey;
  late PageController _pageController;
  bool _showStartMatchToast = false; //提醒房主开启征召

  /// 侧滑特殊的refer，传给服务端
  static const List<String> _SPECIAL_NEXT_REFER = ['flow_recommend', 'flow_friendplaying', 'near_by_person'];

  @override
  void initState() {
    super.initState();

    roomPageKey = GlobalKey<ChatRoomPageState>();
    leftPageKey = GlobalKey();
    rightPageKey = GlobalKey();

    _pageController = PageController(initialPage: 1);

    TopLiveTool.hide();
    WakelockPlus.enable();

    _initData();
    _initListeners();
    eventCenter.emit("Room.Ui.initState");

    bool hasRegistered = Get.isRegistered<WelcomeUserListLogic>();
    Get.put(WelcomeUserListLogic());
    Get.put(NewMessageLogic());
    Get.put(MessageTabLogic(currentTabRid: widget.rid));
    if (hasRegistered) {
      Log.d('initState, clearRoomGetLogic');

      /// 上一个房间的getx logic还未销毁（sreen的dispose没执行），会进行复用,清理下上个房间的数据
      clearRoomGetLogic(_rid);
    }
  }

  void _initListeners() {
    WidgetsBinding.instance.addObserver(this);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener(EventConstant.EventCertifyChange, _onCertifyEvent);
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.addListener(EventConstant.roomChangeRid, _onRoomChangeRid);
    eventCenter.addListener('JoinMic.Success', _onJoinMicSuccess);
    eventCenter.addListener(RoomConstant.Event_Join_Mic_Close, _onJoinMicClose);
    eventCenter.addListener(RoomConstant.Event_Update_Can_Scroll, _onUpdateCanScroll);
    eventCenter.addListener(ChatRoomScreen.eventOpenRoom, openNewRoom);
  }

  void _disposeListeners() {
    WidgetsBinding.instance.removeObserver(this);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener(EventConstant.EventCertifyChange, _onCertifyEvent);
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.removeListener(EventConstant.roomChangeRid, _onRoomChangeRid);
    eventCenter.removeListener('JoinMic.Success', _onJoinMicSuccess);
    eventCenter.removeListener(RoomConstant.Event_Join_Mic_Close, _onJoinMicClose);
    eventCenter.removeListener(RoomConstant.Event_Update_Can_Scroll, _onUpdateCanScroll);
    eventCenter.removeListener(ChatRoomScreen.eventOpenRoom, openNewRoom);
  }

  _onUpdateCanScroll(String type, dynamic data) {
    if (mounted) setState(() {});
  }

  void openNewRoom(String type, dynamic data) async {
    if (data is _RoomArgs) {
      await switchRoom(data);
      _RoomArgs args = data;
      if (args.onPageLoad != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (mounted) {
            args.onPageLoad?.call();
          }
        });
      }
    }
  }

  void _showWelcomeDialog(String type, dynamic data) {
    if (_room == null || data == null) {
      return;
    }
    try {
      WelcomePopup res = WelcomePopup.fromBuffer(data);
      Tracker.instance.track(TrackEvent.welcome_popup_exposure);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return RoomWelcomeDialog(_room!, res, () {
              _followRoomRole();
            });
          });
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  void _onJoinMicSuccess(String type, dynamic data) async {
    if (_room?.config == null) return;

    //模拟厅不上报
    if (_room?.config?.property != null && _room?.config?.property == RoomProperty.virtual) {
      return;
    }

    String roomType = _room!.config!.type;
    Map<String, dynamic> properties = {
      'rid': _room!.rid,
      'room_type': roomType,
      'time': DateTime.now().millisecondsSinceEpoch,
      'position_num': _room!.positions.length,
      'is_open_payer': _room!.config?.paier ?? 0,
      'is_boss': ChatRoomUtil.isBoss,
      'position_id': _room!.positionForCurrentUser?.position ?? -1,
    };
    if (_room!.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    }

    //标签
    if (!Util.isNullOrEmpty(_room!.config?.typeName)) {
      properties['type_label'] = _room!.config!.typeName;
    }

    //模板
    if (!Util.isNullOrEmpty(_room!.config!.originalRFT)) {
      properties['room_factory_type'] = _room!.config!.originalRFT;
    }

    //结算频道
    if (!Util.isNullOrEmpty(_room!.config!.settlementChannel)) {
      properties['settlement_channel'] = _room!.config!.settlementChannel;
    }
    Tracker.instance.track(TrackEvent.on_mic, properties: properties);
  }

  _onJoinMicClose(String type, dynamic data) async {
    if (_room == null) return;

    // 先关闭麦排申请列表在弹窗提示开麦
    _room!.emit(type, data);

    PermissionStatus status = await PermissionUtil.checkPermissions(context, Permission.microphone);
    if (status == PermissionStatus.granted) {
      // 等待麦排申请列表pop
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!mounted) return;
        displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return MicClosedDialog(model: MicCloseModel(false), room: _room!);
            });
      });
    }
  }

  _onQuiteFromBoss(String type, dynamic data) {
    int uid = data;
    if (!mounted || uid <= 0) return;
    Toast.showCenter(context, K.room_package_your_waitter);
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(context, room: _room, uid: uid);
  }

  _onLogout(String type, dynamic data) {
    if (Navigator.canPop(context)) {
      ChatRoomScreen.disposeRoom = true;
      Navigator.of(context).pop();
    }
  }

  _onCertifyEvent(String type, dynamic data) {
    _room?.needVerify = data;
    _room?.needVerifyNew = data;
  }

  _onSocketMessage(String type, dynamic data) async {
    if (type != EventConstant.WebsocketEventMessage || data == null) return;
  }

  static bool _lastCanScroll = true;

  void _refresh(int index) {
    if (!mounted) return;

    if (index == RoomLoadingPage.room) {
      bool scrollable = canScroll;
      // Log.d('Refreshing..., canScroll: $_canScroll, lastCanScroll: $_lastCanScroll, key: $roomPageKey, mounted: ${roomPageKey?.currentState?.mounted}');

      if (scrollable != _lastCanScroll) {
        _lastCanScroll = scrollable;
        setState(() {});
      }
      if (roomPageKey.currentState?.mounted == true) {
        roomPageKey.currentState?.setState(() {});
      } else {
        setState(() {});
      }
    } else if (index == RoomLoadingPage.left) {
      leftPageKey.currentState?.setState(() {});
    } else if (index == RoomLoadingPage.right) {
      rightPageKey.currentState?.setState(() {});
    }
  }

  void _onChanged(String type, dynamic data) {
    // Log.d('Receive change socket, start to refresh UI...');
    _refresh(RoomLoadingPage.room);

    showNotification();
  }

  void showNotification() {
    if (Util.isAndroid) {
      String? iconCacheFilePath = ChatRoomData.getInstance()?.iconCacheFilePath;
      String? ownerName = ChatRoomData.getInstance()?.ownerName;
      if (_checkJuveniles() && (iconCacheFilePath != _lastNotificationIconPath || ownerName != _lastOwnerName)) {
        _lastNotificationIconPath = iconCacheFilePath;
        _lastOwnerName = ownerName;
        SharedAppPlugin.showOngoingNotification(iconCacheFilePath, ownerName);
      }
    }
  }

  @override
  void dispose() {
    if (_rid == (ChatRoomData.getInstance()?.rid ?? 0)) {
      /// 防止出现后一个roomScreen先initState，前一个roomScreen再dispose，导致把最新的getx logic给delete了
      Log.d('Get.delete WelcomeUserListLogic');
      Get.delete<WelcomeUserListLogic>();
      Get.delete<NewMessageLogic>();
      Get.delete<MessageTabLogic>();
    } else {
      Log.d('dispose, ignore Get.delete WelcomeUserListLogic');
    }

    _disposeListeners();
    if (_room != null) {
      _clearRoomListeners(_room!);
      _cancelTimerTask();
    }

    if (_room != null && _room!.realRid > 0) {
      if (_room!.config != null && ChatRoomScreen.disposeRoom == false) {
        TopLiveTool.show(_room!);
      } else {
        _room?.dispose();
      }
    }

    CpMatchResultor.dismiss();
    RoomVapOverlay.dismiss();
    ChatRoomScreen.lastFrom = widget.from;
    WakelockPlus.disable();
    super.dispose();
    eventCenter.emit("Room.Ui.Disposed");
    if (Platform.isAndroid) {
      Future.delayed(const Duration(milliseconds: 100), () {
        SystemChrome.setSystemUIOverlayStyle(Util.isDark == true ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
      });
    }
  }

  void _initData() async {
    _rid = widget.rid;
    _autoMatch = widget.autoMatch;
    _autoJoin = widget.autoJoin;
    _matchRid = widget.matchRid;
    _uid = widget.uid;
    _inviterUid = widget.inviterUid;
    _newCreation = widget.newCreation;
    _mainRid = widget.mainRid;

    ChatRoomScreen.isLoading = true;
    changeRoom(_rid).then((data) {
      Log.d('RoomData inited, start to refresh UI...');
      ChatRoomScreen.isLoading = false;
      _inviterUid = 0;
      if (mounted) setState(() {});
    });

    if (Platform.isAndroid &&
        DeviceInfo.androidSdkInt >= 31 &&
        Config.getBool('has_request_${Permission.bluetoothConnect}', false) == false) {
      PermissionUtil.checkAndRequestPermissions(context, Permission.bluetoothConnect);
    }
  }

  Future<int> getNextRid(bool isNext) async {
    String from = '${widget.from ?? RoomFrom.default_from}';
    if (!Util.isStringEmpty(widget.refer) && _SPECIAL_NEXT_REFER.contains(widget.refer)) {
      from = widget.refer ?? '';
    }

    RecommendResult? recommendResult = await RoomRepository.getRecommendList(
        rid: _rid,
        from: from,
        direct: isNext ? 1 : 2,
        ridList: ChatRoomScreen.ridList,
        lastFrom: '${ChatRoomScreen.lastFrom ?? RoomFrom.default_from}');

    if (recommendResult == null) {
      ChatRoomScreen.isFirst = ChatRoomScreen.isLast = true;
      return -1;
    }
    Log.d('recommendResult = ${recommendResult.ridList}');
    List<int>? ridList = recommendResult.ridList;

    ChatRoomScreen.ridList = ridList;
    ChatRoomScreen.lastFrom =
        recommendResult.type == null || recommendResult.type!.isEmpty ? RoomFrom.default_from : RoomFrom(recommendResult.type!);

    if (ridList == null || ridList.isEmpty) {
      ChatRoomScreen.isFirst = ChatRoomScreen.isLast = true;
      return -1;
    }

    int curIndex = ChatRoomScreen.ridList?.indexOf(_rid) ?? 0;
    int nextIndex = 0;
    if (curIndex >= 0) {
      nextIndex = isNext ? curIndex + 1 : curIndex - 1;
    }

    if (nextIndex >= ChatRoomScreen.ridList!.length) {
      ChatRoomScreen.isLast = true;
      return -1;
    } else if (nextIndex < 0) {
      ChatRoomScreen.isFirst = true;
      return -1;
    }

    if (ridList.length == 1) {
      ChatRoomScreen.isFirst = ChatRoomScreen.isLast = true;
    } else {
      ChatRoomScreen.isFirst = nextIndex == -1;
      ChatRoomScreen.isLast = nextIndex == ChatRoomScreen.ridList?.length;
    }

    Log.d('Get next rid, curIndex: $curIndex, nextIndex: $nextIndex, ridList: ${ChatRoomScreen.ridList?.join(',')}');
    return ChatRoomScreen.ridList![nextIndex];
  }

  Future<int> _getNextAndCheck(bool forward) async {
    int rid = -1;
    if (_room != null && _room!.isMic) {
      bool result = await _showOnMicDialog();
      if (result == true) {
        rid = await getNextRid(forward);
      } else {
        rid = -1;
      }
    } else {
      rid = await getNextRid(forward);
    }

    Log.d('Check change page, forward: $forward, nextRid: $rid');
    if (!mounted) return rid;
    if (rid > 0) {
      bool canChange = await ChatRoomUtil.preCheck(context, rid);
      if (!canChange) rid = -1;
    }

    return rid;
  }

  Future<bool> _showOnMicDialog() async {
    bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
              title: K.room_exit_to_new_room,
              negativeButton: NegativeButton(
                text: K.room_not_now,
              ));
        });
    return result == true;
  }

  bool _checkJuveniles() {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool isJuvenilesModeOn = settingManager.isJuvenilesModeActive();

    return !(isJuvenilesModeOn && _room?.config != null && ('friend' == _room?.config?.type || 'friends' == _room?.config?.type));
  }

  Future<void> switchRoom(_RoomArgs args) async {
    if (args.rid <= 0) return;
    if (_rid == args.rid) return;

    _mainRid = args.mainRid; // changeRoom方法会初始化ChatRoomData,需要提前给_mainRid赋值
    await changeRoom(args.rid, newRefer: args.refer);

    _rid = args.rid;
    _autoMatch = args.autoMatch;
    _autoJoin = args.autoJoin;
    _matchRid = args.matchRid;
    _uid = args.uid;
    _newCreation = args.newCreation;

    if (mounted) setState(() {});
  }

  Future<void> _onPageChange(int index, String newRefer) async {
    if (index == 1) return;

    ChatRoomScreen.isLoading = true;
    setState(() {});

    int rid = await _getNextAndCheck(index > 1);

    Log.d('Start to change page with index: $index, nextRid: $rid');

    if (rid > 0) {
      await changeRoom(rid, newRefer: newRefer).then((data) {
        _rid = rid;
        _autoMatch = 0;
        _autoJoin = 0;
        _matchRid = -1;
        _uid = 0;
        _newCreation = false;
        if (mounted) {
          _pageController.jumpToPage(1);
        }
      });
    } else {
      await _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  ///接受一个rid并切换到该rid对应的房间中去
  _onRoomChangeRid(String type, dynamic data) async {
    if (data == null) return;

    int? newRid;
    int? newUid;
    if (data is Map) {
      newRid = data['rid'];
      newUid = data['uid'];
    } else if (data is int) {
      newRid = data;
    }

    if (newRid != null && _rid != newRid) {
      _room?.loading = true;
      setState(() {});
      await changeRoom(newRid, changeRoom: true);
      _rid = newRid;
      _autoMatch = 0;
      _autoJoin = 0;
      _matchRid = -1;
      _newCreation = false;
      if (newUid != null) {
        _uid = newUid;
      }
      roomPageKey = GlobalKey<ChatRoomPageState>();
      if (mounted) setState(() {});
    }
  }

  Future<void> changeRoom(int rid, {bool changeRoom = false, String? newRefer}) async {
    if (_room != null) {
      _clearRoomListeners(_room!);
      _cancelTimerTask();
    }

    await _initRoomData(rid, changeRoom: changeRoom, newRefer: newRefer);
    _scheduleTimerTask();

    if (!_checkJuveniles()) {
      if (Navigator.of(context).canPop()) {
        ChatRoomScreen.disposeRoom = true;
        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: K.room_juveniles_cant_join, gravity: ToastGravity.CENTER);
      }
    }

    ChatRoomScreen.lastRid = rid;
  }

  _initRoomListeners(ChatRoomData? roomData) {
    if (roomData == null) return;

    roomData.addListener(RoomConstant.Event_Refresh, _onChanged);
    roomData.addListener(RoomConstant.Event_Quite_From_Boss, _onQuiteFromBoss);
    //欢迎弹窗消息
    roomData.addListener(RoomConstant.Event_Welcome_Dialog, _showWelcomeDialog);
  }

  _clearRoomListeners(ChatRoomData? roomData) {
    if (roomData == null) return;
    roomData.removeListener(RoomConstant.Event_Refresh, _onChanged);
    roomData.removeListener(RoomConstant.Event_Quite_From_Boss, _onQuiteFromBoss);
    roomData.removeListener(RoomConstant.Event_Welcome_Dialog, _showWelcomeDialog);
  }

  _initRoomData(int rid, {bool changeRoom = false, String? newRefer}) async {
    ChatRoomScreen.disposeRoom = false;
    if (ChatRoomData.exists() && ChatRoomData.getInstance()?.realRid != rid) {
      clearRoomGetLogic(rid);
      await ChatRoomData.getInstance()?.dispose();
    }

    bool enterSameRoom =
        ChatRoomData.exists() && (ChatRoomData.getInstance()?.realRid ?? 0) > 0 && ChatRoomData.getInstance()?.realRid == rid;

    String? refer = newRefer ?? widget.refer;

    _rid = rid;
    _room = ChatRoomData(
      autoMatch: _autoMatch,
      autoJoin: _autoJoin,
      matchRid: _matchRid,
      uid: _uid,
      refer: refer,
      source: widget.source,
      backRoomId: widget.backRoomId,
      inviterUid: _inviterUid,
      searchString: widget.searchString,
      newCreation: _newCreation,
      mainRid: _mainRid,
    );
    _room!.hasLoadMatchTime = false;
    _showStartMatchToast = false;
    _initRoomListeners(_room!);
    await ChatRoomData.getInstance()?.init(rid);

    if (_room == null) {
      return;
    }

    if (_room!.matchStatus == 0 && _room!.showMatch && _room!.isCreator && _autoMatch != 1) {
      _showStartMatchToast = true;
    }

    String? roomType = _room!.config?.type;
    Map<String, dynamic> properties = {
      'rid': rid,
      'room_type': roomType,
      'time': DateTime.now().millisecondsSinceEpoch,
      'owner_uid': _room!.config?.uid,
      'refer': refer,
      'room_channel': _room!.config?.types.toTypesString(),
      'room_property': (_room!.isBaba) ? 'is_baba' : describeEnum(_room!.config?.property),
      if (widget.isNewCover) 'Is_new_live_cover': true,
    };
    if (_room!.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    } else if (_room!.config?.game != Games.None) {
      properties['game_type'] = describeEnum(_room!.config?.game).toLowerCase();
    }
    if (widget.searchString != null) {
      String searchString = widget.searchString!;
      properties['search_content'] = searchString;
    }

    //标签
    if (!Util.isNullOrEmpty(_room!.config?.typeName)) {
      properties['type_label'] = _room!.config?.typeName;
    }

    //模板
    if (!Util.isNullOrEmpty(_room!.config?.originalRFT)) {
      properties['room_factory_type'] = _room!.config?.originalRFT;
    }

    //结算频道
    if (!Util.isNullOrEmpty(_room!.config?.settlementChannel)) {
      properties['settlement_channel'] = _room!.config?.settlementChannel;
    }

    //新增取值：channel_user ：通过此类型push进房
    if (!Util.isNullOrEmpty(widget.refer)) {
      properties['refer'] = widget.refer;
    }

    //新增取值：channel_user ：通过此类型push进房 targetUid:目标用户的uid
    if ((widget.targetUid ?? 0) > 0) {
      properties['target_uid'] = widget.targetUid;
    }

    if (!enterSameRoom) {
      if (widget.refer != null && widget.refer == 'batch_match' && widget.source != null) {
        //通过快速加入或一起玩进入的房间需要改埋点中的refer
        properties['refer'] = 'quickjoin_${widget.source ?? ''}';
      }

      Tracker.instance.track(TrackEvent.enter_room, properties: properties);
      Tracker.instance.timeEvent(TrackEvent.exit_room);
    }

    int currentNobility = NobilityUtil.currentIntNobility(oldNobility: Session.title, newNobility: Session.titleNew);
    int startNobility = NobilityUtil.currentIntNobility(
        oldNobility: NobilityUtil.getInt(NobilityType.Duke), newNobility: NobilityUtil.getInt(NobilityType.Emperor));

    if (currentNobility >= startNobility) await ChatRoomScreen.updateStealth(_room!);
  }

  /// 清除上一个房间的getX logic相关状态
  clearRoomGetLogic(int rid) {
    WelcomeUserListLogic logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      logic.welcomes.clear();
    }

    MessageTabLogic messageTabLogic;
    if (Get.isRegistered<MessageTabLogic>()) {
      messageTabLogic = Get.find<MessageTabLogic>();
      messageTabLogic.currentTabRid = rid;
    }

    NewMessageLogic newMessageLogic;
    if (Get.isRegistered<NewMessageLogic>()) {
      newMessageLogic = Get.find<NewMessageLogic>();
      newMessageLogic.clear();
    }
  }

  Timer? _followCreatorTimer;
  Timer? _showNoticeFansTimer;

  _scheduleTimerTask() {
    _followCreatorTimer = Timer(const Duration(seconds: 60), () {
      _checkFollow();
    });

    bool needCheck = (_room?.purview == Purview.Createor || (_room?.purview == Purview.SuperAdmin && !_room!.isSuper));
    if (needCheck &&
            !Util.parseBool(_newCreation) &&
            _room?.config?.property != RoomProperty.virtual &&
            !ChatRoomUtil.isPuzzleRoom(_room?.config) ||
        _showStartMatchToast) {
      if (_showStartMatchToast &&
          !Config.getBool(BBConfigKey.hasShowNoticeStartRecruitToday(), false) &&
          (_room?.config?.property == RoomProperty.Vip)) {
        if (!ChatRoomUtil.showRecruitBubbleTips()) {
          // 提示房主开启征召 用通知粉丝弹框样式
          _showNoticeFansTimer = Timer(const Duration(milliseconds: 300), () {
            if (!mounted) return;
            NoticeFansWidget.show(
              context,
              _room?.config?.rid ?? -1,
              title: K.room_start_recruit,
              content: K.room_recurit_start_remind,
              btnTitle: K.room_recurit_start_rightnow,
              onBtnTap: _startRecruit,
            );
          });
        }
      } else {
        _showNoticeFansTimer = Timer(const Duration(milliseconds: 300), () {
          if (!mounted) return;
          NoticeFansWidget.show(context, _room?.config?.rid ?? -1);
        });
      }
    }
  }

  //开启征召
  _startRecruit() async {
    if (_room == null) return;
    String adminRole = '';
    if (_room!.isEightOwner(Session.uid)) {
      // 在房主位的房主
      if (ClientRole.Broadcaster == _room!.role) {
        adminRole = 'broadcaster';
      } else {
        adminRole = 'audience';
      }
    }

    String wolfTypeLabel = '';
    String wolfPublishLabel = '';

    if (_room!.config?.game != null && _room!.config?.game == Games.Wolf) {
      IWereWolfManager? wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      wolfTypeLabel = wereWolfManager?.getTypeLabel() ?? '';
      wolfPublishLabel = wereWolfManager?.getPublishDeal() ?? '';
    }

    await RoomRepository.startMatch(
      context: context,
      rid: _room!.rid.toString(),
      type: wolfTypeLabel.isNotEmpty ? wolfTypeLabel : _room!.config?.type,
      admin_role: adminRole,
      publishDeal: wolfPublishLabel.isNotEmpty ? wolfPublishLabel : '',
    );
  }

  _cancelTimerTask() {
    _followCreatorTimer?.cancel();
    _showNoticeFansTimer?.cancel();

    _followCreatorTimer = null;
    _showNoticeFansTimer = null;
  }

  ///检查关注：
  ///1.直播房：是否关注房主，未关注房主，则弹框引导关注；
  ///2.其他房：关注人数小于30，并且未关注房主/接待，则弹框引导关注
  _checkFollow() async {
    //房主自己
    if (!mounted || _room == null || _room?.config == null || _room?.config?.uid == Session.uid) {
      return;
    }

    //连线场景房不弹出
    if (_room!.config!.isSceneType) return;

    //斗地主不展示
    if (_room!.config!.isLandlord) return;

    RoomPosition follow = _room!.getFollowRole();
    Log.d('_checkFollow, name: ${follow.name}');

    // 待关注的人为自己或者不在麦位
    if (follow.uid == 0 || Session.uid == follow.uid) {
      return;
    }

    bool needShowFollowDialog = false;

    try {
      String url = '${System.domain}go/yy/friend/data';
      final Map<String, String> params = {
        "type": FriendsListType.Follow,
        "page": "1",
        "pageSize": "30",
      };
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.value();
      List list = res['data'];
      //关注人数小于30,且未关注房主
      if (list.length < 30) {
        needShowFollowDialog = true;
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          int uid = Util.parseInt(item['uid']);
          if (uid == follow.uid) {
            needShowFollowDialog = false;
            break;
          }
        }
      } else {
        needShowFollowDialog = false;
      }
    } catch (e) {
      Log.d(e);
    }

//    Log.d('_checkFollow, needShowFollowDialog: ${needShowFollowDialog}');

    if (needShowFollowDialog) {
      if (!mounted || _room?.config == null) return;
      bool? r = await BottomFollowDialog.show(context, follow.icon, follow.name);
      if (r != null && r == true) {
        _followRoomRole(follow: follow);
      }
    }
  }

  Future<bool> _followRoomRole({RoomPosition? follow}) async {
    try {
      follow ??= _room?.getFollowRole();
      String? roomType = _room?.config?.type;
      NormalNull response = await BaseRequestManager.onFollow(
        follow?.uid.toString() ?? '',
        refer: 'room',
        roomType: roomType ?? '',
        settlementChannel: _room?.config?.settlementChannel ?? '',
        typeLabel: _room?.config?.typeName ?? '',
        roomFactoryType: _room?.config?.originalRFT ?? '',
      );
      if (!mounted) return false;
      if (response.success) {
        Toast.showCenter(context, K.followed);
        return true;
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
        }
        return false;
      }
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
      return false;
    }
  }

  bool _onPageLoadChecked = false;

  Widget _buildRoomPage() {
    Log.d('Build room page, rid: $_rid');
    return ChatRoomPage(
      key: roomPageKey,
      room: _room,
      onPageLoad: () {
        if (!_onPageLoadChecked) {
          _onPageLoadChecked = true;
          widget.onPageLoad?.call();

          if (widget.showKeyboardAfterLoaded) {
            Future(() {
              eventCenter.emit(RoomConstant.Event_Room_Display_Input);
            });
          }
        }
      },
    );
  }

  Widget _buildLoadingPage(int index) {
    return RoomLoadingPage(
      key: index == RoomLoadingPage.left ? leftPageKey : rightPageKey,
      index: index,
    );
  }

  bool get canScroll {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (!roomManager.canScrollChangeRoom()) return false;
    if (ChatRoomScreen.isLoading) return false;
    if (_room == null || _room?.config == null) return false;

    /// 有返回按钮不允许左右切房
    if (widget.backRoomId != null && widget.backRoomId != 0 && widget.backRoomId != widget.rid) return false;

    if (widget.mainRid != 0 && widget.mainRid != widget.rid) return false;

    if (ChatRoomUtil.isRoomCreator(_room!)) {
      return false;
    }

    if (ChatRoomUtil.isLayaGame(_room!.config)) {
      return false;
    }
    if (ChatRoomUtil.isMyHouse(_room!.config)) {
      return false;
    }

    return !(_room!.config?.type == 'juben' ||
        ((_room!.config?.game == Games.Guess || _room!.isGuessQueue) && _room!.isMic) ||
        _room!.config?.isSceneType == true);
  }

  int _curPage = 1;

  @override
  Widget build(BuildContext context) {
    if (window.physicalSize.width / window.physicalSize.height >= 0.8) {
      /// 简单适配宽屏手机上房间不可用问题
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          size: Size(window.physicalSize.height / window.devicePixelRatio * 9 / 16, window.physicalSize.height / window.devicePixelRatio),
          textScaler: const TextScaler.linear(1.0),
        ),
        child: _buildBody(),
      );
    }

    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 && notification is ScrollEndNotification) {
              final PageMetrics metrics = notification.metrics as PageMetrics;
              final int currentPage = metrics.page?.round() ?? 0;

              Log.d('Receive scroll notification: $notification, page: $currentPage');

              if (currentPage != _curPage) {
                String newRefer;
                if (currentPage > _curPage) {
                  newRefer = 'slide_next';
                } else {
                  newRefer = 'slide_back';
                }
                _curPage = currentPage;
                _onPageChange(currentPage, newRefer).then((data) async {
                  if (!mounted) return;
                  ChatRoomScreen.isLoading = false;
                  setState(() {});
                });
              }
            }
            return false;
          },
          child: PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: false,
            physics: canScroll
                ? const PageScrollPhysics(parent: ClampingScrollPhysics(parent: AdjustedScrollPhysics()))
                : const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              _buildLoadingPage(RoomLoadingPage.left),
              _buildRoomPage(),
              _buildLoadingPage(RoomLoadingPage.right),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    bool isActive = AppLifecycleState.resumed == state;
    _room?.setLifecycleState(isActive);
  }
}

class AdjustedScrollPhysics extends ScrollPhysics {
  const AdjustedScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  AdjustedScrollPhysics applyTo(ScrollPhysics? ancestor) => AdjustedScrollPhysics(parent: buildParent(ancestor));

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => position.maxScrollExtent >= 50;

  @override
  double get minFlingVelocity => 100;

  @override
  double get minFlingDistance => 90;
}
