import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

class MicLinkAnim extends StatelessWidget {
  final bool showAni;
  final GlobalKey<MultiframeImageState> _key = GlobalKey();

  MicLinkAnim(this.showAni, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLinkLine();
  }

  Widget _buildLinkLine() {
    return PositionedDirectional(
      top: 28,
      child: showAni
          ? RepaintBoundary(
              child: MultiframeImage.asset(
                RoomAssets.chat_room$mic_link_anim_mic_link_webp,
                key: _key,
                width: 70,
                height: 30,
                loop: false,
                onComplete: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  _key.currentState?.replay();
                },
              ),
            )
          : R.img(RoomAssets.chat_room$mic_link_mic_link_line_webp,
              width: 70, height: 30),
    );
  }
}
