import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/ArtCenterCounter.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/grab_hat_progress_widget.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/model/hat_play_data.dart';
import 'package:chat_room/src/biz_plugin/pendant/common_pendant.dart';
import 'package:chat_room/src/biz_plugin/pendant/pendant_repo.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import 'package:chat_room/src/lottery/widget/lottery_float_widget.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:chat_room/src/red_packet/red_packet_widget.dart';
import 'package:flutter/material.dart';

import '../../../biz_plugin/pendant/pendant_util.dart';
import 'room_base_pendant.dart';
import 'room_special_pendant.dart';

/// 房间挂件消息key
const String roomPendantKey =
    '${RoomConstant.Event_Pb_Prefix}room.position.plugin.message';

/// 房间活动型挂件
class RoomActivityPendant extends RoomBasePendant {
  const RoomActivityPendant({
    super.key,
    required super.room,
    required super.controller,
    required super.wrapListener,
    required super.tickNotifier,
  });

  @override
  State<RoomBasePendant> createState() => _RoomActivityPendantState();
}

class _RoomActivityPendantState extends RoomBasePendantState {
  final List<String> _events = [
    RoomConstant.Event_Room_Lottery_Start,
    RoomConstant.Event_Room_Lottery_End,
    EventConstant.WebsocketEventMessage,
    EventConstant.EventVipLevelUp,
    EventConstant.EventRechargeActivitySuccess,
    EventConstant.EventRechargeActivityClose,
  ];

  final List<String> _roomEvents = [
    roomPendantKey,
    RoomConstant.Event_Room_Grab_Hat,
    RoomConstant.Event_Message_Red_Packet,
  ];

  /// 限时充值活动插件id
  final int rechargeActivityPluginId = 2;

  /// 抢帽子数据
  GrabHatPushData? _grabHatData;

  /// 插件数据列表
  final List<ResRoomPositionPluginItem> _sourceList = [];

  @override
  Size get pendantSize => const Size(60, 84);

