import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

enum ArrowState { up, down, none }

class ArrowWidget extends StatefulWidget {
  final ArrowState? state;

  const ArrowWidget({Key? key, this.state}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArrowWidgetState();
}

class ArrowWidgetState extends State<ArrowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
            angle: pi,
            child: R.img('assets/images/gift_wall/arrow_down.png',
                color: widget.state == ArrowState.up
                    ? Colors.white
                    : Colors.white.withOpacity(0.2),
                width: 8.dp,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_PERSONALDATA)),
        R.img('assets/images/gift_wall/arrow_down.png',
            color: widget.state == ArrowState.down
                ? Colors.white
                : Colors.white.withOpacity(0.2),
            width: 8.dp,
            fit: BoxFit.contain,
            package: ComponentManager.MANAGER_PERSONALDATA),
      ],
    );
  }
}
