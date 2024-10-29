import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideData.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_notice_message_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_state_widget_builder.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_user_icon.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideCenterMiddleWidget extends StatefulWidget {
  const WolfGuideCenterMiddleWidget({super.key});

  @override
  State createState() {
    return WolfGuideCenterMiddleWidgetState();
  }
}

class WolfGuideCenterMiddleWidgetState
    extends State<WolfGuideCenterMiddleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);
    return _buildBody(context, wolfModel);
  }

  Widget _buildColumn(
      WolfGuideIconStyle style, int itemCount, WolfModel wolfModel) {
    List<Widget> userIcons = [];
    userIcons = WolfGuideData.getInstance()
        .positions!
        .skip(style == WolfGuideIconStyle.left ? 0 : itemCount)
        .take(itemCount)
        .map((RoomPosition item) => WolfGuideUserIcon(
              roomPosition: item,
              style: style,
              speakers: wolfModel.data.speakers,
            ))
        .toList(growable: true);

    int emptyCount = itemCount - userIcons.length;
    for (int i = 0; i < emptyCount; i++) {
      RoomPosition roomPosition = RoomPosition(
        uid: -1,
        position: style == WolfGuideIconStyle.left ? i : itemCount + i,
      );
      userIcons.add(WolfGuideUserIcon(
        roomPosition: roomPosition,
        style: style,
        speakers: wolfModel.data.speakers,
      ));
    }

    List<Widget> widgets = [];
    for (int i = 0; i < userIcons.length; i++) {
      widgets.add(userIcons[i]);
      if (i != userIcons.length - 1) {
        widgets.add(SizedBox(height: WolfOpUtil.spaceHeight));
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
    children.add(_buildColumn(WolfGuideIconStyle.left, itemCount, wolfModel));

    //中间状态信息
    children.add(const Spacer());

    //右侧麦位
    children.add(_buildColumn(WolfGuideIconStyle.right, itemCount, wolfModel));

    double height = WolfOpUtil.itemHeight * itemCount +
        WolfOpUtil.spaceHeight * (itemCount - 1) +
        6.0;
    WolfGuideConfigState? state = WolfGuideData.getInstance().currentState;
    double messageHeight;
    if (state == WolfGuideConfigState.Wait) {
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
                        (WolfGuideUserIcon.left +
                            WolfGuideUserIcon.iconSize +
                            WolfGuideUserIcon.right),
                height: messageHeight,
                child: WolfGuideNoticeMessageWidget(wolfModel: wolfModel),
              ),
            ),
            PositionedDirectional(
              top: 6,
              child: SizedBox(
                width: Util.width -
                    2 *
                        (WolfGuideUserIcon.left +
                            WolfGuideUserIcon.iconSize +
                            WolfGuideUserIcon.right),
                height: WolfOpUtil.itemHeight * itemCount +
                    WolfOpUtil.spaceHeight * (itemCount - 1),
                child: WolfGuideStateWidgetBuilder.build(context, wolfModel),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
