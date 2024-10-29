import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:flutter/cupertino.dart';

class GuessBeginReplayWidget extends StatefulWidget {
  const GuessBeginReplayWidget({super.key});

  @override
  _GuessBeginReplayWidgetState createState() => _GuessBeginReplayWidgetState();
}

class _GuessBeginReplayWidgetState extends State<GuessBeginReplayWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = Tween(begin: 1.5, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _fadeAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _controller.addStatusListener((status) {
      Log.d('GuessBeginReplayWidget:$status');
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: ScaleTransition(
        scale: _animation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: R.img(Assets.draw_guess$ic_replay_image_webp,
              width: 256, height: 114),
        ),
      ),
    );
  }
}
