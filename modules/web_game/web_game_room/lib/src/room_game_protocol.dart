import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart' hide describeEnum;
import 'package:web_game_core/web_game_core.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/topLive.dart';
import 'package:chat_room/src/base/widget/user_icon_tap_handler.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import 'game_codec.dart';
import 'game_side_panel.dart';
import 'mic_mixin.dart';

abstract class IRoomGameProtocol extends IGameProtocol {
  /// 获取房间信息
  Map<String, dynamic> getRoomInfo();

  /// 游戏可以接收gamemsg了
  void canReceiveGameMsg(GamePayload payload);

  /// 同步游戏状态
  void syncGameStatus(GamePayload payload);

  /// 同步麦位坐标
  void syncMicPosFromGame(GamePayload payload);

  /// 同步公屏坐标
  void syncMsgListPosFromGame(GamePayload payload);

  /// 同步麦位数据到游戏
  void syncPlayerListToGame();

  /// 同步房间热度到游戏
  void syncHotNumToGame();

  /// 点击麦位
  void tapSeat(GamePayload payload);

  /// 游戏发送gamemsg
  void sendGameMsgFromGame(GamePayload payload);

  /// 发送gamemsg到游戏
  void sendGameMsgToGame(GameMsg gameMsg);

  /// 退出房间
  void quitRoom(GamePayload payload);

  /// 打开房间管理页
  void openRoomAdmin();

  /// 打开房间分享页
  void openShareRoomPanel();

  /// 打开房间设置页
  void openRoomSettings();

  /// 打开侧边面板(横屏游戏)
  void openSidePanel(GamePayload payload);

  /// 打开聊天输入面板
  void openInputMessagePanel();

  /// 打开表情面板
  void openEmojiPanel();

  /// 打开礼物面板
  void openGiftPanel();

  /// 打开私聊消息页
  void openChatMsgPanel();

  /// 打开个人资料弹窗
  void openProfilePanel(GamePayload payload);

  /// 允许显示弹幕
  void enableFloatMsg(GamePayload payload);

  /// 允许播放礼物/进场动效
  void enableDisplayGift(GamePayload payload);

  /// 打开麦位等待面板
  void openWaitMicList();

  // --------------- 语音相关 ---------------

  /// 上麦
  void joinMic(GamePayload payload);

  /// 上麦并开麦
  void joinAndOpenMic(GamePayload payload);

  /// 下麦
  void leaveMic(GamePayload payload);

  /// 开闭麦
  void muteMic(GamePayload payload);

  /// 播放音效
  void playEffect(GamePayload payload);

  /// 停止播放音效
  void stopEffect(GamePayload payload);

  /// 停止播放所有音效
  void stopAllEffects();

  /// 是否禁用所有远程推流
  void muteAllRemoteAudioStreams(GamePayload payload);

  /// 是否禁用某个用户的远程推流
  void muteRemoteAudioStream(GamePayload payload);

  // --------------- 语音相关 ---------------

  /// 最小化游戏
  void minimizeGame(GamePayload payload);

  /// 开始游戏
  void startGame(GamePayload payload);

  /// 关闭游戏
  void closeGame(GamePayload payload);
}

typedef GameEventCallback = void Function(GamePayload payload);

/// 与房间游戏对接的协议
///
/// 销毁时记得调用dispose并将引用置为null
class RoomGameProtocol extends GameProtocol implements IRoomGameProtocol {
  RoomGameProtocol(
    State state, {
    VoidCallback? onStartupCallback,
    this.onMinimizeGame,
    this.onStartGame,
    this.onCloseGame,
  }) : super(state, onStartupCallback: onStartupCallback);

  /// 最小化游戏回调
  final GameEventCallback? onMinimizeGame;

  /// 开始游戏回调
  final GameEventCallback? onStartGame;

  /// 关闭游戏回调
  final GameEventCallback? onCloseGame;

  final IRoomManager roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  late ChatRoomData room;
  int gameId = 1;
  StreamSubscription<GameMsg>? _gameSs;
  Map<String, num>? msgListPosition;
  bool floatMsgEnabled = true; // 允许显示弹幕
  bool displayGiftEnabled = true; // 允许播放礼物动效
  bool gaming = false; // 是否正在游戏中
  bool _isAntiAddiction = false;

