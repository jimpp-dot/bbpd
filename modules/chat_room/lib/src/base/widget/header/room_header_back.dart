import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

double roomHeaderBackWidth = 36.0;

class RoomHeaderBackWidget extends StatelessWidget {
  const RoomHeaderBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: Container(
        width: roomHeaderBackWidth,
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: R.img("back.svg",
            width: 24.0,
            height: 24.0,
            package: ComponentManager.MANAGER_BASE_ROOM),
      ),
    );
  }
}
