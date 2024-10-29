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

class GuessQueueJudgmentWidget extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;

  const GuessQueueJudgmentWidget(
      {super.key, required this.room, required this.countDownTime});

  @override
  GuessQueueJudgmentState createState() => GuessQueueJudgmentState();
}

class GuessQueueJudgmentState extends State<GuessQueueJudgmentWidget> {
  bool hasVote = false;
  final TraceCodec _traceCodec = const TraceCodec();
  Trace? _trace;
  GuessQueueRePlayComment? _comment;
  int voteLength = 0;

  @override
  void initState() {
    super.initState();

    _comment = widget.room.config?.guessQueueRoomConfigData?.replayComment;
    voteLength = _comment?.vote?.length ?? 0;
    _trace = _traceCodec.decode(_comment?.image ?? '');
  }

  @override
  void didUpdateWidget(covariant GuessQueueJudgmentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (voteLength !=
        widget.room.config?.guessQueueRoomConfigData?.replayComment?.vote
            ?.length) {
      _comment = widget.room.config?.guessQueueRoomConfigData?.replayComment;
      voteLength = _comment?.vote?.length ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Util.width - 32,
          height: guessQueueBoardHeight() - 8,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                K.guess_judgment_tip,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5955FA),
                ),
              ),
              const SizedBox(height: 11),
              Container(
                width: 229,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.8)),
                  border: Border.all(color: const Color(0xFF343434), width: 2),
                ),
                child: AudienceBoard(_trace, eraseColor: Colors.white),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: (Util.width - 32 - 28 - 28 - 31 - 10) / 2),
                    child: Text(
                      _comment?.fromWord ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF202020),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 28),
                  R.img(Assets.draw_guess$ic_big_arrow_svg,
                      width: 31, height: 10),
                  const SizedBox(width: 28),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: (Util.width - 32 - 28 - 28 - 31 - 10) / 2),
                    child: Text(
                      _comment?.toWord ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF202020),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(child: _buildResults()),
              buildVote(),
              const SizedBox(height: 8),
            ],
          ),
        ),
        PositionedDirectional(
          top: 8,
          end: 8,
          child: GuessQueueCountDown(
            room: widget.room,
            countDownTime: widget.countDownTime,
          ),
        ),
      ],
    );
  }

  Widget buildVote() {
    /// 观众不展示投票按钮, 已经投过票也不展示按钮
    if (!widget.room.isMic || hasVote) {
      return const SizedBox(height: 48);
    }

    if (_comment?.fromWord != null &&
        _comment?.toWord != null &&
        _comment?.fromWord == _comment?.toWord) {
      return GestureDetector(
        onTap: () => vote(true),
        child: Container(
          width: 184,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF737BFF),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: const Color(0xFF343434), width: 3),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.guess_queue_vote_suc,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => vote(false),
            child: Container(
              width: 123,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF919191),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                border: Border.all(color: const Color(0xFF343434), width: 3),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.guess_queue_vote_fail,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => vote(true),
            child: Container(
              width: 123,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF737BFF),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                border: Border.all(color: const Color(0xFF343434), width: 3),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.guess_queue_vote_suc,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  /// 投票成功还是失败
  void vote(bool suc) async {
    if (!hasVote) {
      hasVote = true;

      /// 只能投票一次
      GuessQueueRepo.judgementResult(
        widget.room.rid ?? 0,
        suc ? 1 : 0,
        widget.room.config?.guessQueueRoomConfigData?.replayComment?.lineId ??
            0,
      );
      return;
    }
  }

  Widget _buildResults() {
    if (_comment?.vote?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    List<Widget> list = [];

    _comment!.vote?.forEach(
      (key, value) {
        list.add(_buildResult(value > 0));
        list.add(const SizedBox(width: 8));
      },
    );

    if (list.length > 1) {
      list.removeLast();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

  Widget _buildResult(bool suc) {
    return R.img(
      suc
          ? Assets.draw_guess$ic_vote_suc_svg
          : Assets.draw_guess$ic_vote_fail_svg,
      width: 26,
      height: 26,
      package: ComponentManager.MANAGER_DRAW_GUESS,
    );
  }
}
