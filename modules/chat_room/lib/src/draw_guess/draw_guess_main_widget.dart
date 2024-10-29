import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 画猜竞猜模式主界面
///
class DrawGuessMainWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback onSettingClick;

  const DrawGuessMainWidget(this.room, this.onSettingClick, {Key? key})
      : super(key: key);

  @override
  State<DrawGuessMainWidget> createState() => _DrawGuessMainWidgetState();
}

class _DrawGuessMainWidgetState extends State<DrawGuessMainWidget>
    with
        RoomTemplateMixin<DrawGuessMainWidget>,
        RoomFloatingBannerMixin<DrawGuessMainWidget> {
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
    IDrawGuessManager drawGuessManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_DRAW_GUESS);
    return Column(children: [
      renderRoomHeader(widget.room, widget.onSettingClick),
      LeftTopRecruitWidget(
        room: widget.room,
        margin: const EdgeInsetsDirectional.only(start: 13, bottom: 10),
      ),
      drawGuessManager.getGuess(widget.room),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 4, 8),
        child: drawGuessManager.getGuessPlayerList(widget.room, true),
      ),
      renderMessageList(widget.room),
      renderController(widget.room),
    ]);
  }
}
