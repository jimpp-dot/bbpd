// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/hat_play_data.dart';

/// 抢帽子插件，麦上帽子
class HatPlayPlugin extends UserIconPlugin {
  GrabHatPushData? _data;

  @override
  bool get effect => true;

  @override
  String get name => UserIconPlugin.hatPlay;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener(RoomConstant.Event_Room_Grab_Hat, _onReceiveMsg);
  }

  @override
  void onDispose() {
    room.removeListener(RoomConstant.Event_Room_Grab_Hat, _onReceiveMsg);
    super.onDispose();
  }

  _onReceiveMsg(String type, data) {
    try {
      _data = data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _data = null;
    }
    refreshUI();
  }

  @override
  List<Widget> buildWidgets() {
    double hatSize = size * 1.3;
    List<Widget> res = <Widget>[];

    if (_data == null ||
        _data!.state == 0 ||
        _data!.hat.uid != roomPosition.uid) return res;

    if (_data!.hat.hatEffect.isNotEmpty) {
      res.add(PositionedDirectional(
        top: -(hatSize - size) / 2,
        start: -(hatSize - size) / 2,
        child: IgnorePointer(
          child: CachedNetworkImage(
            imageUrl: _data!.hat.hatEffect,
            width: hatSize,
            height: hatSize,
          ),
        ),
      ));
    } else {
      res.add(PositionedDirectional(
        top: -(hatSize - size) / 2,
        start: -(hatSize - size) / 2,
        child: IgnorePointer(
          child: CachedNetworkImage(
            imageUrl: _data!.hat.hat,
            width: hatSize,
            height: hatSize,
          ),
        ),
      ));
    }

    return res;
  }
}
