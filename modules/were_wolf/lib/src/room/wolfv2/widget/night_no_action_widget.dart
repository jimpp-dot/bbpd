import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

///
/// todo
///
class NightNoActionWidget extends StatefulWidget {
  final ChatRoomData room;

  const NightNoActionWidget({super.key, required this.room});

  @override
  _NightNoActionWidgetState createState() => _NightNoActionWidgetState();
}

class _NightNoActionWidgetState extends State<NightNoActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
