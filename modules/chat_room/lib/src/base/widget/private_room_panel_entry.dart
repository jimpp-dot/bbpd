import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../../chatRoomData.dart';
import 'private_room_panel.dart';

class PrivateRoomPanelEntry extends StatelessWidget {
  final ChatRoomData room;

  const PrivateRoomPanelEntry({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PrivateRoomPanel.show(context: context, room: room);
      },
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            R.img(
              'ic_private_room_panel_entry.webp',
              width: 60,
              height: 60,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadiusDirectional.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    Util.parseInt(room.nest?['free']) == 1
                        ? K.room_gpk_idle
                        : K.room_busy,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  R.img(
                    'ic_next_blue.png',
                    width: 12,
                    height: 12,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
