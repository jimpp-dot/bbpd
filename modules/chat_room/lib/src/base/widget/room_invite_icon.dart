import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 房间邀请按钮
///
class RoomInviteIcon extends StatelessWidget {
  final double size;
  final double iconSize;
  final Color? iconColor;
  final Color? bgColor;
  final int rid;

  const RoomInviteIcon({
    super.key,
    required this.rid,
    this.size = 32,
    this.iconColor,
    this.bgColor,
    this.iconSize = 24,
  });

  _onInviteTaped(BuildContext context) {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, rid,
        tp: 1, needInApp: true, newShareInRoom: true, rid: rid);
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => _onInviteTaped(context),
        child: Container(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: bgColor,
          ),
          alignment: AlignmentDirectional.center,
          child: R.img(
            'ic_invite_w.svg',
            color: iconColor ?? Colors.white,
            width: iconSize,
            height: iconSize,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
      );
}
