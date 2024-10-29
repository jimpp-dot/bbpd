import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/guess/src/audience_board.dart';
import 'package:draw_guess/src/room/guess/src/codec.dart';
import 'package:draw_guess/src/room/guess/src/trace.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import '../../../../k.dart';
import 'guess_queue_board_container.dart';
import 'guess_queue_count_down.dart';
import 'guess_queue_share_widget.dart';

class GuessQueueSelectImgResult extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;

  const GuessQueueSelectImgResult({
    super.key,
    required this.room,
    required this.countDownTime,
  });

  @override
  GuessQueueSelectImgResultState createState() {
    return GuessQueueSelectImgResultState();
  }
}

class GuessQueueSelectImgResultState extends State<GuessQueueSelectImgResult> {
  final TraceCodec _traceCodec = const TraceCodec();
  Trace? _trace;
  String? name;
  String? icon;

  @override
  void initState() {
    super.initState();

    GuessQueueRePlayLikeImage? likeImg =
        widget.room.config?.guessQueueRoomConfigData?.replayLike?.like;

    if (likeImg != null) {
      name = likeImg.name;
      icon = likeImg.icon;
      _trace = _traceCodec.decode(likeImg.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(name)) return const SizedBox.shrink();
    return Stack(
      children: [
        SizedBox(
          width: Util.width - 32,
          height: guessQueueDrawHeight() + 46,
          child: Column(
            children: [
              SizedBox(
                height: guessQueueDrawHeight() + 46 - 30 - 9 - 48 - 8,
                width:
                    (guessQueueDrawHeight() + 46 - 30 - 9 - 48 - 8) * 336 / 235,
                child: AudienceBoard(
                  _trace,
                  eraseColor: const Color(0xFFFDF8F2),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFF313131), width: 1),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: CommonAvatar(
                      path: icon,
                      size: 28,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: Util.width - 32 - 24 - 34,
                    ),
                    child: Text(
                      K.guess_like_somebody_pic([name!]),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF313131),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              GuessQueueShareWidget(
                widget.room.rid,
                widget.room.config?.guessQueueRoomConfigData?.replayLike
                        ?.lineId ??
                    0,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        PositionedDirectional(
          top: 4,
          end: 8,
          child: GuessQueueCountDown(
            room: widget.room,
            countDownTime: widget.countDownTime,
          ),
        ),
      ],
    );
  }
}
