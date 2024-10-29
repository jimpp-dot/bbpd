import 'package:shared/shared.dart';
import 'package:draw_guess/k.dart';
import 'package:draw_guess/src/room/guess/src/audience_board.dart';
import 'package:draw_guess/src/room/guess/src/codec.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_guess_word_dialog.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import 'guess_queue_board_container.dart';
import 'guess_queue_count_down.dart';

class GuessQueueGuessWidget extends StatelessWidget {
  final TraceCodec _traceCodec = const TraceCodec();

  final ChatRoomData room;
  final int countDownTime;
  final String trace; // 轨迹数据

  const GuessQueueGuessWidget(
      {super.key,
      required this.room,
      required this.countDownTime,
      required this.trace});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Util.width - 24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: guessQueueDrawHeight() - 17,
                width: 336.0 / 235 * (guessQueueDrawHeight() - 17),
                child: AudienceBoard(
                  _traceCodec.decode(trace),
                  eraseColor: const Color(0xFFFDF8F2),
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: inputAnswer,
                child: Container(
                  width: 184,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFF737BFF),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.guess_input_answer,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 4,
          end: 12,
          child: GuessQueueCountDown(
            room: room,
            countDownTime: countDownTime,
            timeOutCallback: _timeOut,
          ),
        ),
      ],
    );
  }

  void _timeOut() {
    eventCenter.emit(EventConstant.EventGuessQueueWordDialogClose);
  }

  /// 输入答案
  void inputAnswer() async {
    GuessQueueGuessWordDialog.show(System.context, room);
  }
}
