import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'cross_pk_main_widget.dart';

/// laya塔防
class LayaCrossPkTower extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback onSettingClick;

  const LayaCrossPkTower(
      {Key? key, required this.room, required this.onSettingClick})
      : super(key: key);

  @override
  LayaCrossPkTowerState createState() {
    return LayaCrossPkTowerState();
  }
}

class LayaCrossPkTowerState extends State<LayaCrossPkTower>
    with RoomTemplateMixin<LayaCrossPkTower> {
  final IBASEGameRoomManager baseGameRoomManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_WEBGAME_ROOM);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned.fill(
          child: baseGameRoomManager.buildRoomGamePage(
            gameType: 'cocos-tower-pk',
            showLoadingPage: true,
            showLoadingCloseBtn: false,
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: 0.0,
          height: Util.height - Util.iphoneXBottom,
          child: _buildMain(),
        ),
        // 因为麦位由laya展示，礼物播放也走laya回调
        ...renderExtra(context, widget.room, showGift: false),
      ],
    );
  }

  Widget _buildMain() {
    return Column(
      children: [
        renderRoomHeader(widget.room, widget.onSettingClick),
        CrossPKMainWidget(room: widget.room),
        const Spacer(),
        renderController(widget.room)
      ],
    );
  }
}
