import 'dart:math';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import '../../chatRoomData.dart';
import '../../protobuf/generated/drainage.pb.dart';
import '../model/roomConstant.dart';
import '../widget/common_message_list/multi_tab_msg_repo.dart';
import '../widget/common_message_list/room_invite_guide.dart';

/// 大小房相关数据
mixin DrainageData on Events {
  /// 关联房间公屏，房间可以多Tab展示关联房间的公屏
  DrainagePreviewData? drainagePreviewData;

  /// 大小房：房间邀请/返回大房引导
  List<RoomInviteGuideData> roomInviteGuideData = [];

  /// 获取房间公屏Tab/小房入口信息
  void getDrainagePreviewData(int rid) async {
    drainagePreviewData = await MultiTabMsgRepo.getRoomMsgTab(rid);
    if (Util.validList(drainagePreviewData?.drainageRoom)) {
      emit(RoomConstant.Event_Message_Tab_Change);
    }

    checkDrainageData();
  }

  /// 房间公屏Tab刷新
  void onEventDrainageRefresh(Uint8List value) {
    try {
      drainagePreviewData = DrainagePreviewData.fromBuffer(value);
      emit(RoomConstant.Event_Message_Tab_Change);

      checkDrainageData();
    } catch (e) {
      Log.d('_onEventDrainageRefresh, error: $e');
    }
  }

  /// 大小房入口，新增或关闭，
  /// 由于在收到这个socket时，客户端没有办法判断自己是否要展示右下角的房间入口，没有办法直接去add/remove roomInviteGuideData
  /// 所以改为，客户端做一定延迟错峰拉取
  void onEventDrainageEvent(Uint8List value) {
    try {
      RoomDrainageEventData data = RoomDrainageEventData.fromBuffer(value);
      int maxDelay = data.refreshInterval * 1000;
      if (maxDelay <= 0) {
        /// max最小1000ms
        maxDelay = 1000;
      }
      int delay = 500 + Random().nextInt(maxDelay - 500);

      Future.delayed(Duration(milliseconds: delay), () {
        if (ChatRoomData.getInstance() != null) {
          getDrainagePreviewData(ChatRoomData.getInstance()!.realRid);
        }
      });
    } catch (e) {
      Log.d('onEventDrainageEvent, error: $e');
    }
  }

  void checkDrainageData() {
    roomInviteGuideData.clear();
    if (Util.validStr(drainagePreviewData?.masterRoom.masterIcon) &&
        Util.parseInt(drainagePreviewData?.masterRoom.masterRid) > 0) {
      /// 在小房间，展示【返回主房】
      bool already = roomInviteGuideData.any((element) =>
          element.relateRoom.rid ==
          Util.parseInt(drainagePreviewData?.masterRoom.masterRid));
      if (!already) {
        roomInviteGuideData.add(RoomInviteGuideData(
          isMaterRoom: true,
          relateRoom: RoomDrainageLocking(
            rid: Util.parseInt(drainagePreviewData?.masterRoom.masterRid),
            name: '',
            icon: drainagePreviewData?.masterRoom.masterIcon,
          ),
        ));
      }
    } else {
      if (Util.validList(drainagePreviewData?.locking)) {
        for (RoomDrainageLocking item in drainagePreviewData!.locking) {
          roomInviteGuideData.add(RoomInviteGuideData(
            isMaterRoom: false,
            relateRoom: item,
          ));
        }
      }
    }

    emit(RoomConstant.Event_Invite_Guide_Change);
  }
}
