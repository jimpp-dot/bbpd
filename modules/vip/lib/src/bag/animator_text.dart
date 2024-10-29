import 'dart:math';

import 'package:flutter/material.dart';

typedef ValueCallback = void Function(int value);

class AnimText extends StatefulWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const AnimText({super.key, this.fontSize, this.color, this.fontWeight});

  @override
  State<StatefulWidget> createState() {
    return AnimState();
  }
}

class AnimState extends State<AnimText> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Text(
          "${animation?.value ?? 1}",
          style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color,
              fontWeight: widget.fontWeight),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimator(int begin, int end,
      {bool reverse = false, required ValueCallback callback}) {
    /// 差值太小，时长也要跟随改变，最长3000ms
    int difference = (end - begin);

    Curve curve = Curves.easeInCubic; // (100,∞) 先慢后快-三次方；
    int duration = 5000; // (100,∞) 时长5000ms；
    if (difference > 50 && difference <= 100) {
      curve = Curves.easeInQuad; // (50,100] 先慢后快-二次方；
      duration = 4000; // (50,100] 时长4000ms；
    } else if (difference > 25 && difference <= 50) {
      curve = Curves.easeIn; // (25,50] 先慢后快；
      duration = 3000; //(25,50] 时长3000ms；
    } else if (difference > 10 && difference <= 25) {
      curve = Curves.linear; // (10,25] 匀速；
      duration = 2000; // (10,25] 时长3000ms；
    } else if (difference > 5 && difference <= 10) {
      curve = Curves.linear; // (5,10] 匀速；
      duration = 1500; // (5,10] 时长2000ms；
    } else if (difference <= 5) {
      curve = Curves.linear; // (0,5] 匀速；
      duration = min(difference * 250, 1000); // (0,5] 时长最大1000ms；
    }

    Tween tween = IntTween(begin: begin, end: end);
    if (reverse) {
      tween = ReverseTween(tween);
    }
    animation = tween.animate(CurvedAnimation(parent: controller, curve: curve))
      ..addListener(() {
        callback(animation?.value ?? 1);
      });
    controller.reset();
    controller.duration = Duration(milliseconds: duration);

    /// 启动
    controller.forward();
  }

  void stopAnimator() {
    controller.stop();
  }
}
