import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_center_bottom_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_center_middle_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_center_top_widget.dart';

///
///
class WolfGuideRoom extends StatelessWidget {
  const WolfGuideRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        WolfGuideCenterTopWidget(),
        WolfGuideCenterMiddleWidget(),
        WolfGuideCenterBottomWidget(),
      ],
    );
  }
}
