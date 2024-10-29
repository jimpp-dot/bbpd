import 'package:chat_room/k.dart';

import '../../base/config.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisplayUnderResult extends StatefulWidget {
  final List<RoomPosition> positions;
  final List<int> winners;
  final List<int> losers;
  final String underWord;
  final String populaceWord;
  final String winType;

  const DisplayUnderResult(
      {super.key,
      required this.winners,
      required this.losers,
      required this.underWord,
      required this.populaceWord,
      required this.positions,
      required this.winType});

  @override
  State<StatefulWidget> createState() {
    return _DisplayUnderResultState();
  }
}

class _DisplayUnderResultState extends State<DisplayUnderResult> {
  Widget _renderUserIcon(
      {required RoomPosition position,
      required double width,
      required double height}) {
    return Column(
      children: <Widget>[
        Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 9),
          decoration: const ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(color: Color(0xFF453A5E), width: 2)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: CachedNetworkImage(
              imageUrl: '${System.imageDomain}${position.icon}',
              suffix: '!head150',
              width: width,
              height: height,
            ),
          ),
        ),
        Text(
          K.room_num_of_player(['${position.position + 1}']),
          style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF271B43),
              decoration: TextDecoration.none),
        ),
      ],
    );
  }

  RoomPosition? _getRoomPosition(int index) {
    RoomPosition? position;
    widget.positions
        .where((item) => item.position == index)
        .forEach((item) => position = item);
    return position;
  }

  Widget _renderParts(List<int> users, bool isWinner, String wordStr) {
    int columnCounts = 3;
    List<Widget> res = [];

    res.add(Container(
      height: 24,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.horizontal(
            start: Radius.circular(13), end: Radius.circular(13)),
        color: const Color(0xFF32274B).withOpacity(0.6),
      ),
      alignment: Alignment.center,
      child: Text(
        wordStr,
        style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFAC99D8),
            decoration: TextDecoration.none),
      ),
    ));

    for (int i = 0; i < users.length; i = i + columnCounts) {
      List<Widget> widgets = [];
      for (int j = 0; j < columnCounts && i + j < users.length; j++) {
        RoomPosition? roomPosition = _getRoomPosition(users[i + j]);
        if (roomPosition != null &&
            (roomPosition.uid > 0 ||
                roomPosition.underData!.gameUnderOrigin > 0)) {
          widgets.add(
              _renderUserIcon(position: roomPosition, width: 55, height: 55));
        }
      }
      res.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ));
    }

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: isWinner ? 32 : 26),
          padding: const EdgeInsets.only(top: 26, bottom: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color(0xFF7D6BA7).withOpacity(0.9),
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: res,
            ),
          ),
        ),
        Positioned(
            top: isWinner ? 0 : 12,
            child: R.img(
                isWinner
                    ? 'under_result_header_winner.png'
                    : 'under_result_header_loser.png',
                width: isWinner ? 74 : 65,
                height: isWinner ? 58 : 38,
                package: ComponentManager.MANAGER_BASE_ROOM)),
        PositionedDirectional(
            top: isWinner ? 22 : 16,
            end: -10,
            child: R.img(
                isWinner ? 'under_result_winner.png' : 'under_result_loser.png',
                width: 86,
                height: 24,
                package: ComponentManager.MANAGER_BASE_ROOM)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String populaceWord = '${K.room_civilian_words}：${widget.populaceWord}';
    String underWord = '${K.room_under_words}：${widget.underWord}';

    return Center(
      child: IntrinsicHeight(
        child: Container(
          width: 285,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              _renderParts(widget.winners, true,
                  widget.winType == 'populace' ? populaceWord : underWord),
              _renderParts(widget.losers, false,
                  widget.winType == 'populace' ? underWord : populaceWord),
            ],
          ),
        ),
      ),
    );
  }
}
