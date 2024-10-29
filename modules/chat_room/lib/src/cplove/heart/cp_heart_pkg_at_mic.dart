import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class CpHeartPkgAtMic extends StatelessWidget {
  final RoomPosition position;
  final ChatRoomData room;
  final double? marginTop;

  const CpHeartPkgAtMic(
      {Key? key, required this.position, required this.room, this.marginTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int package = room.config?.package ?? 0;
    if (package <= 0) {
      return const SizedBox(width: 0.0, height: 0.0);
    }

    return Container(
      margin: EdgeInsetsDirectional.only(top: marginTop ?? 8),
      width: 48,
      alignment: AlignmentDirectional.center,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(RoomAssets.cplove_cp_heart_pkg_icon_png,
              package: ComponentManager.MANAGER_BASE_ROOM, width: 9, height: 8),
          const SizedBox(width: 1),
          Text(
            _getValue(),
            style: const TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _getValue() {
    int package = position.package;
    if (package < 1000 * 100) {
      return (package / 100).toStringAsFixed(1).toString();
    } else if (package < 10000 * 100) {
      return (package ~/ 100).toString();
    } else {
      return '${(package ~/ (100 * 1000)).toStringAsFixed(1)}k';
    }
  }
}
