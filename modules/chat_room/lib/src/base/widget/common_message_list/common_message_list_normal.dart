import 'dart:convert';
import 'dart:math';

import 'package:chat_room/src/base/widget/common_message_list/relate_room_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/shared.dart' hide MessageContent, MessageType;

import '../../../../assets.dart';
import '../../../../k.dart';
import '../../../biz_plugin/accompany_tacit/accompany_tacit_util.dart';
import '../../../chatRoomData.dart';
import '../../../cplove/heart/cp_heart_wear_hat_widget.dart';
import '../../../guess_gift/guess_gift_receive_dialog.dart';
import '../../../protobuf/generated/accompany.tacit.pb.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../../protobuf/generated/gift_screen.pb.dart';
import '../../../protobuf/generated/guess_gift.pb.dart';
import '../../../protobuf/generated/room_data.pb.dart';
import '../../config.dart';
import '../../message/throttle_queue.dart';
import '../../model/gift_media.dart';
import '../../model/message_content_display_type_ext.dart';
import '../../model/public_screen_enhancement_model.dart';
import '../../model/roomConstant.dart';
import '../../model/roomRepository.dart';
import '../../repo/room_api.dart';
import '../fade_animation_widget.dart';
import '../intimate_notify_widget.dart';
import '../ktv_applause_button.dart';
import '../normal_room_counter.dart';
import '../repo/public_screen_report_repo.dart';
import 'common_message_item.dart';
import 'common_message_tab_change.dart';
import 'invite_user_list_logic.dart';
import 'new_message_logic.dart';

/// 本房间的公屏
class CommonMessageListNormal extends StatefulWidget {
  final ChatRoomData room;
  final bool isNewWolfRoom;

  /// 当前Tab房间信息：type/permission等
  final RoomDrainageData? drainageData;

  const CommonMessageListNormal({
    Key? key,
    required this.room,
    this.isNewWolfRoom = false,
    this.drainageData,
  }) : super(key: key);

  @override
  CommonMessageListNormalState createState() {
    return CommonMessageListNormalState();
  }
}

class CommonMessageListNormalState extends State<CommonMessageListNormal> with CommonMessageTabChange implements QueueConsumer {
  bool _displayMessage = false;
  late ScrollController _controller;
  final ThrottleQueue _messageQueue = ThrottleQueue();

  ///app是否在前台
  bool _isResumed = true;
  bool _init = false;
  bool _scrollLock = false;

  bool _scrolling = false;

  List<String> _welcomeComeIn = []; //公屏增强欢迎别人入群

  /// KTV一首歌结束需要展示鼓掌按钮
  MessageContent? ktvApplause;
  bool _needRefresh = false;

  late LongPressMsgData _longPressMsgData;

  static const int _scrollEndAnimationDuration = 250;

  @override
  void initState() {
    super.initState();
    appStateObserver.addListener(_onAppStateChanged);
    eventCenter.addListener(EventConstant.EventKnightGroupExpire, _onKnightExpire);
    eventCenter.addListener(RoomConstant.Event_Online, _onOnlineChanged);
    _displayMessage = widget.room.config?.displayMessage ?? false;
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    widget.room.addListener(RoomConstant.Event_Send_End_Mic_Msg, _sendEndMicMsg);
    widget.room.addListener(RoomConstant.Event_ACCOMPANY_TACIT, _onReceiveAccompanyTacit);
    widget.room.addListener(RoomConstant.Event_Guess_Gift_Receiver, _onReceiveGuessGift);
    _messageQueue.setThrottleDuration(widget.room.msgAppearRate, _scrollEndAnimationDuration, widget.room.msgAppearFlushNum);
    _messageQueue.queueConsumer = this;
    _longPressMsgData = LongPressMsgData(showCopyAndComplainEntry: false, longPressItemIndex: 0, longPressItemMsgId: 0);
    Get.put(InviteUserListLogic());
    _load();
  }

