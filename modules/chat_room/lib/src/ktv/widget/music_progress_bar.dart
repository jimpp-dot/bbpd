import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/ktv/ktv_music_controller.dart';

import '../utils/time_util.dart';

class MusicProgressBar extends StatefulWidget {
  const MusicProgressBar({super.key});

  @override
  State<MusicProgressBar> createState() => _MusicProgressBarState();
}

class _MusicProgressBarState extends State<MusicProgressBar> {
  int _progress = 0;
  int _total = 0;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();

    _progress = KtvMusicController.currentMixingPosition;
    _total = KtvMusicController.totalTime;

    _refreshTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      _progress = KtvMusicController.currentMixingPosition;
      _total = KtvMusicController.totalTime;
      refresh();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragDown: (details) {
        Log.d('_MusicProgressBarState.build');
      },
      onTap: () {
        Log.d('_MusicProgressBarState.build');
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                //最底下的背景条
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                //中间的进度条
                FractionallySizedBox(
                  widthFactor: _total > 0 ? _progress.toDouble() / _total : 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${KtvTimeUtil.mmss(_progress)} / ${KtvTimeUtil.mmss(_total)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
