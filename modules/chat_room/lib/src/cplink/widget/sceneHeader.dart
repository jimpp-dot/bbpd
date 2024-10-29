import 'package:flutter/material.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

class SceneHeader extends StatelessWidget {
  final ChatRoomData chatRoomData;

  const SceneHeader({Key? key, required this.chatRoomData}) : super(key: key);

  Widget _buildTitle() {
    return Text(
      chatRoomData.config?.name ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.0,
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              child: Align(alignment: Alignment.center, child: _buildTitle())),
          PositionedDirectional(
            top: 0,
            bottom: 0,
            end: 16,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 36.0,
                  alignment: Alignment.center,
                  child: R.img("ic_close_translucent.svg",
                      width: 24.0,
                      height: 24.0,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
