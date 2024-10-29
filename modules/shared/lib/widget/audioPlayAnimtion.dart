import 'dart:math';

import 'package:flutter/material.dart';

class AudioPlayAnimation extends StatefulWidget {
  final AnimationController controller;
  final double scale;
  final List<Color>? colors;
  final bool refreshOnAnimCallBack;

  const AudioPlayAnimation(this.controller, this.scale,
      {super.key, this.colors, this.refreshOnAnimCallBack = false});

  @override
  _AudioPlayAnimationState createState() {
    return _AudioPlayAnimationState();
  }
}

class _AudioPlayAnimationState extends State<AudioPlayAnimation> {
  late Animation _scaleAni;
  late AnimationController _aniController;
  late double _itemWidth;
  late double _space;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() {
    _aniController = widget.controller;

    _space = 3 * widget.scale;
    _itemWidth = 2 * widget.scale;

    _scaleAni = Tween<double>(begin: 0, end: pi * 2).animate(_aniController);
    if (widget.refreshOnAnimCallBack) {
      _aniController.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double aniValue = _scaleAni.value;

    double height1 = widget.scale * (4 + 14 * (sin(aniValue)).abs());
    double height2 = widget.scale * (4 + 14 * (sin(pi / 6 - aniValue)).abs());
    double height3 =
        widget.scale * (4 + 14 * (sin(pi * 2 / 6 - aniValue)).abs());
    double height4 =
        widget.scale * (4 + 14 * (sin(pi * 3 / 6 - aniValue)).abs());
    double height5 =
        widget.scale * (4 + 14 * (sin(pi * 4 / 6 - aniValue)).abs());
    double height6 =
        widget.scale * (4 + 14 * (sin(pi * 5 / 6 - aniValue)).abs());
    double height7 =
        widget.scale * (4 + 14 * (sin(pi * 6 / 6 - aniValue)).abs());
    double height8 =
        widget.scale * (4 + 14 * (sin(pi * 7 / 6 - aniValue)).abs());
    double height9 =
        widget.scale * (4 + 14 * (sin(pi * 8 / 6 - aniValue)).abs());
    double height10 =
        widget.scale * (4 + 14 * (sin(pi * 9 / 6 - aniValue)).abs());
    double height11 =
        widget.scale * (4 + 14 * (sin(pi * 10 / 6 - aniValue)).abs());
    double height12 =
        widget.scale * (4 + 14 * (sin(pi * 11 / 6 - aniValue)).abs());
    double height13 =
        widget.scale * (4 + 14 * (sin(pi * 12 / 6 - aniValue)).abs());

    return AnimatedBuilder(
      animation: _aniController,
      builder: (BuildContext context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _itemWidth,
              height: height1,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![0]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height2,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![1]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height3,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![2]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height4,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![3]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height5,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![4]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height6,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![5]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height7,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![6]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height8,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![7]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height9,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![8]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height10,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![9]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height11,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![10]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height12,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![11]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
            SizedBox(
              width: _space,
            ),
            Container(
              width: _itemWidth,
              height: height13,
              decoration: BoxDecoration(
                color: widget.colors != null
                    ? widget.colors![12]
                    : const Color(0xFFFFFFFF),
                borderRadius:
                    BorderRadius.all(Radius.circular(1.0 * widget.scale)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void didUpdateWidget(AudioPlayAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _init();
    }
  }
}
