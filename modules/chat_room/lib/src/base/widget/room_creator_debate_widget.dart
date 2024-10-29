import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

import 'room_role_widget.dart';

class RoomCreatorDebateWidget extends StatefulWidget {
  final ChatRoomData room;

  const RoomCreatorDebateWidget({super.key, required this.room});

  @override
  RoomCreatorDebateState createState() => RoomCreatorDebateState();
}

class RoomCreatorDebateState extends State<RoomCreatorDebateWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RoomPosition getUser() {
    return (widget.room.isEightPosition)
        ? RoomPosition.fromCreator(widget.room.createor!)
        : Util.isCollectionEmpty(widget.room.positions)
            ? RoomPosition(uid: 0)
            : widget.room.positions[0];
  }

  Widget _renderCreator(BuildContext context) {
    RoomPosition user = getUser();
    RoomUserRole? userRole;
    if ((widget.room.config?.reception ?? false) && user.uid > 0) {
      userRole = RoomUserRole.Reception;
    }
    if (widget.room.isEightPosition) {
      if (user.uid > 0) {
        userRole = RoomUserRole.Owner;
      }
    }

    return UserIcon(
      room: widget.room,
      position: user,
      size: IconSize.small,
      role: userRole != null ? RoomRoleWidget.getRoleName(userRole) : '',
      showPosition: true,
      border: const BorderSide(color: Colors.white, width: 0.5),
      whiteIcon: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderCreator(context);
  }
}
