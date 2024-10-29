import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_notice_message_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_state_widget_builder.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';

///狼人12人游戏中间
class WolfCenterMiddleWidget extends StatefulWidget {
  final ChatRoomData room;
  final Map<int, bool> speakers;
  final bool displayEmote;

  const WolfCenterMiddleWidget(
      {super.key,
      required this.speakers,
      required this.room,
      required this.displayEmote});

  @override
  State createState() {
    return WolfCenterMiddleState();
  }
}

class WolfCenterMiddleState extends State<WolfCenterMiddleWidget> {
  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);
    return _buildBody(context, wolfModel);
  }

  Widget _buildColumn(WolfIconStyle style, int itemCount, WolfModel wolfModel) {
    List<Widget> userIcons = [];
    userIcons = widget.room.positions
        .skip(style == WolfIconStyle.left ? 0 : itemCount)
        .take(itemCount)
        .map((RoomPosition item) => WolfUserIcon(
              room: widget.room,
              roomPosition: item,
              style: style,
              displayEmote: widget.displayEmote,
              speakers: widget.speakers,
              wolfModel: wolfModel,
            ))
        .toList(growable: true);

    int emptyCount = itemCount - userIcons.length;
    for (int i = 0; i < emptyCount; i++) {
      RoomPosition roomPosition = RoomPosition(
        uid: -1,
        position: style == WolfIconStyle.left ? i : itemCount + i,
      );
      userIcons.add(WolfUserIcon(
        room: widget.room,
        roomPosition: roomPosition,
        style: style,
        displayEmote: widget.displayEmote,
        speakers: widget.speakers,
        wolfModel: wolfModel,
      ));
    }

    List<Widget> widgets = [];
    for (int i = 0; i < userIcons.length; i++) {
      widgets.add(userIcons[i]);
      if (i != userIcons.length - 1) {
        widgets.add(SizedBox(
          height: WolfOpUtil.spaceHeight,
        ));
      }
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  Widget _buildBody(BuildContext context, WolfModel wolfModel) {
    List<Widget> children = [];

    int itemCount = WolfOpUtil.sideCount;

    //左侧麦位
    children.add(_buildColumn(WolfIconStyle.left, itemCount, wolfModel));

    //中间状态信息
    children.add(const Spacer());

    //右侧麦位
    children.add(_buildColumn(WolfIconStyle.right, itemCount, wolfModel));

    double height = WolfOpUtil.itemHeight * itemCount +
        WolfOpUtil.spaceHeight * (itemCount - 1) +
        6.0;
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    double messageHeight;
    if (wolfConfigData?.state == WolfState.Wait) {
      messageHeight = wolfModel.messageHight;
    } else {
      messageHeight = WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
          WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1);
    }
    return SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
            PositionedDirectional(
              top: 6,
              child: SizedBox(
                width: Util.width -
                    2 *
                        (WolfUserIcon.left +
                            WolfUserIcon.iconSize +
                            WolfUserIcon.right),
                height: messageHeight,
                child: WolfNoticeMessageWidget(room: wolfModel.room),
              ),
            ),
            PositionedDirectional(
              top: 6,
              child: SizedBox(
                width: Util.width -
                    2 *
                        (WolfUserIcon.left +
                            WolfUserIcon.iconSize +
                            WolfUserIcon.right),
                height: WolfOpUtil.itemHeight * itemCount +
                    WolfOpUtil.spaceHeight * (itemCount - 1),
                child: WolfStateWidgetBuilder.build(context, wolfModel.room),
              ),
            ),
          ],
        ));
  }
}
