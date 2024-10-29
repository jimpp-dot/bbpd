import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';

class RoomDefendUpdateProgress extends StatefulWidget {
  final RoomPosition position;

  const RoomDefendUpdateProgress({Key? key, required this.position})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomDefendUpdateProgressState();
}

class _RoomDefendUpdateProgressState extends State<RoomDefendUpdateProgress> {
  bool showValue = false;
  bool showProgress = false;
  double score = 0;
  double nextScore = 0;
  double radio = 0;

  @override
  Widget build(BuildContext context) {
    RadioDefendValue roomDefend = widget.position.roomDefend;
    if (roomDefend.uid > 0) {
      showValue = !roomDefend.showNext;
      showProgress = roomDefend.showNext;
      score = roomDefend.score;
      nextScore = roomDefend.nextLevelScore;
      if (nextScore != 0) {
        radio = score / nextScore;
        if (radio < 0) {
          radio = 0;
        } else if (radio > 1) {
          radio = 1;
        }
      }
    } else {
      showValue = false;
      showProgress = false;
      score = 0;
      nextScore = 0;
      radio = 0;
    }
    return Stack(
      children: <Widget>[
        Container(
          height: 34,
          margin: const EdgeInsetsDirectional.only(start: 2, end: 2),
          alignment: Alignment.topCenter,
          child: Offstage(
            offstage: !showValue,
            child: Container(
              height: 14,
              margin: const EdgeInsetsDirectional.only(top: 6),
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              decoration: BoxDecoration(
                color: const Color(0x4D000000),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img("ic_defend_value.webp",
                      width: 10,
                      height: 10,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  const SizedBox(width: 2),
                  Text(
                    "$score",
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 34,
          margin: const EdgeInsetsDirectional.only(start: 2, end: 2),
          alignment: Alignment.topCenter,
          child: Offstage(
            offstage: !showProgress,
            child: Container(
              height: 30,
              margin: const EdgeInsetsDirectional.only(top: 4),
              padding: const EdgeInsetsDirectional.only(
                  start: 6, end: 6, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: const Color(0x4D000000),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img("ic_defend_value.webp",
                          width: 10,
                          height: 10,
                          package: ComponentManager.MANAGER_BASE_ROOM),
                      const SizedBox(width: 2),
                      Text(
                        "$score/$nextScore",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: buildProgressBar(),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          K.radio_defend_update_tip,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProgressBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      child: SizedBox(
        height: 4,
        child: buildStack(),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: 4,
            color: const Color(0xFFF6F7F9),
          ),
        ),
        ClipRect(
          child: Align(
            widthFactor: radio,
            child: Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFC5897), Color(0xFFFF6AFD)]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
