import 'dart:math';

import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_board_container.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

///画猜接龙麦位列表
class GuessQueueMicList extends StatefulWidget {
  final ChatRoomData room;

  const GuessQueueMicList({super.key, required this.room});

  @override
  _GuessQueueMicListState createState() => _GuessQueueMicListState();
}

class _GuessQueueMicListState extends State<GuessQueueMicList> {
  Size get _iconSize =>
      IconStyles[UserIconStyle.GuessQueue] ?? const Size(52, 52);

  @override
  Widget build(BuildContext context) {
    if (_micListOneLine() == false) {
      return UserListNormal(
        room: widget.room,
        iconStyle: UserIconStyle.GuessQueue,
      );
    }

    return Container(
      margin: const EdgeInsetsDirectional.only(start: 0.0, end: 0.0, top: 4.0),
      height: _iconSize.height + 48.0,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.room.positions.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  /// 麦位列表单行展示
  bool _micListOneLine() {
    double headerHeight = MediaQuery.of(context).padding.top + 44.0;
    double recruitHeight = leftTopRecruitHeight + 10;
    double boardHeight = guessQueueBoardHeight();
    double marginHeight = 20.0;
    double micListHeight = 4.0 + (_iconSize.height + 48.0) * 2;
    double bottomHeight = bottomControllerHeight + Util.iphoneXBottom;

    double totalHeight = headerHeight +
        recruitHeight +
        boardHeight +
        marginHeight +
        micListHeight +
        bottomHeight;
    if (totalHeight > Util.height) return true;

    return false;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    RoomPosition item = widget.room.positions[index];
    String name = item.name;

    if (item.uid <= 0 && Util.isStringEmpty(name)) {
      name = K.room_empty_mic_prefix;
    }

    if (item.uid <= 0 &&
        widget.room.config?.mode != RoomMode.Lock &&
        item.lock == true &&
        widget.room.config?.property != RoomProperty.Private) {
      name = K.room_mic_locked;
    }

    List<Widget> res = [];

    res.add(
      Column(
        children: <Widget>[
          UserIcon(
            room: widget.room,
            position: item,
            size: IconSize.guessQueue,
          ),
          Container(
            height: 40.0,
            margin: const EdgeInsets.only(top: 8.0),
            alignment: Alignment.topCenter,
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: name,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 11.0,
                      color: item.uid > 0
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                      letterSpacing: 0.0,
                      wordSpacing: 0.0,
                    ),
                  ),
                ],
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    if (item.uid > 0 &&
        item.uid == widget.room.config?.guessQueueRoomConfigData?.lineUid) {
      res.add(
        PositionedDirectional(
          top: -20,
          child: Column(
            children: [
              Container(
                width: 46,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: StadiumBorder(),
                ),
                child: Center(
                  child: Text(
                    K.room_game_replaying,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF5955FA),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              R.img(Assets.draw_guess$guess_queue_bottom_triangle_png,
                  width: 12, height: 5)
            ],
          ),
        ),
      );
    }

    if ((widget.room.uid ?? 0) > 0 &&
        item.uid == widget.room.uid &&
        !item.isMystery) {
      res.add(
        Positioned(
          top: -24,
          child: UserTip(
            timerCompleteCallback: () {
              if (!mounted) return;
              if (widget.room.config == null) return;
              setState(() {
                widget.room.uid = 0;
              });
            },
          ),
        ),
      );
    }

    double itemWidth = min(36.0 + _iconSize.width, Util.width / 4);
    double otherLeftMargin = (Util.width - 4 * itemWidth) / 6.0;
    double firstLeftMargin = 1.5 * otherLeftMargin;

    return Container(
      width: itemWidth +
          ((index == 0 || index == widget.room.positions.length - 1)
              ? firstLeftMargin
              : otherLeftMargin),
      alignment: AlignmentDirectional.centerEnd,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: res,
      ),
    );
  }
}
