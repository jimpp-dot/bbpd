import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../base/widget/off_mic_user_list.dart';
import 'dating_user_mic_area.dart';

/// 约会吧 主界面
///
class DatingRoomPage extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback onSettingClick;
  const DatingRoomPage(this.room, this.onSettingClick, {super.key});

  @override
  State<DatingRoomPage> createState() => _DatingRoomPageState();
}

class _DatingRoomPageState extends State<DatingRoomPage>
    with
        RoomTemplateMixin<DatingRoomPage>,
        RoomFloatingBannerMixin<DatingRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        renderBg(context, widget.room),
        Positioned.fill(
          top: 0.0,
          bottom: Util.iphoneXBottom,
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
        renderRoomHeader(widget.room, widget.onSettingClick),
        const SizedBox(height: 12),
        DatingUserMicArea(widget.room),
        const SizedBox(height: 4),
        OffMicUserList(room: widget.room),
        renderMessageList(widget.room),
        renderController(widget.room),
      ],
    );
  }
}
