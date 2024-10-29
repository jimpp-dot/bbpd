import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

///操作选中目标的头像视图
class WolfSelectTargetUserWidget extends StatelessWidget {
  final RoomPosition roomPosition;
  final int opFlag; //0默认 1毒药 2解药

  const WolfSelectTargetUserWidget({
    super.key,
    required this.roomPosition,
    this.opFlag = 0,
  });

  Widget _buildUserIcon(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(width: 1.0, color: Color(0xFF9F7250)))),
      clipBehavior: Clip.hardEdge,
      child: CommonAvatar(
        path: roomPosition.icon,
        shape: BoxShape.circle,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _buildUserIcon(64.0),
        R.img(
          'wolfv2/wolf_select_target_user_icon_border.webp',
          width: 64.0,
          height: 64.0,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
        PositionedDirectional(
          start: 2.0,
          bottom: -1.0,
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  R.imagePath('wolfv2/wolf_select_target_position_bg.webp',
                      package: ComponentManager.MANAGER_WERE_WOLF),
                ),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '${roomPosition.position + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        if (opFlag == 1 || opFlag == 2)
          PositionedDirectional(
            end: -4.0,
            bottom: -2.0,
            child: R.img(
              opFlag == 1
                  ? 'wolfv2/wolf_select_target_poison.webp'
                  : 'wolfv2/wolf_select_target_antidote.webp',
              width: 24.0,
              height: 36.0,
              package: ComponentManager.MANAGER_WERE_WOLF,
            ),
          ),
      ],
    );
  }
}