  @override
  void init() {
    super.init();
    room = ChatRoomData.getInstance()!;
    room.speakers.addListener(_onSpeakersChange);
    room.addListener(RoomConstant.Event_Wait_Changed, _onWaitChanged);
    room.addListener(RoomConstant.Event_Admin_Wait_Changed, _onWaitChanged);
    room.addListener(RoomConstant.Event_Auction_Wait_Changed, _onWaitChanged);

    eventCenter.addListener(RoomConstant.Event_Online, _onHotNumChanged);
    eventCenter.addListener('antiAuction.verify.success', _onVerify);
  }

  @override
  void dispose() {
    super.dispose();
    room.speakers.removeListener(_onSpeakersChange);
    eventCenter.removeListener(RoomConstant.Event_Online, _onHotNumChanged);
    room.removeListener(RoomConstant.Event_Wait_Changed, _onWaitChanged);
    room.removeListener(RoomConstant.Event_Admin_Wait_Changed, _onWaitChanged);
    room.removeListener(
        RoomConstant.Event_Auction_Wait_Changed, _onWaitChanged);
    eventCenter.removeListener('antiAuction.verify.success', _onVerify);
    _gameSs?.cancel();
    msgListPosition = null;
    gaming = false;
  }

  /// 重置，一般用于切房场景
  @override
  void reset() {
    super.reset();
    _gameSs?.cancel();
    _gameSs = GameCodec.stream.listen((event) {
      sendGameMsgToGame(event);
    });
    // buffer events before start.
    if (!gameBooted) {
      _gameSs?.pause();
    }
  }

  void _onVerify(String type, Object? data) {
    _isAntiAddiction = false;
    disableMouseEvent(timeout: 0);
  }

  void _antiCheck() {
    if (ChatRoomData.exists() && Platform.isIOS) {
      final room = ChatRoomData.getInstance();
      _isAntiAddiction = room?.config?.antiAuction ?? false;
      if (_isAntiAddiction) {
        disableMouseEvent(timeout: 50000);
      }
    }
  }

  @override
  void registerGameMessageCallback() {
    super.registerGameMessageCallback();
    gameMessageCallbacks['receive_gamemsg'] = (payload) {
      // 游戏可以接收消息了
      canReceiveGameMsg(payload);
      _antiCheck();
    };
    gameMessageCallbacks['sync_game_status'] = (payload) {
      // 同步游戏状态
      syncGameStatus(payload);
    };
    gameMessageCallbacks['sync_player_position'] = (payload) {
      // 游戏同步麦位坐标
      syncMicPosFromGame(payload);
    };
    gameMessageCallbacks['tap_seat'] = (payload) {
      // 点击麦位
      tapSeat(payload);
    };
    gameMessageCallbacks['gamemsg'] = (payload) {
      // 游戏发送消息
      sendGameMsgFromGame(payload);
    };
    gameMessageCallbacks['sync_msg_list_position'] = (payload) {
      // 同步公屏消息列表的位置
      syncMsgListPosFromGame(payload);
    };
    gameMessageCallbacks['quit_room'] = (payload) {
      quitRoom(payload);
    };
    gameMessageCallbacks['open_room_admin'] = (payload) {
      openRoomAdmin();
    };
    gameMessageCallbacks['open_share_room_panel'] = (payload) {
      openShareRoomPanel();
    };
    gameMessageCallbacks['open_room_settings'] = (payload) {
      openRoomSettings();
    };
    gameMessageCallbacks['open_input_message_panel'] = (payload) {
      openInputMessagePanel();
    };
    gameMessageCallbacks['open_emoji_panel'] = (payload) {
      openEmojiPanel();
    };
    gameMessageCallbacks['open_gift_panel'] = (payload) {
      openGiftPanel();
    };
    gameMessageCallbacks['open_chat_message_panel'] = (payload) {
      openChatMsgPanel();
    };
    gameMessageCallbacks['open_side_panel'] = (payload) {
      openSidePanel(payload);
    };
    gameMessageCallbacks['open_profile_panel'] = (payload) {
      openProfilePanel(payload);
    };
    gameMessageCallbacks['enable_float_msg'] = (payload) {
      // 是否允许显示弹幕
      enableFloatMsg(payload);
    };
    gameMessageCallbacks['enable_display_gift'] = (payload) {
      // 是否允许显示礼物、进场动效
      enableDisplayGift(payload);
    };
    gameMessageCallbacks['open_wait_mic_list'] = (payload) {
      // 打开麦位等待列表
      openWaitMicList();
    };
    gameMessageCallbacks['join_mic'] = (payload) {
      joinMic(payload);
    };
    gameMessageCallbacks['join_and_open_mic'] = (payload) {
      joinAndOpenMic(payload);
    };
    gameMessageCallbacks['leave_mic'] = (payload) {
      leaveMic(payload);
    };
    gameMessageCallbacks['mute_mic'] = (payload) {
      muteMic(payload);
    };
    gameMessageCallbacks['play_effect'] = (payload) {
      playEffect(payload);
    };
    gameMessageCallbacks['stop_effect'] = (payload) {
      stopEffect(payload);
    };
    gameMessageCallbacks['stop_all_effects'] = (payload) {
      stopAllEffects();
    };
    gameMessageCallbacks['mute_all_remote_audio_streams'] = (payload) {
      muteAllRemoteAudioStreams(payload);
    };
    gameMessageCallbacks['mute_remote_audio_stream'] = (payload) {
      muteRemoteAudioStream(payload);
    };
    gameMessageCallbacks['start_game'] = (payload) {
      startGame(payload);
    };
    gameMessageCallbacks['close_game'] = (payload) {
      closeGame(payload);
    };
    gameMessageCallbacks['minimize_game'] = (payload) {
      minimizeGame(payload);
    };
  }

