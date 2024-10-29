import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 画猜接龙面板通用容器
class GuessQueueBoardContainer extends StatelessWidget {
  final Widget child;

  const GuessQueueBoardContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 24,
      height: guessQueueBoardHeight(),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8F2),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: const Color(0xFF343434), width: 4),
      ),
      child: child,
    );
  }
}

double guessQueueBoardHeight() {
  return 66.0 + 50 + guessQueueDrawHeight();
}

double guessQueueDrawHeight() {
  return ((Util.width - 40) * 235 / 336);
}
