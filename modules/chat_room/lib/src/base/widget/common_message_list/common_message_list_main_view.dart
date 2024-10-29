import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;

import '../../../chatRoomData.dart';
import '../../../protobuf/generated/auction.pb.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../../protobuf/generated/heartrace.notice.pb.dart';
import '../../config.dart';
import '../../model/roomConstant.dart';
import '../welcomeItem.dart';
import 'common_message_list_normal.dart';
import 'common_message_list_relate.dart';
import 'message_tab_logic.dart';
import 'new_message_logic.dart';
import 'welcome_user_list_logic.dart';

/// 房间公屏重构：支持多TAB展示关联房间的公屏
class CommonMessageListMainVew extends StatefulWidget {
  final ChatRoomData room;
  final bool isNewWolfRoom;
  final GlobalKey<ComboFullEffectWidgetState>? comboEffectKey;

  const CommonMessageListMainVew({
    Key? key,
    required this.room,
    this.isNewWolfRoom = false,
    this.comboEffectKey,
  }) : super(key: key);

  @override
  BbMessageListMainState createState() {
    return BbMessageListMainState();
  }
}

class BbMessageListMainState extends State<CommonMessageListMainVew> with TickerProviderStateMixin {
  /// 支持多Tab展示本房间和关联房间的公屏
  final List<Tab> _tabs = [];

