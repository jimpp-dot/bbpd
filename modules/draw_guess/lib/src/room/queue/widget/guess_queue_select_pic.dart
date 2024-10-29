import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/guess/src/audience_board.dart';
import 'package:draw_guess/src/room/guess/src/codec.dart';
import 'package:draw_guess/src/room/guess/src/trace.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_count_down.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import 'guess_queue_board_container.dart';

class GuessQueueSelect extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;

  const GuessQueueSelect(
      {super.key, required this.room, required this.countDownTime});

  @override
  GuessQueueSelectState createState() => GuessQueueSelectState();
}

class GuessQueueSelectState extends State<GuessQueueSelect> {
  final TraceCodec _traceCodec = const TraceCodec();

  int showIndex = 0;
  bool hasSelect = false;
  List<Trace?> traces = [];

  @override
  void initState() {
    super.initState();

    var images =
        widget.room.config?.guessQueueRoomConfigData?.replayLike?.images;
    if (images != null) {
      for (var image in images) {
        traces.add(_traceCodec.decode(image.image ?? ''));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Util.width - 32,
          height: guessQueueDrawHeight() + 46,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => changeIndex(false),
                    child: R.img(Assets.draw_guess$ic_guess_pre_svg,
                        width: 32, height: 32),
                  ),
                  SizedBox(
                    width: Util.width - 32 - 40 - 40,
                    height: (Util.width - 32 - 40 - 40) * 235 / 336,
                    child: (traces.isEmpty)
                        ? const SizedBox.shrink()
                        : AudienceBoard(traces[showIndex],
                            eraseColor: const Color(0xFFFDF8F2)),
                  ),
                  GestureDetector(
                    onTap: () => changeIndex(true),
                    child: R.img(Assets.draw_guess$ic_guess_next_svg,
                        width: 32, height: 32),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  /// 选择喜欢的图片
                  if (!hasSelect) {
                    hasSelect = true;
                    var images = widget.room.config?.guessQueueRoomConfigData
                        ?.replayLike?.images;
                    if (images != null && images.length > showIndex) {
                      /// 选择喜欢的画的uid
                      GuessQueueRepo.chooseFavorite(
                        widget.room.rid ?? 0,
                        images[showIndex].uid,
                        widget.room.config?.guessQueueRoomConfigData?.replayLike
                                ?.lineId ??
                            0,
                      );
                    }
                  }
                },
                child: Container(
                  width: 184,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF737BFF),
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    border:
                        Border.all(color: const Color(0xFF343434), width: 3),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.guess_like,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
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

  void changeIndex(bool next) {
    if (traces.isEmpty) return;

    if (next) {
      showIndex++;
    } else {
      showIndex--;
    }

    if (showIndex >= traces.length) {
      showIndex = 0;
    } else if (showIndex < 0) {
      showIndex = traces.length - 1;
    }

    refresh();
  }
}
