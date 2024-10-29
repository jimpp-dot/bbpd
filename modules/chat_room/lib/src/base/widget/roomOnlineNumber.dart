import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

class RoomOnlineNumber extends StatefulWidget {
  final int num;

  const RoomOnlineNumber({super.key, required this.num});

  @override
  _RoomOnlineNumberState createState() => _RoomOnlineNumberState();
}

class _RoomOnlineNumberState extends State<RoomOnlineNumber> {
  int _onlineNum = 0;

  @override
  void initState() {
    super.initState();
    _onlineNum = widget.num;
    eventCenter.addListener(RoomConstant.Event_Online, _onOnlineChanged);
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.Event_Online, _onOnlineChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(RoomOnlineNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    _onlineNum = widget.num;
    setState(() {});
  }

  void _onOnlineChanged(String type, dynamic data) {
    if (data is int) {
      _onlineNum = data;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          R.img("room_online.svg",
              width: 24.0,
              height: 24.0,
              package: ComponentManager.MANAGER_BASE_ROOM),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 2.0),
            child: NumText(
              '$_onlineNum',
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  textBaseline: TextBaseline.ideographic),
            ),
          )
        ],
      ),
    );
  }
}
