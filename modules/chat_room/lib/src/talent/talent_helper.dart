import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

import 'data/talent_main_view_model.dart';
import 'data/talent_models.dart';

String get keyLastSendMsgTime => 'room.talent.lastSendMsgTime${Session.uid}';

class TalentHelper {
  /// 拥有可编辑和添加列表权限的人
  static bool hasEditPermission(ChatRoomData? room) {
    if (room == null) return false;
    return room.createor?.uid == Session.uid;
  }

  static bool isCreateOrPerformer(ChatRoomData? room) {
    if (room == null) return false;
    // 直播才艺厅正在表演者可以抱人上麦
    int? currentPerformerUid =
        Util.getListElementSafely(room.positions, 0)?.uid;
    return room.createor?.uid == Session.uid ||
        currentPerformerUid == Session.uid;
  }

  static void recordSendMsgTime() {
    DateTime now = DateTime.now();
    Config.set(keyLastSendMsgTime, '${now.millisecondsSinceEpoch}');
  }

  static bool ifCanSendMsg() {
    int? intervalSeconds = TalentMainViewModel.chatMsgInterVal;
    if (intervalSeconds == null) {
      return false;
    }
    int lastSendTime = Config.getInt(keyLastSendMsgTime, 0);
    DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(lastSendTime);
    DateTime now = DateTime.now();
    return now.difference(lastTime).inSeconds.abs() >= intervalSeconds;
  }

  /// 返回高斯模糊的
  static Widget blurDialogWidget({required Widget child, double? height}) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height ?? Util.height * 0.84,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12.dp),
              topEnd: Radius.circular(12.dp),
            ),
            color: const Color(0xFF171621).withOpacity(0.8),
          ),
          child: child,
        ),
      ),
    );
  }

  /// 校验当前是否可以投票
  /// return true,可以，false不可以
  static bool verifyVote(ChatRoomData room, BroadcasterInfo? info,
      {bool noToast = false}) {
    if (info == null) {
      if (!noToast) {
        Fluttertoast.showCenter(msg: K.room_talent_no_performer);
      }
      return false;
    }

    RoomPosition? firstPos;
    try {
      firstPos = room.positions.first;
    } catch (e) {
      Log.d(e);
    }
    if (firstPos == null || firstPos.uid <= 0) {
      if (!noToast) {
        Fluttertoast.showCenter(msg: K.room_talent_no_performer);
      }
      return false;
    }

    if (firstPos.uid != info.currentAnchor?.uid) {
      if (!noToast) {
        Fluttertoast.showCenter(msg: K.room_talent_no_performer);
      }
      return false;
    }
    return true;
  }
}
