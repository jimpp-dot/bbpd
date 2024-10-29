import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/guess/src/audience_board.dart';
import 'package:draw_guess/src/room/guess/src/codec.dart';
import 'package:draw_guess/src/room/guess/src/trace.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_gift_button.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'guess_queue_board_container.dart';

class GuessQueueReplayBoard extends StatefulWidget {
  final ChatRoomData room;

  const GuessQueueReplayBoard({super.key, required this.room});

  @override
  GuessQueueRePlayState createState() => GuessQueueRePlayState();
}

class GuessQueueRePlayState extends State<GuessQueueReplayBoard> {
  Trace? totalTrace;
  Trace? _trace;
  int durationTotal = 2000;
  late int durationPerSegment;
  Timer? _timer;
  int _index = 0;
  final TraceCodec _traceCodec = const TraceCodec();
  String? showImg;
  bool showGuess = false;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() {
    _stop();
    showGuess = false;
    _index = 0;

    showImg = widget
        .room.config?.guessQueueRoomConfigData?.replay?.drawerInfo?.guessImage;

    playShowGuessAudio();
    showGuessDelay();

    if (Util.isStringEmpty(showImg)) {
      totalTrace = null;
      return;
    }
    totalTrace = _traceCodec.decode(showImg!);
    _trace = Trace(segments: [], boardSize: totalTrace!.boardSize);
    int len = totalTrace!.segments.length;
    if (len > 1) {
      durationPerSegment = durationTotal ~/ len;
    } else if (len == 1) {
      durationPerSegment = 1000;
    } else {
      durationPerSegment = durationTotal;
    }

    if (durationPerSegment <= durationTotal) {
      _timer =
          Timer.periodic(Duration(milliseconds: durationPerSegment), _onTimer);
    }
  }

  void showGuessDelay() async {
    Future.delayed(const Duration(milliseconds: 4500), () {
      showGuess = true;
      refresh();
    });
  }

  void playShowGuessAudio() async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!mounted) {
        return;
      }
      widget.room.playShortAudio('guess_show_guess_text.mp3',
          path: 'packages/draw_guess/assets/sound/');
    });
  }

  void _onTimer(Timer timer) {
    _index++;
    if (totalTrace?.segments == null ||
        totalTrace!.segments.isEmpty ||
        _index > totalTrace!.segments.length) {
      _stop();
      return;
    }

    _trace?.updateSegments(totalTrace!.segments.sublist(0, _index));
  }

  _stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void didUpdateWidget(covariant GuessQueueReplayBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.room.config?.guessQueueRoomConfigData?.replay?.drawerInfo
            ?.guessImage !=
        showImg) {
      _init();
    }
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelfDraw =
        widget.room.config?.guessQueueRoomConfigData?.replay?.drawerInfo?.uid ==
            Session.uid;
    List<Gift>? gifts = widget.room.config?.guessQueueRoomConfigData?.gift;
    Gift? gift1, gift2;
    if (gifts?.isNotEmpty ?? false) {
      gift1 = gifts![0];
      if (gifts.length > 1) {
        gift2 = gifts[1];
      }
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        (totalTrace == null)
            ? SizedBox(
                width: Util.width - 24,
                height: 46 + guessQueueDrawHeight(),
              )
            : SizedBox(
                width: Util.width - 24,
                height: 46 + guessQueueDrawHeight(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: guessQueueDrawHeight(),
                      width: 336.0 / 235 * guessQueueDrawHeight(),
                      child: AudienceBoard(_trace,
                          eraseColor: const Color(0xFFFDF8F2)),
                    ),
                  ],
                ),
              ),
        if (showGuess)
          PositionedDirectional(
            bottom: 18,
            height: 24,
            start: 0,
            end: 0,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: _replayIconTitleItem(),
            ),
          ),
        PositionedDirectional(
          end: 6,
          width: 40,
          child: Container(
            padding: const EdgeInsetsDirectional.only(bottom: 60),
            child: isSelfDraw
                ? _buildShare()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (gift1 != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 12),
                          child: GuessQueueGiftButton(
                            gift: gift1,
                            room: widget.room,
                            toUid: widget.room.config?.guessQueueRoomConfigData
                                    ?.replay?.drawerInfo?.uid ??
                                0,
                            isFirst: true,
                          ),
                        ),
                      if (gift2 != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 12),
                          child: GuessQueueGiftButton(
                            gift: gift2,
                            room: widget.room,
                            toUid: widget.room.config?.guessQueueRoomConfigData
                                    ?.replay?.drawerInfo?.uid ??
                                0,
                            isFirst: false,
                          ),
                        ),
                      _buildShare(),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildShare() {
    return GestureDetector(
      onTap: _share,
      child: R.img(Assets.draw_guess$ic_share_btn_svg, width: 40, height: 40),
    );
  }

  Widget _replayIconTitleItem() {
    double iconSize = 24;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconSize / 2),
            border: Border.all(width: 1, color: const Color(0xFF313131)),
          ),
          child: CommonAvatar(
            size: iconSize,
            path: widget.room.config?.guessQueueRoomConfigData?.replay
                    ?.guesserInfo?.icon ??
                '',
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          K.guess_guess_is,
          maxLines: 1,
          style: R.textStyle.medium14.copyWith(color: const Color(0xFF313131)),
        ),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            widget.room.config?.guessQueueRoomConfigData?.replay?.guesserInfo
                    ?.guessWord ??
                '',
            maxLines: 1,
            style:
                R.textStyle.medium14.copyWith(color: const Color(0xFF5955FA)),
          ),
        ),
      ],
    );
  }

  _share() {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(
      System.context,
      Session.uid,
      rid: widget.room.rid,
      tp: 202,
      lineId: widget.room.config?.guessQueueRoomConfigData?.replay?.ownerInfo
              ?.lineId ??
          0,
    );
  }
}
