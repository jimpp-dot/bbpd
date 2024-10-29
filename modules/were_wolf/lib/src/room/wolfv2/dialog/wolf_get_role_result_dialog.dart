import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import '../../../../k.dart';

class WolfGetRoleResultDialog extends StatelessWidget {
  final RoleResultItem roleItem;
  final ChatRoomData room;

  const WolfGetRoleResultDialog(
      {super.key, required this.roleItem, required this.room});

  TextStyle get textStyle {
    return TextStyle(
        fontSize: 15,
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.w600);
  }

  static show(BuildContext context,
      {Key? key,
      required RoleResultItem roleItem,
      required ChatRoomData room}) async {
    eventCenter.emit(EventConstant.EventWolfDialogClose);

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return WolfGetRoleResultDialog(
              key: key, roleItem: roleItem, room: room);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0x00000000),
      insetPadding: const EdgeInsets.only(left: 31, right: 31),
      child: Container(
        height: 470,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.imagePath("wolfv2/wolf_get_role_result_bg.webp",
              package: ComponentManager.MANAGER_WERE_WOLF)),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 57),
            Container(
              height: 32,
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(R.imagePath(
                    "wolfv2/wolf_role_result_title_bg.webp",
                    package: ComponentManager.MANAGER_WERE_WOLF)),
                fit: BoxFit.fill,
              )),
              alignment: Alignment.center,
              child: Text(roleItem.roleName,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                child: R.img(_getImgPath(roleItem.role),
                    package: ComponentManager.MANAGER_WERE_WOLF,
                    height: 144,
                    fit: BoxFit.contain)),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 24, end: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: K.room_wolf_win_condition, style: textStyle),
                        TextSpan(text: roleItem.winCondition, style: textStyle),
                      ]),
                      softWrap: true),
                  Text(roleItem.desc, style: textStyle)
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  if (ModalRoute.of(context)?.isCurrent == true) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 113,
                  height: 37,
                  padding: const EdgeInsetsDirectional.only(top: 3),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(R.imagePath(
                        "wolfv2/wolf_role_result_btn.webp",
                        package: ComponentManager.MANAGER_WERE_WOLF)),
                    fit: BoxFit.fill,
                  )),
                  child: Text(K.wolf_ok,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                )),
            const SizedBox(height: 31),
            _buildTimer(context)
          ],
        ),
      ),
    );
  }

  String _getImgPath(WolfRole role) {
    switch (role) {
      case WolfRole.Werewolf:
        return 'wolfv2/role/img_result_role_wolf.webp';
      case WolfRole.Seer:
        return 'wolfv2/role/img_result_role_seer.webp';
      case WolfRole.Witch:
        return 'wolfv2/role/img_result_role_witch.webp';
      case WolfRole.Guard:
        return 'wolfv2/role/img_result_role_guard.webp';
      case WolfRole.Hunter:
        return 'wolfv2/role/img_result_role_hunter.webp';
      case WolfRole.Popular:
        return 'wolfv2/role/img_result_role_popular.webp';
      default:
        return 'wolfv2/role/img_result_role_popular.webp';
    }
  }

  Widget _buildTimer(BuildContext context) {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    int timer = getTimer(selfPosition);
    return TimerWidget(
        key: GlobalKey(),
        stop: Duration(seconds: timer),
        onTick: () {
          timer--;
          if (timer <= 0) {
            if (ModalRoute.of(context)?.isCurrent == true) {
              Navigator.of(context).pop();
            }
          }
        },
        builder: (context) {
          return Container();
        });
  }

  int getTimer(RoomPosition? selfPosition) {
    int timer = (selfPosition?.counter != null && selfPosition!.counter > 0
            ? selfPosition.counter
            : room.config!.counter) -
        room.timestamp;
    return timer;
  }
}
