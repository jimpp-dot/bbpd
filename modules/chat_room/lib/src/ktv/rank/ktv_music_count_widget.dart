import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';

class MusicCountWidget extends StatelessWidget {
  final int count;

  const MusicCountWidget({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img('ktv/ktv_rank_music_icon.png',
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_ROOM),
        const SizedBox(width: 2),
        Text(KtvTimeUtil.getMusicNum(count),
            style: const TextStyle(color: Color(0xFFFF01B0), fontSize: 14)),
      ],
    );
  }
}