  /// 是否显示抢帽子
  bool _isShowGrabHat = false;

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners(_events, _onEvent);
    widget.room.addListeners(_roomEvents, _onEvent);
    _loadPendantData();
  }

  @override
  void dispose() {
    super.dispose();
    widget.room.removeListeners(_roomEvents, _onEvent);
    eventCenter.removeListeners(_events, _onEvent);
  }

  void _onEvent(String type, dynamic data) {
    switch (type) {
      case RoomConstant.Event_Room_Lottery_Start:
      case RoomConstant.Event_Room_Lottery_End:
      case EventConstant.WebsocketEventMessage:
        // 公屏抽奖
        if (LotteryManager.instance.handleLotteryEvent(this, type, data)) {
          refresh();
        }
        break;
      case RoomConstant.Event_Room_Grab_Hat:
        // 抢帽子
        if (data is GrabHatPushData?) {
          _grabHatData = data;
          refresh();
        }
        break;
      case EventConstant.EventVipLevelUp:
        // vip升级
        if (data is int) {
          widget.room.redPacketConfig?.handleLevelUp(widget.room, data);
          refresh();
        }
        break;
      case RoomConstant.Event_Message_Red_Packet:
        // 房间红包
        if (data is Map) {
          _handleRedPackageMsg(data);
        }
        break;
      case roomPendantKey:
        // 房间通用活动挂件
        _handlePendantEvent(data);
        break;
      case EventConstant.EventRechargeActivitySuccess:
        // 限时充值弹窗充值成功移除挂件
        removePluginItemData(rechargeActivityPluginId);
        refresh();
        break;
      case EventConstant.EventRechargeActivityClose:
        bool isHaveRechargeActivity = false;
        for (ResRoomPositionPluginItem item in _sourceList) {
          if (item.pluginId == rechargeActivityPluginId) {
            isHaveRechargeActivity = true;
            break;
          }
        }
        if (!isHaveRechargeActivity) {
          _loadPendantData();
        }
        break;
    }
  }

  @override
  void onTick() {
    // 倒计时给定的是具体秒数的需要在此处计时,负责控件不显示时倒计时不会启动
    widget.room.redPacketConfig?.countDownTime();
    if (_isShowGrabHat != _canShowGrabHat) {
      // 抢帽子挂件显示状态发生改变
      _isShowGrabHat = !_isShowGrabHat;
      refresh();
    }
  }

  @override
  List<PendantItem> buildPendantList() {
    List<PendantItem> list = [];
    if (_sourceList.isNotEmpty) {
      // 活动通用挂件
      for (var itemData in _sourceList) {
        list.add(PendantItem(
          '${itemData.pluginId}',
          CommonPendant(
            key: ValueKey('${itemData.pluginId}_${itemData.stageInfo.stageId}'),
            room: widget.room,
            data: itemData,
            timerNotifier: widget.tickNotifier,
          ),
        ));
      }
    }
    if (widget.room.redPacketConfig != null &&
        widget.room.redPacketConfig?.state != RedPacketState.NoPacket) {
      // 房间红包
      list.add(PendantItem(
        redPacketKey,
        RedPacketWidget(room: widget.room, timerNotifier: widget.tickNotifier),
      ));
    }
    if (LotteryManager.instance.shouldShowLotteryFloat(widget.room.rid)) {
      // 公屏抽奖
      list.add(PendantItem(
        lotteryKey,
        LotteryFloatWidget(room: widget.room),
      ));
    }
    if (_isShowGrabHat && _grabHatData != null) {
      // 抢帽子
      list.add(PendantItem(
        grabHatKey,
        GrabHatProgressWidget(
          room: widget.room,
          data: _grabHatData!,
          timerNotifier: widget.tickNotifier,
        ),
      ));
    }
    if ((widget.room.artCenterCounter) > widget.room.timestamp) {
      // 主播房转麦序房
      list.add(PendantItem(
        artCenterKey,
        ArtCenterCounter(
          counter: widget.room.artCenterCounter,
          isStart: widget.room.artCenterCounterStart,
          room: widget.room,
        ),
      ));
    }
    return list;
  }

  /// 能否显示抢帽子挂件
  bool get _canShowGrabHat {
    if (_grabHatData == null) return false;
    return _grabHatData!.expire > DateTime.now().secondsSinceEpoch;
  }

  /// 处理房间红包消息
  _handleRedPackageMsg(Map data) {
    if (widget.room.redPacketConfig == null) return;
    int id = Util.parseInt(data['id'], -1);
    String state = data['state'];
    Log.d(tag: TAG, '_handleRedPackageMsg, state: $state ,id :$id');
    if (state == 'begin') {
      int money = Util.parseInt(data['money'], -1);
      widget.room.redPacketConfig
          ?.updateState(RedPacketState.CountDown, from: "msg from server");
      widget.room.redPacketConfig?.id = id;
      widget.room.redPacketConfig?.money = money;
      widget.room.redPacketConfig?.updateStayDura(
          Util.parseInt(data['stay'], 1),
          from: "msg from server");
      widget.room.redPacketConfig?.updateCountTime(
          Util.parseInt(data['stay'] * 60, -1),
          from: "msg from server");
    } else if (state == 'over') {
      if (id != widget.room.redPacketConfig?.id) {
        Log.d(tag: TAG, '_handleRedPackageMsg, ignore ,id not matched');
        return;
      }
      widget.room.redPacketConfig
          ?.updateState(RedPacketState.NoPacket, from: "msg from server");
    }
    refresh();
  }

  /// 加载挂件数据
  void _loadPendantData() async {
    ResRoomPositionPlugin resp =
        await PendantRepo.getPendantList(widget.room.rid);
    if (resp.success) {
      if (!Constant.inProduction) {
        Log.d(tag: TAG, 'api => data=${resp.data.toProto3Json()}');
      }
      for (var itemData in resp.data.pluginInfo) {
        _updateCache(itemData);
      }
      // 根据挂件权重排序,权重越大越靠前
      _sourceList.sort((a, b) => -a.weight.compareTo(b.weight));
      refresh();
    }
  }

  /// 处理房间通用挂件事件
  void _handlePendantEvent(dynamic data) {
    if (data is Uint8List) {
      ResRoomPositionPluginRoomMessage itemData =
          ResRoomPositionPluginRoomMessage.fromBuffer(data);
      if (!Constant.inProduction) {
        Log.d(tag: TAG, 'onSocket => data=${itemData.toProto3Json()}');
      }
      _updateCache(itemData.data);
      refresh();
    } else if (data is Map) {
      Log.d(tag: TAG, 'onEvent => data=$data}');
      String op = data['op']; // 操作类型: delete-删除
      int pluginId = data['pluginId']; // 插件id
      if (op == 'delete') {
        removePluginItemData(pluginId);
        refresh();
      }
    }
  }

  /// 移除插件类型
  void removePluginItemData(int pluginId) {
    Log.d(tag: TAG, 'remove item => pluginId=$pluginId');
    // 插件到结束时间后需要隐藏时会收到该条消息
    // 删除对应缓存数据
    _sourceList.removeWhere((e) => e.pluginId == pluginId);
  }

  /// 更新缓存数据
  void _updateCache(ResRoomPositionPluginItem item) {
    if (item.pluginShowType == PendantShowType.delete.name) {
      // 删除消息
      Log.d(tag: TAG, 'delete type => pluginId=${item.pluginId}');
      // 通知特殊插件根据插件id删除
      eventCenter.emit(specialPendantKey, item);
      removePluginItemData(item.pluginId);
      return;
    }
    if (_specialPendantCheck(item)) {
      // 处理特殊插件
      Log.d(tag: TAG, 'Pendant is special => pluginId=${item.pluginId}');
      return;
    }
    if (isUnknownType(item.stageInfo.pluginType) ||
        isInvalidShowType(item.pluginShowType)) {
      // 不支持的插件类型或无效的显示类型直接返回
      Log.d(
          tag: TAG,
          'invalid type => pluginType=${item.stageInfo.pluginType} pluginShowType=${item.pluginShowType}');
      return;
    }
    // 查询是否已存在对应插件的数据
    int cacheIndex = _sourceList.indexWhere((e) => e.pluginId == item.pluginId);
    if (cacheIndex < 0) {
      Log.d(tag: TAG, 'cacheIndex=$cacheIndex');
      // 无缓存数据时,直接缓存数据
      _sourceList.add(item);
    } else {
      Log.d(
        tag: TAG,
        'cacheMsgTime=${_sourceList[cacheIndex].stageInfo.msgTime} msgTime=${item.stageInfo.msgTime}',
      );
      if (_sourceList[cacheIndex].stageInfo.msgTime < item.stageInfo.msgTime) {
        // 缓存数据较旧时,更新缓存数据,防止消息乱序
        _sourceList[cacheIndex] = item;
      }
    }
  }

  /// 检测并处理特殊类型挂件
  bool _specialPendantCheck(ResRoomPositionPluginItem item) {
    if (item.stageInfo.pluginType == PendantType.associated_room.name) {
      eventCenter.emit(specialPendantKey, item);
      return true;
    } else if (item.stageInfo.pluginType == PendantType.title_birthday.name) {
      eventCenter.emit(EventConstant.EventShowBirthdaySprite, item);
      return true;
    }
    return false;
  }
}
