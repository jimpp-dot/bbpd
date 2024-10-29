import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart' hide SoundFastWare;

///
///
class WolfGuideBaseUserIcon extends StatelessWidget {
  final RoomPosition position;
  final bool? isSpeaking;
  final double size;

  const WolfGuideBaseUserIcon({
    super.key,
    required this.position,
    this.isSpeaking,
    this.size = 44.0,
  });

  //头像或者对应大小的Container
  Widget _renderIcon(context) {
    if (position.uid > 0) {
      String icon = '';
      icon = position.icon;
      String image = (icon.startsWith('http://') || icon.startsWith('https://'))
          ? icon
          : '${System.imageDomain}$icon!head150';
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: HeadIcon(
          icon: image,
          width: size,
          height: size,
        ),
      );
    } else {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    //说话波纹
    res.add(
      SoundEffectWidget(
        isSpeaking: isSpeaking == true,
        aniColor: const Color(0xFF00E34B),
        width: size,
        borderWidth: 4.0,
        ring: position.ring,
      ),
    );

    res.add(SizedBox(
      key: position.key,
      width: size,
      child: _renderIcon(context),
    ));

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: res,
    );
  }
}
