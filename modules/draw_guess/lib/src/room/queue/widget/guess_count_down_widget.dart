import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/chat_room.dart';

class GuessCountDownWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback? countDownFinish;

  const GuessCountDownWidget(this.countDownFinish, this.room, {super.key});
  @override
  _GuessCountDownWidgetState createState() => _GuessCountDownWidgetState();
}

class _GuessCountDownWidgetState extends State<GuessCountDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _fadeAnimation;

  int index = 3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: 3.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _fadeAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (index == 1) {
          _controller.stop();
          widget.countDownFinish?.call();
        } else {
          index--;
          setState(() {});
          _controller.reset();
          _controller.forward();
        }
      }
    });
    _controller.forward();
    widget.room.playShortAudio('guess_count_down.mp3',
        path: 'packages/draw_guess/assets/sound/');
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
          child: R.img(Assets.draw_guess$ic_count_down_x_webp(index),
              width: 132, height: 132),
        ),
      ),
    );
  }
}
