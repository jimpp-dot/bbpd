import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/birthday/room_usericon_name_widget.dart';
import 'package:flutter/material.dart';

class BirthdayRoomWidget extends StatefulWidget {
  final ChatRoomData room;

  const BirthdayRoomWidget({Key? key, required this.room}) : super(key: key);

  @override
  _BirthdayRoomWidgetState createState() => _BirthdayRoomWidgetState();
}

class _BirthdayRoomWidgetState extends State<BirthdayRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56),
        _buildBossRow(),
        const SizedBox(height: 20),
        _buildSecondRow(),
        const SizedBox(height: 20),
        _buildThirdRow(),
        const SizedBox(height: 8)
      ],
    );
  }

  Widget _buildBossRow() {
    const double size = 64.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserIconNameWidget(
          room: widget.room,
          item: widget.room.positions[7],
          size: size,
          boss: true,
        ),
        if (widget.room.config!.showExtraMic)
          UserIconNameWidget(
            room: widget.room,
            item: widget.room.positions.last,
            size: size,
            boss: true,
          ),
      ],
    );
  }

  Widget _buildSecondRow() {
    const double size = 60.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.room.positions.getRange(0, 3).map((item) {
        return UserIconNameWidget(
          room: widget.room,
          item: item,
          size: size,
        );
      }).toList(),
    );
  }

  Widget _buildThirdRow() {
    const double size = 60.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.room.positions.getRange(3, 7).map((item) {
        return UserIconNameWidget(
          room: widget.room,
          item: item,
          size: size,
        );
      }).toList(),
    );
  }
}
