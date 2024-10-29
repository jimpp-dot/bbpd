import 'dart:typed_data';
import 'package:shared/shared.dart';
import '../../../chat_room.dart';
import 'package:flutter/material.dart';
import '../../base/widget/room_vap_overlay.dart';
import '../../protobuf/generated/business_wedding.pb.dart';
import 'wedding_business_model.dart';

class WeddingBusinessMsgHandler extends AbsRoomMsgHandler {
  WeddingBusinessMsgHandler(ChangeNotifier model, ChatRoomData room)
      : super(model, room);

  static const TAG = 'WeddingBusinessMsgHandler';

  @override
  void handleMsg(String name, dynamic data) {
    switch (name) {
      case RoomConstant.Event_Wedding_Business_Refresh:
        try {
          if (data is! Uint8List) return;
          Uint8List buffer = data;
          BusinessWeddingConfig pb = BusinessWeddingConfig.fromBuffer(buffer);

          int oldState = _model.value.wedding.state;
          _model.value.wedding.state = pb.wedding.state;
          _model.value.wedding.score = pb.wedding.score;

          if (oldState != pb.wedding.state) {
            showStateChangeVap(pb.wedding.state);
          }
          _model.notify();
        } catch (e) {
          Log.d('Event_Wedding_Business_Refresh error: $e');
        }
        break;

      default:
        break;
    }
  }

  /// 状态流转动效：0->1 opening/ 1->2
  void showStateChangeVap(int state) {
    String vapUrl = '';
    int vapSize = 0;
    if (state == 1) {
      /// 婚礼开幕
      vapUrl = _model.value.effect.opening.url;
      vapSize = _model.value.effect.opening.size;
    } else if (state == 2) {
      /// 交换戒指
      vapUrl = _model.value.effect.ringExchange.url;
      vapSize = _model.value.effect.ringExchange.size;
    } else if (state == 3) {
      /// 婚礼闭幕
      vapUrl = _model.value.effect.ending.url;
      vapSize = _model.value.effect.ending.size;
    }

    if (Util.validStr(vapUrl) && vapSize > 0) {
      RoomVapOverlay.show(
        context: System.context,
        vapUrl: vapUrl,
        vapSize: vapSize,
      );
    }
  }

  WeddingBusinessModel get _model => model as WeddingBusinessModel;

  @override
  List<String> get msgList => WeddingBusinessEvents.LIST;
}

class WeddingBusinessEvents {
  static const LIST = [RoomConstant.Event_Wedding_Business_Refresh];
}
