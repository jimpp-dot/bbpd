import 'package:chat_room/src/cplink/widget/cplink_v2_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';

class CpLinkV2Widget extends StatelessWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const CpLinkV2Widget(
      {Key? key, required this.room, required this.displayEmote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (room.config == null ||
        room.config?.types != RoomTypes.CpLink ||
        room.config?.configExpendData is! CpLinkConfigData) {
      return const SizedBox();
    }
    return CpLinkV2StartWidget(
        circleSize: 228, room: room, displayEmote: displayEmote);
  }
}