  @override
  void dispose() {
    appStateObserver.removeListener(_onAppStateChanged);
    _controller.removeListener(_onScroll);
    _messageQueue.dispose();
    eventCenter.removeListener(EventConstant.EventKnightGroupExpire, _onKnightExpire);
    eventCenter.removeListener(RoomConstant.Event_Online, _onOnlineChanged);
    widget.room.removeListener(RoomConstant.Event_Message, _onMessageReceived);
    widget.room.removeListener(RoomConstant.Event_Active, _onAppActiveChange);
    widget.room.removeListener(RoomConstant.Event_Send_End_Mic_Msg, _sendEndMicMsg);
    widget.room.removeListener(RoomConstant.Event_ACCOMPANY_TACIT, _onReceiveAccompanyTacit);
    widget.room.removeListener(RoomConstant.Event_Guess_Gift_Receiver, _onReceiveGuessGift);

    Get.delete<InviteUserListLogic>();
    super.dispose();
  }

  @override
  void didUpdateWidget(CommonMessageListNormal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_displayMessage != oldWidget.room.config?.displayMessage) {
      _displayMessage = widget.room.config?.displayMessage ?? false;
      if (!_displayMessage) {
        _messageQueue.clearMsg();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Util.validList(widget.drainageData?.permission)) {
      return Column(
        children: [
          buildTop(),
          Expanded(child: buildMessageList()),
        ],
      );
    }

    return buildMessageList();
  }

  void _onOnlineChanged(String type, dynamic data) {
    if (mounted && Util.validList(widget.drainageData?.permission)) setState(() {});
  }

