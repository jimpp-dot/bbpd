import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:draw_guess/src/room/queue/widget/guess_begin_replay_widget.dart';
import 'package:draw_guess/src/room/queue/widget/guess_count_down_widget.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_board_container.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_confirm_word_widget.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_guess_widget.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_judgment_widget.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_replay_board.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_result_rank_page.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_select_pic.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_wait_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import '../guess_queue_config.dart';
import 'guess_queue_board_header.dart';
import 'guess_queue_draw_widget.dart';
import 'guess_queue_select_img_result.dart';
import 'guess_queue_start_widget.dart';
import 'guess_queue_mic_list.dart';
import 'package:provider/provider.dart' hide Selector;

/// 画猜接龙主界面
class GuessQueueWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback? onSettingClick;

  const GuessQueueWidget({super.key, required this.room, this.onSettingClick});

  @override
  State<StatefulWidget> createState() => _GuessQueueWidgetState();
}

class _GuessQueueWidgetState extends State<GuessQueueWidget>
    with
        RoomTemplateMixin<GuessQueueWidget>,
        RoomFloatingBannerMixin<GuessQueueWidget> {
  late final GuessQueueModel _model;

  @override
  void initState() {
    super.initState();
    _model = GuessQueueModel(GuessQueueData.state(GuessQueueState.Preparation))
      ..init(_room);
    _model.changeStateByConfig();
    _model.endCallback = _showResultRankPage;

    eventCenter.addListener(EventConstant.EventGuessQueueEnd, _endGame);
  }

  ChatRoomData get _room => widget.room;

  GuessQueueState get state => _model.value.state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GuessQueueModel>.value(
      value: _model,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        renderBg(context, _room),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: 0.0,
          height: Util.height - Util.iphoneXBottom,
          child: _buildMain(),
        ),
        // PositionedDirectional(
        //   end: 0,
        //   bottom: preMadeRecruitBottom,
        //   child: buildFloatingBanner(widget.room),
        // ),
        ...renderExtra(context, _room),
      ],
    );
  }

  Widget _buildMain() {
    return Column(
      children: [
        renderRoomHeader(
          _room,
          widget.onSettingClick,
        ),
        LeftTopRecruitWidget(
            room: _room,
            margin: const EdgeInsetsDirectional.only(start: 13, bottom: 10)),
        Consumer<GuessQueueModel>(builder: (context, data, _) {
          return _buildBoard(data);
        }),
        SizedBox(height: 20.dp),
        GuessQueueMicList(
          room: _room,
        ),
        renderMessageList(_room),
        renderController(_room),
      ],
    );
  }

  Widget _buildBoard(GuessQueueModel guessQueueModel) {
    bool isPrepare = guessQueueModel.value.state == GuessQueueState.Preparation;
    int position = _room.positionForCurrentUser?.position ?? -1;
    bool isPlayingNotPlayer = guessQueueModel.isPlaying() && position == -1;
    bool showStart = isPrepare || isPlayingNotPlayer;

    if (showStart) {
      return GuessQueueStartWidget(
        room: _room,
        guessQueue: true,
        countDownTime:
            _room.config?.guessQueueRoomConfigData?.replayStartTime ?? 0,
      );
    }
    return GuessQueueBoardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GuessQueueBoardHeader(guessQueueModel.value, _room),
          _buildBoardContent(guessQueueModel),
        ],
      ),
    );
  }

  Widget _buildBoardContent(GuessQueueModel model) {
    switch (model.value.state) {
      case GuessQueueState.SelectWord:
        return GuessQueueConfirmWordWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          resp: model.value.confirmWorResp,
        );
      case GuessQueueState.Drawing:
        return GuessQueueDrawWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          data: _model.value,
        );
      case GuessQueueState.GuessWord:
        return GuessQueueGuessWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          trace: _model.value.guessImgResp?.data?.image ?? '',
        );
      case GuessQueueState.WaitGuessWord:
      case GuessQueueState.WaitDrawing:
        return GuessQueueWaitWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          state: state,
        );
      case GuessQueueState.BeginCountDown:
        return Expanded(
            child: GuessCountDownWidget(model.beginCountDownFinish, _room));
      case GuessQueueState.BeginReplay:
        return const Expanded(child: GuessBeginReplayWidget());
      case GuessQueueState.ReplayingDraw:
        return GuessQueueReplayBoard(
          room: _room,
        );
      case GuessQueueState.Judgment:
        return GuessQueueJudgmentWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
        );
      case GuessQueueState.SelectPicture:
        if (_room.config?.guessQueueRoomConfigData?.replayLike?.lineUid ==
            Session.uid) {
          return GuessQueueSelect(
            room: _room,
            countDownTime:
                _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          );
        }
        return GuessQueueWaitWidget(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
          showShare: true,
          state: state,
        );
      case GuessQueueState.SelectPictureEnd:
        return GuessQueueSelectImgResult(
          room: _room,
          countDownTime: _room.config?.guessQueueRoomConfigData?.deadline ?? 0,
        );
      case GuessQueueState.Preparation:
      case GuessQueueState.End:
        break;
    }
    return const SizedBox.shrink();
  }

  void _showResultRankPage() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (!mounted) return;
      GuessQueueResultRankPage.show(context, _room.rid);
    });
  }

  /// 1号麦结束游戏
  void _endGame(String type, dynamic data) async {
    BaseResponse res = await GuessQueueRepo.endGame(_room.rid);
    if (res.success == true) {
    } else if (res.msg?.isNotEmpty ?? false) {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventGuessQueueEnd, _endGame);
    _model.dispose();

    super.dispose();
  }
}
