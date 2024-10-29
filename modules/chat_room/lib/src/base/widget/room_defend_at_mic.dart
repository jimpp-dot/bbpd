import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';

/// 电台守护-麦框
///
class RoomDefendAtMic extends StatefulWidget {
  final RoomPosition position;

  const RoomDefendAtMic({Key? key, required this.position}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomDefendAtMicState();
}

class _RoomDefendAtMicState extends State<RoomDefendAtMic> {
  String remotePath = "${System.imageDomain}static/radio-defend/";

  @override
  Widget build(BuildContext context) {
    int index = widget.position.position;
    String type = "brass";
    if (index == 1) {
      type = "gold";
    } else if (index == 2) {
      type = "silver";
    }

    double width = IconSize.normal + 21;
    double top = -10.5;

    int level = 1;
    RadioDefendValue roomDefend = widget.position.roomDefend;
    if (roomDefend.uid > 0) {
      level = roomDefend.level;
      if (level < 1) {
        level = 1;
      } else if (level > 3) {
        level = 3;
      }
    } else {
      level = 1;
    }

    bool remote = false;
    String url = "";
    if (level == 1) {
      remote = false;
      url = "radio_header_${type}_$level.png";
    } else {
      remote = true;
      url = "${remotePath}radio_header_${type}_${level}_v2.webp";
    }

    return Positioned(
      top: top,
      width: width,
      height: width,
      child: IgnorePointer(
        child: Container(
          width: width,
          height: width,
          alignment: Alignment.center,
          child: (remote)
              ? CachedNetworkImage(
                  imageUrl: url,
                  width: width,
                  height: width,
                )
              : R.img(
                  url,
                  width: width,
                  height: width,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
        ),
      ),
    );
  }
}