  Widget buildTop() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 8),
      width: Util.width - 24,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.white.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              '${K.room_current_room_in}${K.room_hot}：${widget.room.roomHot}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          if (Util.validList(widget.drainageData?.permission))
            GestureDetector(
              onTap: goRelateRoom,
              child: Container(
                width: 56,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.room_more,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white, height: 1.1),
                ),
              ),
            ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    if (widget.room.config == null) return const SizedBox.shrink();
    List<Widget> res = [
      _renderExpanded(context),
      if (_displayMessage && _messageQueue.freezeFrame)
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: _renderUnreadMsg(),
        ),
      _renderCounter(),

      if (widget.room.isBusinessHeart) _renderCpHeartHatMsg(),
      if (ktvApplause != null)
        KtvApplauseButton(
          ktvApplause!.extra?['icon'] ?? '',
          ktvApplause!.extra?['name'] ?? '',
          ktvApplause!.extra?['uuid'] ?? '',
          '${widget.room.rid}',
          _onKtvApplauseComplete,
        ),

      /// 复制/投诉
      if (_longPressMsgData.showCopyAndComplainEntry)
        PositionedDirectional(
          start: 0,
          end: 0,
          top: 0,
          bottom: 0,
          child: _renderCopyAndComplainWidget(),
        )
    ];

    res.add(IntimateNotifyWidget(room: widget.room));

    return Stack(
      clipBehavior: Clip.none,
      children: res,
    );
  }

  void _load() async {
    try {
      var data = await widget.room.getHistoryMessages();

      /// 历史消息中，过滤掉 礼物连击消息 / 新狼人房的狼人消息
      if (data.isNotEmpty) {
        // 历史消息中，连击礼物连击消息不展示在公屏, 夜店被本房间的霸屏消息不展示在公屏
        data.removeWhere((element) {
          return (element.isComboGift() ||
              (widget.isNewWolfRoom && element.type == MessageType.Wolf) ||
              (Util.parseInt(element.extra?['from_pub_rid']) != 0 &&
                  Util.parseInt(element.extra?['from_pub_rid']) != widget.room.realRid) ||
              element.extra?['pub_club_icon'] != null);
        });
      }
      _messageQueue.initMsgList(data);

      _sendLocalMessage();

      GiftMediaModel giftMediaModel = Provider.of<GiftMediaModel>(context, listen: false);
      giftMediaModel.reload();
    } catch (e) {
      Log.d(e);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _init = true;
    });
    _messageQueue.startConsumer();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollToEnd();
    });
    widget.room.removeListener(RoomConstant.Event_Message, _onMessageReceived);
    widget.room.addListener(RoomConstant.Event_Message, _onMessageReceived);
    widget.room.removeListener(RoomConstant.Event_Active, _onAppActiveChange);
    widget.room.addListener(RoomConstant.Event_Active, _onAppActiveChange);
  }

  /// 应用前后台切换
  void _onAppStateChanged() async {
    AppLifecycleState state = appStateObserver.value;
    bool resumed = state == AppLifecycleState.resumed;
    if (_isResumed != resumed) {
      _isResumed = resumed;
    }
  }

  void _sendLocalMessage() {
    //Send gameId message
    _sendGameIdMessage();

    //Send security message
    _sendSecurityMsg();

    //Send description message
    _sendDescriptionMessage().then((value) {
      if (mounted) setState(() {});
    });

    _sendGiftMessage().then((value) {
      if (mounted) setState(() {});
    });
  }

  /// 守护到期提醒
  _onKnightExpire(String type, dynamic data) {
    Map extra;
    if (data is Map) {
      extra = data;
    } else {
      return;
    }
    MessageContent message = MessageContent.from(
      "",
      extra,
      null,
      null,
      type: MessageType.KnightExpire,
    );

    _messageQueue.addLastThrottleMsg(
      message,
    );
  }

  void _sendEndMicMsg(String name, dynamic data) {
    String content = 'endOnMic';
    Map extra = {'type': 'endOnMic', 'time': Util.parseInt(data).toString()};
    MessageContent message = MessageContent.from(
      content,
      extra,
      null,
      null,
    );
    _messageQueue.addLastThrottleMsg(
      message,
    );
  }

  _onScroll() {
    if (!_controller.hasClients) return;
    if (!_controller.position.hasPixels) return;
    if (!_controller.position.hasContentDimensions) return;
    if (_controller.position.pixels >= _controller.position.maxScrollExtent && _messageQueue.freezeFrame == true) {
      setFreezeFrame(false);
    }
  }

  void freezeFrame() {
    if (!_controller.hasClients) return;
    if (!_controller.position.hasPixels) return;
    if (!_controller.position.hasContentDimensions) return;
    if (_controller.position.pixels < _controller.position.maxScrollExtent && _messageQueue.freezeFrame == false) {
      setFreezeFrame(true);
    }
  }

  // 用户滑动过公屏之后（不在最底部），公屏不再随着消息的接收自动滑到底部，而显示未读消息数
  void setFreezeFrame(bool freeze) {
    if (mounted) {
      setState(() {
        _messageQueue.freezeFrame = freeze;
        if (!freeze) {
          _messageQueue.unreadMsg = 0;
        }
      });
    }
  }

  _onMessageReceived(String type, dynamic data) {
    if (!mounted) return;

    MessageContent message;
    if (data is MessageContent) {
      message = data;
    } else {
      return;
    }

    try {
      Map? extra = message.extra;
      // Log.d("AAA-MSG: ${jsonEncode(message)}");
      Log.d("AAA-MSG: ${message.type}  extra:$extra");

      /// 专门发给某个用户的，不是这个用户，不必展示这条消息，直接丢弃
      if (extra?.containsKey("toUid") == true && Util.parseInt(extra?['toUid']) > 0 && Util.parseInt(extra?['toUid']) != Session.uid) {
        return;
      }

      if (message.type == MessageType.Package) {
        if (Util.parseInt(extra?['uid']) == Session.uid) {
          GiftMediaModel giftMediaModel = Provider.of<GiftMediaModel>(context, listen: false);
          giftMediaModel.reload();
        }
      }

      // 忽略画猜房的轨迹图像数据 连击消息为兼容老版本message为null
      if ((message.message == null && message.type != MessageType.Hit) || extra?['subType'] == 'image') {
        return;
      }

      /// 麦上emoji表情
      if (extra?.containsKey('emote_position') == true && extra!['emote_position'] > 0 && extra['emote_sender'] > 0) {
        if (Util.appState == AppLifecycleState.resumed) {
          eventCenter.emit('Room.Emote', extra);
        }
        return;
      }

      // 忽略房间内发头像礼物的消息
      if (message.type == MessageType.AvatarGift) {
        return;
      }

      // 新狼人房间忽略关于狼人流程的消息
      if (message.type == MessageType.Wolf && widget.isNewWolfRoom) {
        return;
      }

      bool isComboGiftHitMessage = message.isComboGift();

      // 夜店卡座转发到大厅的送礼消息 只展示霸屏 不展示连击
      bool showComboGift =
          isComboGiftHitMessage && (Util.parseInt(extra?['from_pub_rid']) == 0 || Util.parseInt(extra?['from_pub_rid']) == widget.room.rid);

      // Log.d('welcometype:${extra['type']} $_showComboGift');
      if (Util.appState == AppLifecycleState.resumed && (showComboGift || extra?['type'] == 'notify' || extra?['type'] == 'walcome')) {
        /// 飘屏
        eventCenter.emit(EventConstant.EventRoomWelcome, message);
      }

      // 霸屏消息来源非本房间
      bool tyrantMsgNotMyRoom = Util.parseInt(extra?['from_pub_rid']) != 0 && Util.parseInt(extra?['from_pub_rid']) != widget.room.rid;

      // 夜店开卡座成功霸屏消息
      bool isOpenPubClub = extra?['pub_club_icon'] != null;

      // 公屏忽略房间内连击礼物连击的消息 非本房间的霸屏消息不在公屏中展示 开卡座成功的霸屏消息不在公屏中展示
      if (isComboGiftHitMessage || tyrantMsgNotMyRoom || isOpenPubClub) {
        if (mounted) {
          setState(() {});
        }
        return;
      }

      if (Util.appState == AppLifecycleState.resumed) {
        _messageQueue.addLastThrottleMsg(message);
        if (!_messageQueue.hasStartConsumer()) {
          /// 未开始消费消息，展示红点
          if (Get.isRegistered<NewMessageLogic>()) {
            NewMessageLogic newMessageLogic = Get.find<NewMessageLogic>();
            newMessageLogic.change(widget.room.rid, true);
          }
        }

        setState(() {
          if (message.type == MessageType.Match && message.extra?['applause'] == 1 && Session.uid != Util.parseInt(message.extra?['uid'])) {
            // 公屏有切歌消息，展示鼓掌按钮
            ktvApplause = message;
          }
        });

        if (message.type == MessageType.Message && message.extra?['applause'] == 1) {
          // 公屏中有鼓掌消息，播放鼓掌音效
          AudioPlayHelper.instance().playAudio('ktv_applause_audio.mp3', path: 'packages/chat_room/assets/sound/');
        }

        if (message.type == MessageType.Message && Util.parseInt(message.extra?['prop_id']) > 0) {
          // KTV氛围工具动画效果
          // 要的太急 先弄个临时方案 后面优化下
          eventCenter.emit('ktv_atmosphere_animation', Util.parseInt(message.extra?['prop_id']));
        }
      } else {
        _needRefresh = true;
        _messageQueue.addLastThrottleMsg(message);
      }

      if (message.displayType == RoomMessageDisplayType.welcomeTargetToMe) {
        eventCenter.emit(RoomConstant.Event_Welcome_To_Me, message.user?.uid ?? 0);
      }
    } catch (e) {
      Log.d(e);
    }
  }

  //公屏提示赠送礼物
  Future<void> _sendGiftMessage() async {
    if (widget.room.config == null) return;
    if (widget.room.positions.isEmpty) return;

    Purview purview = widget.room.purview;

    //非房主or接待不提示
    if (purview == Purview.SuperAdmin || purview == Purview.Createor) return;

    //连连看场景房不提示
    if (widget.room.config!.isSceneType) return;

    RoomPosition? roomPosition;
    String targetStr = K.room_owner;
    if (widget.room.config?.property == RoomProperty.Business) {
      roomPosition = widget.room.positions.firstWhereOrNull((_) => _.position == 0 && _.uid > 0);
      if (widget.room.config?.types == RoomTypes.Live ||
          widget.room.config?.types == RoomTypes.Radio ||
          widget.room.config?.types == RoomTypes.RadioDefend) {
        targetStr = K.room_live_prefix;
      } else {
        targetStr = K.room_reception;
      }
    } else {
      int creatorId = widget.room.createor?.uid ?? 0;
      roomPosition = widget.room.positions.firstWhereOrNull((_) => _.uid > 0 && _.uid == creatorId);
      targetStr = K.room_owner;
    }

    if (roomPosition == null) return;

    String url = "${System.domain}go/yy/gift/screen?version=2";
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '${widget.room.rid}',
        'uid': '${Session.uid}',
      });
      RespGiftScreen res = RespGiftScreen.fromBuffer(response.bodyBytes);
      if (mounted) {
        if (res.data.switchState <= 0) return;
        if (res.data.giftId <= 0 || res.data.giftName.isEmpty) return;

        Future.delayed(Duration(seconds: res.data.delay), () {
          if (Util.appState != AppLifecycleState.resumed) return;

          String msg = K.room_send_gift_to_creator([targetStr, res.data.giftName]);
          Map extra = {
            'gift_id': res.data.giftId,
            'to_uid': roomPosition!.uid,
          };

          MessageContent message = MessageContent.from(
            msg,
            extra,
            null,
            null,
            type: MessageType.SendGift,
          );

          _messageQueue.addLastThrottleMsg(
            message,
          );

          Tracker.instance.track(TrackEvent.room_lollipop_tips, properties: {
            'rid': widget.room.rid,
            'room_type': widget.room.config?.type,
            'room_types': describeEnum(widget.room.config?.types),
            'room_property': describeEnum(widget.room.config?.property),
          });
        });
      }
    } catch (e) {}
  }

  _onAppActiveChange(String type, dynamic data) {
    if (data == true && mounted && _needRefresh) {
      _needRefresh = false;
      _setStateAndPostScrollEnd();
    }
  }

  Future<void> _sendDescriptionMessage() async {
    ResRoomDataDesc des = await RoomApi.roomDescription(widget.room.rid);

    if (des.success && des.hasData() && mounted) {
      Map extra = {'type': 'local'};
      MessageContent message = MessageContent.from(
        des.data,
        extra,
        null,
        null,
      );
      _messageQueue.addLastThrottleMsg(message, shrinkNum: ThrottleQueue.maxInitNum);
    }
  }

  void _sendGameIdMessage() {
    if (mounted && (widget.room.config?.type == 'chook' || widget.room.config?.type == 'king')) {
      String content = '';
      for (var position in widget.room.positions) {
        if (position.uid > 0 && position.gameId != null && position.gameId!.isNotEmpty) {
          content = content +
              (content.isEmpty ? '' : '、') +
              (position.position == 0 ? K.room_admin_chair : K.room_num_mic(['${position.position}']));
        }
      }

      if (content.isNotEmpty) content = '$content${K.room_fill_gameid}';

      Map extra = {'type': 'local', 'nav-type': 'inputGameId', 'nav-text': K.room_modify_my_gameid};

      MessageContent message = MessageContent.from(content, extra, null, null);
      _messageQueue.addLastThrottleMsg(message, shrinkNum: ThrottleQueue.maxInitNum);
    }
  }

  void _sendSecurityMsg() {
    Map<String, dynamic>? safeNotify = widget.room.safeNotify;

    if (safeNotify?['text'] != null && Util.validStr(safeNotify?['url']) && Util.validStr(safeNotify?['announce'])) {
      String content = safeNotify!['text'];
      Map extra = {
        'type': 'local',
        'nav-type': 'security',
        'nav-text': safeNotify['text'],
        'jump-text': safeNotify['announce'],
        'jump-url': safeNotify['url']
      };
      MessageContent message = MessageContent.from(content, extra, null, null);
      _messageQueue.addLastThrottleMsg(message, shrinkNum: ThrottleQueue.maxInitNum);
    }
  }

  ///默契问答消息,走新的proto消息协议
  _onReceiveAccompanyTacit(String type, dynamic data) {
    Log.d('_onReceiveAccompanyTacit,type=$type data=$data');
    if (data is! Uint8List) return;
    AccompanyTacit tacitData = AccompanyTacit.fromBuffer(data);

    ///需要将消息转成MessageContent 用于展示卡片
    MessageContent? message = AccompanyTacitUtil.parse(tacitData);
    if (message != null) {
      _onMessageReceived(type, message);
    }
  }

  void _onReceiveGuessGift(String type, dynamic data) {
    try {
      if (data != null && data is Uint8List) {
        Uint8List buffer = data;
        GuessGiftPreferencesMessage guessGiftData = GuessGiftPreferencesMessage.fromBuffer(buffer);
        debugPrint("_onReceiveGuessGift guessGiftData: $guessGiftData");
        GuessGiftReceiveDialog.show(context, guessGiftData);
      }
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }

  /// 快捷欢迎语
  void _loadWelcomeMessage() async {
    if (_welcomeComeIn.isNotEmpty) {
      _sendWelcomeMessage();
    } else {
      PublicScreenEnhancementModel? model = await RoomRepository.loadPublicScreenEnhancement(widget.room.realRid, 'message');
      if (mounted) {
        _welcomeComeIn = model?.data?.content ?? [];
        if (_welcomeComeIn.isNotEmpty) {
          // 随机选择一个发送
          _sendWelcomeMessage();
        }
      }
    }
  }

  _sendWelcomeMessage() async {
    if (_welcomeComeIn.isEmpty) {
      return;
    }
    int index = Random().nextInt(_welcomeComeIn.length);

    String? value = _welcomeComeIn[index];

    if (value.isEmpty) return;
    try {
      int isGuess = 0;
      if (widget.room.config?.game == Games.Guess) {
        IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        if (drawGuessManager.isDrawing()) {
          isGuess = 1;
        }
      }

      DataRsp dataRsp = await widget.room.sendMessage(
          value,
          json.encode({
            'vip': Session.vip,
            'vip_new': Session.vipNew,
            'title': Session.title,
            'title_new': Session.titleNew,
            'defends': widget.room.defend,
            'is_guess': isGuess,
            'position': widget.room.positionForCurrentUser?.position ?? -1,
            'is_live': widget.room.config?.types == RoomTypes.Live ? 1 : 0,
            'live_uid': widget.room.createor?.uid ?? 0,
            'live_label': widget.room.config?.liveDataV3?.fansLabel ?? '',
          }));
      if (dataRsp.success == true && widget.room.config?.property != RoomProperty.virtual) {
        Tracker.instance.track(TrackEvent.room_public_chat, properties: {
          'rid': widget.room.rid,
          'msg_type': 'text',
          if (!Util.isNullOrEmpty(widget.room.config?.typeName)) 'type_label': widget.room.config?.typeName,
          if (!Util.isNullOrEmpty(widget.room.config?.originalRFT)) 'room_factory_type': widget.room.config?.originalRFT,
          if (!Util.isNullOrEmpty(widget.room.config?.settlementChannel)) 'settlement_channel': widget.room.config?.settlementChannel,
        });
      }
    } catch (e) {
      Toast.showCenter(context, e.toString());
    }
  }

  Widget _renderBody(MessageContent message, int index) {
    return CommonMessageItem(
      room: widget.room,
      message: message,
      index: index,
      loadWelcomeMessage: _loadWelcomeMessage,
      onMsgLongPress: setLongPressMsgData,
    );
  }

  void setLongPressMsgData(LongPressMsgData data) {
    if (mounted) {
      setState(() {
        _longPressMsgData = data;
      });
    }
  }

  // 未读消息数展示
  Widget _renderUnreadMsg() {
    if (_messageQueue.unreadMsg == 0) {
      return const SizedBox.shrink();
    } else {
      String unreadNum = '${_messageQueue.unreadMsg}';
      if (_messageQueue.unreadMsg > 99) {
        unreadNum = '99+';
      }
      return FadeAnimationWidget(
        child: GestureDetector(
          onTap: () {
            _scrollToEnd();
            setFreezeFrame(false);
          },
          child: Container(
            height: 32,
            padding: const EdgeInsetsDirectional.only(start: 28, end: 29),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_unread_msg([unreadNum]),
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const SizedBox(width: 4),
                R.img(
                  'ic_expand.svg',
                  width: 16,
                  height: 16,
                  color: Colors.black,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _renderExpanded(BuildContext context) {
    if (_displayMessage != true || _init == false) {
      return const SizedBox.shrink();
    }

    double topPadding = 6;

    if (widget.room.config?.property == RoomProperty.Vip) {
      topPadding = 20;
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          UserScrollNotification user = notification;
          _scrollLock = user.direction.toString() != 'ScrollDirection.idle';
        }
        return false;
      },
      child: Listener(
        onPointerUp: (PointerUpEvent event) {
          // 手动滑动后（除公屏滚到底），公屏不再自动滚
          freezeFrame();
        },
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Colors.transparent, Colors.transparent],
              stops: [0.0, 0.1, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.builder(
            cacheExtent: 100.0,
            physics: const AlwaysScrollableScrollPhysics(),
            addAutomaticKeepAlives: false,
            padding: EdgeInsetsDirectional.only(top: topPadding),
            controller: _controller,
            itemCount: _messageQueue.widgetDataListLength,
            itemBuilder: (BuildContext context, int index) {
              MessageContent message = _messageQueue.elementAt(index);
              return _renderBody(message, index);
            },
          ),
        ),
      ),
    );
  }

  void _onKtvApplauseComplete() {
    if (mounted) {
      setState(() {
        ktvApplause = null;
      });
    }
  }

  // 心动速配，帽子消息
  Widget _renderCpHeartHatMsg() {
    return PositionedDirectional(
      bottom: 100.0,
      end: 0.0,
      child: CpHeartWearHatWidget(
        room: widget.room,
      ),
    );
  }

  /// 公屏复制/投诉
  Widget _renderCopyAndComplainWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _longPressMsgData.showCopyAndComplainEntry = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 141,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      MessageContent message = _messageQueue.elementAt(_longPressMsgData.longPressItemIndex);
                      // Log.d('----------------message:${message.toString()}');
                      if (message.messageId == _longPressMsgData.longPressItemMsgId) {
                        refresh(() {
                          _longPressMsgData.showCopyAndComplainEntry = false;
                        });
                        Clipboard.setData(ClipboardData(text: message.message ?? ''));
                        Fluttertoast.showToast(msg: K.room_msg_copied, gravity: ToastGravity.CENTER);
                      }
                    },
                    child: Container(
                      width: 70,
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(RoomAssets.message_copy_webp, width: 16, height: 16, package: ComponentManager.MANAGER_BASE_ROOM),
                          const SizedBox(width: 4),
                          Text(
                            K.room_msg_copy,
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1, height: 20, color: Colors.white54),
                  InkWell(
                    onTap: () async {
                      // 点击后需要投诉的消息
                      MessageContent msg = _messageQueue.elementAt(_longPressMsgData.longPressItemIndex);
                      int msgLength = _messageQueue.widgetDataListLength;
                      if (msgLength > 0 &&
                          _longPressMsgData.longPressItemIndex < msgLength &&
                          msg.messageId == _longPressMsgData.longPressItemMsgId) {
                        // 前5条消息
                        List<MessageContent> preMsgList = [];
                        if (_longPressMsgData.longPressItemIndex > 0) {
                          int count = 0;
                          for (int i = _longPressMsgData.longPressItemIndex - 1; i >= 0; i--) {
                            if (count > 4) {
                              break;
                            }
                            MessageContent preMsg = _messageQueue.elementAt(i);
                            if (preMsg.type == MessageType.Message) {
                              preMsgList.add(preMsg);
                              count++;
                            }
                          }
                        }

                        // 后5条消息
                        List<MessageContent> sufMsgList = [];
                        if (_longPressMsgData.longPressItemIndex < msgLength - 1) {
                          int count = 0;
                          for (int i = _longPressMsgData.longPressItemIndex + 1; i < msgLength; i++) {
                            if (count > 4) {
                              break;
                            }
                            MessageContent sufMsg = _messageQueue.elementAt(i);
                            if (sufMsg.type == MessageType.Message) {
                              sufMsgList.add(sufMsg);
                              count++;
                            }
                          }
                        }

                        // 合并消息列表
                        List<MessageContent> msgList = [
                          if (Util.validList(preMsgList)) ...preMsgList.reversed,
                          msg,
                          if (Util.validList(sufMsgList)) ...sufMsgList
                        ];

                        // 投诉
                        if (Util.validList(msgList)) {
                          int toUid = Util.parseInt(msg.user?.uid);
                          int rid = Util.parseInt(widget.room.rid);
                          String content = Util.parseStr(msg.message) ?? '';
                          List contexts = [];
                          for (MessageContent item in msgList) {
                            // Log.d('-----------_longPressItemIndex:$_longPressItemIndex// currentMessage:${msg.message}// message:${item.message}');
                            contexts.add({
                              "uid": Util.parseInt(item.user?.uid),
                              "context": item.message ?? "",
                              "type": MessageContent.getTextTypes(item.type)
                            });
                          }

                          String? contextsStr;
                          try {
                            contextsStr = json.encode(contexts);
                          } catch (e) {
                            Log.d('json.encode(contexts) error:${e.toString()}');
                          }
                          if (Util.validStr(contextsStr)) {
                            NormalNull resp = await PublicScreenReportRepo.report(toUid, rid, content, contextsStr!);
                            if (resp.success) {
                              refresh(() {
                                _longPressMsgData.showCopyAndComplainEntry = false;
                              });
                              Fluttertoast.showCenter(msg: Util.validStr(resp.msg) ? resp.msg : K.room_msg_complain_success);
                            } else {
                              Fluttertoast.showCenter(msg: Util.validStr(resp.msg) ? resp.msg : K.room_msg_complain_failure);
                            }
                          }
                        }
                      }
                    },
                    child: Container(
                      width: 70,
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(RoomAssets.message_complain_webp, width: 16, height: 16, package: ComponentManager.MANAGER_BASE_ROOM),
                          const SizedBox(width: 4),
                          Text(
                            K.room_msg_complain,
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            R.img(
              'guess_queue_bottom_triangle.png',
              width: 12,
              height: 5,
              package: ComponentManager.MANAGER_DRAW_GUESS,
              color: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderCounter() {
    if (widget.room.config != null &&
        widget.room.config!.counter - widget.room.timestamp > 0 &&
        (widget.room.isKtvRoom ||
            widget.room.config?.game == Games.Wolf ||
            widget.room.config?.game == Games.Guess ||
            widget.room.config?.game == Games.Under)) {
      return PositionedDirectional(
        top: 12,
        end: 12,
        child: NormalRoomCounter(counter: widget.room.config!.counter),
      );
    }

    return const SizedBox.shrink();
  }

  /// setState 更新数据再post一个scrollEnd task
  _setStateAndPostScrollEnd() {
    if (!mounted) return;
    setState(() {});
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _handleScrollEnd();
    });
  }

  ///当前有触摸时不滚动，触摸释放时5秒后可以滚动
  void _handleScrollEnd() {
    if (!_controller.hasClients) return;
    if (_messageQueue.freezeFrame) return;

    if (_controller.position.maxScrollExtent > _controller.offset) {
      _scrollToEnd();
      return;
    }
    //一次触发滚动实际上先后滚动了两次以确保滚动到底，因为maxScrollExtent有时并不准确
    // _scrollToEnd();
  }

  void _scrollToEnd() {
    if (_scrollLock) return;
    if (!_controller.hasClients) return;
    Log.d('_MessageListState._scrollToEnd value = ${_controller.position.maxScrollExtent}');
    if (_scrolling) return;
    _scrolling = true;
    _controller.position
        .moveTo(_controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: _scrollEndAnimationDuration), curve: Curves.easeInOut)
        .then((v) {
      _scrolling = false;
    });
  }

  @override
  handleFlushEndFrame() {
    if (!mounted) return;
    if (Util.appState == AppLifecycleState.resumed) {
      _setStateAndPostScrollEnd();
    } else {
      _needRefresh = true;
    }
  }

  @override
  handleEndFrame() {
    if (!mounted) return;
    if (Util.appState == AppLifecycleState.resumed) {
      _setStateAndPostScrollEnd();
    } else {
      _needRefresh = true;
    }
  }

  @override
  void changeMessageTab(int currentRid) {
    if (currentRid == widget.room.rid) {
      /// 切换到当前房间TAB，清除红点，并开始消费消息
      _messageQueue.startConsumer();
      _setStateAndPostScrollEnd();
      if (Get.isRegistered<NewMessageLogic>()) {
        NewMessageLogic newMessageLogic = Get.find<NewMessageLogic>();
        newMessageLogic.change(widget.room.rid, false);
      }
    } else {
      /// 切到关联房间TAB，需要记录红点，并暂停消费消息
      _messageQueue.pauseConsume();
    }
  }

  bool going = false;

  void goRelateRoom() async {
    if (going) {
      return;
    }

    going = true;

    if (widget.drainageData != null) {
      await RelateRoomOption.moreOption(widget.drainageData!.permission, widget.drainageData!.rid, widget.room.realRid);
    }

    going = false;
  }
}

class LongPressMsgData {
  bool showCopyAndComplainEntry; // 是否显示复制/投诉按钮
  int longPressItemIndex;
  int longPressItemMsgId;

  LongPressMsgData({
    required this.showCopyAndComplainEntry,
    required this.longPressItemIndex,
    required this.longPressItemMsgId,
  });
}