  /// 个人房房主：关房  其他人：退出房间
  void closeOrQuitRoom() {
    gameResManager?.cancelDownload();

    if (room.isCreator && room.isPrivate) {
      RoomRepository.close(room.rid);
    } else {
      TopLiveTool.destroy(exitDirect: true);
    }
  }

  void _onSpeakersChange() {
    syncPlayerListToGame();
  }

  void _onWaitChanged(String type, dynamic data) {
    syncWaitButtonStatus();
  }

  void _onHotNumChanged(String type, dynamic data) {
    syncHotNumToGame();
  }

  /// 同步上座按钮状态给游戏
  /// Type 0 表示不展示
  /// Type 1 表示上座
  /// Type 2 表示排队中
  /// Type 3 表示排队 当type = 3时增加number字段 int 类型表示红点数量
  void syncWaitButtonStatus() {
    //区分管理和普通人员，管理是 0 和 3， 普通人员是 1 和 2
    if (webViewController != null) {
      Map data = {
        'type': 0,
        'num': 0,
      };
      if (room.purview != Purview.Normal) {
        if (room.showWaitMic) {
          data['type'] = 3;
          data['num'] = room.waitMicTotalNum;
        } else {
          data['type'] = 0;
          data['num'] = 0;
        }
      } else {
        bool normal = room.wait.contains(Session.uid);
        bool boss = room.waitForBoss.contains(Session.uid);
        bool auction = room.waitForAuction.contains(Session.uid);

        if (normal || boss || auction) {
          data['type'] = 2;
        } else if (ChatRoomUtil.isUidOnPosition(Session.uid)) {
          ///已经在麦上
          data['type'] = 0;
        } else {
          data['type'] = 1;
        }
      }
      GamePayload payload = GamePayload(
        name: 'sync_wait_button_status',
        id: DateTime.now().millisecondsSinceEpoch,
        data: data,
      );
      sendMessageToGame(payload);
    }
  }

  /// 麦位信息有变化，同步给游戏
  @override
  void syncPlayerListToGame() {
    if (webViewController != null) {
      GamePayload payload = GamePayload(
        name: 'sync_player_list',
        id: DateTime.now().millisecondsSinceEpoch,
        data: room.positions.map((roomPosition) {
          int micStatus = roomPosition.micStatus;
          if (roomPosition.uid == Session.uid) {
            micStatus = room.mute ? 0 : 1;
          }
          return {
            'uid': roomPosition.uid,
            'name': roomPosition.name,
            'position': roomPosition.position,
            'icon': Util.getUserIconUrl(roomPosition.icon) ?? '',
            'gender': roomPosition.sexValue,
            'mic_status': micStatus,
            'is_speaking': room.speakers.value[roomPosition.uid] ?? false,
            'is_lock': roomPosition.lock,
            'is_forbidden': roomPosition.forbidden,
            'ring': roomPosition.ring,
            'frame': roomPosition.getFrameImg(),
            'game_online': roomPosition.gameOnline,
            'position_state': roomPosition.positionState,
          };
        }).toList(),
      );
      sendMessageToGame(payload);
    }

    ///麦位变化时刷新同步上座按钮状态给游戏
    syncWaitButtonStatus();
  }