  TabController? _tabController;
  List<GlobalKey> _tabKeys = [];
  List<int> roomIds = [];

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventRoomWelcome, _onRoomWelcome);

    /// 团长进房，房间内所有人都可以收到，用于进场特效
    widget.room.addListener("Action.room.captain.enter", _onReceiveCaptainEnter);
    widget.room.addListener(RoomConstant.EVENT_Defend_Join_Mic_Banner, _onReceiveDefendJoinMic);
    widget.room.addListener(RoomConstant.EVENT_Defend_Enter_Room_Banner, _onReceiveDefendEnterRoom);
    widget.room.addListener(RoomConstant.EVENT_Go_To_Private_Room, _onReceivePrivateRoom);
    widget.room.addListener('${RoomConstant.Event_Prefix}auction.och.hit', _onReceiveAuctionBlessAward);
    widget.room.addListener(RoomConstant.Event_Heart_Race_Notice, _onReceiveHeartRaceNotice);
    widget.room.addListener(RoomConstant.Event_Heart_Race_Top_Change, _onReceiveHeartRaceTopChange);
    widget.room.addListener(RoomConstant.Event_Message_Tab_Change, _onMessageTabChange);
    initTab();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventRoomWelcome, _onRoomWelcome);
    widget.room.removeListener('Action.room.captain.enter', _onReceiveCaptainEnter);
    widget.room.removeListener(RoomConstant.EVENT_Defend_Join_Mic_Banner, _onReceiveDefendJoinMic);
    widget.room.removeListener(RoomConstant.EVENT_Defend_Enter_Room_Banner, _onReceiveDefendEnterRoom);
    widget.room.removeListener(RoomConstant.EVENT_Go_To_Private_Room, _onReceivePrivateRoom);
    widget.room.removeListener('${RoomConstant.Event_Prefix}auction.och.hit', _onReceiveAuctionBlessAward);
    widget.room.removeListener(RoomConstant.Event_Heart_Race_Notice, _onReceiveHeartRaceNotice);
    widget.room.removeListener(RoomConstant.Event_Heart_Race_Top_Change, _onReceiveHeartRaceTopChange);
    widget.room.removeListener(RoomConstant.Event_Message_Tab_Change, _onMessageTabChange);
    _tabController?.dispose();
    _tabController?.removeListener(_onTabChange);
    super.dispose();
  }

  void initTab() {
    NewMessageLogic? newMessageLogic;
    if (Get.isRegistered<NewMessageLogic>()) {
      newMessageLogic = Get.find<NewMessageLogic>();
    }

    if (showMultiTab) {
      int lastIndex = 0;
      if (_tabController != null) {
        lastIndex = _tabController!.index;
        _tabController?.dispose();
        _tabController?.removeListener(_onTabChange);
      }
      safeRun(() {
        int length = widget.room.drainagePreviewData?.drainageRoom.length ?? 0;
        _tabController = TabController(initialIndex: lastIndex < length ? lastIndex : 0, length: length, vsync: this);
        _tabController?.addListener(_onTabChange);
      });

      _tabs.clear();
      List<int> ids = [];
      List<GlobalKey> keys = [];
      for (RoomDrainageData room in widget.room.drainagePreviewData!.drainageRoom) {
        if (room.rid == widget.room.realRid) {
          /// 本房间
          ids.add(room.rid);

          /// newMessageLogic已经做了防止重复add
          newMessageLogic?.add(room.rid);
          _tabs.add(Tab(
            text: room.name,
          ));
          GlobalKey key;
          var reUseKey = getKey(room.rid);
          if (reUseKey != null) {
            key = reUseKey;
          } else {
            key = GlobalKey<CommonMessageListNormalState>();
          }
          keys.add(key);
        } else {
          /// 关联房间
          ids.add(room.rid);

          /// newMessageLogic已经做了防止重复add
          newMessageLogic?.add(room.rid);
          _tabs.add(Tab(
            text: room.name,
          ));
          GlobalKey key;
          var reUseKey = getKey(room.rid);
          if (reUseKey != null) {
            key = reUseKey;
          } else {
            key = GlobalKey<CommonMessageListRelateState>();
          }
          keys.add(key);
        }
      }
      _tabKeys = keys;
      roomIds = ids;
    } else {
      _tabKeys.clear();
      roomIds.clear();
      _tabs.clear();
      newMessageLogic?.clear();
      _tabController?.dispose();
      _tabController?.removeListener(_onTabChange);
      _tabController = null;
    }
  }

  bool get showMultiTab {
    /// drainageRoom.length > 1才认为是多Tab展示
    return Util.validList(widget.room.drainagePreviewData?.drainageRoom) &&
        widget.room.drainagePreviewData!.drainageRoom.length > 1 &&
        hasGetxLogic;
  }

  bool get hasGetxLogic {
    return Get.isRegistered<WelcomeUserListLogic>() && Get.isRegistered<NewMessageLogic>() && Get.isRegistered<MessageTabLogic>();
  }

  GlobalKey? getKey(int rid) {
    for (int i = 0; i < roomIds.length; i++) {
      if (roomIds[i] == rid && _tabKeys.length > i && ((i == 0 && rid == widget.room.realRid) || (i > 0 && rid != widget.room.realRid))) {
        /// 复用上一次的key，避免tab变化时做无谓的刷新
        /// 复用条件  1.相同rid；2.相同的MessageList类型，第0个Tab为BbMessageListNormal，后面的为BbMessageListRelate
        return _tabKeys[i];
      }
    }
    return null;
  }

  _onTabChange() {
    if ((_tabController?.indexIsChanging ?? false)) {
      return;
    }

    int index = _tabController?.index ?? 0;
    if (index < roomIds.length) {
      /// 设置currentTabRid,底部控制栏，确定是否可以输入
      if (Get.isRegistered<MessageTabLogic>()) {
        MessageTabLogic messageTabLogic = Get.find<MessageTabLogic>();
        messageTabLogic.change(roomIds[index]);
      }

      /// 切换TAB，通知所有TAB
      for (int i = 0; i < _tabKeys.length; i++) {
        if (_tabKeys[i].currentState == null) return;
        if (_tabKeys[i].currentState != null) {
          if (_tabKeys[i].currentState is CommonMessageListNormalState) {
            (_tabKeys[i].currentState as CommonMessageListNormalState).changeMessageTab(roomIds[index]);
          } else if (_tabKeys[i].currentState is CommonMessageListRelateState) {
            (_tabKeys[i].currentState as CommonMessageListRelateState).changeMessageTab(roomIds[index]);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          buildMessage(),
          _renderWelcome(context),
        ],
      ),
    );
  }

  Widget buildMessage() {
    if (showMultiTab && _tabController != null) {
      /// 包含关联房间的公屏
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<NewMessageLogic>(builder: (logic) {
            List<int> redDotIndex = [];
            for (int i = 0; i < roomIds.length; i++) {
              if (logic.hasNewMsg(roomIds[i])) {
                redDotIndex.add(i);
              }
            }
            return CommonTabBar(
              showSplash: false,
              labelPadding: const EdgeInsetsDirectional.only(end: 12),
              controller: _tabController,
              isScrollable: true,
              tabs: _tabs,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              indicator: CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
                insets: const EdgeInsetsDirectional.only(bottom: 5),
                wantWidth: 12,
              ),
              marginStart: 12,
              redDotIndex: redDotIndex,
            );
          }),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              viewportFraction: 0.99,
              children: renderTabViews(),

              /// 默认初始化所有关联房间公屏Tab，可以定时拉取关联房间公屏
            ),
          ),
        ],
      );
    }

    return CommonMessageListNormal(
      room: widget.room,
      isNewWolfRoom: widget.isNewWolfRoom,
    );
  }

  List<Widget> renderTabViews() {
    List<Widget> tabViews = [];
    RoomDrainageData? data;
    if (Util.validList(widget.room.drainagePreviewData?.drainageRoom) && widget.room.drainagePreviewData!.drainageRoom.isNotEmpty) {
      data = widget.room.drainagePreviewData!.drainageRoom[0];
    }

    tabViews.add(
      KeepAliveWrapper(
        child: CommonMessageListNormal(
          key: _tabKeys[0],
          room: widget.room,
          isNewWolfRoom: widget.isNewWolfRoom,
          drainageData: data,
        ),
      ),
    );

    for (int i = 1; i < _tabs.length; i++) {
      if (i < _tabKeys.length && i < roomIds.length) {
        late RoomDrainageData data;
        if (Util.validList(widget.room.drainagePreviewData?.drainageRoom) && i < widget.room.drainagePreviewData!.drainageRoom.length) {
          data = widget.room.drainagePreviewData!.drainageRoom[i];
        } else {
          data = RoomDrainageData(
            type: DrainageRoomType.DrainageRoomTypeNone,
            rid: roomIds[i],
            name: '',
            showType: 0,
            permission: [],
          );
        }
        tabViews.add(
          KeepAliveWrapper(
            child: CommonMessageListRelate(
              key: _tabKeys[i],
              room: widget.room,
              relateRid: roomIds[i],
              pullMsgInterval: widget.room.drainagePreviewData?.pullMsgInterval ?? 0,
              drainageData: data,
            ),
          ),
        );
      }
    }

    return tabViews;
  }

  _onWelcomeComplete(Welcome data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();

      if (logic.welcomes.contains(data)) {
        logic.removeWelcome(data);
        _refreshComboEffect();
      }
    }
  }

  Widget _renderWelcome(BuildContext context) {
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      return Positioned.fill(
        child: IgnorePointer(
          child: GetBuilder<WelcomeUserListLogic>(
            builder: ((logic) {
              return ListView.builder(
                padding: EdgeInsetsDirectional.zero,
                addAutomaticKeepAlives: false,
                shrinkWrap: false,
                itemCount: logic.welcomes.length,
                itemBuilder: (BuildContext context, int index) {
                  Welcome welcome = logic.welcomes.elementAt(index);
                  return RepaintBoundary(
                    child: WelcomeItem(key: welcome.key, data: welcome, onComplete: _onWelcomeComplete),
                  );
                },
              );
            }),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  /// 本房间公屏的欢迎/连击消息，从common_message_list_normal转发过来，公屏消息夹杂在其他消息中
  _onRoomWelcome(String type, dynamic message) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      if (message is MessageContent) {
        Map? extra = message.extra;

        bool isComboGiftHitMessage = message.isComboGift();
        if (isComboGiftHitMessage) {
          int giftId = 0;
          if (message.extra != null && message.extra?['gift'] != null) {
            giftId = Util.parseInt(message.extra?['gift']['id']);
          }
          // 相同hitId的连击，直接修改连击个数
          bool resetHitNum = false;
          for (Welcome element in logic.welcomes) {
            if (element.type == WelcomeType.ComboGift &&
                Util.validStr(element.hitId) &&
                element.hitId == Util.parseStr(message.extra?['hit_id']) &&
                element.giftId == giftId) {
              element.hitNum = message.extra?['hit_num'];
              resetHitNum = true;
              break;
            }
          }
          if (resetHitNum) {
            if (mounted) {
              setState(() {
                _refreshComboEffect();
              });
            }
            return;
          }
        }

        int title = Util.parseInt(extra?['title']);
        int titleNew = Util.parseInt(extra?['title_new']);
        Welcome welcome = Welcome.fromMap(extra ?? {}, isComboGiftHitMessage, widget.room.createor?.name ?? '');
        bool showTitle = true;
        if (extra?.containsKey('is_show_title') == true) {
          showTitle = Util.parseBool(extra?['is_show_title']);
        }

        //自己发送的连击礼物单独处理
        if (welcome.fromUid == Session.uid && isComboGiftHitMessage) {
          eventCenter.emit(EventConstant.EventRoomCombo, welcome);
          return;
        }

        bool hasMount = false;
        if (welcome.mounts != null && welcome.mounts is Map && welcome.mounts['id'] != null) {
          hasMount = true;
        }
        int currentNobility = NobilityUtil.currentIntNobility(oldNobility: title, newNobility: titleNew);
        if ((currentNobility < NobilityUtil.getInt(NobilityType.King) && !hasMount) || isComboGiftHitMessage) {
          bool needWelcome = false;
          if (logic.welcomes.length < 50) {
            needWelcome = true;
          } else if (logic.welcomes.length < 65) {
            if (currentNobility >= NobilityUtil.getInt(NobilityType.Viscount)) {
              needWelcome = true;
            }
          } else if (logic.welcomes.length < 80) {
            if (currentNobility >= NobilityUtil.getInt(NobilityType.Earl)) {
              needWelcome = true;
            }
          } else if (logic.welcomes.length < 100) {
            if (currentNobility >= NobilityUtil.getInt(NobilityType.Duke)) {
              needWelcome = true;
            }
          }

          if (needWelcome) {
            logic.addWelcome(welcome);
            _refreshComboEffect();
          }
        } else {
          if (showTitle) eventCenter.emit(RoomConstant.EVENT_Large_Welcome, welcome);
        }
      }
    }
  }

  /// 团长进房，房间内所有人都可以收到，用于进场特效
  void _onReceiveCaptainEnter(String type, dynamic data) {
    Log.d('_onReceiveCaptainEnter type = $type  data = $data');
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        Map<String, dynamic> captain = data['captain'];
        Map<String, dynamic> effect = data['effect'];
        Log.d('captain = $captain effect= $effect');
        Welcome welcome = Welcome(
          key: GlobalKey(),
          name: captain['name'],
          vip: captain['vip'],
          type: WelcomeType.Welcome,
          effect: WelcomeEffect.fromJson(effect),
        );
        logic.addWelcome(welcome);
        _refreshComboEffect();
      } catch (e) {
        Log.d(e);
        return;
      }
    }
  }

  void _onReceiveDefendJoinMic(String type, dynamic data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        Map<String, dynamic> effect = {'image': data['background'], 'font_color': data['font_color']};
        Welcome welcome = Welcome(
          key: GlobalKey(),
          name: data['my_name'],
          toName: data['to_name'],
          type: WelcomeType.DefendJoinMic,
          effect: WelcomeEffect.fromJson(effect),
          micSuffix: data['mic_suffix'],
        );
        logic.addWelcome(welcome);
      } catch (e) {
        Log.d(e);
        return;
      }
    }
  }

  _onReceiveDefendEnterRoom(String type, dynamic data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        Map<String, dynamic> effect = {'image': data['background'], 'font_color': data['font_color']};
        Welcome welcome = Welcome(
          key: GlobalKey(),
          name: data['my_name'],
          toName: data['to_name'],
          type: WelcomeType.DefendEnterRoom,
          effect: WelcomeEffect.fromJson(effect),
          enterSuffix: data['enter_suffix'],
          icon: data['my_icon'],
          toIcon: data['to_icon'],
        );
        logic.addWelcome(welcome);
      } catch (e) {
        Log.d(e);
      }
    }
  }

  void _onReceivePrivateRoom(String type, dynamic data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        Welcome welcome = Welcome(
          key: GlobalKey(),
          type: WelcomeType.PrivateRoom,
          icon: data['my_icon'],
          toIcon: data['to_icon'],
        );
        logic.addWelcome(welcome);
      } catch (e) {
        Log.d(e.toString());
        return;
      }
    }
  }

  void _onReceiveAuctionBlessAward(String type, dynamic data) {
    if (data != null && data is Map && data.containsKey('pb')) {
      try {
        AuctionOchHitMessage res = AuctionOchHitMessage.fromBuffer(List<int>.from(data['pb']));
        Welcome welcome = Welcome(
          key: GlobalKey(),
          type: WelcomeType.AuctionBlessAward,
          icon: res.icon,
          name: res.name,
          hitNum: res.num,
        );
        // 欧气奖励 显示在高处
        eventCenter.emit(EventConstant.EventRoomCombo, welcome);
      } catch (e) {
        Log.d(e.toString());
        return;
      }
    }
  }

  /// 心跳竞速：选择关系
  void _onReceiveHeartRaceNotice(String type, dynamic data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        if (data != null && data is Uint8List) {
          Uint8List buffer = data;
          HeartraceNotice pb = HeartraceNotice.fromBuffer(buffer);
          Welcome welcome = Welcome(
            key: GlobalKey(),
            type: WelcomeType.HeartRaceChooseRelation,
            icon: pb.leftIcon,
            toIcon: pb.rightIcon,
            micSuffix: pb.title,
            enterSuffix: pb.subTitle,
          );
          logic.addWelcome(welcome);
        }
      } catch (e) {
        Log.d(e.toString());
        return;
      }
    }
  }

  /// 心跳竞速：第一名变动
  void _onReceiveHeartRaceTopChange(String type, dynamic data) {
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      try {
        if (data != null && data is Map) {
          Welcome welcome = Welcome(
            key: GlobalKey(),
            type: WelcomeType.HeartRaceTopChange,
            icon: data['icon'],
            isMale: data['isMale'],
            name: data['name'],
          );
          logic.addWelcome(welcome);
        }
      } catch (e) {
        Log.d(e.toString());
        return;
      }
    }
  }

  /// message Tab 更新
  void _onMessageTabChange(String type, dynamic data) {
    if (mounted) {
      setState(() {
        initTab();
      });
    }
  }

  _refreshComboEffect() {
    if (widget.comboEffectKey == null || Util.validStr(widget.comboEffectKey!.currentState?.currentPath)) return;
    WelcomeUserListLogic? logic;
    if (Get.isRegistered<WelcomeUserListLogic>()) {
      logic = Get.find<WelcomeUserListLogic>();
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      double maxExtent = renderBox.size.height;
      int count = (maxExtent / 62).ceil();
      for (int i = 0; i < min(logic.welcomes.length, count); i++) {
        Welcome item = logic.welcomes[i];
        String effectStr = widget.room.hitBgWithCount(item.hitNum ?? 0);
        if (Util.validStr(effectStr)) {
          widget.comboEffectKey!.currentState?.filePath = effectStr;
          return;
        }
      }
    }
  }
}
