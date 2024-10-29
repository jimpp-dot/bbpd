import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 暂无人点歌  提示
///
class KtvNoSingerTipsWidget extends StatelessWidget {
  const KtvNoSingerTipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 92,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(RoomAssets.chat_room$ktv_note_left_png,
                  width: 29, height: 20),
              const SizedBox(width: 9),
              Flexible(
                child: Text(
                  K.ktv_nobody,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      height: 1.2),
                ),
              ),
              const SizedBox(width: 6),
              R.img(RoomAssets.chat_room$ktv_note_right_png,
                  width: 32, height: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            K.ktv_earphone_tips,
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
                height: 1.2),
          ),
        ],
      ),
    );
  }
}