  /// 同步房间热度
  @override
  void syncHotNumToGame() {
    if (webViewController != null) {
      GamePayload payload = GamePayload(
        name: 'sync_hot_num_to_game',
        id: DateTime.now().millisecondsSinceEpoch,
        data: {
          'hotNum': room.roomHot, // 快乐星球用roomHot，其他app还没有
        },
      );
      sendMessageToGame(payload);
    }
  }

  @override
  Map<String, dynamic> getRoomInfo() {
    return {
      'rid': room.rid,
      'ownerId': room.createor?.uid ?? 0,
      'name': room.config?.name ?? '',
      'hotNum': room.roomHot, // 房间热度
      'isAdmin': room.isAdmin ? 1 : 0,
    };
  }

  @override
  void getBaseInfo(GamePayload payload) {
    Map<String, dynamic> data = {};
    data['user'] = getUserInfo();
    data['app'] = getAppInfo();
    data['device'] = getDeviceInfo();
    data['room'] = getRoomInfo();
    sendMessageToGame(payload.response(data));
  }

  @override
  void onStartupSuccess(GamePayload payload) {
    super.onStartupSuccess(payload);
    if (payload.data is Map) {
      gameId = Util.parseInt(payload.data['gameId'], 1);
    }
    syncPlayerListToGame();
  }

  /// 游戏可以接收游戏消息了
  @override
  void canReceiveGameMsg(GamePayload payload) {
    _gameSs?.resume();
  }

  /// 游戏同步麦位坐标
  @override
  void syncMicPosFromGame(GamePayload payload) {
    List data = payload.data;
    if (state is MicMixin) {
      (state as MicMixin).syncMicPosFromGame(data);
    }
  }

  /// 点击麦位
  @override
  void tapSeat(GamePayload payload) async {
    int pos = payload.data?['position'] ?? 0;
    UserIconTapHandler tapHandler = UserIconTapHandler();
    tapHandler.init(
        context: context, room: room, position: room.positions[pos]);
    disableMouseEvent();
    await tapHandler.onIconTap();
    enableMouseEvent();
  }

  /// 点击关注、取消关注
  @override
  void followClick(GamePayload payload) async {
    assert(payload.isRequest);
    Map<String, dynamic> map = Map<String, dynamic>.from(payload.data);
    if (map['follow'] == true) {
      NormalNull res = await BaseRequestManager.onFollow(
        map['uid'].toString(),
        rid: room.rid,
        roomType: room.config?.type ?? '',
        roomFactoryType: room.config?.originalRFT ?? '',
      );
      Log.d(res.toProto3Json(), tag: 'follow');
      sendMessageToGame(
          payload.response({'success': res.success, 'msg': res.msg}));
    } else {
      NormalNull res = await BaseRequestManager.unFollow(map['uid'].toString());
      Log.d(res.toProto3Json(), tag: 'unfollow');
      sendMessageToGame(
          payload.response({'success': res.success, 'msg': res.msg}));
    }
  }

  /// 发送gamemsg
  @override
  void sendGameMsgFromGame(GamePayload payload) async {
    Map data = payload.data;
    String msgName = data['name'];
    int? gameid = data['gameId'];
    List<int> msgData = List<int>.from(data['data']);
    if (payload.isRequest) {
      GameMsg? gameMsg = await GameCodec.sendRawData(msgName, msgData, true,
              gameId: gameid ?? gameId)
          ?.timeout(const Duration(seconds: 5), onTimeout: () => null);
      if (gameMsg != null) {
        sendMessageToGame(payload.response(gameMsg.toJson()));
      } else {
        Log.w('send gamemsg:$msgName timed out.');
      }
    } else {
      GameCodec.sendRawData(msgName, msgData, false, gameId: gameId ?? gameId);
    }
  }

  @override
  void sendGameMsgToGame(GameMsg gameMsg) {
    sendMessageToGame(GamePayload(
      name: 'gamemsg',
      id: DateTime.now().millisecondsSinceEpoch,
      data: gameMsg.toJson(),
    ));
  }

  /// 游戏同步公屏消息位置
  @override
  void syncMsgListPosFromGame(GamePayload payload) {
    msgListPosition = null;
    var data = payload.data;
    if (data is Map &&
        data.containsKey('top') &&
        data.containsKey('bottom') &&
        data.containsKey('start') &&
        data.containsKey('end')) {
      msgListPosition = Map<String, num>.from(data);
    }
    refreshState();
  }

