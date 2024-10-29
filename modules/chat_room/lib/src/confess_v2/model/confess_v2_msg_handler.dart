import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_data.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_view_model.dart';
import 'package:flutter/cupertino.dart';

class ConfessV2MsgHandler extends AbsRoomMsgHandler {
  /// 表白消息触发 - IM消息
  static const String _confessNotice = 'confess.result.notice';

  ConfessV2MsgHandler(ChangeNotifier model, ChatRoomData room)
      : super(model, room) {
    _registerMsg();
  }

  void _registerMsg() {
    eventCenter.addListeners([EventConstant.WebsocketEventMessage], _handImMsg);
  }

  void _unregisterMsg() {
    eventCenter
        .removeListeners([EventConstant.WebsocketEventMessage], _handImMsg);
  }

  @override
  void handleMsg(String name, Object? data) {}

  void _handImMsg(String name, Object? dataObj) {
    if (dataObj is! Map) return;
    Map data = dataObj;
    String action = data['name'];
    if (action != _confessNotice || data['data'] is! Map) return;
    data = data['data'];
    Map<String, dynamic> json = data as Map<String, dynamic>;
    ConfessV2ViewModel viewModel = model as ConfessV2ViewModel;

    viewModel.sendGiftViewModel
        .onConfessV2IMEvent(ConfessV2EventTouchData.fromJson(json));
  }

  @override
  List<String> get msgList => [];

  @override
  void dispose() {
    super.dispose();
    _unregisterMsg();
  }
}
