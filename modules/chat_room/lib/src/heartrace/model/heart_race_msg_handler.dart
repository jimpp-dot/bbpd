import 'dart:typed_data';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../chat_room.dart';
import '../../base/widget/room_vap_overlay.dart';
import '../widget/heart_race_team_result.dart';
import 'heart_race_model.dart';
import '../../protobuf/generated/common_room_heartrace.pb.dart';

class HeartRaceMsgHandler extends AbsRoomMsgHandler {
  HeartRaceMsgHandler(ChangeNotifier model, ChatRoomData room)
      : super(model, room);

  static const TAG = 'HeartRaceMsgHandler';

  @override
  void handleMsg(String name, dynamic data) async {
    switch (name) {
      case RoomConstant.Event_Heart_Race_Refresh:
        try {
          if (data is! Uint8List) return;
          Uint8List buffer = data;
          HeartRaceConfig pb = HeartRaceConfig.fromBuffer(buffer);

          String oldState = _model.value.state;
          bool oldHasHat = _model.value.hasHat;
          MicPair? oldTopPair = Util.validList(_model.value.micPair)
              ? _model.value.micPair[0]
              : null;

          if (pb.hasState()) {
            _model.value.state = pb.state;
          }
          if (pb.hasStateDeadline()) {
            _model.value.stateDeadline = pb.stateDeadline;
          }
          if (Util.validList(pb.micPair)) {
            _model.value.micPair.clear();
            for (var pair in pb.micPair) {
              _model.value.micPair.add(pair);
            }
          }
          if (pb.hasLevel()) {
            _model.value.level = pb.level;
          }
          if (pb.hasIsLockSec()) {
            _model.value.isLockSec = pb.isLockSec;
          }
          if (pb.hasAwardConfig()) {
            _model.value.awardConfig = pb.awardConfig;
          }
          if (pb.hasHasHat()) {
            _model.value.hasHat = pb.hasHat;
          }

          if (oldState == 'wait' && pb.state == 'pk') {
            /// 弹组队成功弹窗
            HeartRaceTeamResult.show(_model.value.micPair);
          } else if (oldState == 'pk' &&
              pb.state == 'pk_result' &&
              Util.validStr(pb.vapUrl) &&
              Util.parseInt(pb.vapSize) > 0) {
            /// 展示胜利动效
            if (Util.validList(_model.value.micPair)) {
              MicPair top = _model.value.micPair[0];
              List<String> imgList = [
                getRemote375ImgUrl(top.left.icon),
                getRemote375ImgUrl(top.right.icon)
              ];
              String leftFrame = _model.value.hasHat == true
                  ? Util.getRemoteImgUrl(top.left.sex == 2
                      ? 'static/room/heart_race/heart_rate_frame_female.webp'
                      : 'static/room/heart_race/heart_rate_frame_male.webp')
                  : '';
              if (Util.validStr(leftFrame)) {
                imgList.add(leftFrame);
              }
              String rightFrame = _model.value.hasHat == true
                  ? Util.getRemoteImgUrl(top.right.sex == 2
                      ? 'static/room/heart_race/heart_rate_frame_female.webp'
                      : 'static/room/heart_race/heart_rate_frame_male.webp')
                  : '';
              if (Util.validStr(rightFrame)) {
                imgList.add(rightFrame);
              }
              RoomVapOverlay.show(
                  context: System.context,
                  vapUrl: Util.getRemoteImgUrl(pb.vapUrl),
                  vapSize: pb.vapSize,
                  textList: [top.left.name, top.right.name, '${top.package}'],
                  imageList: imgList,
                  onComplete: () {
                    _model.showLockAni = true;
                    _model.notify();
                  });
            }
          }

          bool newHasHat = _model.value.hasHat;
          MicPair? newTopPair = Util.validList(_model.value.micPair)
              ? _model.value.micPair[0]
              : null;
          checkTopChange(oldHasHat, newHasHat, oldTopPair, newTopPair);

          _model.notify();
        } catch (e) {
          Log.d('Event_Mom_Refresh error: $e');
        }
        break;

      default:
        break;
    }
  }

  /// 第一组人员变动/帽子变化，需要展示横幅
  void checkTopChange(bool oldHasHat, bool newHasHat, MicPair? oldTopMicPair,
      MicPair? newTopMicPair) {
    if (oldHasHat == false && newHasHat == true) {
      /// 从没有帽子到有帽子，第一组两者都要展示横幅
      if (newTopMicPair != null) {
        if (Util.parseInt(newTopMicPair.left.uid) > 0) {
          showTopChange(newTopMicPair.left);
        }
        if (Util.parseInt(newTopMicPair.right.uid) > 0) {
          showTopChange(newTopMicPair.right);
        }
      }
    } else if (newHasHat == true) {
      /// 在一直有帽子的情况下，判断第一组的人员变化，变化的人需要展示横幅
      int newLeftUid = Util.parseInt(newTopMicPair?.left.uid);
      int newRightUid = Util.parseInt(newTopMicPair?.right.uid);
      int oldLeftUid = Util.parseInt(oldTopMicPair?.left.uid);
      int oldRightUid = Util.parseInt(oldTopMicPair?.right.uid);
      if (newLeftUid > 0 &&
          newLeftUid != oldLeftUid &&
          newLeftUid != oldRightUid) {
        showTopChange(newTopMicPair?.left);
      }
      if (newRightUid > 0 &&
          newRightUid != oldLeftUid &&
          newRightUid != oldRightUid) {
        showTopChange(newTopMicPair?.right);
      }
    }
  }

  void showTopChange(MicItem? item) {
    if (item == null) return;
    _model.room?.emit(RoomConstant.Event_Heart_Race_Top_Change,
        {'icon': item.icon, 'isMale': item.sex == 1, 'name': item.name});
  }

  HeartRaceModel get _model => model as HeartRaceModel;

  @override
  List<String> get msgList => MysteryEvents.LIST;

  String getRemote375ImgUrl(String icon) {
    if (icon.isEmpty) {
      return icon;
    }
    String url = icon;
    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    if (!url.contains(RegExp(r'!head(\d+)'))) {
      url = '$url!head375';
    }
    return url;
  }
}

class MysteryEvents {
  /// 心跳竞速需要监听的socket
  static const LIST = [RoomConstant.Event_Heart_Race_Refresh];
}
