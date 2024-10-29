import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 亲密互动消息列表顶部横幅
///
class IntimateNotifyWidget extends StatefulWidget {
  final ChatRoomData room;

  const IntimateNotifyWidget({super.key, required this.room});

  @override
  State<IntimateNotifyWidget> createState() => _IntimateNotifyWidgetState();
}

class _IntimateNotifyWidgetState extends State<IntimateNotifyWidget> {
  static const int _IDLE = 0;
  static const int _RECEIVE = 10;
  static const int _REFUND = 50;

  IGiftManager giftManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
  String? name;
  int? status;
  bool _hide = true;

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(RoomConstant.Event_Intimate_Interact_Task_Tip, handleMsg);
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.Event_Intimate_Interact_Task_Tip, handleMsg);
    super.dispose();
  }

  void handleMsg(String type, dynamic msg) {
    if (!mounted) return;
    if (msg is Map) {
      name = Util.notNullStr(msg['name']);
      status = Util.parseInt(msg['status']);
      _hide = Util.parseBool(msg['hide'], false);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!needShow) return const SizedBox.shrink();

    return giftManager.getIntimateInteractPublicScreenWidget(
        status ?? 0, name ?? '');
  }

  bool get needShow {
    if (_hide == true) {
      return false;
    }

    if (name == null || name!.isEmpty) {
      return false;
    }

    if (status == _IDLE || status == _RECEIVE || status == _REFUND) {
      return true;
    } else {
      return false;
    }
  }
}