  /// 同步游戏状态
  @override
  void syncGameStatus(GamePayload payload) {
    var map = payload.data;
    if (map is Map) {
      bool gaming = Util.parseBool(map['gaming'], false);
      if (this.gaming != gaming) {
        this.gaming = gaming;
        refreshState();
      }
    }
  }

  /// 退出房间
  @override
  void quitRoom(GamePayload payload) {
    Navigator.of(context).maybePop();
  }

  /// 打开房间管理页
  @override
  void openRoomAdmin() {
    RoomNavUtil.openRoomAdminScreen(
      context,
      rid: room.rid,
      purview: room.purview,
      types: room.config?.types,
      fullScreenDialog: true,
      uid: room.createor?.uid ?? 0,
    );
  }

  /// 房间分享面板
  @override
  void openShareRoomPanel() async {
    disableMouseEvent();
    roomManager.openRoomShareDialog(context);
    enableMouseEvent();
  }

  /// 点击房间设置
  @override
  void openRoomSettings() async {
    if (state is RoomSettingMixin) {
      disableMouseEvent();
      await (state as RoomSettingMixin).onSettingClick(room);
      enableMouseEvent();
    }
  }

  /// 打开侧边栏(一般用户横屏游戏)
  @override
  void openSidePanel(GamePayload payload) async {
    var data = payload.data;
    if (data is Map) {
      GameSidePanelType type = GameSidePanelType.msg;
      String page = data['page'];
      if (page == 'msg') {
        type = GameSidePanelType.msg;
      } else if (page == 'chat') {
        type = GameSidePanelType.chat;
      } else if (page == 'gift') {
        type = GameSidePanelType.gift;
      }
      disableMouseEvent();
      await GameSidePanel.show(context, room, type);
      enableMouseEvent();
    }
  }

  /// 调起文字输入框
  @override
  void openInputMessagePanel() async {
    disableMouseEvent();
    bool? displayEmote = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      maxHeightRatio: 0.75,
      builder: (BuildContext context) {
        return roomManager.getInputMessage(context, room: room);
      },
    );
    enableMouseEvent();

