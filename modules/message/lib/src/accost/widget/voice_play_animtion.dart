import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class VoicePlayAnimation extends StatefulWidget {
  final AnimationController controller;
  final double scale;
  final List<Color>? colors;
  final double? maxWidth;

  const VoicePlayAnimation(this.controller, this.scale, this.maxWidth,
      {super.key, this.colors});

  @override
  _VoicePlayAnimationState createState() {
    return _VoicePlayAnimationState();
  }
}

class _VoicePlayAnimationState extends State<VoicePlayAnimation> {
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
  }

  @override
  Widget build(BuildContext context) {
    if (widget.maxWidth == null || widget.maxWidth! <= 0) {
      return const SizedBox.shrink();
    }

    double aniValue = _scaleAni.value;

    List<double> heightList = [
      widget.scale * (4 + 14 * (sin(aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 2 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 3 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 4 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 5 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 6 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 7 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 8 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 9 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 10 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 11 / 6 - aniValue)).abs()),
      widget.scale * (4 + 14 * (sin(pi * 12 / 6 - aniValue)).abs()),
    ];

    double width = 0;
    List<Widget> children = [];
    while (width < widget.maxWidth!) {
      for (int i = 0; i < heightList.length; i++) {
        width += _itemWidth;
        if (width >= widget.maxWidth!) {
          break;
        }

        children.add(Container(
          width: _itemWidth,
          height: heightList[i],
          decoration: BoxDecoration(
            color: R.colors.mainBrandColor,
            borderRadius: BorderRadius.all(Radius.circular(1.0 * widget.scale)),
          ),
        ));

        width += _space;
        children.add(
          SizedBox(
            width: _space,
          ),
        );
      }
    }
    children.removeLast();

    return AnimatedBuilder(
      animation: _aniController,
      builder: (BuildContext context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        );
      },
    );
  }

  @override
  void didUpdateWidget(VoicePlayAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _init();
    }
  }
}
