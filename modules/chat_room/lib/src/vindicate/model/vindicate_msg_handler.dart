import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/model/vindicate_view_model.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

class VindicateMsgHandler extends AbsRoomMsgHandler {
  VindicateMsgHandler(ChangeNotifier model, ChatRoomData room)
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
  void handleMsg(String name, dynamic data) {
    // TODO: implement handleMsg
  }

  /// TODO: 添加横幅(全局飘屏)事件， 组件[GlobalRoomMessage]
  void _handImMsg(String name, Object? dataObj) {
    if (dataObj is! Map) return;
    Map data = dataObj;
    String action = data['name'];
    if (action != VindicateMsg.confessNotice || data['data'] is! Map) return;
    data = data['data'];
    Map<String, dynamic> json = data as Map<String, dynamic>;
    VindicateViewModel viewModel = model as VindicateViewModel;

    viewModel.sendGiftViewModel
        .onVindicateIMEvent(VindicateEventTouchData.fromJson(json));
  }

  @override
  // TODO: implement msgList
  List<String> get msgList => [];

  @override
  void dispose() {
    super.dispose();

    _unregisterMsg();
  }
}

class VindicateMsg {
  /// 表白消息触发 - IM消息
  static String get confessNotice => 'confess.result.notice';
}
