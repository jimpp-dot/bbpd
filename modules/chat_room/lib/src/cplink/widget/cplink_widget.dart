import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/widget/cplink_start_widget.dart';

class CpLinkWidget extends StatelessWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const CpLinkWidget({Key? key, required this.room, required this.displayEmote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (room.config == null ||
        room.config?.types != RoomTypes.CpLink ||
        room.config?.configExpendData is! CpLinkConfigData) {
      return const SizedBox();
    }
    return CpLinkStartWidget(
      circleSize: 228,
      room: room,
      displayEmote: displayEmote,
    );
  }
}
