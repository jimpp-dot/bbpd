import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../page/reception_rank_panel.dart';

class RoomReceptionWidget extends StatelessWidget {
  const RoomReceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFFFCB82).withOpacity(0.24),
      child: GestureDetector(
        onTap: () {
          ReceptionRankPanel.show(context);
        },
        child: Container(
            width: 32,
            height: 32,
            alignment: AlignmentDirectional.center,
            child: GradientText(K.room_reception_entrance,
                style: Util.youSheBiaoTiYuan.copyWith(
                    color: const Color(0xFFFEE4BC), fontSize: 11, height: 1),
                gradient: const LinearGradient(
                    colors: [Color(0xFFFEE4BC), Color(0xFFFFCB82)]))),
      ),
    );
  }
}
