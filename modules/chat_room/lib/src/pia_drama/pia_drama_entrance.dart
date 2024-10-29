import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../chat_room.dart';
import '../../k.dart';
import 'order/order_drama_page.dart';

/// pia戏点本入口
class PiaDramaEntrance {
  static Widget renderPiaDramaEntrance({
    required BuildContext context,
    required ChatRoomData room,
    required hasRightWidgets,
  }) {
    return PositionedDirectional(
      top: MediaQuery.of(context).padding.top +
          (hasRightWidgets == true ? 78 : 68),
      end: 0.0,
      child: GestureDetector(
        onTap: () {
          OrderDramaPage.show(context, room: room);
        },
        child: Container(
          width: 91,
          height: 32,
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsetsDirectional.only(start: 2),
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadiusDirectional.horizontal(start: Radius.circular(16)),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0x806968FF), Color(0x809274FF)],
            ),
          ),
          child: Row(
            children: [
              R.img(
                'ic_pia_drama.webp',
                width: 28,
                height: 28,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              const SizedBox(width: 4),
              Text(
                K.room_drama_entance,
                style: const TextStyle(
                  color: Color(0xFFB6D5FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
