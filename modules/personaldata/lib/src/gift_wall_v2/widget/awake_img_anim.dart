import 'package:flutter/cupertino.dart';

///觉醒弹窗礼物动画
class AwakeImgAnim extends StatelessWidget {
  final Animation<double> _controller;
  final Widget _widget;
  late Animation<double> _scale;
  late Animation<double> _alpha;

  AwakeImgAnim(this._widget, this._controller, {Key? key}) : super(key: key) {
    _scale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _alpha = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Opacity(
          opacity: _alpha.value,
          child: Transform.scale(scale: _scale.value, child: _widget),
        );
      },
      animation: _controller,
    );
  }
}
