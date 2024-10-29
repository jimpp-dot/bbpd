import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../chat_room.dart';
import 'check_gs_onhook_state.dart';

class CheckGsOnHookController extends GetxController {
  final state = CheckGsOnHookState();

  /// 时间对象
  Timer? _timer;

  @override
  void onClose() {
    cancelCountDown();
    super.onClose();
  }

  /// 开始倒计时
  void startCountDown() {
    cancelCountDown();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countDown <= 0) {
        cancelCountDown();
        gsCheckingPopClick('end_countdown');
        Navigator.of(System.context).pop();
      } else {
        state.countDown--;
      }
      update(['count_down']);
    });
  }

  /// 取消倒计时
  void cancelCountDown() {
    _timer?.cancel();
    _timer = null;
  }

  /// 关闭事件
  void onCloseTapped() {
    gsCheckingPopClick('close');
    Navigator.of(System.context).pop();
  }

  /// 确认事件
  void onConfirmTapped() {
    gsCheckingPopClick('button');
    Navigator.of(System.context).pop();
  }

  /// 数据解析
  void fromJson(Map<String, dynamic> data) {
    state.title = data['title'];
    state.content = data['content'];
    state.buttonText = data['button_text'];
    int countdown = Util.parseInt(data['countdown']);
    state.countDown = countdown;
    state.isShowCountDown = countdown > 0;
    if (countdown > 0) {
      startCountDown();
    }
    update(['text', 'count_down']);
  }

  /// gs考勤弹窗曝光
  void gsCheckingPopExposure() {
    Map<String, dynamic> properties = {};
    if (ChatRoomData.exists()) {
      properties['scene_type'] = 'party';
      properties['rid'] = Util.parseInt(ChatRoomData.getInstance()?.rid);
      RoomPosition? position = ChatRoomUtil.getPositionByUid(Session.uid);
      if (position != null) {
        properties['mic_Sequence_Number'] = Util.parseInt(position.position);
      }
    } else {
      properties['scene_type'] = getCurrentTabName();
    }
    Tracker.instance.track(
      TrackEvent.gs_checking_pop_exposure,
      properties: properties,
    );
  }

  /// gs考勤弹窗点击
  void gsCheckingPopClick(String clickType) {
    Map<String, dynamic> properties = {'checking_click_type': clickType};
    if (ChatRoomData.exists()) {
      properties['scene_type'] = 'party';
      properties['rid'] = Util.parseInt(ChatRoomData.getInstance()?.rid);
      RoomPosition? position = ChatRoomUtil.getPositionByUid(Session.uid);
      if (position != null) {
        properties['mic_Sequence_Number'] = Util.parseInt(position.position);
      }
    } else {
      properties['scene_type'] = getCurrentTabName();
    }
    Tracker.instance.track(
      TrackEvent.gs_checking_pop_click,
      properties: properties,
    );
  }

  String getCurrentTabName() {
    int appBootTabIndex = appNavigatorObserver.appBootTabIndex;
    String tabName = '';
    if (appBootTabIndex == 0) {
      tabName = 'home';
    } else if (appBootTabIndex == 1) {
      tabName = 'dynamic';
    } else if (appBootTabIndex == 2) {
      tabName = 'message';
    } else if (appBootTabIndex == 3) {
      tabName = 'profile';
    }
    return tabName;
  }
}
