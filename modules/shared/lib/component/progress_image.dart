library progress_image;

import 'dart:math';

import 'package:flutter/material.dart';

typedef WidgetBuilderWithSize = Widget Function(
    BuildContext context, Size size);

class ProgressImage extends StatefulWidget {
  final double width;
  final double height;
  final int initProgress;
  final WidgetBuilderWithSize builder;

  const ProgressImage({
    super.key,
    this.width = 70.0,
    this.height = 150.0,
    this.initProgress = -1,
    required this.builder,
  });

  @override
  ProgressImageState createState() => ProgressImageState();
}

class ProgressImageState extends State<ProgressImage>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Tween<double> tween;
  late AnimationController elasticityCircleAnimation;
  late Tween<double> elasticityCircleTween;
  double dataSet = 0.0;
  final random = Random();

  // -1 代表刚开始
  late int progress;

  @override
  void initState() {
    super.initState();
    progress = widget.initProgress;
    initSplashTween();
    initElasticityCircleTween();
  }

  void initSplashTween() {
    //    创建动画控制器
    animation = AnimationController(
        duration: Duration(milliseconds: progress < 100 ? 0 : 300), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    dataSet = widget.height * 2;
    tween = Tween<double>(
        begin: progress == -1 ? 0.0 : dataSet.toDouble(),
        end: progress == -1
            ? 0.0
            : progress < 100
                ? dataSet.toDouble()
                : 0.0);
    animation.forward();
  }

  void initElasticityCircleTween() {
    //    创建动画控制器
    elasticityCircleAnimation = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() {
        if (elasticityCircleAnimation.status == AnimationStatus.completed) {
          elasticityCircleAnimation.reverse();
        }
        if (elasticityCircleAnimation.status == AnimationStatus.dismissed) {
          elasticityCircleAnimation.forward();
        }

        setState(() {});
      });
    elasticityCircleTween = Tween<double>(begin: 2.0, end: 4.0);
    elasticityCircleAnimation.forward();
  }

  void setProgress(int progress) {
    setState(() {
      this.progress = progress;
      if (this.progress == 100) {
//        elasticityCircleAnimation.dispose();
//        elasticityCircleAnimation = null;
      }
      animation.dispose();
      initSplashTween();
    });
  }

  @override
  void dispose() {
    animation.dispose();
    elasticityCircleAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSufficient = progress == 100 || progress == -1;
    Size size = Size(widget.width, widget.height);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipPath(
        child: Stack(
          children: <Widget>[
            widget.builder(context, size),
            CustomPaint(
              size: size,
              painter: ProgressImageContent(tween.animate(animation).value),
            ),
            if (!isSufficient)
              Center(
                  child: Text(
                '$progress%',
                style: const TextStyle(color: Colors.white),
              )),
            CustomPaint(
              size: size,
              painter: ElasticityCircle(isSufficient
                  ? -1.0
                  : elasticityCircleTween
                      .animate(elasticityCircleAnimation)
                      .value),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressImageContent extends CustomPainter {
  final double animateValue;

  ProgressImageContent(this.animateValue);

  @override
  void paint(Canvas canvas, Size size) {
    if (animateValue > 0) {
      //选中大圆
      final selectedBigCirclePaint = Paint()
        ..color = Colors.black26
        ..style = PaintingStyle.stroke
        ..strokeWidth = animateValue;
      //画到最高
      canvas.drawCircle(Offset(size.width / 2, size.height / 2),
          size.height / 2, selectedBigCirclePaint);
    }
  }

  @override
  bool shouldRepaint(ProgressImageContent oldDelegate) {
    return animateValue != oldDelegate.animateValue;
  }
}

class ElasticityCircle extends CustomPainter {
  final double animateValue;

  ElasticityCircle(this.animateValue);

  @override
  void paint(Canvas canvas, Size size) {
    if (animateValue > 0) {
      //选中大圆
      final selectedBigCirclePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = animateValue;
      //画到最高
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20.0,
          selectedBigCirclePaint);
    }
  }

  @override
  bool shouldRepaint(ElasticityCircle oldDelegate) {
    return animateValue != oldDelegate.animateValue;
  }
}
