import 'package:flutter/material.dart';

import '../shared.dart';

class Loading extends StatefulWidget {
  const Loading({super.key, this.label = '加载中...', this.progress, this.color});

  final String? label;
  final double? progress;
  final Color? color;

  @override
  _LoadingState createState() =>
      _LoadingState(label: label, progress: progress, color: color);
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  final String? label;
  final double? progress;
  final Color? color;

  _LoadingState({this.label, this.progress, this.color});

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          value: progress,
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(color ?? R.color.mainBrandColor)),
    );
  }
}
