import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import 'guess_queue_beans.dart';

enum GuessQueueBgm {
  // CountDown,
  Draw,
  RePlay,
}

class GuessQueueMsgHandler extends AbsRoomMsgHandler {
  GuessQueueMsgHandler(ChangeNotifier model, ChatRoomData room)
      : super(model, room);

  GuessQueueBgm? bgm;

  @override
  void handleMsg(String name, dynamic data) async {
    if (name == RoomConstant.EVENT_REFRESH_GUESS_QUEUE_CONFIG) {
      //GuessQueueRoomConfigData configData = obj;
    } else if (name == RoomConstant.EVENT_REFRESH_MIC_LIST) {
      _model.micListChange();
    } else {
      if (data is! Map) return;
      if (data['data'] is! Map) return;
      Map dataMap = data['data'];
      String action = dataMap['name'];
      Log.d('action = $action, data = $dataMap');
      //_model.changeStateByConfig(fromSocket: true);

      switch (action) {
        case GuessQueueMsgEvent.EVENT_START_DRAW:
          int turns = Util.parseInt(dataMap['turns']);

          /// 第一轮默认选词, 选完词再画
          if (turns == 1) {
            //_model.value.state = GuessQueueState.BeginCountDown;
            int cid = Util.parseInt(dataMap['cate_id']);
            _model.value.catId = cid;
            _model.value.confirmWorResp =
                await GuessQueueRepo.getQueueConfirmWords(room?.rid, cid,
                    room?.positionForCurrentUser?.position ?? 0);
          } else {
            DrawWordResp drawWordResp =
                await GuessQueueRepo.getDrawWord(room?.rid);
            //_model.value.state = GuessQueueState.Drawing;
            _model.value.drawWordResp = drawWordResp;
          }
          break;
        case GuessQueueMsgEvent.EVENT_START_GUESS:
          //_model.value.state = GuessQueueState.GuessWord;
          _model.value.guessImgResp = null;
          GuessImgResp guessImgResp = await GuessQueueRepo.getImages(room?.rid);
          _model.value.guessImgResp = guessImgResp;
          break;

        case GuessQueueMsgEvent.EVENT_REPLAY:
          //_model.value.state = GuessQueueState.BeginReplay;
          break;

        case GuessQueueMsgEvent.EVENT_REPLAY_COMMENT:
          //_model.value.state = GuessQueueState.Judgment;
          break;

        case GuessQueueMsgEvent.EVENT_REPLAY_LIKE:
          //_model.value.state = GuessQueueState.SelectPicture;
          break;

        case GuessQueueMsgEvent.EVENT_LIKE_RESULT:
          //_model.value.state = GuessQueueState.SelectPictureEnd;
          break;

        case GuessQueueMsgEvent.EVENT_END:
          //_model.value.state = GuessQueueState.End;
          _model.endCallback?.call();
          break;
      }
    }

    _model.changeStateByConfig(fromSocket: true);
  }

  clearBgm() async {
    if (bgm != null) {
      await AudioPlayHelper.instance().closeSound();
      bgm = null;
    }
  }

  playBgm(GuessQueueState state) async {
    if (bgm != GuessQueueBgm.Draw &&
        (state == GuessQueueState.SelectWord ||
            state == GuessQueueState.Drawing ||
            state == GuessQueueState.WaitDrawing ||
            state == GuessQueueState.GuessWord ||
            state == GuessQueueState.WaitGuessWord)) {
      await AudioPlayHelper.instance().closeSound();
      bgm = GuessQueueBgm.Draw;
      await AudioPlayHelper.instance().playAudio('guess_draw_bgm.mp3',
          path: 'packages/draw_guess/assets/sound/', loop: true);
    } else if (bgm != GuessQueueBgm.RePlay &&
        (state == GuessQueueState.BeginReplay ||
            state == GuessQueueState.ReplayingDraw ||
            state == GuessQueueState.Judgment ||
            state == GuessQueueState.SelectPicture ||
            state == GuessQueueState.SelectPictureEnd)) {
      await AudioPlayHelper.instance().closeSound();
      bgm = GuessQueueBgm.RePlay;
      await AudioPlayHelper.instance().playAudio('guess_replay_bgm.mp3',
          path: 'packages/draw_guess/assets/sound/', loop: true);
    } else if (bgm != null &&
        (state == GuessQueueState.End ||
            state == GuessQueueState.Preparation)) {
      clearBgm();
    }
  }

  GuessQueueModel get _model => model as GuessQueueModel;

  @override
  List<String> get msgList => [
        RoomConstant.Event_Refresh_GUESS_QUEUE,
        RoomConstant.EVENT_REFRESH_GUESS_QUEUE_CONFIG,
        RoomConstant.EVENT_REFRESH_MIC_LIST
      ];
}

class GuessQueueMsgEvent {
  static const _PREFIX = 'guess';

  /// 开始画
  static const EVENT_START_DRAW = "$_PREFIX.start.draw";

  /// 开始猜
  static const EVENT_START_GUESS = "$_PREFIX.start.guess";

  /// 开始复盘
  static const EVENT_REPLAY = "$_PREFIX.start.replay";

  /// 复盘投票
  static const EVENT_REPLAY_COMMENT = '$_PREFIX.start.replay.comment';

  /// 复盘选喜欢的画/及展示喜欢的画
  static const EVENT_REPLAY_LIKE = '$_PREFIX.start.replay.like';

  /// 公布喜欢的结果
  static const EVENT_LIKE_RESULT = '$_PREFIX.replay.like.result';

  /// 公布结果
  static const EVENT_END = "$_PREFIX.end";
}
