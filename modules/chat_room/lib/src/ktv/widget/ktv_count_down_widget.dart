import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/config.dart';
import 'package:flutter/material.dart';

/// 开始演唱提示 浮层
///
class KtvCountDownWidget extends StatefulWidget {
  final KtvInfo ktvInfo;

  const KtvCountDownWidget(this.ktvInfo, {super.key});

  @override
  State<KtvCountDownWidget> createState() => _KtvCountDownState();
}

class _KtvCountDownState extends State<KtvCountDownWidget> {
  int _countDown = 0;
  Timer? _countDownTimer;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _countDownTimer?.cancel();
    super.dispose();
  }

  _init() {
    _getCountDownBySecond();

    _countDownTimer?.cancel();
    _countDownTimer = null;

    if (_countDown > 1) {
      _countDownTimer =
          Timer.periodic(const Duration(milliseconds: 300), (timer) {
        _getCountDownBySecond();
        if (_countDown <= 1) {
          _countDownTimer?.cancel();
          _countDownTimer = null;
        }

        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  _getCountDownBySecond() {
    int now = DateTime.now().millisecondsSinceEpoch;
    _countDown = (widget.ktvInfo.currentSong!.countDown - now) ~/ 1000;
    if (_countDown > 5) {
      _countDown = 5;
    } else if (_countDown < 1) {
      _countDown = 1;
    }
  }

  @override
  void didUpdateWidget(covariant KtvCountDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ktvInfo.currentSong!.countDown !=
        widget.ktvInfo.currentSong!.countDown) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LimitedBox(
              maxWidth: 150,
              child: Text(
                widget.ktvInfo.currentSong!.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              K.room_ktv_please_ready,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 5),
        LimitedBox(
          maxWidth: 200,
          child: Text(
            K.room_ktv_count_down_title([
              '$_countDown',
              '${widget.ktvInfo.currentSong!.sname}-${widget.ktvInfo.currentSong!.singerName}'
            ]),
            style:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.4)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 22,
          decoration: const BoxDecoration(
            color: Color(0xFF4A445B),
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                RoomAssets.chat_room$ktv_ktv_headset_icon_svg,
                width: 12,
                height: 12,
              ),
              const SizedBox(width: 2),
              Text(
                K.room_ktv_count_down_subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