    if (displayEmote == true) {
      openEmojiPanel();
    }
  }

  /// 调起 emoji 面板
  @override
  void openEmojiPanel() async {
    bool disable = room.config?.displayMessage == false &&
        room.role != ClientRole.Broadcaster;
    if (disable) {
      return;
    }

    disableMouseEvent();
    await roomManager.openEmotePanel(context, room, onSendSuccess: () {
      Tracker.instance.track(TrackEvent.room_public_chat, properties: {
        'rid': room.rid,
        'msg_type': 'emoji',
        if (!Util.isNullOrEmpty(room.config?.typeName))
          'type_label': room.config?.typeName,
        if (!Util.isNullOrEmpty(room.config?.originalRFT))
          'room_factory_type': room.config?.originalRFT,
        if (!Util.isNullOrEmpty(room.config?.settlementChannel))
          'settlement_channel': room.config?.settlementChannel,
      });
    });
    enableMouseEvent();
  }

  /// 打开礼物面板
  @override
  void openGiftPanel() async {
    disableMouseEvent(timeout: 120);
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    await giftManager.showRoomGiftPanel(context, room: room);
    enableMouseEvent();
  }

  /// 打开私聊面板
  @override
  void openChatMsgPanel() async {
    // Tracker.instance.track(TrackEvent.game_room, properties: {
    //   'game_room_click': 'messagelist',
    //   'rid': room.rid,
    //   'room_type': room.config?.type,
    // });
    IMessageManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    disableMouseEvent();
    await manager.openChatMessagePanel(context);
    enableMouseEvent();
  }

  /// 打开用户资料弹窗面板
  @override
  void openProfilePanel(GamePayload payload) async {
    var map = payload.data;
    int uid = 0;
    if (map is Map) {
      uid = Util.parseInt(map['uid']);
    }
    if (uid > 0) {
      disableMouseEvent();
      await RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
          context, uid, room, 0);
      enableMouseEvent();
    }
  }

  @override
  void enableFloatMsg(GamePayload payload) {
    var map = payload.data;
    if (map is Map) {
      floatMsgEnabled = Util.parseBool(map['enable']);
      refreshState();
    }
  }

  @override
  void enableDisplayGift(GamePayload payload) {
    var map = payload.data;
    if (map is Map) {
      displayGiftEnabled = Util.parseBool(map['enable']);
      refreshState();
    }
  }

  @override
  void clearCache(GamePayload payload) {
    super.clearCache(payload);
    TopLiveTool.destroy();
  }

  @override
  void openWaitMicList() async {
    bool isAdmin = room.isAdmin;
    disableMouseEvent(timeout: 120);
    if (room.config?.mode == RoomMode.Auto && !isAdmin) {
      await RoomRepository.joinMic(
        room.realRid,
        -1,
        needCertify: true,
        type: room.needVerify,
        newType: room.needVerifyNew,
      );
    } else {
      await roomManager.openMicUpWaitListBottomPanel(context,
          room: room, isBoss: false, isAuction: false, isAdmin: isAdmin);
    }
    enableMouseEvent();
  }

  /// 上麦
  @override
  void joinMic(GamePayload payload) {
    var map = payload.data;
    int position = -1; // 默认上第一个可上的麦位
    if (map is Map) {
      position = Util.parseInt(map['position'], -1);
    }
    RoomRepository.joinMic(room.rid, position);
  }

  /// 上麦并开麦
  @override
  void joinAndOpenMic(GamePayload payload) {
    if (room.isMic) {
      if (room.mute) room.setMute(false);
    } else {
      var data = payload.data;
      int pos = -1;
      if (data is Map && data.containsKey('position')) {
        pos = Util.parseInt(data['position'], -1);
      }
      RoomRepository.joinMic(room.rid, pos).then((value) {
        if (room.mute) room.setMute(false);
      });
    }
  }

  /// 下麦
  @override
  void leaveMic(GamePayload payload) {
    if (room.isMic) {
      RoomRepository.leavelMic(room.rid);
    }
  }

  /// 开关麦
  @override
  void muteMic(GamePayload payload) {
    var data = payload.data;
    if (room.isMic && data is Map && data.containsKey('mute')) {
      bool mute = Util.parseBool(data['mute'], false);
      if (room.mute != mute) {
        room.setMute(mute);
        RoomPosition? curPos = room.positionForCurrentUser;
        RoomRepository.opMic(
            room.rid, curPos?.position, !mute ? 'openMic' : 'closeMic');
      }
    }
  }

  @override
  void playEffect(GamePayload payload) {
    var data = payload.data;
    if (data is Map && data.containsKey('path')) {
      String path = data['path'];
      int loop = Util.parseInt(data['loop'], 1); // 默认播一次
      double volume = Util.parseDouble(data['volume'], 100); // 音量
      int soundId = Util.parseInt(data['soundId'], 0);
      room.rtcController.engine?.playEffect(
        filePath: gameResManager!.getFullResPath(path)!,
        soundId: soundId,
        // rtc api里0表示播一次，-1表示循环播，所以这里转换一下参数
        loopCount: loop - 1,
        gain: volume,
        publish: 0,
      );
    }
  }

  @override
  void stopEffect(GamePayload payload) {
    var data = payload.data;
    if (data is Map && data.containsKey('soundId')) {
      int soundId = data['soundId'];
      room.rtcController.engine?.stopEffect(soundId);
    }
  }

  @override
  void stopAllEffects() {
    room.rtcController.engine?.stopAllEffects();
  }

  @override
  void muteAllRemoteAudioStreams(GamePayload payload) {
    var data = payload.data;
    if (data is Map && data.containsKey('mute')) {
      bool mute = Util.parseBool(data['mute']);
      room.rtcController.engine?.muteAllRemoteAudioStreams(mute);
    }
  }

  @override
  void muteRemoteAudioStream(GamePayload payload) {
    var data = payload.data;
    if (data is Map) {
      int uid = Util.parseInt(data['uid']);
      bool mute = Util.parseBool(data['mute']);
      if (uid > 0) {
        room.rtcController.engine?.muteRemoteAudioStream(uid, mute);
      }
    }
  }

  @override
  void minimizeGame(GamePayload payload) {
    onMinimizeGame?.call(payload);
  }

  @override
  void startGame(GamePayload payload) {
    onStartGame?.call(payload);
  }

  @override
  void closeGame(GamePayload payload) {
    onCloseGame?.call(payload);
  }

  @override
  void trackEvent(GamePayload payload) {
    Map data = payload.data;
    if (data.containsKey('name')) {
      String name = data['name'];
      Map properties = data['properties'];
      properties['rid'] = room.rid;
      properties['room_type'] = room.config?.type;
      properties['room_factory_type'] = room.config?.originalRFT;
      Tracker.instance.track(TrackEvent(name),
          properties: Map<String, dynamic>.from(properties));
    }
  }
}
