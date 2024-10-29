import 'dart:typed_data';

import 'package:chat_room/src/biz_plugin/grab_hat/model/hat_play_data.dart';
import 'package:chat_room/src/biz_plugin/pendant/pendant_repo.dart';
import 'package:chat_room/src/biz_plugin/pendant/pendant_util.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import 'package:chat_room/src/protobuf/common_banner_extension.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:chat_room/src/red_packet/red_packet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

const String activityPendantKey = 'activityPendantKey';
const String functionPendantKey = 'functionPendantKey';
const String bannerPendantKey = 'bannerPendantKey';

/// 房间挂件消息key
const String roomPendantKey =
    '${RoomConstant.Event_Pb_Prefix}room.position.plugin.message';

/// 暂未启用,公屏抽奖逻辑待优化
class RoomPendantManager extends GetxController {
  final ChatRoomData room;
  final State state;

  RoomPendantManager({required this.room, required this.state});

  @override
  void onInit() {
    super.onInit();
    _addListeners();
    _loadData();
  }

  /// 加载数据
  void _loadData() {
    _loadBannerData();
    _loadPendantData();
  }

  @override
  void onClose() {
    _removeListeners();
    super.onClose();
  }

  void onTick() {
    _onActivityPendantTick();
    _onFunctionPendantTick();
  }

  /// ======================= 活动挂件 =======================
  final List<String> _events = [
    RoomConstant.Event_Room_Lottery_Start,
    RoomConstant.Event_Room_Lottery_End,
    EventConstant.WebsocketEventMessage,
    EventConstant.EventVipLevelUp,
  ];

  final List<String> _roomEvents = [
    roomPendantKey,
    RoomConstant.Event_Room_Grab_Hat,
    RoomConstant.Event_Message_Red_Packet,
  ];

  /// 是否显示房间红包
  bool get showRedPacket =>
      room.redPacketConfig != null &&
      room.redPacketConfig?.state != RedPacketState.NoPacket;

  /// 是否显示公屏抽奖
  bool get showLottery =>
      LotteryManager.instance.shouldShowLotteryFloat(room.rid);

  /// 是否显示抢帽子
  bool get showGrabHat => _isShowGrabHat;

  /// 插件数据列表
  List<ResRoomPositionPluginItem> get pendantList => _pendantList;

  final List<ResRoomPositionPluginItem> _pendantList = [];

  /// 抢帽子数据
  GrabHatPushData? _grabHatData;
  bool _isShowGrabHat = false;

  void _addListeners() {
    eventCenter.addListeners(_events, _onEvent);
    room.addListeners(_roomEvents, _onEvent);
  }

  void _removeListeners() {
    room.removeListeners(_roomEvents, _onEvent);
    eventCenter.removeListeners(_events, _onEvent);
  }

