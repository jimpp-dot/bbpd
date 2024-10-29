import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/atmosphere/atmosphere_manager.dart';
import 'package:chat_room/src/base/model/gift_wish_bean.dart';
import 'package:chat_room/src/base/model/rcmd_limit.dart';
import 'package:chat_room/src/base/page/roomPassword.dart';
import 'package:chat_room/src/base/room_event_show_anim_screen.dart';
import 'package:chat_room/src/base/widget/cpMatchResult.dart';
import 'package:chat_room/src/base/widget/wait_mic_alert.dart';
import 'package:chat_room/src/biz_plugin/base/room_plugin_control_mixin.dart';
import 'package:chat_room/src/ktv/ktv_music_controller.dart';
import 'package:chat_room/src/live/model/live_repository.dart';
import 'package:chat_room/src/mic_heart_beat_reporter.dart';
import 'package:chat_room/src/protobuf/generated/live.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_contribute.pb.dart';
import 'package:chat_room/src/protobuf/generated/rpc_room_frame.pb.dart';
import 'package:chat_room/src/red_packet/packet_config.dart';
import 'package:chat_room/src/room_msg_pull_manager.dart';
import 'package:chat_room/src/room_refresh_part_notify.dart';
import 'package:chat_room/src/talent/talent_helper.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:protobuf/protobuf.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/model/fans_group_model.dart';
import 'package:shared/model/screen_show_model.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;

import '../chat_room.dart';
import '../pb_typeurls.dart';
import 'base/channel_callback.dart';
import 'base/channel_relay_user.dart';
import 'base/create_private_room/drainage_data.dart';
import 'base/entity/errorExpend.dart';
import 'base/game_list/util/game_list_util.dart';
import 'base/message/message_send_frequency.dart';
import 'base/moremenu/room_menu_controller.dart';
import 'base/punish/room_punish_manager.dart';
import 'base/room_music_control.dart';
import 'base/util/god_tag_util.dart';
import 'base/widget/anti_addiction_dialog.dart';
import 'base/widget/topLive.dart';
import 'biz_plugin/grab_hat/model/hat_play_data.dart';
import 'biz_plugin/heartpass/model/heart_pass_beans.dart';
import 'kickroom_roommute/controllers/room_general_setting_mixin.dart';
import 'ktv/ktv_sing_song_tips_dialog.dart';
import 'ktv/model/ktv_pk_rank.dart';
import 'live/live_pk_config_v3.dart';
import 'lottery/lottery_manager.dart';
import 'music/model/muisc_play_list_model.dart';
import 'music/playlist/music_playlist_manager.dart';
import 'under/game_under.dart';
import 'under/model/underData.dart';
import 'visitant/model/visitant_model.dart';
import 'visitant/visitant_upgrade_dialog.dart';

export 'chat_room_data_extension.dart';

enum OptionSettingType {
  SHOW_FROM_DOWN, // 底部弹窗  商业房：房主/接待/管理
  SHOW_FROM_TOP, // 顶部弹窗  个人房：房主/接待/管理
  SHOW_FROM_RIGHT, // 右侧弹窗: 用户角色为：非房主、接待管理员、普通管理员的用户
}

class ChatRoomData extends Events with RoomPluginControlMixin, RoomGeneralSettingMixin, DrainageData {
  static const TAG = "ChatRoomData";

  Connectivity? _conn;
  StreamSubscription? _subscription;

  /// 房间惩罚管理
  RoomPunishManager? _punishManager;

  int? autoJoin;
  int? autoMatch;
  int? matchRid;
  int? uid; //从某个uid用户踩房进来的
  int inviterUid = 0;
  String? searchString;
  bool newCreation = false;

  /// 显示房间排行榜
  bool showRankingList = false;

  /// 连连看助力开关
  bool cpLinkAssist = true;

  /// 房间内支持的功能
  List<String>? features;

  /// 群聊ID，兼容群聊内打开送礼
  int chatGroupId = 0;

  /// 是否位麦序房，不能通过config中的factoryType决定，因为会存在其他主播的房型覆盖
  bool isArtCenterAll = false;

  /// 麦序房 - 管理员
  bool isArtCenterAdmin = false;

  String? _coverEarIcon; // 捂耳朵头像框URL地址

  String? get coverEarIcon => _coverEarIcon;

  /// 私密房功能状态
  Map? nest;

  late RoomRtcController rtcController;
  late MicHeartBeatReporter micHeartBeatReporter;

  int get inflexion => rtcController.inflexion;

  static const _socketPingInterval = 5;

  RoomMsgPullManager? _roomMsgPullManager;
  RoomRefreshPartNotify? _roomRefreshPartNotify;

