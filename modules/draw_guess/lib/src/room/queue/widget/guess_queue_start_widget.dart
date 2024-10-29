import 'package:draw_guess/k.dart';
import 'package:draw_guess/assets.dart';
import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_beans.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import 'guess_queue_choose_words_widget.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/dart_extensions/extensions_common.dart';

class GuessQueueStartWidget extends StatefulWidget {
  final ChatRoomData room;
  final bool guessQueue;

  /// 倒计时到什么时间点，用这个时间跟房间timestamp比较，所有用户可以统一倒计时
  final int countDownTime;

  const GuessQueueStartWidget({
    super.key,
    required this.room,
    this.countDownTime = 0,
    this.guessQueue = false,
  });

  @override
  _GuessQueueStartWidgetState createState() => _GuessQueueStartWidgetState();
}

class _GuessQueueStartWidgetState extends State<GuessQueueStartWidget> {
  bool _queueModeSelected = true;

  Timer? _timer;
  int diff = 0;

  @override
  void initState() {
    super.initState();
    _queueModeSelected = widget.guessQueue;
    _init();

    eventCenter.addListener(EventConstant.EventGuessQueueStart, _emitStartGame);
  }

  @override
  void didUpdateWidget(GuessQueueStartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countDownTime != widget.countDownTime) {
      _init();
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventGuessQueueStart, _emitStartGame);

