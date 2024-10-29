import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// VAP模拟器容器。避免iOS模拟器被透明层挡住无法操作
class VapSimulatorWidget extends StatefulWidget {
  final VoidCallback? onComplete;

  const VapSimulatorWidget({Key? key, this.onComplete}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VapSimulatorState();
}

class _VapSimulatorState extends State<VapSimulatorWidget> {
  int _second = 3; // 默认3s后执行动画回调
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _cancelTimer();

    /// 3s后自动执行动画结束的回调
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      refresh(() {
        _second--;
      });
      if (_second <= 0) {
        _cancelTimer();
        widget.onComplete?.call();
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    if (_second <= 0) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xB3000000),
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              'bb_null.webp',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 180,
              height: 180,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Text(
              '开发环境下，iOS模拟器VAP动画',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: Util.fontFamily),
            ),
            const SizedBox(height: 10),
            Text(
              '模拟VAP动画 播放中(${_second}s)。。。',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontFamily: Util.fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}