  final IBASEGameRoomManager baseGameRoomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WEBGAME_ROOM);

  String? refer;
  String? source;
  int? backRoomId; //可返回房间的id，存在则说明有快捷返回按钮
  int? mainRid;

  ChatRoomData._({
    this.autoJoin = 0,
    this.autoMatch = 0,
    this.matchRid = -1,
    this.uid = 0,
    this.refer,
    this.source,
    this.backRoomId,
    this.inviterUid = 0,
    this.searchString = '',
    this.newCreation = false,
    this.mainRid = 0,
  }) : super() {
    rtcController = RoomRtcController(this);
    micHeartBeatReporter = MicHeartBeatReporter(this);
    _roomMsgPullManager = RoomMsgPullManager(this);
    _roomRefreshPartNotify = RoomRefreshPartNotify(this);
    _conn = Connectivity();
    _subscription = _conn?.onConnectivityChanged.listen((ConnectivityResult data) {});
  }

  factory ChatRoomData(
      {autoJoin = 0,
      autoMatch = 0,
      matchRid = -1,
      uid = 0,
      refer,
      source,
      backRoomId,
      inviterUid = 0,
      String? searchString,
      bool newCreation = false,
      int? mainRid}) {
    _instance ??= ChatRoomData._(
        autoJoin: autoJoin,
        autoMatch: autoMatch,
        matchRid: matchRid,
        uid: uid,
        refer: refer,
        source: source,
        backRoomId: backRoomId,
        inviterUid: inviterUid,
        searchString: searchString,
        newCreation: newCreation,
        mainRid: mainRid);
    return _instance!;
  }

  static int isFirstRid = 0;

  static ChatRoomData? _instance;

  static ChatRoomData? getInstance() => _instance;

  static ChatRoomData emptyRoom() {
    ChatRoomData emptyRoom = ChatRoomData._();
    emptyRoom.refer = '/'; //涉及支付
    emptyRoom._config = RoomConfig.fromJson({});

    return emptyRoom;
  }

  static bool exists() {
    return _instance != null;
  }

  _leaveRoom() async {
    TopLiveTool.destroy();
  }

  bool _isActive = true;

  bool get isActive => _isActive;

  setLifecycleState(bool active) {
    _isActive = active;
    emit(RoomConstant.Event_Active, _isActive);
  }

  @override
  Future dispose() async {
    Log.d(tag: TAG, "ChatRoomData disposed ,$_disposed");
    if (_disposed) {
      return;
    }
    _roomMsgPullManager?.dispose();
    _roomRefreshPartNotify?.dispose();

    LotteryManager.instance.release();

    if (_rid > 0) {
      Map<String, dynamic> properties = {
        'rid': _rid,
        'room_type': _config?.type,
        'owner_uid': _config?.uid,
        'room_channel': _config?.types.toTypesString(),
        'refer': refer,
        'room_property': _isBaba ? 'is_baba' : describeEnum(_config?.property),
      };
      if (_config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        properties['game_type'] = wereWolfManager.getGameType();
      } else if (_config?.game != Games.None) {
        properties['game_type'] = describeEnum(_config?.game).toLowerCase();
      }

      //标签
      if (!Util.isNullOrEmpty(_config?.typeName)) {
        properties['type_label'] = _config?.typeName;
      }

      //模板
      if (!Util.isNullOrEmpty(_config?.originalRFT)) {
        properties['room_factory_type'] = _config?.originalRFT;
      }

      //结算频道
      if (!Util.isNullOrEmpty(_config?.settlementChannel)) {
        properties['settlement_channel'] = _config?.settlementChannel;
      }

      Tracker.instance.track(TrackEvent.exit_room, properties: properties);

      micHeartBeatReporter.dispose();
    }

    KtvMusicController.release();
    MsgSendFrequency.instance.reset();
    MusicPlayListManager.inst.release();
    bindModel?.dispose();

    _punishManager?.dispose();
    _punishManager = null;

    if (rtcController.initialized) {
      try {
        MusicController.destroy();
        KtvMusicController.dispose();
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    } else {
      Log.d(tag: TAG, 'ChatRoomData dispose, dont need destroy rtc-engine');
    }

    rtcController.destroy();

    _instance = null;
    _rid = 0;
    _disposed = true;
    loading = true;
    _errorMsg = null;
    _errorExpend = null;
    _password = null;
    _config = null;
    _liveDuration = 0;
    liveDurationNotifier.value = 0;
    _pingTimer?.cancel();
    if (_liveHungUpTimer != null) _liveHungUpTimer!.cancel();

    if (_channel != null) {
      if (_channel!.readyState == WebSocket.open) {
        _channel!.close(WebSocketStatus.goingAway);
      }
      _channel = null;
    }

    SharedAppPlugin.cancelOngoingNotification();

    _subscription?.cancel();

    drainagePreviewData = null;
    roomInviteGuideData.clear();

    super.dispose();

    Log.d(tag: TAG, "ChatRoomData dispose complete");
    eventCenter.emit(RoomConstant.Event_Room_Dispose);
  }

  bool _disposed = false;
  int stealth = 0;

  int _serverTime = 0; //服务器的unix时间
  int _localTime = 0; //本地时间
  int _rid = 0;
  bool _init = true;
  bool loading = true; //是否在加载数据中
  bool _follow = false;
  RoomConfig? _config;
  String? _iconCacheFilePath;
  String? _ownerName;
  RoomCreator? _createor;
  final GlobalKey _creatorKey = GlobalKey(); // 房主位key
  final GlobalKey _bigHeadKey = GlobalKey(); // 房间大头位key
  Purview _purview = Purview.Normal;

  /// 权限:后台可以给某些用户开一些特殊的权限（如：给非房主设置/取消管理的权限）
  int permission = 0;
  final List<RoomPosition> _positions = [];
  List<int> _admins = [];
  List<int> _wait = [];
  List<Map<String, dynamic>> waitProfiles = [];
  List<int> _waitForBoss = [];
  List<int> _waitForAuction = []; // 拍卖厅-拍卖对象麦位单独排麦
  RcmdLimit? limitTimes; //用于判断新用户是否展示快捷打招呼，赠送小心心，棒棒糖等
  List<String> _themeSwitchBackground = [];
  String? _password = '';
  String? _socket;
  final List<int> _defends = [];
  bool _isBaba = false; //靓号房
  /// 房间消息出字频率
  int? msgAppearRate;

  /// 消息缓冲区阈值，直接跳转到底部
  int? msgAppearFlushNum;

  /// 是否开启发送消息间隔模式，
  /// 1开启（存在）间隔，
  /// 0取消(没有)间隔
  int? msgSendIntervalMode;

  WebSocket? _channel;

  WebSocket? get channel => _channel;

  int _sendIndex = 0;
  final Map<int, ChannelCallBack> _promiseMap = {};

  Timer? _pingTimer;

  Timer? _liveHungUpTimer; // 直播间，检测主播是否挂机用的
  int _hungUpTime = 1; // 主播持续挂机了多少个三十秒，说话即清零

  int _onlineNum = 0;
  int _senderId = 0;

  /// 全新的房间热度，不再用onlineNum和real进行拼接
  int _roomHot = 0;

  // 是否需要认证
  int needVerify = 0;
  int needVerifyNew = 0;

  // 操作选项支持跳转h5
  Map? operateH5;

  String? gameUnderWord;

  int matchStatus = 0;
  bool showMatch = false;
  int matchAllSeconds = 0; //征召一轮总时间
  int matchLeftSeconds = 0; //剩余可征召时间
  bool hasLoadMatchTime = false; //添加原因在RecruitWidget中
  List<String> showMatchRoles = [];

  bool isSuper = false; // 巡管，如果是超管也为true

  String newUserNotify = ''; //新用户进房引导奖励desp

  //剧本杀
  dynamic expand;
  Map? micGroup;
  RoomPosition? dmPosition;

  // 公屏引导
  Map<String, dynamic>? roomGuide;

  /// 直播房room/config接口下发，socket无此字段，为防止被socket消息覆盖，赋值到isFollowCreator保存
  bool isFollowCreator = false;
  bool isFollowReception = false;

  List<RankList> contributeTopData = [];

  // 直播间排名(日榜)
  int liveRank = 0;

  // PK排名(日榜)
  int pkRank = 0;

  // PK排名临界值
  int pkCriticalValue = 50;

  // 直播间日榜跳转H5 url
  String? liveRankUrl;

  FanLabel? _liveFansLabelExtra;

  // 房间红包
  PacketConfig? redPacketConfig;

  // 房间连击礼物入口
  Gift? comboGift;

  bool showRoomDataTab = false; //房间管理界面是否显示数据tab

  ScreenShowModel? screenShowModel;

  /// 是否加入粉丝团
  bool hasJoinFansGroup = false;

  /// 房间是否显示分组pk入口
  bool showGpk = false;

  /// 房间玩法插件列表
  List<String>? pluginList;

  /// 房间安全提醒消息 显示内容和跳转url
  Map<String, dynamic>? safeNotify;

  /// 房间萌新相关礼物列表
  List<Map<String, dynamic>>? newbieGifts;

  /// 心动闯关入口
  HeartPassEntrance? heartPassEntrance;

  /// 房间是否处于分组PK进行中状态
  bool gpkEnable = false;

  /// 是否显示约战入口
  bool crossPKEnable = false;

  /// 是否正在进行约战/塔防：0：未PK，1：约战PK，2：塔防PK（laya）
  int showCrossPK = 0;

  ///进房后是否自动上麦
  bool autoMic = false;

  /// 是否显示点亮星座入口
  bool showStarSign = false;

  /// 是否显示KTV房间任务入口
  bool showKtvTask = false;

  /// 是否显示新人房间特权入口
  bool showNewRoomPrivilege = false;
  int newRoomPrivilegeDuration = 0;

  // 首充活动，控制条礼物Icon
  FirstPayGift? firstPayGift;

  // 麦下用户列表
  List<KtvOffMic>? offMicList;

  // 印象标记
  List<Map<String, dynamic>>? impressTagList;

  /// ktv PK模式数据
  KtvPkRankConfig? ktvPkRank;

  bool vadEnabled = false; //是否允许语音检测
  int vadInterval = 60; //多少秒静音之后关闭声网录音开启vad

  RoomMoreMenuController moreMenuController = RoomMoreMenuController();

  OptionSettingType? optionSettingType;

  FansGroupInfo? fansGroup;

  RoomWishGiftsData? roomWishGiftsData;

  /// only for需要跟ChatRoomData共生命中期的房间model
  AbsRoomModel? bindModel;

  /// rtcSDK:
  ///  1.[rtcTypeAgora]
  ///  2.[rtcTypeZego]
  ///  4.[rtcTypeTencent]
  int? currentRtcType;

  /// 推流的id.
  String? currentRtcStreamId;

  /// 当前KTV合唱的主唱RtcStreamId
  String? leadSingerRtcStreamId;

  /// 当前KTV合唱的合唱RtcStreamId
  List<String> chorusRtcStreamIds = [];

  /// 是否允许操作开关麦，在抢唱游戏过程，游戏控制用户开关麦
  bool canOperateMic = true;

  bool _showVisitantRank = false;

  /// 是否显示贵宾榜
  bool get isShowVisitantRank => _showVisitantRank;

  /// 贵宾榜榜一头像
  String? visitantIcon;

  /// 房间玩法入口标签状态
  GameListLabelStatus gameListLabelStatus = GameListLabelStatus.Disable;

  Map? hitConfig; //礼物连击资源配置

  /// 直播时长（主播在麦上时间, 单位秒）
  ValueNotifier<int> liveDurationNotifier = ValueNotifier(0);
  double _liveDuration = 0;

  ///呼叫Dm用户
  int callDmUid = 0;

  /// trtc ktv房间混响音效，设置的效果在退出房间后会自动失效
  int trtcVoiceReverbType = 0;

  /// 情感小窝：我的飞船
  bool showPrivateRoomEntry = false;

  /// 麦序房转播倒计时（即将开始/即将结束）
  int artCenterCounter = 0;

  /// 麦序房转播倒计时(开始/结束)
  bool artCenterCounterStart = false;

  /// 麦序房换挡提示文案
  String? artCenterCounterMgs;

  /// 蒙面互动：蒙面GS麦序，礼物面板不能把蒙面GS的真人头像展示出来
  List<int> mysteryPositions = [];

  ValueNotifier<Map<int, bool>> speakers = ValueNotifier(<int, bool>{});

  /// ktv/一起听 是否使用声网版权音乐，4：声网曲库
  /// 非 （ktv和一起听） 歌房该值为 null
  int? ktvSourceType;

  bool showPKSuperMatch = false; // 是否显示PK超级联赛挂件

  bool showAnniversary = false; // 是否显示周年庆

  bool showAnnualCelebration = false; // 是否展示年度盛典

  bool _liveDataFlag = false; // 主播关房是否显示统计页面

  int? prettyRid; // 靓号房

  int? musicOrderSinger; // 点唱厅，当前正在演唱的歌手uid

  int? musicOrderId; // 点唱厅，当前正在演唱的歌曲id

  bool hideLayaBar = false; // 隐藏laya游戏的顶部和底部栏，显示APP的顶部和底部栏

  static Map<int, bool> bgVideoPlayingMap = {}; //KTV房间背景视频是在播放还是暂停

  int commonSwitch = 0; // 房间通用开关

  String hitBgWithCount(int count) {
    if (hitConfig != null && hitConfig!['hit_num_config'] != null && hitConfig!['hit_num_config'].keys.toList().contains('$count')) {
      Map? map = hitConfig!['hit_num_config']['$count'];
      if (map?.keys.contains('flower_url') == true) {
        return map!['flower_url'] ?? '';
      }
    }
    return '';
  }

  String hitIconWithCount(int count) {
    if (hitConfig != null && hitConfig!['hit_num_config'] != null && hitConfig!['hit_num_config'].keys.toList().contains('$count')) {
      Map? map = hitConfig!['hit_num_config']['$count'];
      if (map?.keys.contains('url') == true) {
        return map!['url'] ?? '';
      }
    }
    return '';
  }

  int hitLevelWithPrice(int price) {
    if (hitConfig != null && hitConfig!['hit_level_config'] != null) {
      List? levels = hitConfig!['hit_level_config'];
      if (Util.validList(levels)) {
        for (int i = 0; i < levels!.length; i++) {
          if (price <= Util.parseInt(levels[i])) {
            return i;
          }
        }
        return levels.length;
      }
    }
    return 0;
  }

  /// 是否有粉丝团
  bool get hasFansGroup => (fansGroup?.groupId ?? 0) > 0;

  GlobalKey get createorKey {
    return _creatorKey;
  }

  GlobalKey get bigHeadKey => _bigHeadKey;

  RoomConfig? get config {
    return _config;
  }

  String? get iconCacheFilePath {
    return _iconCacheFilePath;
  }

  String? get ownerName {
    return _ownerName;
  }

  RoomCreator? get createor {
    return _createor;
  }

  Purview get purview {
    return _purview;
  }

  List<RoomPosition> get positions {
    return _positions;
  }

  List<int> get admins {
    return _admins;
  }

  List<int> get wait {
    return _wait;
  }

  List<int> get waitForBoss {
    return _waitForBoss;
  }

  List<int> get waitForAuction {
    return _waitForAuction;
  }

  // 房间排麦总人数
  int get waitMicTotalNum {
    return (_wait.length + _waitForBoss.length + _waitForAuction.length);
  }

  // 底部工具栏展示排麦列表入口 狼人杀还是在右上角
  bool get showWaitMic {
    bool showRes = _config?.mode == RoomMode.Lock && _purview != Purview.Normal;

    if (ChatRoomUtil.isLiveTalent(_config)) {
      showRes = TalentHelper.isCreateOrPerformer(this);
    }

    final notDisplay = _config?.types == RoomTypes.RadioDefend && _positions.isNotEmpty && _positions[0].uid != Session.uid;

    return showRes && !notDisplay && waitMicTotalNum > 0;
  }

  int get onlineNum {
    return _onlineNum;
  }

  /// 房间热度
  int get roomHot {
    if (_config?.property != RoomProperty.virtual) {
      /// 非虚拟房
      return _roomHot;
    }

    /// 虚拟房
    return _onlineNum;
  }

  bool isSpeaker(int uid) {
    return rtcController.isSpeaker(uid);
  }

  /// 真实房间ID，区别与rid
  int get realRid {
    return _rid;
  }

  /// 在麦序房被其他房间覆盖时，传的是主播房间rid，不同于麦序房本身的rid
  int get rid {
    if (isArtCenterInsertOtherRoom) {
      return _config?.rid ?? 0;
    }
    return _rid;
  }

  /// 当前房间的，当前用户，是否为房主
  bool get isCreator => createor?.uid == Session.uid;

  /// 当前房间的，当前用户，是否为接待
  bool get isReception => _purview == Purview.SuperAdmin && !isSuper;

  /// 当前房间的，当前用户，是否为管理(房主、接待、超管)
  bool get isAdmin => _purview == Purview.SuperAdmin || isSuper || _purview == Purview.Admin || isCreator;

  Set<int> get mutedUserIds {
    return rtcController.mutedUserIds;
  }

  addMutedUserId(int id) {
    rtcController.addMutedUserId(id);
  }

  removeMutedUserId(int id) {
    rtcController.removeMutedUserId(id);
  }

  bool get isBaba => _isBaba;

  bool _isJukebox = false;

  /// 当前房间，是否为点唱白名单厅
  bool get isJukebox => _isJukebox;

  initAll(int rid, [bool slow = false]) async {
    loading = true;
    _errorMsg = null;
    _errorExpend = null;
    emit(RoomConstant.Event_Refresh);
    await init(rid, slow);
  }

  init(int rid, [bool slow = false]) async {
    Log.d(tag: TAG, "ChatRoomData init");
    if (_rid != rid) {
      _rid = rid;
    }
    KtvMusicController.init();
    _punishManager?.dispose();
    _punishManager = RoomPunishManager(this);
    _punishManager?.init();

    await loadConfig(slow);

    micHeartBeatReporter.init();
  }

  /// 语音活动检测(Voice Activity Detection,VAD) start
  /// 是否启用vad
  bool get _vadEnabled {
    return vadEnabled && Util.isAndroid && !_backgroundMusicDisableVad();
  }

  bool get getVadEnabled {
    return _vadEnabled;
  }

  setPassword(String password) {
    PasswordManager.setValue(_rid, password);
    _password = password;
    loading = true;
    emit(RoomConstant.Event_Refresh);
    initAll(_rid);
  }

  reload() async {
    await loadConfig();
  }

  /// 发送业务消息
  Future<bool> sendBusinessMessage(String cmd, Map<String, dynamic> data, {bool checkFrequency = true}) async {
    if (checkFrequency == true && MsgSendFrequency.instance.isRestrict) {
      MsgSendFrequency.instance.toastTip();
      return false;
    }

    DataRsp dataRsp = await _send('BusinessMessage', data: {'cmd': cmd, 'data': data});

    MsgSendFrequency.instance.anchorSendTime(this);

    return dataRsp.success;
  }

  /// 发送消息
  /// [checkFrequency] 是否检查发送频率相关限制
  /// return true发送成功，false没有发送
  Future<DataRsp> sendMessage(String message, String extra, {bool checkFrequency = true}) async {
    if (checkFrequency == true && MsgSendFrequency.instance.isRestrict) {
      MsgSendFrequency.instance.toastTip();
      return DataRsp(success: false);
    }

    DataRsp dataRsp = await _send('sendMessage', data: {
      'content': message,
      'extra': extra,
      'user': {'id': Session.uid.toString(), 'name': Session.name, 'portraitUri': Session.icon}
    });

    MsgSendFrequency.instance.anchorSendTime(this);

    return dataRsp;
  }

  /// 你画我猜房间，发送给server的绘画轨迹数据
  Future<void> sendGuessImage(String image) async {
    await _send('sendImage', data: {
      'extra': {
        'type': 'Guess',
        'subType': 'image',
        'image': image,
      },
      'user': {'id': Session.uid.toString(), 'name': Session.name, 'portraitUri': Session.icon}
    });
  }

  Future<List<MessageContent>> getHistoryMessages() async {
    List<MessageContent> messages = [];
    DataRsp rsp = await _send('getHistoryMessages', data: {'rid': _rid.toString()});
    if (rsp.success && rsp.data is List) {
      for (dynamic jsonString in rsp.data) {
        try {
          Map content = json.decode(jsonString);
          Map? extra;
          if (content['extra'] is String) {
            extra = json.decode(content['extra']);
          } else {
            extra = content['extra'];
          }
          if (!content.containsKey('content') || extra == null || extra['subType'] == 'image') continue;
          if (extra.containsKey('emote_position') && extra['emote_position'] > 0 && extra['emote_sender'] > 0) {
            continue;
          }

          MessageContent message =
              MessageContent.from(Util.parseStr(content['content']), extra, content['user'], content['messageId'], mounts: extra['mounts']);

          /// 初始化公屏通用标签
          await message.checkCommonTagData();
          messages.add(message);
        } catch (e) {
          Log.d(tag: TAG, "getHistoryMessages error ,$e");
        }
      }
    } else {
      Log.d(tag: TAG, "getHistoryMessages error ${rsp.msg}");
    }
    Log.d(tag: TAG, "getHistoryMessages ok ${messages.length}");
    return messages;
  }

  PositionOffset getPointByUid(int uid) {
    return ChatRoomUtil.getPointByUid(uid);
  }

  ErrorExpend? _errorExpend;

  ErrorExpend? get errorExpend {
    return _errorExpend;
  }

  String? _errorMsg;
  bool _requestPassword = false;
  String? _passwordMessage;

  String get displayErrorMsg {
    return (_errorMsg != null && _errorMsg!.isNotEmpty) ? _errorMsg! : base.K.server_return_error_retry;
  }

  String? get errorMsg {
    return _errorMsg;
  }

  void setErrorMsg(String errorMsg) {
    _errorMsg = errorMsg;
  }

  bool get requestPassword {
    return _requestPassword;
  }

  String? get passwordMessage {
    return _passwordMessage;
  }

  RoomPosition? get positionForCurrentUser {
    return ChatRoomUtil.getPositionByServer();
  }

  List<GlobalKey>? _positionKeys;

  GlobalKey? getGlobalKey(int index) {
    if (_positionKeys == null) {
      _positionKeys = [];
      for (int i = 0; i < 16; i++) {
        _positionKeys!.add(GlobalKey());
      }
    }
    return _positionKeys!.elementAt(index);
  }

  ///个人房 直播房 电台房 头部需要显示贡献榜top
  loadContributeData() async {
    if (isPrivate || isLiveRoom || isBusinessRadio) {
      ResRankingContribute res = await RoomApi.getRoomContributeWeekList(rid);
      if (res.success) {
        contributeTopData = res.data;
        emit(RoomConstant.Event_Refresh);
      }
    }
  }

  /// 拉取直播间信息（直播间排名/贡献榜前三），需要每次进入和回到房间页面拉取，故单独开接口
  loadLiveConfig() async {
    if (config == null || config!.types != RoomTypes.Live) {
      return;
    }
    ResLiveConfig response = await LiveRepository.getLiveConfig(rid, _createor?.uid ?? 0);
    if (response.success) {
      LiveConfigData data = response.data;
      liveRank = data.liveRank;
      liveRankUrl = data.link;
      bool isPkClose = config?.liveDataV3?.pkConfigV3?.isUse == 0;
      if (isPkClose) {
        pkRank = 0;
      } else {
        pkRank = data.pkRank;
      }
      pkCriticalValue = data.pkCriticalValue;
      _liveFansLabelExtra = data.fansLabel;
      emit(RoomConstant.Event_Refresh);
    }
  }

  /// 房间通用设置接口
  void loadGeneralSetting() {
    loadRoomGeneralSetting(
      rid: _rid,
      onRefresh: () => emit(RoomConstant.Event_Refresh),
    );
  }

  /// 是否使用快速进房 1.开关打开 2.非Laya狼人杀
  bool get _useFastEnterRoom => AppConfig.useFastEnterRoom && !ChatRoomUtil.isLayaWolf(_config);

  /// 房间配置接口地址
  String get _roomConfigUrl {
    Map<String, dynamic> params = {
      'version': RoomConstant.configVersion,
      'from_match': _rid == matchRid ? 1 : 0,
      'board_game_version': RoomConstant.boardGameConfigVersion,
      'room_version': RoomConstant.roomVersion,
    };
    String paramsStr = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '${System.domain}room/config?$paramsStr';
  }

  /// 房间配置接口参数
  Map<String, String> get _roomConfigParams => {
        'rid': '$_rid',
        'init': _init ? '1' : '0',
        'refer': refer ?? '',
        'password': (Util.validStr(_password)) ? _password : PasswordManager.getValue(_rid),
        if (inviterUid > 0) 'inviter_uid': '$inviterUid',
        if (Util.validStr(searchString)) 'search_string': searchString!,
        if (Util.validStr(source))
          'source': source!
        else if (refer == 'gs_public_screen_recommend' || refer == 'gs_1v1_recommend')
          'source': 'gs_recommend_room'
      };

  /// 检查是否密码错误
  void _checkIsPasswordError(Map data) {
    String error = Util.notNullStr(data['error']);
    if (!error.startsWith('password')) return;
    _requestPassword = true;
    PasswordManager.remove(_rid); // 清除之前保存的该房间的密码
    String? reason = Util.parseStr(data['reason']);
    if (error == 'password.error' && reason != null) {
      // 密码错误
      _errorMsg = reason;
    } else if (error == 'password.required') {
      // 需要密码
      _errorMsg = K.room_input_password;
    }
  }

  void _createErrorExpend(Map data) {
    if (!data.containsKey('jid')) return;
    _errorExpend = ErrorExpend(
      msg: Util.notNullStr(data['msg']),
      jid: Util.parseInt(data['jid']),
      name: Util.notNullStr(data['name']),
      type: Util.parseInt(data['type']),
      errorCode: Util.parseInt(data['errorCode']),
    );
  }

  /// config接口出错
  bool _onConfigError(String? errorMsg, {Map? data}) {
    loading = false;
    _errorMsg = errorMsg;
    if (data != null) {
      _checkIsPasswordError(data);
      _createErrorExpend(data);
    }
    emit(RoomConstant.Event_Refresh);
    return false;
  }

  Future<bool> loadConfig([bool slow = false]) async {
    _errorMsg = null;
    _errorExpend = null;
    _requestPassword = false;
    _passwordMessage = null;

    /// 调用通用的roomConfig接口
    XhrResponse response = await Xhr.postJson(
      _roomConfigUrl,
      _roomConfigParams,
      optimize: slow ? true : false,
    );
    if (response.error != null) {
      // 接口请求出错
      return _onConfigError(response.error.toString());
    }
    Map resp = response.value();
    if (resp.isEmpty) {
      // 接口返回空数据
      return _onConfigError(base.K.server_return_error_retry);
    }
    if (!Util.parseBool(resp['success'])) {
      // 接口查询失败
      return _onConfigError(Util.parseStr(resp['msg']), data: resp);
    }

    RoomConfig? oldConfig = _config; // 缓存之前的config

    Map dataMap = resp['data'];
    _init = false;
    _socket = (dataMap['socket']).toString().replaceFirst("https://", "wss://");
    _config = RoomConfig.fromJson(dataMap['config']);

    hideLayaBar = Util.parseBool(dataMap['config']?['hide_laya_bar'], false);

    if (_config!.roomHot > 0) {
      _roomHot = _config!.roomHot;
    }

    if ((isKtvRoom || isKtvChorusRoom) && ((oldConfig == null) || (oldConfig.rid != _config!.rid))) {
      /// 第一次进房/切换房间
      /// 切换房型走的socket，暂不处理
      String today = DateTime.now().toyyyyMMdd();
      String lastShowDay = Config.get(KtvSingSongTipsDialog.KTV_SING_SONG_TIPS, '');
      if (today != lastShowDay) {
        /// 今天没有弹过，
        KtvSingSongTipsDialog.delayShowDialog();
      }
    } else if (!isKtvRoom && !isKtvChorusRoom) {
      KtvSingSongTipsDialog.dismiss();
    }

    int? targetRtcSdk = _config!.rtcType;
    targetRtcSdk = useDevRtcType(targetRtcSdk);
    currentRtcStreamId = Util.parseStr(dataMap['rtc_stream_id']);

    await _compareRtcSdk(targetRtcSdk);

    if (dataMap.containsKey('art_center') && dataMap['art_center'] != null && dataMap['art_center'] is Map) {
      isArtCenterAll = dataMap['art_center']['room_factory_type'] == 'business-artcenter';
      isArtCenterAdmin = dataMap['art_center']['is_admin'] ?? false;
    } else {
      isArtCenterAll = false;
      isArtCenterAdmin = false;
    }
    //模拟厅在线人数
    if (_config?.property == RoomProperty.virtual) {
      _onlineNum = Util.parseInt(_config?.virtualOnlineNum);
    }
    _isBaba = Util.parseBool(dataMap['is_baba']);
    if (dataMap['rcmd_limit'] != null && dataMap['rcmd_limit'] is Map) {
      limitTimes = RcmdLimit.fromJson(dataMap['rcmd_limit']);
    }
    Map packetMap = dataMap['package'] is Map ? dataMap['package'] : {};
    packetMap["package_privilege"] = Util.parseBool(dataMap['package_privilege']);
    packetMap["package_left_sec"] = Util.parseInt(dataMap['package_left_sec']);
    redPacketConfig = PacketConfig.fromJson(packetMap);
    showGpk = Util.parseBool(dataMap['show_gpk'], false);
    pluginList = Util.parseList(dataMap['plugin_list'], (e) => Util.parseStr(e) ?? '');
    impressTagList = Util.parseList(dataMap['impress_tag'], (e) => (e as Map<String, dynamic>));
    safeNotify = dataMap['safe_notify'] is Map ? dataMap['safe_notify'] : {};
    newbieGifts = Util.parseList(dataMap['gift_notice'], (e) => (e as Map<String, dynamic>));
    showVipSeat = Util.parseInt(dataMap['vipmic'] == null ? null : dataMap['vipmic']['show'], 0) == 1;
    showPKSuperMatch = Util.parseBool(dataMap['show_pk_pendant'], false);
    showAnniversary = Util.parseBool(dataMap['show_anniversary_pendant'], false);
    showAnnualCelebration = Util.parseBool(dataMap['show_ap_pendant'], false);
    _liveDataFlag = Util.parseBool(dataMap['live_data_flag']);
    prettyRid = Util.parseInt(dataMap['pretty_rid'], 0);
    musicOrderSinger = Util.parseInt(dataMap['music_order_singer'], 0);
    musicOrderId = Util.parseInt(dataMap['music_order_music_id'], 0);
    hasJoinFansGroup = Util.parseBool(dataMap['has_join_fans_group']);

    if (dataMap['crosspk'] is Map) {
      crossPKEnable = Util.parseBool(dataMap['crosspk']['cross_pk_enable'], false);
      showCrossPK = Util.parseInt(dataMap['crosspk']['show_cross_pk'], 0);
    } else {
      crossPKEnable = false;
      showCrossPK = 0;
    }

    if (dataMap.containsKey('lucky') && dataMap['lucky'] is Map) {
      heartPassEntrance = HeartPassEntrance.fromJson(dataMap['lucky']);
    } else {
      heartPassEntrance = null;
    }

    /// 解析房间插件入口
    parseRoomPlugins(dataMap['plugins']);

    hitConfig = dataMap['hit_config'];
    showRoomDataTab = Util.parseBool(dataMap['show_room_data_tab']);
    gpkEnable = Util.parseBool(dataMap['gpk_enable'], false);
    if (dataMap['hit'] != null && dataMap['hit'] is Map) {
      comboGift = Gift.fromJson(dataMap['hit']);
    } else {
      comboGift = null;
    }

    if (dataMap['screen'] != null && dataMap['screen'] is Map) {
      screenShowModel = ScreenShowModel.fromJson(dataMap['screen']);
    } else {
      screenShowModel = null;
    }
    optionSettingType = getSettingType(Util.parseInt(dataMap["option_setting_type"], 0));

    if (dataMap['pay_gift'] != null && dataMap['pay_gift'] is Map) {
      firstPayGift = FirstPayGift.fromJson(dataMap['pay_gift']);
    } else {
      firstPayGift = null;
    }

    /// 排行榜显示
    showRankingList = config?.haveRoomCharm == 1;
    cpLinkAssist = Util.parseInt(dataMap['cplink_assist'], 1) == 1;
    features = Util.parseList<String>(dataMap['features'], (e) => Util.parseStr(e) ?? '');

    msgSendIntervalMode = Util.parseInt(dataMap['msg_send_interval_mode']);
    msgAppearRate = Util.parseInt(dataMap['msg_appear_rate']);
    msgAppearFlushNum = Util.parseInt(dataMap['msg_appear_flush_num']);

    /// 异常卡幽灵麦恢复
    if (canPk) {
      pkMuteRemoteAudioStream();
    }
    offMicList = ChatRoomUtil.parseOffMicList(dataMap['offMicList']);
    if (dataMap['ktv_pk_rank'] != null && dataMap['ktv_pk_rank'] is Map) {
      ktvPkRank = KtvPkRankConfig.fromJson(dataMap['ktv_pk_rank']);
    }

    vadEnabled = Util.parseBool(dataMap['vad_enabled'], false);
    vadInterval = Util.parseInt(dataMap['vad_interval'], 60);
    // vadInterval = 5; // for test only

    if (isKtvRoom && _config!.ktvInfo != null) {
      KtvMusicController.onKtvInfo(RoomConstant.Event_Ktv_Info, _config!.ktvInfo);
    }

    isFollowCreator = dataMap['owner_follow'] == 1;
    isFollowReception = Util.parseBool(dataMap['reception_follow']);
    _iconCacheFilePath = ChatRoomUtil.getIconCachePath(_config!.icon);
    _ownerName = _config!.name;
    //连连看场景房没有创建者后台返回空数组
    _createor = RoomCreator.fromJson(dataMap['createor'] is Map ? dataMap['createor'] : {});
    _positions.clear();
    List list = dataMap['list'];
    for (int i = 0; i < list.length; i++) {
      _positions.add(RoomPosition.fromJson(_config!.game, list[i], getGlobalKey(i), factoryType: config?.factoryType));
    }
    await GodTagUtil.updateGodTags(_positions);

    /// 电台守护坑位升级
    dynamic roomDefend = dataMap['room_defend'];
    if (roomDefend != null && roomDefend is List && roomDefend.isNotEmpty) {
      for (int i = 0; i < roomDefend.length; i++) {
        if ((i + 1) < _positions.length) {
          _positions[i + 1].roomDefend.fromJson(roomDefend[i]);
        }
      }
    }

    needVerify = Util.parseInt(dataMap['need_verify']);
    needVerifyNew = Util.parseInt(dataMap['need_verify_new']);

    if (dataMap['h5'] != null && dataMap['h5'] is Map) {
      operateH5 = dataMap['h5'];
    }

    //卧底房获取卧底词
    ChatRoomUtil.checkAndReloadUnderWord();

    dynamic defends = dataMap['defends'];
    if (defends != null && defends is List && defends.isNotEmpty) {
      _defends.clear();
      for (int i = 0; i < defends.length; i++) {
        _defends.add(Util.parseInt(defends[i]));
      }
    }

    _admins = Util.parseList(dataMap['admins'], (e) => Util.parseInt(e));
    _wait = Util.parseList(dataMap['wait'], (e) => Util.parseInt(e));

    waitProfiles = Util.parseList<Map<String, dynamic>>(dataMap['waitProfiles'], (e) => e);
    _waitForBoss = Util.parseList(dataMap['waitForBoss'], (e) => Util.parseInt(e));
    _waitForAuction = Util.parseList(dataMap['waitForAuction'], (e) => Util.parseInt(e));

    if (dataMap.containsKey('match')) {
      matchStatus = Util.parseInt(dataMap['match']['status']);
      matchLeftSeconds = Util.parseInt(dataMap['match']['left_seconds']);
    }

    if (dataMap.containsKey('match_config')) {
      showMatch = Util.parseInt(dataMap['match_config']['match']) > 0;
      if (dataMap['match_config'] != null && (dataMap['match_config'] as Map).containsKey('roles')) {
        showMatchRoles = Util.parseList(dataMap['match_config']['roles'], (e) => Util.parseStr(e) ?? '');
      }

      if (dataMap['match_config'] != null) {
        matchAllSeconds = Util.parseInt(dataMap['match_config']['recruit_seconds']);

        hasLoadMatchTime = true;
      }
    }

    try {
      String purview = dataMap['purview'].toString().toLowerCase();
      _purview = Purview.values.firstWhere((Purview type) {
        return type.name.toLowerCase() == purview;
      });
    } catch (e) {
      _purview = Purview.Normal;
    }

    permission = Util.parseInt(dataMap['permission'], 0);

    _follow = Util.parseBool(dataMap['follow']);

    Map? map = dataMap['config'];
    if (map != null && map.containsKey('themeSwitchBackground')) {
      _themeSwitchBackground = Util.parseList(map['themeSwitchBackground'], (e) => Util.parseStr(e) ?? '');
    }

    if (resp.containsKey('_audioProfile') && resp['_audioProfile'] >= 0 && resp['_audioProfile'] <= 5) {
      rtcController.audioProfile = AudioProfile.values[resp['_audioProfile']];
    }
    if (resp.containsKey('_audioScenario') && resp['_audioScenario'] >= 0 && resp['_audioScenario'] <= 5) {
      rtcController.audioScenario = AudioScenario.values[resp['_audioScenario']];
    }
    if (Constant.isDevMode && devZegoAnsType != null) {
      RtcBizConfig.ansMode = devZegoAnsType;
    } else {
      int ansMode = Util.parseInt(resp['ans_mode']);
      if (ansMode > 0) {
        RtcBizConfig.ansMode = ansMode - 1; //服务端值比本地索引大1，防止服务端没下发值时被当做0
      }
    }

    isSuper = dataMap['is_super'] == true;

    //剧本杀
    if (dataMap.containsKey('ju_config')) {
      expand = dataMap['ju_config'];
      micGroup = (expand['micGroup'] != null && expand['micGroup'] is Map) ? expand['micGroup'] : null;
    }

    //公屏引导
    if (dataMap.containsKey('room_guide')) {
      roomGuide = (dataMap['room_guide'] != null && dataMap['room_guide'] is Map) ? dataMap['room_guide'] : null;
    }

    var group = dataMap['kfg_show'];
    if (group is Map) {
      fansGroup = FansGroupInfo.fromJson(group as Map<String, dynamic>);
    }

    var giftWish = dataMap['gift_wish'];
    if (giftWish != null && giftWish is Map && giftWish.isNotEmpty) {
      roomWishGiftsData = RoomWishGiftsData.fromJson(giftWish as Map<String, dynamic>);
    } else {
      roomWishGiftsData = null;
    }

    _showVisitantRank = Util.parseBool(dataMap['show_room_vip']);
    visitantIcon = Util.parseStr(dataMap['room_vip_rank_icon']);

    gameListLabelStatus = GameListUtil.parseShowStatus(dataMap);

    _isJukebox = Util.parseBool(dataMap['is_jukebox'], false);

    autoMic = Util.parseBool(dataMap['auto_mic']);

    if (dataMap['star_sign'] != null && dataMap['star_sign'] is Map) {
      showStarSign = Util.parseInt(dataMap['star_sign']['show'], 0) == 1;
    } else {
      showStarSign = false;
    }

    if (dataMap['ktv_task'] != null && dataMap['ktv_task'] is Map) {
      showKtvTask = Util.parseInt(dataMap['ktv_task']['show_task'], 0) == 1;
    } else {
      showKtvTask = false;
    }

    if (dataMap['privilege'] != null && dataMap['privilege'] is Map) {
      showNewRoomPrivilege = Util.parseInt(dataMap['privilege']['rookie'], 0) == 1;
      newRoomPrivilegeDuration = Util.parseInt(dataMap['privilege']['duration'], 0);
    } else {
      showNewRoomPrivilege = false;
      newRoomPrivilegeDuration = 0;
    }

    ktvSourceType = Util.parseInt(dataMap['ktv_source_type']);

    /// 捂耳朵icon
    if (dataMap.containsKey('cover_ear_icon')) {
      _coverEarIcon = Util.parseStr(dataMap['cover_ear_icon']);
    }

    if (isLiveRoom) {
      if (_liveHungUpTimer != null) _liveHungUpTimer!.cancel();
      if (_config?.uid == Session.uid) {
        //主播才检测
        _liveHungUpTimer = Timer.periodic(const Duration(seconds: 30), _onLiveHangUpCheck);
      }
    }

    /// 新用户引导奖励
    if (dataMap.containsKey('new_user_notify')) {
      newUserNotify = Util.parseStr(dataMap['new_user_notify']) ?? '';
    }

    nest = dataMap['nest'];

    if (dataMap['private_nest'] != null && dataMap['private_nest'] is Map && Util.parseInt(dataMap['private_nest']['showList']) > 0) {
      showPrivateRoomEntry = true;
    } else {
      showPrivateRoomEntry = false;
    }

    commonSwitch = Util.parseInt(dataMap['common_switch']);
    emit(RoomConstant.Event_Room_Common_Switch); // 发送房间通用开关消息

    MsgSendFrequency.instance.enableFrequency(msgSendIntervalMode == 1);

    if (_useFastEnterRoom) {
      // 使用快速进房时，提前结束loading状态，并刷新页面
      loading = false;
    }

    await _compare();

    if (_channel == null) {
      _loadWebSocket();
    } else {
      if (true != rtcController.initialized) {
        Log.d(tag: TAG, 'rtc-engine loadConfig try to init rtc.');
        await _initRtc();
      } else {
        _refreshRtcTask();
      }
    }
    loadLiveConfig();
    loadContributeData();
    loadGeneralSetting();

    if (config?.antiAuction == true) {
      showAntiAddictionDialog();
    }

    /// 关联房间公屏数据拉取
    if (dataMap.containsKey('darinage')) {
      getDrainagePreviewData(rid);
    }

    checkSubChannel();

    return true;
  }

  Future checkSubChannel() async {
    Log.d(tag: TAG, 'checkSubChannel, rtcController.initialized: ${rtcController.initialized}');
    if (rtcController.initialized) {
      if (isArtCenterAll && isArtCenterInsertOtherRoom) {
        await ChatRoomUtil.joinSubChannel(_config?.rid ?? 0, this);
      } else {
        await ChatRoomUtil.stopSubChannel(this);
      }
    }
  }

  /// 防沉迷弹窗
  bool _isAntiAddictionShow = false;

  void showAntiAddictionDialog() async {
    if (_isAntiAddictionShow) {
      return;
    }

    _isAntiAddictionShow = true;

    bool? suc = await showDialog(
      context: System.context,
      builder: (BuildContext context) {
        return const Center(
          child: AntiAddictionDialog(),
        );
      },
    );

    if (suc != true) {
      _leaveRoom();
    }

    _isAntiAddictionShow = false;
  }

  /// 处理非首次初始化Rtc任务
  Future<void> _refreshRtcTask() async {
    rtcController.syncPullExtraStream();
  }

  /// 比较rtc sdk的引擎，销毁不同目标sdk引擎，为后续重新初始化做准备
  Future<void> _compareRtcSdk(int? targetRtcSdk) async {
    Log.d(tag: TAG, 'rtc-engine _compareRtcSdk rtcSdk=$currentRtcType,targetSdk=$targetRtcSdk');
    if (null == currentRtcType && (null == targetRtcSdk || targetRtcSdk <= 0)) {
      Log.d(tag: TAG, 'rtc-engine _compareRtcSdk first Agora.');
      currentRtcType = RtcBizConfig.rtcTypeAgora;
    } else if (targetRtcSdk != null) {
      if (currentRtcType != targetRtcSdk) {
        Log.d(tag: TAG, 'rtc-engine _compareRtcSdk destroy previous sdk->$currentRtcType');
        await rtcController.destroy();
        currentRtcType = targetRtcSdk;
      }
    }
  }

  int get timestamp {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000 + (_serverTime - _localTime);
  }

  int get localtime => _localTime;

  // 重试总时间
  static const int retryMaxTime = 30000;
  int _errorTime = 0;

  bool _isTrying = false;

  /// 关闭WebSocket
  void _closeWebSocket() {
    Log.d(tag: TAG, "websocket closed: state=${_channel?.readyState} code=${_channel?.closeCode} reason=${_channel?.closeReason}");
    _pingTimer?.cancel();
    _pingTimer = null;

    if (_channel?.readyState == WebSocket.open) {
      _channel?.close();
    }
    _channel = null;
  }

  _closeThenTry() async {
    Log.d(tag: TAG, '_closeThenTry: _rid=$_rid _errorTime=$_errorTime _isTrying=$_isTrying _disposed=$_disposed');

    if (_isTrying || _disposed || _rid <= 0 || _config == null) return;

    _closeWebSocket();

    if (_errorTime >= retryMaxTime) {
      _isTrying = false;
      Toast.show(System.context, K.room_chat_con_failed_retry);
      TopLiveTool.destroy();
      return;
    }

    ConnectivityResult? result = await _conn?.checkConnectivity();
    Log.d(tag: TAG, '_closeThenTry: ConnectivityResult=$result');

    int delayTime = result == ConnectivityResult.none ? 3000 : 500;
    _errorTime = _errorTime + delayTime;
    _isTrying = true;
    await Future.delayed(Duration(milliseconds: delayTime), () {
      _isTrying = false;
      if (_channel == null && _rid > 0 && !_disposed) {
        _loadWebSocket();
      }
    });
  }

  Future<Map<String, dynamic>?> parsePb(Map res) async {
    int id = Util.parseInt(res['enc'], 0);
    String? socketName = PbTypeUrls.getIdName('registerId/$id');

    Log.d(tag: TAG, 'parsePb, id: $id, name: $socketName');
    if (!Util.validStr(socketName)) {
      Log.i(tag: TAG, 'parsePb, socketName is null, id: $id');
      return null;
    }

    PbInstanceBuilder? instanceBuilder = PbTypeUrls.get('registerName/$socketName');
    if (instanceBuilder == null) {
      Log.i(tag: TAG, 'parsePb, instanceBuilder == null, name: $socketName');
      return null;
    }

    if (!res.containsKey('pb')) {
      Log.i(tag: TAG, 'parsePb, pb is null , name: $socketName');
      return null;
    }

    try {
      ByteData byte = res['pb'];
      Uint8List buffer = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
      GeneratedMessage pbModel = instanceBuilder();
      pbModel.mergeFromBuffer(buffer);
      Map jsonMap = pbModel.toProto3Json() as Map;
      Map<String, dynamic> content = {};
      if (socketName == 'system.screen.message') {
        /// 消息类型1
        content['content'] = jsonMap['content'];
        content['extra'] = jsonMap['extra'];
        content['user'] = jsonMap['user'];
        content['messageId'] = jsonMap['messageId'];
        return content;
      } else if (socketName == 'common.content') {
        /// 消息类型2
        content['content'] = jsonMap['content'];
        content['extra'] = jsonMap['extra'];
        content['user'] = jsonMap['user'];
        content['messageId'] = jsonMap['messageId'];
        return content;
      } else {
        content['name'] = socketName;
        content['data'] = jsonMap;
        return content;
      }
    } catch (e) {
      Log.d(tag: TAG, 'parsePb error: $e');
    }
    return null;
  }

  bool _isConnecting = false;
  Completer<bool>? socketCompleter;

  void _resetCompleter([bool result = false]) async {
    if (socketCompleter != null && socketCompleter!.isCompleted == false) {
      socketCompleter!.complete(result);
    }
    socketCompleter = null;
  }

  void _initSocketCompleter() {
    socketCompleter = Completer();
    socketCompleter?.future.timeout(const Duration(seconds: 15), onTimeout: () {
      Log.d('socket completer timeout after 15s');
      PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectError, {'error': 'socket completer timeout'}));
      _resetCompleter(false);
      return false;
    });
  }

  Future<bool> _loadWebSocket() async {
    Log.d(tag: TAG, '_loadWebSocket: _isConnecting=$_isConnecting disposed=$_disposed');
    if (_isConnecting || _disposed) return false;
    _isConnecting = true;

    /// 如果有正在进行的同步操作，则等待其完成再更新，保证更新顺序
    if (socketCompleter != null) {
      Log.d('_loadWebSocket wait');
      return await socketCompleter!.future;
    }

    _initSocketCompleter();
    bool success = false;
    String? token;

    try {
      // 连接websocket
      Log.d(tag: TAG, 'start connect to $_socket');
      _channel = await WebSocket.connect(_socket ?? System.webSocketDomain);
      _channel?.pingInterval = const Duration(seconds: _socketPingInterval);

      _localTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      _serverTime = _localTime;
      // 监听websocket数据
      _channel?.listen(
        (message) => dispatchSocketMsg(message),
        onDone: () {
          Log.d(tag: TAG, 'websocket onDone');
          PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.onDone, {})); // 连接结束
          _closeThenTry();
        },
        onError: (e) {
          Log.e(tag: TAG, 'websocket onError:$e');
          PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectError, {'error': e.toString()})); // 连接出错
          _closeThenTry();
        },
        cancelOnError: true,
      );
      Log.d(tag: TAG, 'websocket connect ok!!!');
      PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectSucc, {})); // 连接成功

      _pingTimer?.cancel();
      _pingTimer = Timer.periodic(const Duration(milliseconds: 5000), _onPingTimeout); // 启动心跳检测

      token = await _joinChannel();
      if (token != null && token.isNotEmpty) {
        success = true;
      }
    } catch (e) {
      Log.e(tag: TAG, 'websocket connect error:$e');
      PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectError, {'error': e.toString()}));
      _closeThenTry();
      return false;
    } finally {
      _isConnecting = false;
      Log.d('_loadWebSocket socketCompleter success:false');
      _resetCompleter(success);
    }

    if (_disposed) {
      // socket连接成功，但是房间已关闭
      Log.d(tag: TAG, 'websocket connect success, but room disposed.');
      _closeWebSocket();
      return false;
    }
    if (token != null && token.isNotEmpty) {
      if (!rtcController.initialized) {
        // rtcEngine未初始化
        //rtcController.rtcType = null;
        await _initRtc(token: token); // 初始化rtcEnding
      }
    }
    return success;
  }

  /// 加入频道，返回频道token
  Future<String?> _joinChannel() async {
    String? token;
    Log.d(tag: TAG, 'rtc-engine >>> join channel $_rid,cur.rtc=$currentRtcType,config.rtc=${_config?.rtcType},sendIndex=${_sendIndex + 1}');
    DataRsp rsp = await _send(
      'joinChannel',
      wait: false,
      data: {'rid': _rid, 'token': Session.token, 'version': RoomConstant.configVersion, 'rtc_type': currentRtcType},
    );
    if (rsp.success && rsp.data is String) {
      token = rsp.data;
    } else {
      Log.d(tag: TAG, '_joinChannel token error:${rsp.msg}');
      _closeThenTry();
    }
    Log.d(tag: TAG, '_joinChannel token:$token');
    return token;
  }

  /// execFirstBiz 执行首次初始化后的任务，通过Socket再次初始化的不用走此逻辑
  Future<void> _initRtc({bool execFirstBiz = true, String? token}) async {
    Log.d(tag: TAG, 'initRtc => currentRtcType:$currentRtcType rtcController.rtcType:${rtcController.rtcType}');
    if (rtcController.rtcType == currentRtcType) {
      return;
    }
    rtcController.rtcType = currentRtcType;

    if (token == null || token.isEmpty) {
      token = await _joinChannel();
    }

    if (Util.isStringEmpty(token)) {
      rtcController.rtcType = null;
      Log.e(tag: TAG, 'initRtc error: token is null');
      return;
    }

    RtcUseDelegate bizRtcDelegate = RtcUseDelegate(
      micDelegate: () => isMic,
      uidFuc: () => Session.uid,
      speakerTickCallback: _onSpeakerTick,
      canSpeak: _canSpeak,
      talking: (int uid, int volume, int now, int vad) {
        if (volume >= 19) {
          //如果发言的有自己，且发言音量达到19，则通知，注册了事件的页面则会收到消息
          eventCenter.emit(RoomConstant.Event_Self_Valid_Desc, now);
        }
        if (uid == 0) {
          // 本人本地音量变化
          if (currentRtcType == RtcBizConfig.rtcTypeAgora) {
            volume ~/= 1.5; // 声网采集的音量略大,适当削减一下
          }
          // Log.d('=====>room volume=$volume');
          eventCenter.emit(EventConstant.EventOnSelfVolumeChanged, volume);
        }
        if (ChatRoomUtil.isLive(_config) && _config?.uid == Session.uid) {
          RoomPosition? pos = ChatRoomUtil.getPositionByServer();
          Log.d(tag: TAG, 'ChatRoomData.live.speaking...pos = ${pos?.position}, this._config.uid = ${_config?.uid} and vad = $vad');
          if (pos?.position == 0 && vad == 1) {
            _hungUpTime = 0;
          }
        }
      },
      speakersChange: () => speakers.value = rtcController.speakers,
      getPublishStream: () => currentRtcStreamId ?? '',
      getLeadSingerStream: () => leadSingerRtcStreamId ?? '',
      getChorusStream: () => chorusRtcStreamIds.toSet(),
      renewToken: () async => await _renewToken(),
    );
    await rtcController.initEngine(token!, bizRtcDelegate);
    rtcController.enableVad(getVadEnabled);
    rtcController.setVadCheckInterval(vadInterval);
    rtcController.syncVoiceEffect(_config?.inflexion ?? 0);

    ChatRoomUtil.doAfterAgoraJoined();

    Log.d(tag: TAG, 'initRtc success: execFirstBiz=$execFirstBiz');
    // 处理首次初始化Rtc后的业务工作
    if (execFirstBiz) {
      await _refreshRtcTask();

      await _compare(false);

      loading = false;
      emit(RoomConstant.Event_Refresh);

      if (config != null &&
          !config!.nine &&
          config!.game == Games.None &&
          Session.uid == config!.uid &&
          role == ClientRole.Audience &&
          (isNormalEightPosition || isFivePosition)) {
        // 设置了显示房主位，进房间房主默认上麦
        await setRole(ClientRole.Broadcaster);
      }
    } else {
      await setRole(_role);
    }

    await KtvMusicController.setKtvRoleToRtc();

    await checkSubChannel();
  }

  Future dispatchSocketMsg(dynamic message) async {
    if (_disposed) return;
    if (_errorTime > 0) {
      // 重试连接上之后，需要刷一下麦位信息
      Log.d(tag: TAG, "websocket---------loadConfig");
      _errorTime = 0;
      await loadConfig();
    }

    _isTrying = false;
    List<int> msgBytes = message as List<int>;
    if (baseGameRoomManager.isGameMsg(msgBytes)) {
      baseGameRoomManager.handleMsg(msgBytes);
      Log.d(tag: TAG, "handle game message ,return");
      return;
    }
    msgBytes = _preprocessMessage(msgBytes);

    dynamic data = unpack(msgBytes);
    // Log.d(data, tag: LOG_TAG_SOCKET_MSG,);
    if (data is int) {
      _serverTime = data;
      _localTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    } else if (data is String) {
      //消息推送
    } else {
      if (data is! Map) return;
      Map res = data;
      if (res.containsKey('i')) {
        int index = Util.parseInt(res['i']);
        if (_promiseMap.containsKey(index)) {
          ChannelCallBack callBack = _promiseMap[index]!;
          if (res['s'] == true) {
            callBack.onSuccess?.call(res['data']);
          } else {
            callBack.onError?.call(res['msg'] ?? '');
          }
          _promiseMap.remove(index);
        }
        if (!_isBaba) {
          PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.receive, {'msg': data}));
        }
      } else {
        //from push
        // Log.d(TAG,"dispatchSocketMsg: res:$res");
        if (Util.parseInt(res['enc'], 0) > 0) {
          if (Util.parseInt(res['enc'], 0) > 10000) {
            /// 后续添加socket，直接走PB，不再pb转Map
            await _onPbEventNotify(res);
            return;
          }

          /// pb格式，先做转换
          Map? content = await parsePb(res);
          if (content != null) {
            res['fromPb'] = content;

            if (!_isBaba) {
              PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.receive, {'msg': content}));
            }
          }
        }

        if (res.containsKey('content') || res.containsKey('fromPb')) {
          Map content;
          if (res.containsKey('fromPb')) {
            content = res['fromPb'];
          } else {
            content = res['content'];
          }
          if (content.containsKey('name') && content.containsKey('data')) {
            dynamic data = content['data'];
            Map push;
            if (data is String) {
              try {
                push = json.decode(data);
              } catch (e) {
                Log.e(tag: TAG, "message parse error :$e");
                return;
              }
            } else if (data is Map) {
              push = data;
            } else {
              return;
            }
            //解析消息
            await _onEventNotify(Util.notNullStr(content['name']), push);
          } else {
            Map? extra;
            if (content['extra'] is String) {
              extra = json.decode(content['extra']);
            } else {
              extra = content['extra'];
            }
            extra = extra ?? {};
            MessageContent message = MessageContent.from(
              Util.parseStr(content['content']),
              extra,
              content['user'],
              Util.parseInt(content['messageId']),
              mounts: extra['mounts'],
            );

            /// 初始化公屏通用标签
            await message.checkCommonTagData();
            LotteryManager.instance.onReceiveContent(message, rid);
            Log.d(tag: TAG, '******* Receive websocket ,type: ${message.type.name},user:${content['user']} ,extra: $extra');
            emit(RoomConstant.Event_Message, message);

            if (message.type == MessageType.RedPackage) {
              emit(RoomConstant.Event_Message_Red_Packet, message.extra);
            }
            RoomEventAnimationUtil.handleDefendMsg(message);
          }
        } else {}
      }
    }
  }

  bool get rtcInitialize => rtcController.initialized;

  /// PB类型socket处理逻辑（新增加的socket尽量都直接使用PB）
  Future<void> _onPbEventNotify(Map res) async {
    int id = Util.parseInt(res['enc'], 0);
    Log.d(tag: TAG, '_onPbEventNotify: parsePb, $id');
    String? socketName = PbTypeUrls.getIdName('registerId/$id');

    if (!Util.validStr(socketName)) {
      Log.d(tag: TAG, '_onPbEventNotify, socketName is null, id: $id');
      return;
    }

    if (!res.containsKey('pb')) {
      Log.d(tag: TAG, '_onPbEventNotify, pb is null , name: $socketName');
      return;
    }

    Log.d(tag: TAG, '_onPbEventNotify, id: $id, name: $socketName');

    try {
      ByteData? byte = res['pb'];
      Log.d(tag: TAG, '_onPbEventNotify, id: $id, name: $socketName , byte = $byte');

      Uint8List? buffer;
      if (byte != null) {
        buffer = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
        if (!_isBaba) {
          PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.receive,
              {'msg': '_onPbEventNotify', 'id': '$id', 'name': socketName, 'byte': String.fromCharCodes(buffer)},
              isPb: true));
        }
      }

      /// 先走内部处理
      if (!_roomRefreshPartNotify!.handleInner(socketName!, buffer)) {
        Log.d(tag: TAG, '******* Receive websocket, pb name: ${RoomConstant.Event_Pb_Prefix}$socketName');
        emit('${RoomConstant.Event_Pb_Prefix}$socketName', buffer);
      }
    } catch (e) {
      Log.e(tag: TAG, '_onPbEventNotify error: $e');
    }
    return;
  }

  Future<void> _onEventNotify(String name, Map data) async {
    Log.d(tag: TAG, "******* Receive websocket name: $name,data: $data");
    if (name == 'room.refersh') {
      await _onEventNotifyRefresh(name, data);
    } else if (name == 'Room.Online') {
      //模拟厅在线人数通过room.refersh刷新
      if (_config?.property != RoomProperty.virtual) {
        _onlineNum = Util.parseInt(data['num']);
        if (Util.parseInt(data['hot'], 0) > 0) {
          _roomHot = Util.parseInt(data['hot']);
        }
        eventCenter.emit(RoomConstant.Event_Online, roomHot);
      }
    } else if (name == RoomConstant.Event_Viewer) {
      emit(RoomConstant.Event_Viewer, Util.parseInt(data['num']));
    } else if (RoomConstant.Event_Room_Send_Mode == name) {
      var mode = Util.parseInt(data['msg_send_interval_mode'], -1);
      if (mode >= 0) {
        MsgSendFrequency.instance.enableFrequency(mode == 1);
      }
    } else if (RoomConstant.Event_Room_Lottery_Start == name) {
      LotteryManager.instance.onLotteryStart(data);
      eventCenter.emit(name);
    } else if (RoomConstant.Event_Room_Lottery_End == name) {
      LotteryManager.instance.onLotteryEnd(data);
      eventCenter.emit(name);
    } else if ([RoomConstant.Event_Room_Limit_Package, RoomConstant.Event_Room_Achievement_Unlock].contains(name)) {
      eventCenter.emit(name, data);
    } else if (RoomConstant.Event_Room_Lucky_bag_refresh == name) {
      eventCenter.emit(name, data);
    } else if (RoomConstant.Event_Room_Visitant_Upgrade == name) {
      VisitantUpgradeDialog.show(System.context, VisitantUpgradeMsg.fromJson(data as Map<String, dynamic>));
    } else if (RoomConstant.Event_Trans_Room_Toast == name) {
      /// toast提示
      Log.d(tag: TAG, 'room event name: $name, data: $data');
      if (Util.validStr(Util.parseStr(data['msg']))) {
        Fluttertoast.showToast(msg: Util.notNullStr(data['msg']), duration: const Duration(seconds: 5));
      }
    } else if (RoomConstant.Event_Trans_Room_Reload == name) {
      /// 强制loadConfig
      Log.d(tag: TAG, 'room event name: $name, data: $data');
      int sec = Util.parseInt(data['duration'], 10);
      Duration duration = Duration(milliseconds: Random().nextInt(sec * 1000));
      Future.delayed(duration, () {
        if (_disposed) {
          return;
        }
        loadConfig();
      });
    } else if (RoomConstant.Event_Nest_Created_Notify == name) {
      /// 情感房，牵手成功，横幅+动效
      Log.d(tag: TAG, 'Event_Nest_Created_Notify, data: $data');

      /// 动效
      Map gs = data['gs'] ?? {};
      Map boss = data['boss'] ?? {};
      if (Util.parseInt(data['vap_size']) > 0 && Util.validStr(data['vap_url'])) {
        Map giftData = {};
        giftData['uuid'] = data['uuid'];
        giftData['vap_size'] = Util.parseInt(data['vap_size']);
        giftData['url'] = data['vap_url'];
        giftData['vapImgs'] = [Util.getUserIconUrl(gs['icon']), Util.getUserIconUrl(boss['icon'])];
        emit(RoomConstant.Event_Go_Private_Gift, giftData);
      }

      /// 横幅
      Map welcome = {};
      welcome['my_icon'] = gs['icon'];
      welcome['to_icon'] = boss['icon'];
      emit(RoomConstant.EVENT_Go_To_Private_Room, welcome);
    } else if (RoomConstant.Event_Nest_Private_Invite == name) {
      /// GS和老板前往小窝
      Log.d(tag: TAG, 'Event_Nest_Private_Invite, data: $data');
      if ((Session.uid == Util.parseInt(data['boss']) || Session.uid == Util.parseInt(data['gs'])) && Util.parseInt(data['rid']) > 0) {
        if (Util.validStr(data['password'])) {
          PasswordManager.setValue(Util.parseInt(data['rid']), data['password']);
          eventCenter.emit(EventConstant.roomChangeRid, Util.parseInt(data['rid']));
        }
      }
    } else if (RoomConstant.Event_Trans_Room_Start_Ready == name) {
      /// 即将转播麦序房倒计时(即将开始转播)
      if (Util.parseInt(data['deadline']) > 0) {
        artCenterCounter = Util.parseInt(data['deadline']);
        artCenterCounterStart = true;
        artCenterCounterMgs = '';
        emit(RoomConstant.Event_Refresh);
      }
    } else if (RoomConstant.Event_Trans_Room_End_Ready == name) {
      /// 即将结束转播麦序房倒计时
      if (Util.parseInt(data['deadline']) > 0) {
        artCenterCounter = Util.parseInt(data['deadline']);
        artCenterCounterStart = false;
        artCenterCounterMgs = Util.parseStr(data['msg']);
        emit(RoomConstant.Event_Refresh);
      }
    } else if (RoomConstant.Event_Room_Plugins_Refresh == name) {
      _handlePluginsMsg(data);
    } else if ('room.grab.hat' == name) {
      _handleGrabHatMsg(data);
    } else if (RoomConstant.Event_Juke_Music_Change == name) {
      emit(name, data);
    } else {
      emit('${RoomConstant.Event_Prefix}$name', data);
    }
  }

  int _prePosition = -1;

  _onEventNotifyRefresh(String name, Map? data) async {
    if (data == null || data.containsKey('config') == false || _config == null) return;
    Map config = data['config'];
    int newRid = Util.parseInt(config['rid']);
    if ((!config.containsKey('version') || Util.parseInt(config['version']) < (_config?.version ?? 0)) && newRid == _config?.rid) {
      /// 麦序房，rid切换时不比较version，因为两个房间的version不是有序的
      Log.d(
          tag: TAG,
          'DEBUG: Ignore this refresh message, version not match, curVersion:${_config?.version}, targetVersion: ${Util.parseInt(config['version'])}');
      return;
    }

    //模拟厅在线人数
    if (_config?.property == RoomProperty.virtual && config['virtual_online_num'] != null) {
      _onlineNum = Util.parseInt(config['virtual_online_num']);
      eventCenter.emit(RoomConstant.Event_Online, _onlineNum);
    }

    /// 是否需要重新初始化rtc引擎
    bool needReInitRtcEngine = false;
    var needResetRoomMode = false;

    //从嘉宾交流到选择心动弹提示Toast
    CpLoveState? lastCpState = _config?.cpState;
    bool lastIsMusicRoom = isMusicRoom;
    if (data['config'] != null && data['config'] is Map) {
      // 隐藏laya顶部栏和底部栏
      if (config.containsKey('hide_laya_bar')) {
        hideLayaBar = Util.parseBool(data['config']['hide_laya_bar'], false);
      }

      ///粉丝牌显示新样式，socket不下发，需要用http接口取的
      if (_config?.liveDataV3 != null &&
          _config?.liveDataV3!.newLabel != null &&
          _config!.liveDataV3!.newLabel >= 0 &&
          data["config"]["live"] != null) {
        data["config"]["live"]["new_label"] = _config?.liveDataV3?.newLabel;
      }
      RoomConfig newConfig = RoomConfig.fromJson(data['config']);
      if (newConfig.type != _config?.type) {
        // 切换了房间类型
        Tracker.instance.track(TrackEvent.switch_room, properties: {
          'rid': newConfig.rid,
          'room_type': newConfig.type,
          'game_type': describeEnum(newConfig.game).toLowerCase(),
          'pre_room_type': _config?.type,
          'time': DateTime.now().millisecondsSinceEpoch,
          'owner_uid': newConfig.uid,
          'refer': refer,
          'room_channel': newConfig.types.toTypesString(),
          'room_property': describeEnum(newConfig.property),
        });
      }
      // socket有config字段并且type类型不一样，切换房间类型了
      if (newConfig.type != _config?.type || newConfig.factoryType != _config?.factoryType) {
        // 心动闯关插件入口
        if (data.containsKey('lucky') && data['lucky'] is Map) {
          heartPassEntrance = HeartPassEntrance.fromJson(data['lucky']);
        } else {
          heartPassEntrance = null;
        }

        bindModel?.dispose();
        bindModel = null;
      }

      /// 是否要重新初始化引擎
      /// 1、从说猜房切到其它房间或从其他房间切到说猜房 需要
      /// 2、从抢唱房切到其它房间或从其他房间切到抢唱房 需要
      /// 3、ktv合唱与其他房型互切，且rtc用的是zego
      /// 4.从游戏画猜房切到其它房间或从其他房间切到游戏画猜房 需要
      if (ChatRoomUtil.isSpeakGuess(_config) != ChatRoomUtil.isSpeakGuess(newConfig) ||
          ChatRoomUtil.isGrabMic(_config) != ChatRoomUtil.isGrabMic(newConfig)) {
        needReInitRtcEngine = true;
      }

      if ((ChatRoomUtil.isKtvChorus(_config) != ChatRoomUtil.isKtvChorus(newConfig))) {
        if (newConfig.rtcType == RtcBizConfig.rtcTypeZego) {
          needReInitRtcEngine = true;
        } else if (newConfig.rtcType == RtcBizConfig.rtcTypeAgora) {
          needResetRoomMode = true;
        }
      }

      _config = newConfig;
      if (_config!.roomHot > 0) {
        _roomHot = _config!.roomHot;
      }

      //模拟厅在线人数
      if (_config?.property == RoomProperty.virtual) {
        _onlineNum = Util.parseInt(_config?.virtualOnlineNum);
      }

      if (_config?.antiAuction == true) {
        showAntiAddictionDialog();
      }

      checkSubChannel();
    }
    if (lastCpState == CpLoveState.Reward && _config?.cpState == CpLoveState.Switch) {
      RoomPosition? position = ChatRoomUtil.getPositionByServer();
      if (position != null) {
        String targetName = ChatRoomUtil.isMan(position.position) ? K.goddess : K.male_god;
        if (position.position > 0) {
          Fluttertoast.showToast(msg: K.room_choose_your_heart_one([targetName]), gravity: ToastGravity.CENTER);
        }
      }
    }

    if (isBusinessHeart && lastCpState == CpLoveState.Result && _config?.cpState == CpLoveState.Wait) {
      emit(RoomConstant.EVENT_CP_HEART_NEW_TURN);
    }

    // 切入/切出音乐房
    if (lastIsMusicRoom != isMusicRoom) {
      RoomMusicControl.closeMusic();
    }

    showGpk = Util.parseBool(data['show_gpk'], false);
    if (showGpk) {
      /// 只在webSocket推送会下发
      var gpkIds = Util.parseIntList(data['gpk_uids']);
      showGpk = gpkIds.contains(Session.uid);
    }

    gpkEnable = Util.parseBool(data['gpk_enable'], false);

    if (isKtvRoom && _config?.ktvInfo != null) {
      emit(RoomConstant.Event_Ktv_Info, _config?.ktvInfo);
    }

    if (isGuessQueue && _config?.guessQueueRoomConfigData != null) {
      emit(RoomConstant.EVENT_REFRESH_GUESS_QUEUE_CONFIG, _config?.guessQueueRoomConfigData);
    }

    if (data['crosspk'] is Map) {
      if (showCrossPK > 0 && Util.parseBool(data['crosspk']['show_cross_pk'], false) == false) {
        /// 约战PK结束，变声惩罚消除/停止跨房连麦
        Log.d(tag: TAG, 'cross end 1111, stopChannelMediaRelay');
        emit(RoomConstant.Event_Local_Punish_Refresh, null);
        ChatRoomUtil.stopChannelMediaRelay(ChatRoomData.getInstance());
      }
      crossPKEnable = Util.parseBool(data['crosspk']['cross_pk_enable'], false);
      showCrossPK = Util.parseInt(data['crosspk']['show_cross_pk'], 0);
    } else {
      if (showCrossPK > 0) {
        /// 约战PK结束，变声惩罚消除/停止跨房连麦
        Log.d(tag: TAG, 'cross end 2222, stopChannelMediaRelay');
        emit(RoomConstant.Event_Local_Punish_Refresh, null);
        ChatRoomUtil.stopChannelMediaRelay(ChatRoomData.getInstance());
      }
      crossPKEnable = false;
      showCrossPK = 0;
    }

    ktvSourceType = Util.parseInt(data['ktv_source_type']);

    RoomPosition? pos = ChatRoomUtil.getPositionByServer();
    _prePosition = -1;
    if (pos != null) {
      _prePosition = pos.position;
    }

    if (data.containsKey('list') && data['list'] is List) {
      List<int> oldPosUids = List.of(_positions.map((e) => e.uid));
      _positions.clear();
      List list = data['list'];
      for (int i = 0; i < list.length; i++) {
        RoomPosition position = RoomPosition.fromJson(_config?.game, list[i], getGlobalKey(i), factoryType: _config?.factoryType);
        _positions.add(position);
        if (position.uid == Session.uid && inflexion != position.inflexion) {
          await rtcController.syncVoiceEffect(position.inflexion);
        }

        /// 如果用户在麦位上且被屏蔽，解除屏蔽
        rtcController.recoverMutedUser(position.uid);
      }
      _checkMicStatus(
        oldPosUids.where((e) => e > 0).toList(),
        _positions.map((e) => e.uid).where((e) => e > 0).toList(),
      );
      await GodTagUtil.updateGodTags(_positions);

      if (isGuessQueue || isBusinessHeart) {
        emit(RoomConstant.EVENT_REFRESH_MIC_LIST);
      }
    }

    gameListLabelStatus = GameListUtil.parseShowStatus(data);

    /// 电台守护坑位升级
    if (data.containsKey('room_defend') && data['room_defend'] is List) {
      dynamic roomDefend = data['room_defend'];
      if (roomDefend != null && roomDefend is List && roomDefend.isNotEmpty) {
        for (int i = 0; i < roomDefend.length; i++) {
          if ((i + 1) < _positions.length) {
            _positions[i + 1].roomDefend.fromJson(roomDefend[i]);
          }
        }
      }
    }

    /// 异常卡幽灵麦恢复
    if (canPk) {
      pkMuteRemoteAudioStream();
    }

    offMicList = ChatRoomUtil.parseOffMicList(data["offMicList"]);

    //剧本杀
    if (data.containsKey('ju_config')) {
      expand = data['ju_config'];
      micGroup = (expand['micGroup'] != null && expand['micGroup'] is Map) ? expand['micGroup'] : null;
    }

    //转房场景，socket通知房主变更
    if (data.containsKey('createor') && data['createor'] is Map) {
      _createor = RoomCreator.fromJson(data['createor']);
    }

    if (data.containsKey('defends') && data['defends'] is List) {
      dynamic defends = data['data']['defends'];
      if (defends != null && defends is List && defends.isNotEmpty) {
        _defends.clear();
        for (int i = 0; i < defends.length; i++) {
          _defends.add(Util.parseInt(defends[i]));
        }
      }
    }

    if (data.containsKey('admins') && data['admins'] is List) {
      _admins = Util.parseList(data['admins'], (e) => Util.parseInt(e));
    }

    //开黑状态
    if (data.containsKey('match') && data['match'] is Map) {
      Map match = data['match'];

      if (match['status'] != null) {
        matchStatus = Util.parseInt(match['status']);
      }

      if (match['left_seconds'] != null) {
        matchLeftSeconds = Util.parseInt(match['left_seconds']);
      }

      if (match['match'] != null) {
        showMatch = Util.parseInt(match['match']) > 0;
      }

      if (match['roles'] != null) {
        showMatchRoles = Util.parseList(match['roles'], (e) => Util.parseStr(e) ?? '');
      }
    }

    if (data.containsKey('purview') && data['purview'] is String) {
      try {
        String purview = data['purview'].toString().toLowerCase();
        _purview = Purview.values.firstWhere((Purview type) {
          return type.name.toLowerCase() == purview;
        });
      } catch (e) {
        _purview = Purview.Normal;
      }
    }

    if (data.containsKey("refreshRoomOptions")) {
      eventCenter.emit(EventConstant.RoomOptionsRefresh);
    }

    if (data.containsKey('gift_wish')) {
      var giftWish = data['gift_wish'];
      if (giftWish != null && giftWish is Map) {
        roomWishGiftsData = RoomWishGiftsData.fromJson(Map<String, dynamic>.from(giftWish));
      } else {
        roomWishGiftsData = null;
      }
      emit(RoomConstant.Event_Refresh_Gift_Wish);
    }

    if (data.containsKey('ktv_pk_rank')) {
      var ktvPkRankMap = data['ktv_pk_rank'];
      if (ktvPkRankMap != null && ktvPkRankMap is Map) {
        ktvPkRank = KtvPkRankConfig.fromJson(ktvPkRankMap as Map<String, dynamic>);
      } else {
        ktvPkRank = null;
      }
      emit(RoomConstant.Event_Ktv_Pk_Config_Change);
    }

    if (data.containsKey("plugin_list")) {
      pluginList = Util.parseList(data['plugin_list'], (e) => Util.parseStr(e) ?? '');
    }

    if (data.containsKey('safe_notify')) {
      safeNotify = data['safe_notify'] is Map ? data['safe_notify'] : {};
    }

    /// 捂耳朵icon
    if (data.containsKey('cover_ear_icon')) {
      _coverEarIcon = Util.parseStr(data['cover_ear_icon']);
    }

    /// 服务端保证正确性/必要性，客户端每次覆盖
    nest = data['nest'];

    if (data.containsKey('_options') && data['_options'] != null && data['_options'] is Map) {
      Map options = data['_options'];

      Log.d(tag: TAG, 'data_options:$options');

      switch (options['op']) {
        case 'kickout':
          if (Util.parseInt(options['uid']) == Session.uid) {
            _leaveRoom();
            Fluttertoast.showToast(msg: K.room_u_be_kickout, gravity: ToastGravity.CENTER);
            return;
          }
          break;

        case 'close':
          emit(RoomConstant.Event_Close_Room);
          _leaveRoom();
          Fluttertoast.showToast(msg: K.room_cur_room_was_closed, gravity: ToastGravity.CENTER);
          return;

        case 'leavelMic':
          if (Util.parseInt(options['uid']) == Session.uid) {
            Fluttertoast.showToast(msg: K.room_u_was_leaved_mic, gravity: ToastGravity.CENTER);
            RoomMusicControl.closeMusic();
          }
          break;

        case 'forbiddenMic':
          if (Util.parseInt(options['uid']) == Session.uid) {
            Fluttertoast.showToast(msg: K.room_u_was_closed_mic, gravity: ToastGravity.CENTER);
          }
          break;

        case 'lockMic':
          if (Util.parseInt(options['uid']) == Session.uid) {
            Fluttertoast.showToast(msg: K.room_your_mic_was_closed, gravity: ToastGravity.CENTER);
          }
          break;

        case 'roomMicroInvite':
          Log.d(tag: TAG, "roomMicroInvite.....");
          MicInviter micInviter = MicInviter.fromJson(options["data"]);
          if (micInviter.uid == Session.uid) {
            if (_disposed) {
              return;
            }
            InviteMicDialog.showInviteDialog(micInviter);
          }
          break;
        case 'clearMessage':
          emit("Room.ClearMessage");
          break;

        case 'toast':
          if (options.containsKey('uid') && options.containsKey('message') && options['message'] is String) {
            if (options['uid'] is List) {
              List<int> uids = Util.parseList(options['uid'], (e) => Util.parseInt(e));
              if (uids.contains(Session.uid)) {
                Fluttertoast.showToast(msg: options['message'], gravity: ToastGravity.CENTER);
              }
            } else if (options['uid'] is int || options['uid'] is double) {
              if (Util.parseInt(options['uid']) == Session.uid) {
                Fluttertoast.showToast(msg: options['message'], gravity: ToastGravity.CENTER);
              }
            } else {
              Fluttertoast.showToast(msg: options['message'], gravity: ToastGravity.CENTER);
            }
          }
          break;

        case 'sync':
          if (options.containsKey('uid')) {
            List<int> uids =
                (options['uid'] is List) ? Util.parseList(options['uid'], (e) => Util.parseInt(e)) : [Util.parseInt(options['uid'])];
            if (uids.contains(Session.uid)) {
              await loadConfig();
            }
          }
          break;

        case 'cp-match':
          if (options.containsKey('data') && options.containsKey('positions')) {
            CpMatchResultor.show(_creatorKey.currentContext, options['data']);
          }
          break;
        case 'roomChange':
          _doRoomChange(options);
          break;
        case 'room_transfer':
          int newRid = Util.parseInt(options['new_rid'], 0);
          if (newRid > 0) {
            bool selfChange = false;
            if (options.containsKey('out_uids') && options['out_uids'] is List) {
              List? uids = options['out_uids'];
              if (uids != null && uids.isNotEmpty) {
                for (var element in uids) {
                  if (Util.parseInt(element, 0) == Session.uid) {
                    selfChange = true;
                  }
                }
              }
            }
            if (selfChange) {
              eventCenter.emit(EventConstant.roomChangeRid, newRid); //切换房间
            }
          }
          break;
        case 'gift.package':
          // 刷新控制条的礼物Icon，首充礼包活动
          if (Util.parseInt(options['uid']) == Session.uid) {
            if (options['data'] != null && options['data'] is Map) {
              firstPayGift = FirstPayGift.fromJson(options['data']);
            } else {
              firstPayGift = null;
            }
          }
          break;

        case 'show_luckbag':
          eventCenter.emit(RoomConstant.EVENT_Value_Change_Refresh, 'show_luckbag');
          return;
        case 'hide_luckbag':
          eventCenter.emit(RoomConstant.EVENT_Value_Change_Refresh, 'hide_luckbag');
          return;
        case 'cp_link_end':
          _changeToCpLinkSceneRoom(options);
          break;

        case 'choose_scene':
          String text = options["text"];
          int opUid = Util.parseInt(options["op_uid"]);
          if (Util.isStringEmpty(text)) {
            return;
          }
          int uid = Session.uid;
          if ((uid == positions[2].uid || uid == positions[5].uid) && uid != opUid) {
            Fluttertoast.showToast(msg: text, gravity: ToastGravity.CENTER);
          }
          break;
        case 'join_fans_group':
          _joinFansGroup(options);
          break;
        case 'refresh_follow':
          eventCenter.emit(RoomConstant.Event_Reception_Follow_Refresh);
          break;
      }

      /// 卧底房消息处理
      if (options['op'] != null && options['op'].startsWith('game.under')) {
        emit(GameUnderWidget.DISPATCH_GAME_UNDER_EVENT, options);
      }

      /// 玩法房，1号麦结束游戏
      if (options['op'] != null && options['op'] == 'game.end') {
        emit(RoomConstant.Event_Game_End, options);
      }

      /// 你画我猜 消息分发
      if (options['op'] != null && options['op'].startsWith('game.guess')) {
        emit('room.game.guess', options);
      }

      if ('game.wolf.leavemic' == options['op']) {
        int uid = 0;
        if (options['data'] != null && options['data']['uid'] != null) {
          uid = Util.parseInt(options['data']['uid']);
        }
        // 狼人杀10s未准备
        if (uid > 0 && uid == Session.uid) {
          Fluttertoast.showToast(msg: K.room_wolf_no_ready_time_out, gravity: ToastGravity.CENTER);
        }
      }

      // 狼人杀 消息分发
      if (options['op'] != null && options['op'].startsWith('game.wolf')) {
        emit('room.game.wolf', options);
      }

      /// 剧本杀 消息分发
      if (options['op'] != null && options['op'].startsWith('game.juben')) {
        emit('room.game.juben', options);
      }

      /// 直播房消息分发
      if (options['op'] != null && options['op'].startsWith('live.pk')) {
        emit(RoomConstant.LIVE_PK_EVENT, options);
      }

      ///陪伴房消息
      if (options['op'] != null && options['op'].startsWith(RoomConstant.Event_Accompany_Change)) {
        emit(RoomConstant.Event_Accompany_Change, options);
      }

      /// 海龟汤 消息分发
      if (options['op'] != null && options['op'].startsWith('game.puzzle')) {
        emit('room.game.puzzle', options);
      }

      ///麦位连线
      if (options.containsKey('defend_info')) {
        eventCenter.emit(RoomConstant.EVENT_Show_Mic_Line, options['defend_info']);
      }

      /// 画猜接龙
      if (options['op'] != null && options['op'].startsWith('guess.queue.refresh')) {
        Log.d('guess.queue.refresh.... options....$options');
        emit(RoomConstant.Event_Refresh_GUESS_QUEUE, options);
      }
    }

    ChatRoomUtil.checkAndReloadUnderWord();

    if (needReInitRtcEngine) {
      currentRtcType = -1;
    }

    var targetRtcSdk = _config?.rtcType;
    targetRtcSdk = useDevRtcType(targetRtcSdk);
    await _compareRtcSdk(targetRtcSdk);
    if (true != rtcController.initialized) {
      Log.d(tag: TAG, 'rtc-engine _onEventNotifyRefresh try to init rtc.');
      await _initRtc(execFirstBiz: false);
    } else if (needResetRoomMode) {
      await rtcController.updateRoomRtcMode();
    }

    await _refreshRtcTask();

    bool closeMic = false;
    Map options = data.containsKey('_options') && data['_options'] != null && data['_options'] is Map ? data['_options'] : {};
    if (options.containsKey('close_mic_uids') && options['close_mic_uids'] is List && options['close_mic_uids'].contains(Session.uid)) {
      closeMic = true;
      eventCenter.emit(RoomConstant.Event_Join_Mic_Close);
    }

    await _compare(true, closeMic);
    emit(RoomConstant.Event_Refresh);

    if (data.containsKey('wait') && data['wait'] is List) {
      List<int> waitIds = Util.parseList(data['wait'], (e) => Util.parseInt(e));
      onWaitChanged(waitIds);
    }
    if (data.containsKey('waitForBoss') && data['waitForBoss'] is List) {
      List<int> waitIds = Util.parseList(data['waitForBoss'], (e) => Util.parseInt(e));
      onWaitForBossChanged(waitIds);
    }
    if (data.containsKey('waitForAuction') && data['waitForAuction'] is List) {
      List<int> waitIds = Util.parseList(data['waitForAuction'], (e) => Util.parseInt(e));
      onWaitForAuctionChanged(waitIds);
    }
  }

  _handlePluginsMsg(Map<dynamic, dynamic> data) {
    Log.d('_handlePluginsMsg data=$data');

    /// 切房时，如果插件有变化，解析房间插件入口，刷新UI
    parseRoomPlugins(data['plugins']);
    emit(UIRefresh.UI_Room_Plugins_Refresh, data);
  }

  _handleGrabHatMsg(Map<dynamic, dynamic> data) {
    Log.d('_handleGrabHatMsg data=$data');

    emit(RoomConstant.Event_Room_Grab_Hat, GrabHatPushData.fromJson(data));
  }

  void _doRoomChange(Map options) async {
    int newRid = 0;
    if (options.containsKey('data')) {
      Map? data = options['data'];
      if (data != null) {
        newRid = Util.parseInt(data['new_rid'], 0);
      }
    }
    if (newRid > 0) {
      eventCenter.emit(EventConstant.roomChangeRid, newRid);
    }
  }

  void _changeToCpLinkSceneRoom(Map options) {
    if (options.containsKey('status')) {
      if (options['status'] == 'fail') {
        //连线失败, 播放动效，直接返回
        eventCenter.emit(RoomConstant.EVENT_CPLINK_HAND_RESULT, options);
        return;
      }

      if (options['status'] == 'succ') {
        //牵手成功，播放动效
        eventCenter.emit(RoomConstant.EVENT_CPLINK_HAND_RESULT, options);
      }
    }
  }

  void _joinFansGroup(Map options) {
    int uid = Util.parseInt(options['uid']);
    String? successImg = Util.parseStr(options['success_img']);
    hasJoinFansGroup = Util.parseBool(options['has_join_fans_group']);
    if (uid > 0 && !Util.isStringEmpty(successImg)) {
      RoomEventAnimationUtil.joinFansGroup(successImg!);
      if (uid == Session.uid) {
        eventCenter.emit(RoomConstant.EVENT_JOIN_FANS_GROUP_SUCCESS, successImg);
        Tracker.instance.track(TrackEvent.join_fans_group, properties: {'anchor_uid': Util.parseInt(options['live_uid'])});
      }
    }
  }

  void onWaitChanged(List<int> waitIds) {
    bool waitChanged = false;
    if (waitIds.length != _wait.length) {
      waitChanged = true;
    }
    if ((isKtvRoom || isKtvChorusRoom) && waitIds.length > _wait.length && purview == Purview.Createor) {
      WaitMicAlertDialog.show(System.context, _rid);
    }
    _wait = waitIds;
    if (waitChanged) {
      emit(RoomConstant.Event_Wait_Changed);
    }
  }

  void onWaitForBossChanged(List<int> waitIds) {
    bool waitChanged = false;
    if (waitIds.length != _waitForBoss.length) {
      waitChanged = true;
    }
    _waitForBoss = waitIds;
    if (waitChanged) {
      emit(RoomConstant.Event_Admin_Wait_Changed);
    }
  }

  void onWaitForAuctionChanged(List<int> waitIds) {
    bool waitChanged = false;
    if (waitIds.length != _waitForAuction.length) {
      waitChanged = true;
    }
    _waitForAuction = waitIds;
    if (waitChanged) {
      emit(RoomConstant.Event_Auction_Wait_Changed);
    }
  }

  void onMicOnListChanged(int type, List<RoomPosition> positions) async {
    Log.d("onMicOnListChanged type=$type, positions=$positions");
    if (type == 1) {
      // 全量更新
      _positions.clear();
      _positions.addAll(positions);
    } else if (type == 2) {
      // 增量更新
      for (var position in positions) {
        int index = _positions.indexWhere((e) => e.position == position.position);
        if (index >= 0) {
          _positions[index] = position;
        }
      }
    }
    await GodTagUtil.updateGodTags(_positions);
    await _compare();

    /// 通知麦位信息变化
    emit(RoomConstant.Event_Refresh);
  }

  void addRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    rtcController.addRecordStateCallback(callback);
  }

  void removeRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    rtcController.removeRecordStateCallback(callback);
  }

  /// 业务层决定当前用户是否允许播放
  bool _canSpeak(int uid) {
    bool isSpeaker = _positions.any((position) => position.uid == uid);
    if (!isSpeaker && isEightOwner(uid)) {
      // 开启房主位的房主, 开启了房主位的8麦房
      isSpeaker = true;
    }

    if (_config?.rtcExtra?.extraList.any((e) => e.uid == uid && e.mic == 1) == true) {
      isSpeaker = true;
      // Log.dogD('rtc-engine uid->$uid is extra stream.');
    }

    // Log.d(tag: TAG, '_canSpeak:$isSpeaker');

    return isSpeaker;
  }

  bool _checkConn() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now ~/ 1000 - _localTime > 35) {
      Fluttertoast.showToast(msg: K.room_leave_long_time_was_droped, gravity: ToastGravity.CENTER);
      _leaveRoom();
      return false;
    }
    return true;
  }

  Future<bool> checkAudioAuthorization() async {
    return ChatRoomUtil.checkAudioAuthorization();
  }

  _compare([refresh = true, closeMic = false]) async {
    //检查此人是不是在麦上
    if (rtcController.initialized == false || _config == null) return;
    if ((isNormalEightPosition || isFivePosition || isBusinessMusic8) && _config?.uid == Session.uid && _config!.showOwnerSeat) return;
    RoomPosition? position = ChatRoomUtil.getPositionByServer();
    if (position != null && position.micStatus == 0) closeMic = true;
    if (position != null && position.position == roomPositionVirtual) return;

    Log.d(tag: TAG, "rtc-engine compare begin");
    try {
      if ((position != null) && _role == ClientRole.Audience) {
        //需要上麦
        if (Platform.isAndroid) {
          bool granted = await checkAudioAuthorization();
          if (granted) {
            _role = ClientRole.Broadcaster;
            await setRtcRole(ClientRole.Broadcaster);
            bool mute = (shouldVerify()) || closeMic || (_config?.mode == RoomMode.Lock && (!isKtvRoom || !isKtvChorusRoom));
            await setMute(mute, true);
            if (mute) {
              // 上麦后静音需要把状态同步给后台
              RoomRepository.opMic(_rid, positionForCurrentUser?.position, 'closeMic');
            }
          } else {
            RoomRepository.leavelMic(_rid, Session.uid);
          }
        } else if (Platform.isIOS) {
          _role = ClientRole.Broadcaster;
          await setRtcRole(ClientRole.Broadcaster);
          bool mute = (shouldVerify()) || closeMic || (_config?.mode == RoomMode.Lock && (!isKtvRoom || !isKtvChorusRoom));
          await setMute(mute, refresh);
          if (mute) {
            // 上麦后静音需要把状态同步给后台
            RoomRepository.opMic(_rid, positionForCurrentUser?.position, 'closeMic');
          }
        }
      } else if ((position == null) && _role == ClientRole.Broadcaster) {
        _role = ClientRole.Audience;
        await setRtcRole(ClientRole.Audience);
        await setMute(true, refresh);
        if (isSenderRoom && _prePosition == 8 && _positions.isNotEmpty && _positions[0].uid > 0) {
          //从老板位置上下来的
          try {
            emit(RoomConstant.Event_Quite_From_Boss, _positions[0].uid);
          } catch (e) {
            Log.d(tag: TAG, e);
          }
        }
      } else {
        Log.d(tag: TAG, "rtc-engine compare nothing");
      }
    } catch (e) {
      Log.d(tag: TAG, "rtc-engine compare error ${e.toString()}");
    }

    bool isForbidden = false;
    if (position != null) {
      isForbidden = position.forbidden;
      if (_config?.game == Games.Under && config?.underData?.isStrict == true) {
        switch (_config?.underData?.gameUnderState) {
          case GameUnderState.Wait:
          case GameUnderState.End:
            //do nothing
            break;

          case GameUnderState.Send:
          case GameUnderState.Ready:
          case GameUnderState.Vote:
          case GameUnderState.VoteResult:
          case GameUnderState.PublishDead:
            isForbidden = true;
            break;

          case GameUnderState.Desc:
            isForbidden = _config?.underData?.gameUnderCurrent != position.position;

            if (!isForbidden && _mute == true) {
              await setMute(false || closeMic, refresh);
            }
            break;

          default:
            break;
        }
      } else if (position.micStatus == 0) {
        // 同步线上的开麦/闭麦状态
        isForbidden = true;
      }
    }
    if (isForbidden && _mute == false) {
      await setMute(true, refresh);
    }

    await _checkMuteAllRemote();
  }

  Future<void> setRtcRole(ClientRole role) async {
    return rtcController.setClientRole(role);
  }

  void _onPingTimeout(Timer timer) {
    if (!timer.isActive) return;
    _send('ping', isPingMsg: true);
  }

  _onSpeakerTick(int intervalMillisecond) {
    if (_checkConn() == false || _disposed) return;
    _checkSpeakerDuration(intervalMillisecond);
    _checkEmptyBroadcaster();
  }

  /// 直播间主播直播时长统计
  void _checkSpeakerDuration(int intervalMillisecond) {
    bool recordDuration = config?.types == RoomTypes.Live && config?.uid == Session.uid && isMic;
    if (recordDuration) {
      // 主播自己在麦上
      double lastDuration = _liveDuration;
      _liveDuration = _liveDuration + 0.001 * intervalMillisecond;
      if (_liveDuration.floor() != lastDuration.floor()) {
        liveDurationNotifier.value = _liveDuration.floor();
      }
    }
  }

  /// 直播间，挂机检测
  _onLiveHangUpCheck(Timer timer) {
    if (!timer.isActive) return;
    Log.d(tag: TAG, '_onLiveHangUpCheck and _hungUpTime = $_hungUpTime');
    Tracker.instance.track(TrackEvent.live_room_on_hook, properties: {'uid': Session.uid, 'rid': _rid, 'on_hook_value': _hungUpTime});
    _hungUpTime++;
  }

  final Map<int, int> _forbiddenUids = {};

  _checkEmptyBroadcaster() async {
    if (_role == ClientRole.Broadcaster && _config != null) {
      int uid = Session.uid;
      bool isCreator = _config?.uid == uid;
      if (isCreator && _config?.nine == false && (isNormalEightPosition || isFivePosition || isBusinessMusic8)) {
        //8麦位的房间房主，无法检测
        return;
      }
      RoomPosition? pos = _positions.firstWhereOrNull((RoomPosition pos) => pos.uid == uid);
      int index = pos?.position ?? -1;

      var isSpeaker = _canSpeak(uid);
      if (isSpeaker != true) {
        Log.d(tag: TAG, ' _checkEmptyBroadcaster is not speaker change audience');
        await setRole(ClientRole.Audience);
      }

      // 上报幽灵麦数据，找一个上报者
      int checkIndex = 0;
      if (index == checkIndex || uid == _config?.uid) {
        int now = DateTime.now().millisecondsSinceEpoch;
        List<int> uids = [];

        rtcController.speakersWithTime().forEach((int speakerUid, int time) {
          if (now - time < 1000 && speakerUid != _config?.uid) {
            uids.add(speakerUid);
          }
        });

        List<int> report = [];
        for (var current in uids) {
          if (!_canSpeak(current)) {
            if (_forbiddenUids.containsKey(current)) {
              _forbiddenUids[current] = _forbiddenUids[current]! + 1;
              if (_forbiddenUids[current]! >= 10) {
                _forbiddenUids[current] = 0;
                report.add(current);
              }
            } else {
              _forbiddenUids[current] = 1;
            }
          }
        }
        if (report.isNotEmpty && currentRtcType != null && currentRtcType! > 0) {
          Log.d(tag: TAG, 'rtc-engine >>> ghost Report Send uids=${report.join(',')},rtcType=$currentRtcType');
          Xhr.postJson('${System.domain}agora/report/?rid=$_rid', {
            'rid': _rid.toString(),
            'uids': report.join(','),
            'rtc_type': '$currentRtcType',
          });
        }
      }
    }
  }

  Future<String> _renewToken() async {
    Log.d(
        tag: TAG, 'rtc-engine >>> renewToken rtc=$currentRtcType,config.rtc=${_config?.rtcType}，isMic:$isMic,sendIndex=${_sendIndex + 1}');
    Map params = {
      'rid': _rid,
      'token': Session.token,
      'version': RoomConstant.configVersion,
      'rtc_type': currentRtcType,
      'on_mic': isMic,
    };
    DataRsp dataRsp = await _send('RenewToken', data: params);
    if (dataRsp.success && dataRsp.data is String) {
      return dataRsp.data;
    } else {
      Log.d(tag: TAG, '_renewToken error ${dataRsp.msg}');
    }
    return '';
  }

  /// 上麦
  Future<DataRsp> onMic(RPCReqOnMic pb) {
    return _send(
      'RoomCmd',
      data: {
        'cmd': 'OnMic',
        'version': RoomConstant.configVersion,
        'data': base64.encode(pb.writeToBuffer()),
      },
      timeout: 3,
    );
  }

  /// 下麦
  Future<DataRsp> offMic(RPCReqOffMic pb) {
    return _send(
      'RoomCmd',
      data: {
        'cmd': 'OffMic',
        'version': RoomConstant.configVersion,
        'data': base64.encode(pb.writeToBuffer()),
      },
      timeout: 3,
    );
  }

  /// 操作麦位
  Future<DataRsp> opMic(RPCReqOpMic pb) {
    return _send(
      'RoomCmd',
      data: {
        'cmd': 'OpMic',
        'version': RoomConstant.configVersion,
        'data': base64.encode(pb.writeToBuffer()),
      },
      timeout: 3,
    );
  }

  /// 踢出房间
  Future<DataRsp> kickOut(RPCReqKickOut pb) {
    return _send(
      'RoomCmd',
      data: {
        'cmd': 'KickOut',
        'version': RoomConstant.configVersion,
        'data': base64.encode(pb.writeToBuffer()),
      },
      timeout: 3,
    );
  }

  /// 修改房间信息(如切房)
  Future<DataRsp> updateRoom(RPCReqCreate pb) {
    return _send('RoomCmd', data: {
      'cmd': 'Update',
      'version': RoomConstant.configVersion,
      'data': base64.encode(pb.writeToBuffer()),
    });
  }

  /// 关房
  Future<DataRsp> closeRoom() {
    return _send('RoomCmd', data: {
      'cmd': 'CloseRoom',
      'version': RoomConstant.configVersion,
      'data': base64.encode(RPCReqCloseRoom().writeToBuffer()),
    });
  }

  /// websocket请求
  /// [op] 请求命令
  /// [data] 请求参数
  /// [timeout] 请求超时时间，单位秒
  /// [isPingMsg] true：ping消息
  Future<DataRsp> _send(String op, {Map? data, int timeout = 10, bool isPingMsg = false, bool wait = true}) async {
    if (wait) {
      if (socketCompleter != null) {
        Log.d('websocket _send wait op=$op');
        await socketCompleter!.future;
      }
    }

    if (_channel?.readyState == WebSocket.open) {
      int index = ++_sendIndex;
      Log.d(tag: TAG, "websocket _send op=$op, index=$index, data=$data");
      try {
        String msg = json.encode({'op': op, 'data': data ?? {}, 'index': index});
        _channel?.add(msg);
        if (!_isBaba) {
          PulseLog.instance.log(SocketBody(SocketScene.room, SocketAction.send, {'msg': msg}));
        }
        // ping消息不需要回调
        if (isPingMsg) return DataRsp(success: true);

        Completer<DataRsp> completer = Completer();
        _promiseMap[index] = ChannelCallBack(
          index: index,
          onSuccess: (dynamic data) async {
            Log.d(tag: TAG, "websocket _send onSuccess op=$op, index=$index, data=$data");
            if (!completer.isCompleted) completer.complete(DataRsp(success: true, data: data));
          },
          onError: (Object error) {
            Log.e(tag: TAG, 'websocket _send onError op=$op, index=$index, msg=$error');
            if (!completer.isCompleted) completer.complete(DataRsp(success: false, msg: error.toString()));
          },
        );
        Future<DataRsp> future = completer.future.timeout(Duration(seconds: timeout), onTimeout: () async {
          Log.e(tag: TAG, 'websocket _send onTimeout op=$op, index=$index,');
          if (_promiseMap.containsKey(index)) {
            ChannelCallBack? callback = _promiseMap[index];
            callback?.onError?.call('请求超时');
            _promiseMap.remove(index);
          }
          return DataRsp(success: false, msg: '请求超时');
        });
        return future;
      } catch (e) {
        Log.e(tag: TAG, "websocket _send op=$op, error: $e");
      }
    } else {
      Log.e(tag: TAG, 'websocket _send not open, op=$op');
    }

    return DataRsp(success: false, msg: '');
  }

  ClientRole _role = ClientRole.Audience;

  ClientRole get role => _role;

  setRole(ClientRole value, {bool needSetMute = true}) async {
    _role = value;
    await setRtcRole(value);
    if (_config == null || !needSetMute) {
      return;
    }
    await setMute((shouldVerify()) || (_config?.mode == RoomMode.Lock && (!isKtvRoom || !isKtvChorusRoom)), true);
  }

  setRoleOnly(ClientRole value) async {
    _role = value;
  }

  //当前用户是否在麦上，服务器里
  bool get isMic {
    return ChatRoomUtil.isMic;
  }

  bool _mute = true;

  // 屏蔽所有用户音频流
  bool _muteAllRemote = false;

  bool get mute {
    return _mute;
  }

  bool get follow {
    return _follow;
  }

  List<String> get themeSwitchBackground {
    return _themeSwitchBackground;
  }

  bool shouldVerify() {
    return Utility.isNeedVerify(needVerify, needVerifyNew);
  }

  setMute(bool value, [bool refresh = true]) async {
    _mute = value;

    Log.d(
        tag: TAG,
        'setMute value=$value, refresh=$refresh,isKtvRoom =${(isKtvRoom || isKtvChorusRoom)} _isBackgroundMusicMode=${_isBackgroundMusicMode()} _vadEnabled=$_vadEnabled');
    rtcController.enableVad(getVadEnabled);
    rtcController.openBackgroundMode(_isBackgroundMusicMode());
    rtcController.setMute(value);

    if (refresh) emit(RoomConstant.Event_Refresh);
  }

  /// 捂耳朵检测
  Future _checkMuteAllRemote() async {
    RoomPosition? myPosition = ChatRoomUtil.getPositionByUid(Session.uid);
    // Log.d(tag: TAG, 'ChatRoomData _checkMuteAllRemote _muteAllRemote=$_muteAllRemote myPosition=$myPosition');
    if (_muteAllRemote) {
      if (myPosition == null || myPosition.closeListen == 0) {
        _muteAllRemote = false;
        rtcController.muteAllRemoteAudioStreams(false);
      }
    } else {
      if (myPosition?.closeListen == 1) {
        _muteAllRemote = true;
        rtcController.muteAllRemoteAudioStreams(true);
      }
    }
  }

  /// 背景音乐模式下，闭麦行为只关人声，混音保留
  bool _isBackgroundMusicMode() {
    /// 目前只有房主才能设置房间氛围音乐
    bool isAtmospherePlaying = isCreator && RoomAtmosphereManager.isPlayingMusic();

    /// 音乐房房主播放
    bool isMusicRoomCreator = isCreator && isMusicRoom;
    return isKtvRoom || isKtvChorusRoom || isAtmospherePlaying || isMusicRoomCreator;
  }

  /// 存在背景音乐,需要与Vad互斥
  bool _backgroundMusicDisableVad() {
    bool isBackgroundMusicPlaying = !MusicController.isRelease && MusicController.isPlaying;
    return isBackgroundMusicPlaying || _isBackgroundMusicMode();
  }

  bool get isEightPosition {
    return ChatRoomUtil.isEightPosition;
  }

  bool get isNormalEightPosition {
    return ChatRoomUtil.isNormalEightPosition;
  }

  /// 皮队友 5麦商业厅
  bool get isFivePosition => positions.length == 5 && isBusinessNormal5;

  /// 点唱厅 8麦
  bool get isBusinessMusic8 => config?.factoryType == RoomFactoryType.BusinessMusic8;

  bool isEightOwner(int uid) {
    return ChatRoomUtil.isEightOwner(uid) || (isFivePosition && config != null && uid == config?.uid);
  }

  int get bossPosition {
    return ChatRoomUtil.bossPosition;
  }

  // 拍卖厅-拍卖对象麦序
  int get auctionPosition {
    return 1;
  }

  int get serverTime {
    return _serverTime;
  }

  int get defend {
    if (_defends.isNotEmpty) {
      return _defends[0];
    }

    return 0;
  }

  bool get isForbidden {
    return ChatRoomUtil.isForbidden;
  }

  bool get isGameAdmin {
    return ChatRoomUtil.isGameAdmin;
  }

  bool get isGameStarted {
    return ChatRoomUtil.isGameStarted;
  }

  void sendLocalMessage(String msgContent) {
    ChatRoomUtil.sendLocalMessage(msgContent);
  }

  bool resultShowing = false;

  /// 获取房间内关注弹窗关注的人
  /// 1.非商业厅：房主；
  /// 2.直播房：房主
  /// 3.其他商业厅：接待
  RoomPosition getFollowRole() {
    if (config?.property != RoomProperty.Business) {
      // 非商业房
      return RoomPosition.fromCreator(createor!);
    } else {
      // 商业房
      if (ChatRoomUtil.isLiveTalent(config)) {
        var pos = positions[0];
        if (pos.uid > 0) {
          return pos;
        }
        return RoomPosition.fromCreator(createor!);
      } else if (config?.types == RoomTypes.Live) {
        // 直播房
        return RoomPosition.fromCreator(createor!);
      } else {
        // 设接待的商业房
        if (isSenderRoom || config?.types == RoomTypes.CpLove) {
          return isEightPosition ? RoomPosition.fromCreator(createor!) : positions[0];
        } else {
          return positions[0];
        }
      }
    }
  }

  bool showVipSeat = false;

  FanLabel? get liveFansLabelExtra => _liveFansLabelExtra;

  ///显示接待任务
  bool showReceptionTask() {
    if (config?.property == null) return false;
    RoomPosition? roomPosition = positionForCurrentUser;
    return (config?.receptionTaskEnable ?? false) &&
        config?.property == RoomProperty.Business &&
        (config!.reception && roomPosition != null && roomPosition.position == 0);
  }

  ///显示房间任务
  bool showRoomTask() {
    return Util.validStr(config?.roomTaskType);
  }

  /// 直播PK主播解除屏蔽麦位声音逻辑
  void pkMuteRemoteAudioStream() {
    LivePKBaseV3? pkBase = config?.liveDataV3?.pkConfigV3?.pkBase;
    if (pkBase != null) {
      LivePKState? state = pkBase.state;
      if (state != null &&
          (state == LivePKState.Start || state == LivePKState.Ready || state == LivePKState.PK || state == LivePKState.Punish)) {
        //连麦阶段
        LivePKUserOnMicItem? main = pkBase.main;
        LivePKUserOnMicItem? compete = pkBase.compete;
        List<ChannelRelayUser> relayUsers = [];
        if (main != null && main.uid > 0) {
          relayUsers.add(ChannelRelayUser.fromLivePKUserOnMicItem(main));
        }
        if (compete != null && compete.uid > 0) {
          relayUsers.add(ChannelRelayUser.fromLivePKUserOnMicItem(compete));
        }
        relayMuteRemoteAudioStream(relayUsers);
      }
    }
  }

  /// 跨房连麦,参与跨房连麦的主播，解除屏蔽麦位声音逻辑
  void relayMuteRemoteAudioStream(List<ChannelRelayUser> relayUsers) {
    if (relayUsers.isEmpty) {
      return;
    }
    for (var element in relayUsers) {
      if (element.uid > 0 && mutedUserIds.contains(element.uid) && element.mic != 2) {
        rtcController.recoverMutedUser(element.uid);
      }
    }
  }

  static OptionSettingType getSettingType(int type) {
    if (type == 2) {
      return OptionSettingType.SHOW_FROM_RIGHT;
    } else if (type == 1) {
      return OptionSettingType.SHOW_FROM_TOP;
    }

    return OptionSettingType.SHOW_FROM_DOWN;
  }

  List<int> _preprocessMessage(List<int> msgBytes) {
    List<int> versionHead = List.from('bbrv'.codeUnits);
    versionHead.add(1);
    if (msgBytes.length >= versionHead.length) {
      bool withVersionHead = true;
      for (int i = 0; i < versionHead.length; i++) {
        if (versionHead[i] != msgBytes[i]) {
          withVersionHead = false;
          break;
        }
      }
      if (withVersionHead) {
        List<int> receivedChunks = msgBytes.sublist(versionHead.length);
        // profiler.mark('ChatRoomData._preprocessMessage');
        List<int> uncompressedBytes = zlib.decode(receivedChunks);
        // profiler.output('ChatRoomData._preprocessMessage', extra: '${receivedChunks.length}->${uncompressedBytes.length}');
        return uncompressedBytes;
      }
    }

    return msgBytes;
  }

  Future<bool> setVoiceEffect(int effect) async {
    return rtcController.setVoiceEffect(effect);
  }

  /// 播放很短不需要控制的音效，需要跟audio play播放的声音不冲突，使用agora来播放
  @Deprecated('use RtcAudioEffectMixin->playAssetEffectFile method')
  Future<void> playShortAudio(String name, {String path = "packages/chat_room/assets/sound/", bool loop = false}) async {
    try {
      File file = File(join(Constant.temporaryDirectory.path, name));
      if (await file.exists() == false) {
        ByteData bytes = await rootBundle.load(path + name);
        await file.writeAsBytes(bytes.buffer.asUint8List());
      }
      if (await file.exists() == false) {
        return;
      }
      rtcController.engine?.playEffect(filePath: file.path, publish: 0);
    } catch (e) {}
  }

  String getFrameByUid(int uid) {
    RoomPosition? pos = _positions.firstWhereOrNull((RoomPosition pos) => pos.uid == uid);

    return pos?.getFrameImg() ?? '';
  }

  String getRingByUid(int uid) {
    RoomPosition? pos = _positions.firstWhereOrNull((RoomPosition pos) => pos.uid == uid);

    return pos?.ring ?? '';
  }

  /// 麦序房是否转入其他房间
  bool get isArtCenterInsertOtherRoom {
    return isArtCenterAll && (Util.parseInt(_config?.rid) > 0) && _rid != config?.rid;
  }

  /*
  * 在 KTV 歌房点歌时是否使用新的接口请求音乐信息
  * true： 使用新的接口，source_type = 2 为 zego 曲库(音速达曲库、仅在嗨歌测试，并未上线)，4 声网曲库，5 zego 音集协曲库
  * false：使用旧的接口
  * */
  bool get useNewRequestInKtvRoomWhenOrderSong {
    if (isKtvRoom == false && isKtvChorusRoom == false && isMusicRoom == false) {
      return false;
    }

    return [PLAY_LIST_TYPE_AGORA, PLAY_LIST_TYPE_ZEGO].contains(ktvSourceType);
  }

  /// 校验麦位状态改变
  void _checkMicStatus(List<int> oldPosUids, List<int> newPosUids) {
    List<int> onMicUids = newPosUids.where((e) => !oldPosUids.contains(e)).toList();
    List<int> offMicUids = oldPosUids.where((e) => !newPosUids.contains(e)).toList();
    if (onMicUids.isEmpty && offMicUids.isEmpty) return;
    eventCenter.emit(EventConstant.EventMicStatusChanged, {'onMicUids': onMicUids, 'offMicUids': offMicUids});
  }
}
