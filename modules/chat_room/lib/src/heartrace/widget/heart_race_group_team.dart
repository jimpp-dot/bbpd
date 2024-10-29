import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import '../../cplink/widget/heart_link.dart';
import '../../protobuf/generated/common_room_heartrace.pb.dart';
import '../model/heart_race_model.dart';
import 'heart_race_base_widget.dart';
import 'heart_race_user_icon.dart';

/// 心跳竞速：组队阶段
class HeartRaceGroupTeam extends StatefulWidget {
  final ChatRoomData room;
  final List<MicPair> micPair;
  final bool hasHat;
  const HeartRaceGroupTeam(
      {Key? key,
      required this.room,
      required this.micPair,
      this.hasHat = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HeartRaceGroupTeamState();
  }
}

class HeartRaceGroupTeamState extends State<HeartRaceGroupTeam>
    with TickerProviderStateMixin {
  double circleSize = 228;
  double iconR = 30.0;

  double get r => circleSize / 2;

  double get bigR => circleSize / 2 + iconR;

  double bgWidth = 320;
  double bgMarginTop = 51;

  /// 中间6个麦位位置
  late List<Offset> _offsets;

  @override
  void initState() {
    super.initState();
    _offsets = [
      Offset(bigR - r / 2, bigR - r * cos(pi / 6)), //0
      Offset(bigR - r, bigR), //1
      Offset(bigR - r / 2, bigR + r * cos(pi / 6)), //2
      Offset(bigR + r / 2, bigR - r * cos(pi / 6)), //3
      Offset(bigR + r, bigR), //4
      Offset(bigR + r / 2, bigR + r * cos(pi / 6)), //5
    ];
  }

  @override
  Widget build(BuildContext context) {
    RoomPosition reception;
    if (Util.validList(widget.room.positions)) {
      reception = widget.room.positions[0];
    } else {
      reception = RoomPosition(uid: 0);
    }

    RoomPosition? boss;
    if (Util.validList(widget.room.positions) &&
        widget.room.positions.length >= 8) {
      boss = widget.room.positions[7];
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          top: 6,
          start: 20,
          child: HeartRaceReceptionUserIcon(
            room: widget.room,
            roomPosition: reception,
            state: HeartRaceState.wait,
          ),
        ),
        if (boss != null)
          PositionedDirectional(
            top: 6,
            end: 20,
            child: HeartRaceBossUserIcon(
              room: widget.room,
              roomPosition: boss,
            ),
          ),
        PositionedDirectional(
          top: bgMarginTop,
          start: (Util.width - bgWidth) / 2,
          child: HeartRaceBaseWidget.buildBg(bgWidth),
        ),
        PositionedDirectional(
          start: (Util.width - 85) / 2 - 0.5,
          top: bgMarginTop + (bgWidth - 79) / 2 - 3,
          child: HeartRaceBaseWidget.buildIcon(),
        ),
        PositionedDirectional(
          top: bgMarginTop + (bgWidth / 2 - bigR),
          start: (Util.width - bigR * 2) / 2,
          child: SizedBox(
            width: bigR * 2,
            height: bigR * 2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                _buildLink(),
                ...widget.room.positions
                    .sublist(1, 7)
                    .map((_) => _buildItem(_))
                    .toList(),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: bgMarginTop + 120,
          start: Util.width / 2 + 20,
          child: HeartRaceBaseWidget.buildHelp(),
        ),
      ],
    );
  }

