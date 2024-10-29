import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'wolfv2/main/wolf_bottom_controller.dart';
import 'wolfv2/main/wolf_room.dart';
import 'wolfv2/main/wolf_top_header.dart';

class WolfRoomPage extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;
  final bool displayMessageList;

  const WolfRoomPage(
    this.room, {
    super.key,
    this.displayEmoteAtMic = true,
    this.displayMessageList = true,
  });

  @override
  State<WolfRoomPage> createState() => _WolfRoomPageState();
}

class _WolfRoomPageState extends State<WolfRoomPage>
    with
        RoomTemplateMixin<WolfRoomPage>,
        RoomSettingMixin<WolfRoomPage>,
        RoomFloatingBannerMixin<WolfRoomPage> {
  final IWereWolfManager wereWolfManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned.fill(
          child: wereWolfManager.getWolfBg(context),
        ),
        Positioned.fill(
          child: _buildColumn(),
        ),
        PositionedDirectional(
          end: 0,
          bottom: preMadeRecruitBottom,
          child: buildFloatingBanner(widget.room),
        ),
        ...renderExtra(context, widget.room),
      ],
    );
  }

  Widget _buildColumn() {
    return Column(
      children: [
        _buildTopHeader,
        LeftTopRecruitWidget(room: widget.room),
        WolfRoom(room: widget.room, displayEmote: widget.displayEmoteAtMic),
        if (widget.displayMessageList) renderMessageList(widget.room),
        WolfBottomController(room: widget.room),
      ],
    );
  }

  Widget get _buildTopHeader {
    return renderRoomHeader(
      widget.room,
      () => onSettingClick(widget.room),
      normalHeader: WolfTopHeader(
        room: widget.room,
        onSettingClick: () => onSettingClick(widget.room),
      ),
    );
  }
}
