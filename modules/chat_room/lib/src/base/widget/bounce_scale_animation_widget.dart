import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BounceScaleAnimationWidget extends StatefulWidget {
  final Widget? child;
  final int animation1Duration;
  final int animation2Duration;
  final double width;
  final double height;
  final bool useScaleTransition;

  const BounceScaleAnimationWidget({
    Key? key,
    this.child,
    this.animation1Duration = 400,
    this.animation2Duration = 200,
    this.width = 0.0,
    this.height = 0.0,
    this.useScaleTransition = true,
  }) : super(key: key);

  @override
  _BounceScaleAnimationWidgetState createState() =>
      _BounceScaleAnimationWidgetState();
}

class _BounceScaleAnimationWidgetState extends State<BounceScaleAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> scaleAnimation1;

  late AnimationController controller2;
  late Animation<double> scaleAnimation2;

  @override
  void initState() {
    super.initState();

    controller2 = AnimationController(
        duration: Duration(milliseconds: widget.animation2Duration),
        vsync: this);
    scaleAnimation2 = Tween<double>(begin: 1.05, end: 1.0)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.ease));

    controller1 = AnimationController(
        duration: Duration(milliseconds: widget.animation1Duration),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          refresh();
          controller1.forward();
        }
      });

    scaleAnimation1 = Tween<double>(begin: 0, end: 1.05)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.ease));
    controller1.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (scaleAnimation1.value == 1.05) {
      if (!widget.useScaleTransition &&
          widget.width > 0.0 &&
          widget.height > 0.0) {
        return SizedBox(
          width: widget.width * scaleAnimation2.value,
          height: widget.height * scaleAnimation2.value,
          child: widget.child,
        );
      }

      return ScaleTransition(
        scale: scaleAnimation2,
        child: widget.child,
      );
    }

    if (!widget.useScaleTransition &&
        widget.width > 0.0 &&
        widget.height > 0.0) {
      return SizedBox(
        width: widget.width * scaleAnimation1.value,
        height: widget.height * scaleAnimation1.value,
        child: widget.child,
      );
    }

    return ScaleTransition(
      scale: scaleAnimation1,
      child: widget.child,
    );
  }
}
