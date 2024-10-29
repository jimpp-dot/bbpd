import 'package:draw_guess/k.dart';
import 'package:shared/shared.dart' hide Config;
import 'package:draw_guess/src/room/guess/src/broadcaster_board.dart';
import 'package:draw_guess/src/room/guess/src/codec.dart';
import 'package:draw_guess/src/room/guess/src/config.dart';
import 'package:draw_guess/src/room/guess/src/control_bar.dart';
import 'package:draw_guess/src/room/guess/src/trace.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_count_down.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import '../guess_queue_config.dart';
import 'guess_queue_board_container.dart';
import 'package:provider/provider.dart' hide Selector;

/// 画画阶段：画板
class GuessQueueDrawWidget extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;
  final GuessQueueData data;

  const GuessQueueDrawWidget(
      {super.key,
      required this.room,
      required this.countDownTime,
      required this.data});

  @override
  GuessQueueDrawState createState() => GuessQueueDrawState();
}

class GuessQueueDrawState extends State<GuessQueueDrawWidget> {
  final TraceCodec _traceCodec = const TraceCodec();
  GlobalKey<BroadcasterBoardState> _key = GlobalKey();

  Config _config = initialConfig;
  bool hasUseInitTrace = false; // 最多用initTrace覆盖一次
  Trace? _trace;

  @override
  void initState() {
    super.initState();

    String? img = widget.data.drawWordResp?.data?.image;
    if (img != null && img.isNotEmpty) {
      _trace = _traceCodec.decode(img);
      hasUseInitTrace = true;
      widget.data.drawWordResp?.data?.image = null;
    }
  }

  @override
  void didUpdateWidget(covariant GuessQueueDrawWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    String? img = widget.data.drawWordResp?.data?.image;
    if (img != null && img.isNotEmpty && !hasUseInitTrace) {
      _trace = _traceCodec.decode(img);
      hasUseInitTrace = true;
      widget.data.drawWordResp?.data?.image = null;
      _key = GlobalKey(debugLabel: 'BroadcasterBoardState-cover');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShareConfig(
      config: _config,
      child: NotificationListener<EventNotification>(
        onNotification: (notification) {
          if (notification is UpdateConfigNotification) {
            setState(() {
              _config = notification.config;
            });
          } else if (notification is UndoNotification) {
            _key.currentState?.undo();
          }
          return true;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              child: Stack(
                children: [
                  SizedBox(
                    width: Util.width - 40,
                    height: guessQueueDrawHeight(),
                    child: BroadcasterBoard(
                      key: _key,
                      eraseColor: const Color(0xFFFDF8F2),
                      initTrace: _trace,
                      onDraw: (Trace trace) async {
                        _trace = trace;
                        sendDrawSegment(false);
                      },
                    ),
                  ),
                  PositionedDirectional(
                    top: 4,
                    end: 4,
                    child: GuessQueueCountDown(
                      room: widget.room,
                      countDownTime: widget.countDownTime,
                      timeOutCallback: timeOut,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Util.width - 32,
              height: 46,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12),
                  bottomEnd: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  const ControlBar(
                    drawing: true,
                    needBorder: false,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      sendDrawSegment(true);
                      widget.room.playShortAudio('guess_queue_draw_done.mp3',
                          path: 'packages/draw_guess/assets/sound/');
                    },
                    child: Container(
                      width: 72,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFF737BFF),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.guess_queue_draw_done,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 时间到
  void timeOut() {
    sendDrawSegment(true);
  }

  bool isSending = false;

  /// 提交图画轨迹
  void sendDrawSegment(bool finish) async {
    if (isSending) {
      return;
    }
    isSending = true;

    try {
      _trace ??= Trace(
          segments: [],
          boardSize: _key.currentState?.boxSize ?? const Size(336, 235));

      String img = _traceCodec.encode(_trace!);
      GuessQueueModel model = context.read<GuessQueueModel>();
      await GuessQueueRepo.submitDrawImg(
          widget.room.rid, img, '${model.value.lineId}', finish ? 1 : 0);
    } catch (e) {
      Log.d('$e');
    }

    isSending = false;
  }
}
