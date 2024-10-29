import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../assets.dart';
import '../../k.dart';

/// 心愿失效倒计时

class WishInvalidCountdownWidget extends StatefulWidget {
  final bool isEdit; // 是否可编辑，只有房主或接待才有编辑权限

  final int countdown; // 倒计时时长，单位秒

  final VoidCallback? editCallback; // 倒计时编辑回调

  const WishInvalidCountdownWidget({
    Key? key,
    this.isEdit = false,
    this.countdown = 0,
    this.editCallback,
  }) : super(key: key);

  @override
  State<WishInvalidCountdownWidget> createState() =>
      _WishInvalidCountdownWidgetState();
}

class _WishInvalidCountdownWidgetState
    extends State<WishInvalidCountdownWidget> {
  int _countdown = 0;
  Timer? _timer;
  String _countdownText = '0';

  @override
  void initState() {
    super.initState();
    if (widget.countdown > 0) {
      _startCountdown();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  void didUpdateWidget(covariant WishInvalidCountdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _countdown = widget.countdown;
    if (_countdown > 0) {
      _startCountdown();
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_countdown <= 0) {
        _timer?.cancel();
      } else {
        _countdown--;
        _calculateCountdown();
      }
      refresh(() {});
    });
  }

  void _calculateCountdown() {
    int remain = _countdown;
    if (remain < 0) {
      remain = 0;
    }
    int day = remain ~/ (24 * 3600);
    int hour = (remain % (24 * 3600)) ~/ 3600;
    int minute = (remain % 3600) ~/ 60;
    if (day > 0 && hour >= 0) {
      _countdownText =
          K.gift_valid_day(['$day']) + K.gift_valid_hour(['$hour']);
    } else if (hour > 0 && minute >= 0) {
      _countdownText =
          K.gift_valid_hour(['$hour']) + K.gift_valid_minute(['$minute']);
    } else if (minute >= 0) {
      _countdownText = K.gift_valid_minute(['$minute']);
    } else {
      _countdownText = K.gift_valid_minute(['0']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.countdown == 0
        ? const SizedBox.shrink()
        : Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.gift_wish_invalid_countdown,
                  style:
                      const TextStyle(color: Color(0x80FFFFFF), fontSize: 10),
                ),
                Text(
                  _countdownText,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                if (widget.isEdit) ...[
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      widget.editCallback?.call();
                    },
                    child:
                        R.img(Assets.gift$ic_edit_webp, width: 16, height: 16),
                  ),
                ]
              ],
            ),
          );
  }
}
