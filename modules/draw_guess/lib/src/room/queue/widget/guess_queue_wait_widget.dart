import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_board_container.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_count_down.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

import '../guess_queue_config.dart';
import 'guess_queue_share_widget.dart';

/// 画猜接龙等待界面
class GuessQueueWaitWidget extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;
  final bool showShare;
  final GuessQueueState state;

  const GuessQueueWaitWidget({
    super.key,
    required this.room,
    required this.countDownTime,
    required this.state,
    this.showShare = false,
  });

  @override
  _GuessQueueWaitWidgetState createState() => _GuessQueueWaitWidgetState();
}

class _GuessQueueWaitWidgetState extends State<GuessQueueWaitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _transformAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _controller.reset();
              _controller.forward();
            }
          });
        }
      });
    _transformAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int finishNum = 0; // 已经完成对应阶段的人数
    int totalNum = 0; // 麦上总人数
    for (var e in widget.room.positions) {
      // 游戏过程中退出app 没有uid 会有originId
      if (e.originId > 0) {
        totalNum++;
        if (e.guessQueueIsFinish == true) finishNum++;
      }
    }

    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: guessQueueDrawHeight(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RotationTransition(
                turns: _transformAnimation,
                child: R.img(
                  Assets.draw_guess$guess_queue_shalou_webp,
                  width: 80,
                  height: 80,
                ),
              ),
              if (widget.state != GuessQueueState.SelectPicture) ...[
                Text(
                  '$finishNum/$totalNum',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                K.guess_queue_wait_others,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor),
              ),
            ],
          ),
        ),
        if (widget.showShare)
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            height: guessQueueBoardHeight() - 82,
            child: GuessQueueShareWidget(
              widget.room.rid,
              widget.room.config?.guessQueueRoomConfigData?.replayLike
                      ?.lineId ??
                  0,
            ),
          ),
        PositionedDirectional(
          top: 4,
          end: 12,
          child: GuessQueueCountDown(
            room: widget.room,
            countDownTime: widget.countDownTime,
          ),
        ),
      ],
    );
  }
}
