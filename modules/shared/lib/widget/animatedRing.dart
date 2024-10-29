import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedRing extends StatefulWidget {
  final double size;
  final Color bgColor;
  final int startDelay;
  final double? beginOpacity;

  const AnimatedRing(this.size, this.bgColor, this.startDelay,
      {super.key, this.beginOpacity});

  @override
  _AnimatedRingState createState() => _AnimatedRingState();
}

class _AnimatedRingState extends State<AnimatedRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeTween;
  late Animation<double> _opacityTween;
  late Timer _startTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    final CurvedAnimation curve = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 2.5 / 3, curve: Curves.easeOut));
    _sizeTween = Tween<double>(begin: 0, end: widget.size).animate(curve)
      ..addListener(() {
        _refresh();
      });
    _opacityTween =
        Tween<double>(begin: widget.beginOpacity ?? 0.1, end: 0).animate(curve)
          ..addListener(() {
            _refresh();
          });

    _startTimer = Timer(Duration(milliseconds: widget.startDelay), () {
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _startTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: widget.bgColor.withOpacity(_opacityTween.value),
        width: _sizeTween.value,
        height: _sizeTween.value,
      ),
    );
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
