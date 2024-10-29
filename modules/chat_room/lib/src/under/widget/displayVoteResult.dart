import 'package:chat_room/k.dart';

import '../../base/config.dart';
import '../../under/model/underData.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisplayVoteResult extends StatefulWidget {
  final String? type;
  final List<int> loser;
  final Map<int, List<int>> votes;
  final List<RoomPosition> positions;

  const DisplayVoteResult(
      {super.key,
      required this.votes,
      required this.loser,
      this.type,
      required this.positions});

  @override
  State<StatefulWidget> createState() {
    return _DisplayVoteResultState();
  }
}

class _DisplayVoteResultState extends State<DisplayVoteResult> {
  Widget _renderUserIcon(
      {String? icon, required double width, required double height}) {
    return Container(
      decoration: const ShapeDecoration(
        shape:
            CircleBorder(side: BorderSide(color: Color(0xFF453A5E), width: 2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width / 2),
        child: CachedNetworkImage(
          imageUrl: '${System.imageDomain}$icon',
          suffix: '!head150',
          width: width,
          height: height,
        ),
      ),
    );
  }

  void _renderLoser(List<Widget> widgets) {
    RoomPosition? loserPosition;
    if (widget.type == 'loser' && widget.loser[0] >= 0) {
      loserPosition = _getRoomPosition(widget.loser[0]);
    }

    if (loserPosition == null) {
      return;
    } else {
      widgets.add(Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 8, left: 5, right: 5),
              child: _renderUserIcon(
                icon: loserPosition.icon,
                width: 65,
                height: 65,
              )),
          loserPosition.underData?.gameUnderRole == GameUnderRole.Populace_Loser
              ? const SizedBox(
                  width: 55,
                  height: 41,
                )
              : R.img('under_vote_underrole.png',
                  width: 55,
                  height: 41,
                  package: ComponentManager.MANAGER_BASE_ROOM),
        ],
      ));
      widgets.add(Text(
        K.room_num_of_player(['${widget.loser[0] + 1}']),
        style: const TextStyle(
            fontSize: 12,
            color: Color(0xff34294e),
            decoration: TextDecoration.none),
      ));
      widgets.add(Text(
        gameUnderRoleToString[loserPosition.underData?.gameUnderRole] ?? '',
        style: const TextStyle(
            fontSize: 14,
            color: Color(0xff271b43),
            decoration: TextDecoration.none),
      ));
    }
  }

  RoomPosition? _getRoomPosition(int index) {
    RoomPosition? position;
    widget.positions
        .where((item) => item.position == index)
        .forEach((item) => position = item);
    return position;
  }

  Widget _renderVoters(int key) {
    List<Widget> res = [];

    int index = 0;
    for (var voter in widget.votes[key]!) {
      res.add(PositionedDirectional(
        end: index * 24.0,
        child: Container(
          child: Column(
            children: <Widget>[
              _renderUserIcon(
                  icon: _getRoomPosition(voter)?.icon, width: 30, height: 30),
              Text(
                K.room_some_num(['${voter + 1}']),
                style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF34294E),
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
      ));
      index++;
    }

    return Stack(
      children: res,
    );
  }

  Widget _renderVotes() {
    List<Widget> widgets = [];

    widget.votes.forEach((key, value) {
      RoomPosition? votedPosition = _getRoomPosition(key);
      widgets.add(Container(
        height: 55,
        margin: const EdgeInsets.only(top: 12),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            _renderUserIcon(icon: votedPosition?.icon, width: 55, height: 55),
            Expanded(
                child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: _renderVoters(key))),
          ],
        ),
      ));
      widgets.add(Container(
        height: 14,
        margin: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Text(
              K.room_num_of_player(['${key + 1}']),
              style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF34294E),
                  decoration: TextDecoration.none),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 26),
                color: const Color(0xff534475),
                height: 1,
              ),
            )
          ],
        ),
      ));
    });

    return Container(
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: widgets,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    _renderLoser(widgets);

    widgets.add(_renderVotes());

    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          IntrinsicHeight(
            child: Container(
                width: 295,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF7D6BA7),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: widgets,
                  ),
                )),
          ),
          R.img('under_vote_header.png',
              width: 125,
              height: 81,
              package: ComponentManager.MANAGER_BASE_ROOM)
        ],
      ),
    );
  }
}