    _stop();
    super.dispose();
  }

  _onTimer(Timer timer) {
    int diffTime = widget.countDownTime - widget.room.timestamp;
    Log.d(diffTime);
    if (diffTime <= 0) {
      diffTime = 0;
      _stop();
    }
    diff = diffTime;
    refresh();
  }

  _init() {
    if (!widget.guessQueue) {
      return;
    }

    diff = widget.room.serverTime > 0
        ? ((widget.countDownTime) - (widget.room.timestamp ?? 0))
        : 0;
    if (diff <= 0) {
      diff = 0;
      return;
    }
    _start();
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(duration, _onTimer);
  }

  _stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    bool showStartGame = false;
    if (widget.guessQueue) {
      GuessQueueModel model = context.watch<GuessQueueModel>();
      showStartGame = model.value.state == GuessQueueState.Preparation;
      Log.d('showStart =  $showStartGame and state = ${model.value.state}');
    } else {
      showStartGame = true;
    }
    double width = 350;
    double height = 299;
    double borderRadius = 12;
    if (showStartGame) {
      width = 350;
      height = 299;
    } else {
      height = 299;
      width = 299;
    }

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(
            image: AssetImage(
              showStartGame
                  ? Assets.draw_guess$guess_start_bg_webp
                  : Assets.draw_guess$guess_start_bg_for_visitor_webp,
            ),
            fit: BoxFit.cover,
          )),
      child: showStartGame ? _buildStart() : _buildLeftTime(),
    ).toCenter();
  }

  Widget _buildLeftTime() {
    return Column(
      children: [
        const Spacer(),
        Text(
          K.guess_queue_wait_left_time(['$diff']),
          style: TextStyle(
              color: const Color(0xFF313131).withOpacity(0.4), fontSize: 13),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildStart() {
    String text = '';
    int action = 0;
    if (_showStartGame()) {
      text = K.guess_start_game;
      action = 0;
    } else {
      int position = widget.room.positionForCurrentUser?.position ?? -1;
      if (position >= 0) {
        text = K.guess_for_boss_start;
        action = 2;
      } else {
        text = K.guess_join_game;
        action = 1;
      }
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(top: 100.dp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 22),
              _buildModeWidget(true),
              const SizedBox(width: 15),
              _buildModeWidget(false),
              const SizedBox(width: 22),
            ],
          ),
          SizedBox(height: 10.dp),
          SizedBox(
              width: 330 / 3.dp,
              height: 126 / 3.dp,
              child: R
                  .img(
                Assets.draw_guess$ic_guess_queue_start,
                fit: BoxFit.cover,
                package: Assets.package,
              )
                  .onTap(() {
                if (action == 0) {
                  _startGame();
                } else if (action == 1) {
                  _joinGame();
                } else if (action == 2) {
                  //wait
                }
              })),
          SizedBox(height: 8.dp),
          if (widget.guessQueue == true)
            InkWell(
              onTap: _chooseWord,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.guess_choose_word_bank([
                      widget.room.config?.guessQueueRoomConfigData?.cateName ??
                          ''
                    ]),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  if (action == 0)
                    R
                        .img(
                          Assets.draw_guess$ic_guess_queue_drop_down_png,
                          width: 12,
                          height: 12,
                        )
                        .paddingOnly(left: 4),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildModeWidget(bool queue) {
    String decImg = queue
        ? Assets.draw_guess$guess_mode_queue_webp
        : Assets.draw_guess$guess_mode_normal_webp;
    String text = queue ? K.guess_queue_mode : K.guess_normal_mode;
    Color bgColor = queue ? const Color(0xFF625DFF) : const Color(0xFF8857FB);

    bool selected =
        (queue && _queueModeSelected) || (!queue && !_queueModeSelected);

    double width = 140;
    double height = 100;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [getCardBoxShadow()],
        image: DecorationImage(
          image: AssetImage(decImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (selected)
            PositionedDirectional(
              end: 0,
              top: 0,
              child: R.img(
                Assets.draw_guess$guess_select_mark_webp,
                width: 48 / 2.9,
                height: 48 / 2.9,
              ),
            ),
          PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: SizedBox(
                height: 50,
                child: Center(
                  child: YouSheText(
                    text,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    ).onTap(() async {
      if (selected) return;
      if (!_isCreatorOrReception()) {
        Fluttertoast.showToast(msg: K.guess_game_mode_switch_tip);
        return;
      }

      /// 切换模式
      if (!queue) {
        bool re = await _switchGameMode(MODE_GUESS_NORMAL);
        if (re) {
          _queueModeSelected = false;
          refresh();
        }
      } else {
        bool re = await _switchGameMode(MODE_GUESS_QUEUE);
        if (re) {
          _queueModeSelected = true;
          refresh();
        }
      }
    });
  }

  bool _showStartGame() {
    return widget.room.positions[0].uid == Session.uid;
  }

  /// 房主或接待
  bool _isCreatorOrReception() {
    return widget.room.createor?.uid == Session.uid || widget.room.isReception;
  }

  void _chooseWord() async {
    if (_showStartGame()) {
      WordCategory? category = await GuessQueueChooseWordWidget.show(
        context,
        widget.room.rid,
        cid: widget.room.config?.guessQueueRoomConfigData?.cateId ?? 0,
      );
      if (category != null) {
        BaseResponse response =
            await GuessQueueRepo.switchWord(widget.room.rid, category.cid);
        if (response.success == true) {
          refresh();
        } else {
          BaseResponse.toast(response);
        }
      }
    }
  }

  void _emitStartGame(String type, dynamic data) {
    _startGame();
  }

  void _startGame() async {
    /// 开始接龙模式
    if (_showStartGame() && _queueModeSelected && widget.guessQueue) {
      await GuessQueueRepo.startGame(widget.room.rid,
          widget.room.config?.guessQueueRoomConfigData?.cateId ?? 0);
    }

    /// 开始画猜常规模式
    if (_showStartGame() && !_queueModeSelected && !widget.guessQueue) {
      int inMicCounts = 0;
      for (var roomPosition in widget.room.positions) {
        IDrawGuessManager drawGuessManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_DRAW_GUESS);
        int originUid =
            drawGuessManager.getOriginUid(roomPosition.positionExpendData);
        if (roomPosition.uid > 0 || originUid > 0) {
          inMicCounts++;
        }
      }

      bool disabled = inMicCounts < 4;

      if (disabled) {
        Fluttertoast.showToast(
            msg: K.guess_player_not_enough, gravity: ToastGravity.CENTER);
      } else {
        widget.room.emit('room.game.guess.start');
      }
    }
  }

  void _joinGame() {
    /// 自由上麦
    if (widget.room.config?.mode == RoomMode.Auto) {
      RoomRepository.joinMic(widget.room.rid, -1, needCertify: true);
    } else {
      ChatRoomUtil.showWaitList(widget.room);
    }
  }

  Future<bool> _switchGameMode(String type) async {
    List<dynamic> p = [];
    p.add({"type": 'switch_room_type', "value": type});
    bool re =
        await RoomOptionSaveHelper.saveOptions(widget.room.rid, jsonEncode(p));
    return re;
  }
}
