import 'package:flutter/material.dart';

class PopupSelector extends StatelessWidget {
  final Widget child;
  final Offset offset;

  const PopupSelector({super.key, required this.child, required this.offset});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context, false),
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: offset.dx,
              top: offset.dy,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
