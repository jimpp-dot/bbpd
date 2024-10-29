import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

///操作选中目标的头像视图
class WolfFullTurnUserWidget extends StatelessWidget {
  final RoomPosition roomPosition;
  final double maxWidth;

  const WolfFullTurnUserWidget({
    super.key,
    required this.roomPosition,
    this.maxWidth = 84,
  });

  Widget _buildUserIcon(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: CommonAvatar(
        path: roomPosition.icon,
        shape: BoxShape.circle,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 3.0,
        ),
        SizedBox(
          width: 44.0,
          height: 44.0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              _buildUserIcon(44.0),
              PositionedDirectional(
                start: -3.0,
                end: -3.0,
                top: -3.0,
                bottom: -3.0,
                child: R.img(
                  'wolfv2/wolf_select_target_user_icon_border.webp',
                  width: 50.0,
                  height: 50.0,
                  package: ComponentManager.MANAGER_WERE_WOLF,
                ),
              ),
              PositionedDirectional(
                start: -9.0,
                bottom: -2.0,
                child: Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        R.imagePath('wolfv2/user_icon/wolf_position_bg.webp',
                            package: ComponentManager.MANAGER_WERE_WOLF),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${roomPosition.position + 1}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.center,
          width: maxWidth,
          child: Text(
            roomPosition.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