  void _onEvent(String type, dynamic data) {
    switch (type) {
      case RoomConstant.Event_Room_Lottery_Start:
      case RoomConstant.Event_Room_Lottery_End:
      case EventConstant.WebsocketEventMessage:
        // 公屏抽奖
        if (LotteryManager.instance.handleLotteryEvent(state, type, data)) {
          update([activityPendantKey]);
        }
        break;
      case RoomConstant.Event_Room_Grab_Hat:
        // 抢帽子
        if (data is GrabHatPushData?) {
          _grabHatData = data;
          update([activityPendantKey]);
        }
        break;
      case EventConstant.EventVipLevelUp:
        // vip升级
        if (data is int) {
          room.redPacketConfig?.handleLevelUp(room, data);
          update([activityPendantKey]);
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
    }
  }

  void _onActivityPendantTick() {
    room.redPacketConfig?.countDownTime();
    if (_isShowGrabHat != _canShowGrabHat) {
      // 抢帽子挂件显示状态发生改变
      _isShowGrabHat = !_isShowGrabHat;
      update([activityPendantKey]);
    }
  }

  /// 能否显示抢帽子挂件
  bool get _canShowGrabHat {
    if (_grabHatData == null) return false;
    return _grabHatData!.expire > DateTime.now().secondsSinceEpoch;
  }

  /// 处理房间红包消息
  _handleRedPackageMsg(Map data) {
    if (room.redPacketConfig == null) return;
    int id = Util.parseInt(data['id'], -1);
    String state = data['state'];
    Log.d(tag: TAG, '_handleRedPackageMsg, state: $state ,id :$id');
    if (state == 'begin') {
      int money = Util.parseInt(data['money'], -1);
      room.redPacketConfig
          ?.updateState(RedPacketState.CountDown, from: "msg from server");
      room.redPacketConfig?.id = id;
      room.redPacketConfig?.money = money;
      room.redPacketConfig?.updateStayDura(Util.parseInt(data['stay'], 1),
          from: "msg from server");
      room.redPacketConfig?.updateCountTime(
          Util.parseInt(data['stay'] * 60, -1),
          from: "msg from server");
    } else if (state == 'over') {
      if (id != room.redPacketConfig?.id) {
        Log.d(tag: TAG, '_handleRedPackageMsg, ignore ,id not matched');
        return;
      }
      room.redPacketConfig
          ?.updateState(RedPacketState.NoPacket, from: "msg from server");
    }
    refresh();
  }

  /// 加载挂件数据
  void _loadPendantData() async {
    ResRoomPositionPlugin resp = await PendantRepo.getPendantList(room.rid);
    if (resp.success) {
      if (!Constant.inProduction) {
        Log.d(tag: TAG, 'api => data=${resp.data.toProto3Json()}');
      }
      for (var itemData in resp.data.pluginInfo) {
        _updateCache(itemData);
      }
      // 根据挂件权重排序,权重越大越靠前
      _pendantList.sort((a, b) => -a.weight.compareTo(b.weight));
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
    _pendantList.removeWhere((e) => e.pluginId == pluginId);
  }

  /// 更新缓存数据
  void _updateCache(ResRoomPositionPluginItem item) {
    if (item.pluginShowType == PendantShowType.delete.name) {
      // 接收删除消息
      Log.d(tag: TAG, 'delete type => pluginId=${item.pluginId}');
      removePluginItemData(item.pluginId);
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
    int cacheIndex =
        _pendantList.indexWhere((e) => e.pluginId == item.pluginId);
    if (cacheIndex < 0) {
      Log.d(tag: TAG, 'cacheIndex=$cacheIndex');
      // 无缓存数据时,直接缓存数据
      _pendantList.add(item);
    } else {
      Log.d(
        tag: TAG,
        'cacheMsgTime=${_pendantList[cacheIndex].stageInfo.msgTime} msgTime=${item.stageInfo.msgTime}',
      );
      if (_pendantList[cacheIndex].stageInfo.msgTime < item.stageInfo.msgTime) {
        // 缓存数据较旧时,更新缓存数据,防止消息乱序
        _pendantList[cacheIndex] = item;
      }
    }
  }

  /// ======================= 功能挂件 =======================
  /// 是否显示加入粉丝团
  bool get showFansGroup =>
      room.fansGroup != null && (room.fansGroup!.groupId ?? 0) <= 0;

  /// 是否显示荣耀时刻
  bool get shoHonorTime => _isHonorTimeShow;

  /// 是否显示点唱
  bool get showOrderSong => room.isKtvRoom;

  bool _isHonorTimeShow = false;

  /// 更新荣耀时刻显示状态
  void _onFunctionPendantTick() {
    if (_isHonorTimeShow != _canShowHonorTime) {
      _isHonorTimeShow = !_isHonorTimeShow;
      update([functionPendantKey]);
    }
  }

  /// 能否显示荣耀时刻
  bool get _canShowHonorTime {
    var data = room.generalSetting?.data.gloryRank;
    if (data == null) return false;
    DateTime now = DateTime.now();
    // hideAt为后一天的分钟,需要加一天
    return data.show &&
        now.isAfter(TimeUtil.nowDayTime(minute: data.showAt)) &&
        now.isBefore(TimeUtil.nowDayTime(minute: data.hideAt + 24 * 60));
  }

  /// ======================= Banner挂件 =======================
  /// banner列表
  List<BannerItemEntity> get bannerList => _bannerList;

  /// 是否显示关闭按钮
  bool get showCloseBanner => _showCloseBanner;

  final List<BannerItemEntity> _bannerList = [];

  bool _showCloseBanner = false;

  /// 加载Banner数据
  void _loadBannerData() async {
    ResBanner resp = await RoomApi.getRoomBanner(
        room.rid, Session.sex, Session.getInt('role', 0));
    if (resp.success) {
      List list = Util.isVerify ? resp.data.verifyItems : resp.data.items;
      for (var item in list) {
        BannerItemEntity? entity =
            BannerItemEntity.formatBanner(item, rid: room.rid);
        if (entity != null) {
          _bannerList.add(entity);
        }
      }
      _showCloseBanner = resp.data.opt.showClose;
      update([bannerPendantKey]);
    }
  }

  /// 关闭隐藏Banner
  void closeBanner() {
    _bannerList.clear();
    update([bannerPendantKey]);
  }
}
