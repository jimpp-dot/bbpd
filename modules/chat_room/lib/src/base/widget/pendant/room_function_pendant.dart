import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/fans/join_fan_group_widget.dart';
import 'package:chat_room/src/ktv/widget/ktv_music_order_song_btn.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'room_base_pendant.dart';

/// 房间功能型挂件
class RoomFunctionPendant extends RoomBasePendant {
  const RoomFunctionPendant({
    super.key,
    required super.room,
    required super.controller,
    required super.wrapListener,
    required super.tickNotifier,
  });

  @override
  State<RoomBasePendant> createState() => _RoomFunctionPendantState();
}

class _RoomFunctionPendantState extends RoomBasePendantState {
  /// 是否显示荣耀时刻
  bool _isHonorTimeShow = false;

  @override
  List<PendantItem> buildPendantList() {
    List<PendantItem> list = [];
    if (widget.room.fansGroup != null && widget.room.fansGroup!.groupId! <= 0) {
      // 加入粉丝团
      list.add(PendantItem(
        joinFansKey,
        JoinFanGroupWidget(group: widget.room.fansGroup!, refer: widget.room.refer ?? ''),
      ));
    }
    // if (_isHonorTimeShow) {
    //   // 荣耀时刻
    //   IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    //   var data = widget.room.generalSetting!.data.gloryRank;
    //   Widget? honorTime = rankManager.getRankHoursEntrance(
    //       widget.room.rid,
    //       {
    //         'showAt': TimeUtil.nowDayTime(minute: data.showAt),
    //         'hideAt': TimeUtil.nowDayTime(minute: data.hideAt + 24 * 60), // hideAt为后一天的分钟,需要加一天
    //         'countStart': TimeUtil.nowHourTime(minute: data.countStart),
    //         'countEnd': TimeUtil.nowHourTime(minute: data.countEnd),
    //       },
    //       widget.tickNotifier);
    //   if (honorTime != null) {
    //     list.add(PendantItem(honorTimeKey, honorTime));
    //   }
    // }
    if (widget.room.isKtvRoom) {
      // 点唱按钮
      list.add(PendantItem(
        ktvOrderKey,
        KtvMusicOrderSongBtn(room: widget.room),
      ));
    }
    return list;
  }

  @override
  void onTick() {
    if (_isHonorTimeShow != _canShowHonorTime) {
      _isHonorTimeShow = !_isHonorTimeShow;
      refresh();
    }
  }

  /// 能否显示荣耀时刻
  bool get _canShowHonorTime {
    var data = widget.room.generalSetting?.data.gloryRank;
    if (data == null) return false;
    DateTime now = DateTime.now();
    // hideAt为后一天的分钟,需要加一天
    return data.show &&
        now.isAfter(TimeUtil.nowDayTime(minute: data.showAt)) &&
        now.isBefore(TimeUtil.nowDayTime(minute: data.hideAt + 24 * 60));
  }
}
