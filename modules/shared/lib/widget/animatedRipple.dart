import 'package:flutter/material.dart';

import 'animatedRing.dart';

class AnimatedRipple extends StatefulWidget {
  final double size;
  final Color bgColor;
  final int extraStartDelay;
  final double? beginOpacity;

  const AnimatedRipple(this.size, this.bgColor,
      {super.key, this.extraStartDelay = 0, this.beginOpacity});

  @override
  _AnimatedRipple createState() => _AnimatedRipple();
}

class _AnimatedRipple extends State<AnimatedRipple>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            for (int i = 0; i < 3; i++)
              AnimatedRing(
                widget.size,
                widget.bgColor,
                1000 * i + widget.extraStartDelay,
                beginOpacity: widget.beginOpacity,
              ),
          ],
        ),
      ),
    );
  }
}
