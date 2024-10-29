import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_msg_handler.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/chat_room.dart';

import 'guess_queue_beans.dart';

class GuessQueueModel extends AbsRoomModel<GuessQueueData> {
  GuessQueueModel(GuessQueueData value) : super(value);

  static const TAG = 'GuessQueueModel';

  bool _isDispose = false;

  VoidCallback? endCallback;

  @override
  AbsRoomMsgHandler createMsgHandler(AbsRoomModel model, ChatRoomData room) {
    return GuessQueueMsgHandler(this, room);
  }

  void changeStateByConfig({bool fromSocket = false}) async {
    GuessQueueRoomConfigData? configData =
        room?.config?.guessQueueRoomConfigData;
    if (configData == null) {
      return;
    }

    Log.d(
        '$TAG fromSocket == $fromSocket and state = ${configData.toString()}');

    switch (configData.state) {
      case GuessQueueRoomConfigData.STATE_WAIT:
        value.state = GuessQueueState.Preparation;
        break;

      case GuessQueueRoomConfigData.STATE_DRAW:
        if (isPlayer()) {
          int catId = configData.cateId;
          int turns = configData.turns;
          RoomPosition? position = room?.positionForCurrentUser;
          if (turns == 1) {
            bool? choose = position?.guessQueueWordChoosed;
            if (choose == true) {
              bool? finish = position?.guessQueueIsFinish;
              if (finish == true) {
                value.state = GuessQueueState.WaitDrawing;
              } else {
                if (!fromSocket) {
                  DrawWordResp drawWordResp =
                      await GuessQueueRepo.getDrawWord(room?.rid);
                  value.drawWordResp = drawWordResp;
                }

                value.state = GuessQueueState.Drawing;
                value.lineId = position?.guessQueueLineId;
              }
            } else {
              if (value.state == GuessQueueState.Preparation) {
                eventCenter.emit(EventConstant.EventGuessQueueResultPageClose);
                value.state = GuessQueueState.BeginCountDown;
                value.catId = catId;
                if (!fromSocket) {
                  value.confirmWorResp =
                      await GuessQueueRepo.getQueueConfirmWords(room?.rid,
                          catId, room?.positionForCurrentUser?.position ?? 0);
                }
              }
            }
          } else {
            bool? finish = position?.guessQueueIsFinish;
            if (finish == true) {
              value.state = GuessQueueState.WaitDrawing;
            } else {
              if (!fromSocket) {
                DrawWordResp drawWordResp =
                    await GuessQueueRepo.getDrawWord(room?.rid);
                value.drawWordResp = drawWordResp;
              }
              value.state = GuessQueueState.Drawing;
              value.lineId = position?.guessQueueLineId;
            }
          }
        } else {
          value.state = GuessQueueState.WaitDrawing;
        }
        break;

      case GuessQueueRoomConfigData.STATE_GUESS:
        if (isPlayer()) {
          RoomPosition? position = room?.positionForCurrentUser;
          if (position?.guessQueueIsFinish == true) {
            value.state = GuessQueueState.WaitGuessWord;
          } else {
            value.state = GuessQueueState.GuessWord;
            if (!fromSocket) {
              GuessImgResp guessImgResp =
                  await GuessQueueRepo.getImages(room?.rid);
              value.guessImgResp = guessImgResp;
            }
          }
        } else {
          value.state = GuessQueueState.GuessWord;
        }
        break;

      case GuessQueueRoomConfigData.STATE_PRE_REPLAY:
        value.state = GuessQueueState.BeginReplay;
        break;

      case GuessQueueRoomConfigData.STATE_REPLAY:
        value.state = GuessQueueState.ReplayingDraw;
        break;

      case GuessQueueRoomConfigData.STATE_REPLAY_COMMENT:
        value.state = GuessQueueState.Judgment;
        break;

      case GuessQueueRoomConfigData.STATE_REPLAY_LIKE:
        if (room?.config?.guessQueueRoomConfigData?.replayLike?.like != null) {
          value.state = GuessQueueState.SelectPictureEnd;
        } else {
          value.state = GuessQueueState.SelectPicture;
        }
        break;
      case GuessQueueRoomConfigData.STATE_RESULT:
        //value.state = GuessQueueState.SelectPictureEnd;
        break;
    }
    notify();
    await (msgHandler as GuessQueueMsgHandler).playBgm(value.state);
  }

  void micListChange() {
    if (isPlayer()) {
      RoomPosition? position = room?.positionForCurrentUser;
      Log.d(
          '$TAG micListChange......guess_queue_is_finish...finish = ${position?.guessQueueIsFinish}');
      if (value.state == GuessQueueState.Drawing) {
        if (position?.guessQueueIsFinish == true) {
          value.state = GuessQueueState.WaitDrawing;
        }
      } else if (value.state == GuessQueueState.GuessWord) {
        if (position?.guessQueueIsFinish == true) {
          value.state = GuessQueueState.WaitGuessWord;
        }
      }
    }
    notify();
  }

  bool isPlayer() {
    return (room?.positionForCurrentUser?.position ?? -1) >= 0;
  }

  void refreshState(GuessQueueState state, {dynamic data}) async {
    value.state = state;
    notify();
    await (msgHandler as GuessQueueMsgHandler).playBgm(state);
  }

  void notify() {
    if (_isDispose) return;
    notifyListeners();
  }

  bool isPlaying() {
    return GUESS_QUEUE_PLAYING_STATE.contains(value.state);
  }

  ///开始倒计时结束
  beginCountDownFinish() {
    refreshState(GuessQueueState.SelectWord);
  }

  _onSelectWordSuccess() async {
    DrawWordResp drawWordResp = await GuessQueueRepo.getDrawWord(room?.rid);
    value.state = GuessQueueState.Drawing;
    value.drawWordResp = drawWordResp;
    RoomPosition? position = room?.positionForCurrentUser;
    value.lineId = position?.guessQueueLineId;
    notify();
  }

  Future<BaseResponse> submitConfirmWord(String wordId) async {
    BaseResponse rsp =
        await GuessQueueRepo.submitConfirmWord(room?.rid, wordId);

    if (rsp.success == true) {
      _onSelectWordSuccess();
    }
    return rsp;
  }

  void loadQueueConfirmWords() async {
    value.confirmWorResp = await GuessQueueRepo.getQueueConfirmWords(
        room?.rid, value.catId, room?.positionForCurrentUser?.position ?? 0);
    notify();
  }

  @override
  void dispose() {
    _isDispose = true;
    (msgHandler as GuessQueueMsgHandler).clearBgm();
    super.dispose();
  }

  @override
  void loadData() {}
}