  Offset getIconTopLeftOffset(int index, {List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;

    return offs[index].translate(-iconR, -iconR);
  }

  Offset getIconRightOffset(int index, {List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;
    return offs[index].translate(iconR, 0);
  }

  Offset getIconLeftOffset(int index, {List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;
    return offs[index].translate(-iconR, 0);
  }

  Widget _buildItem(RoomPosition roomPosition) {
    int index = widget.room.positions.sublist(1, 7).indexOf(roomPosition);
    if (index < 0 || index >= _offsets.length) return const SizedBox();

    double iconSize = iconR * 2;

    Offset offset = getIconTopLeftOffset(index);

    /// 第一名双方满足一定条件有头像框
    String frame = '';

    if (widget.hasHat == true &&
        (roomPosition.position == 2 || roomPosition.position == 5)) {
      frame = roomPosition.sex == Sex.Female
          ? 'static/room/heart_race/heart_rate_frame_female.webp'
          : 'static/room/heart_race/heart_rate_frame_male.webp';
    }

    RoomPosition? replacePosition;
    if (roomPosition.uid == 0) {
      /// 已经组队的用户，掉线或者下麦，需要显示离线
      MicItem? item = getItemByPosition(roomPosition.position);
      if (item != null && item.uid > 0) {
        Map data = {
          'uid': item.uid,
          'name': item.name,
          'icon': item.icon,
          'sex': item.sex,
          'position': roomPosition.position,
        };
        replacePosition = RoomPosition.fromJson(null, data, roomPosition.key);
      }
    }

    return PositionedDirectional(
      start: offset.dx,
      top: offset.dy,
      child: HeartRaceUserIcon(
        room: widget.room,
        roomPosition: replacePosition ?? roomPosition,
        iconSize: iconSize,
        frameUrl: Util.validStr(frame) ? Util.getRemoteImgUrl(frame) : '',
        showOffline: replacePosition != null,
        showEmptyName: true,
      ),
    );
  }

  Widget _buildLink() {
    List<Offset> innerOffsets = [
      Offset(r / 2, r * (1 - cos(pi / 6))), //0
      Offset(0, r), //1
      Offset(r / 2, r * (1 + cos(pi / 6))), //2
      Offset(r * 3 / 2, r * (1 - cos(pi / 6))), //3
      Offset(r * 2, r), //4
      Offset(r * 3 / 2, r * (1 + cos(pi / 6))), //5
    ];

    List<Offset> linkOffsets = [];
    for (int i = 0; i < innerOffsets.length; i++) {
      linkOffsets.add(i <= 2
          ? getIconRightOffset(i, offsets: innerOffsets)
          : getIconLeftOffset(i, offsets: innerOffsets));
    }

    List<int> linkValues;
    if (Util.validList(widget.micPair)) {
      linkValues = [widget.micPair[0].package];
      if (widget.micPair.length > 1) {
        linkValues.add(widget.micPair[1].package);
      }
      if (widget.micPair.length > 2) {
        linkValues.add(widget.micPair[2].package);
      }
    } else {
      linkValues = [0, 0, 0];
    }

    return HeartLinkWidget(
      room: widget.room,
      circleSize: circleSize,
      offsets: innerOffsets,
      positionList: widget.room.positions
          .sublist(1, min(7, widget.room.positions.length)),
      linkValues: linkValues,
    );
  }

  Widget buildIcon() {
    return CachedNetworkImage(
      width: 85,
      height: 79,
      imageUrl:
          Util.getRemoteImgUrl('static/room/heart_race/heart_race_icon.webp'),
    );
  }

  MicItem? getItemByPosition(int position) {
    if (position == 1 && ((widget.micPair.length) > 1)) {
      return (widget.micPair[1].package) > 0 ? widget.micPair[1].left : null;
    } else if (position == 2 && (widget.micPair.isNotEmpty)) {
      return (widget.micPair[0].package) > 0 ? widget.micPair[0].left : null;
    } else if (position == 3 && ((widget.micPair.length) > 2)) {
      return (widget.micPair[2].package) > 0 ? widget.micPair[2].left : null;
    } else if (position == 4 && ((widget.micPair.length) > 1)) {
      return (widget.micPair[1].package) > 0 ? widget.micPair[1].right : null;
    } else if (position == 5 && (widget.micPair.isNotEmpty)) {
      return (widget.micPair[0].package) > 0 ? widget.micPair[0].right : null;
    } else if (position == 6 && ((widget.micPair.length) > 2)) {
      return (widget.micPair[2].package) > 0 ? widget.micPair[2].right : null;
    }

    return null;
  }
}
