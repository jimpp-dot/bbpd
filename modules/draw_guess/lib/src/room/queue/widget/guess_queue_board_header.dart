import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

class GuessQueueBoardHeader extends StatefulWidget {
  final GuessQueueData data;
  final ChatRoomData room;

  const GuessQueueBoardHeader(this.data, this.room, {super.key});

  @override
  _GuessQueueBoardHeaderState createState() => _GuessQueueBoardHeaderState();
}

class _GuessQueueBoardHeaderState extends State<GuessQueueBoardHeader> {
  @override
  Widget build(BuildContext context) {
    Widget? content = _buildContent();
    if (content == null) return const SizedBox.shrink();
    return SizedBox(
      height: 62,
      child: Column(
        children: [
          Expanded(child: content),
          _buildDotLine(),
        ],
      ),
    );
  }

  Widget? _buildContent() {
    switch (widget.data.state) {
      case GuessQueueState.SelectWord:
        return _buildTitleHeader(K.guess_select_your_word);
      case GuessQueueState.Drawing:
        return _buildDrawingHeader();
      case GuessQueueState.GuessWord:
        return _buildGuessWordHeader();
      case GuessQueueState.WaitDrawing:
        return _buildTitleHeader(K.guess_wait_other_people_finish_draw);
      case GuessQueueState.WaitGuessWord:
        return _buildTitleHeader(K.guess_wait_other_people_guess);
      case GuessQueueState.ReplayingDraw:
        return _buildReplayingHeader();
      case GuessQueueState.SelectPicture:
        return _buildSelectPicHeader();
      case GuessQueueState.SelectPictureEnd:
        return _buildSelectPicHeader();
      case GuessQueueState.Preparation:
      case GuessQueueState.BeginCountDown:
      case GuessQueueState.BeginReplay:
      case GuessQueueState.Judgment:
      case GuessQueueState.End:
        return null;
    }
  }

  Widget _buildTitleHeader(String title) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(
        title,
        style: R.textStyle.medium16
            .copyWith(color: const Color(0xFF5955FA), fontSize: 15),
      ),
    );
  }

  Widget _buildDrawingHeader() {
    bool hasFrom = false;
    bool hasTo = false;
    if (Util.parseInt(widget.data.drawWordResp?.data?.prev?.uid) > 0) {
      hasFrom = true;
    }
    if (Util.parseInt(widget.data.drawWordResp?.data?.next?.uid) > 0) {
      hasTo = true;
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleItem(K.guess_from, false, hasFrom),
              _arrowIconItem(hasFrom),
              _titleItem(K.guess_please_draw, true, true),
              _arrowIconItem(hasTo),
              _titleItem(K.guess_give_to, false, hasTo),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              _iconItem(hasFrom ? _preIcon : '', hasFrom),
              Expanded(
                child: Text(
                  widget.data.drawWordResp?.data?.word ?? '',
                  style: R.textStyle.medium16
                      .copyWith(color: const Color(0xFF5955FA)),
                  textAlign: TextAlign.center,
                ),
              ),
              _iconItem(hasTo ? _nextIcon : '', hasTo)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuessWordHeader() {
    bool hasFrom = false;
    bool hasTo = false;
    if (Util.parseInt(widget.data.guessImgResp?.data?.prev?.uid) > 0) {
      hasFrom = true;
    }
    if (Util.parseInt(widget.data.guessImgResp?.data?.next?.uid) > 0) {
      hasTo = true;
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleItem(K.guess_from, false, hasFrom),
              _arrowIconItem(hasFrom),
              _titleItem(K.guess_please_guess_word, true, true),
              _arrowIconItem(hasTo),
              _titleItem(K.guess_give_to, false, hasTo),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              _iconItem(hasFrom ? _preIcon : '', hasFrom),
              const Spacer(),
              _iconItem(hasTo ? _nextIcon : '', hasTo)
            ],
          ),
        ],
      ),
    );
  }

  String get _preIcon => widget.data.guessImgResp?.data?.prev?.icon ?? '';

  String get _nextIcon => widget.data.guessImgResp?.data?.next?.icon ?? '';

  Widget _titleItem(String title, bool select, bool showContent) {
    if (!showContent) {
      return const SizedBox(width: 43);
    }
    Color bgColor = select ? const Color(0xFF737BFF) : const Color(0xFFB6B6B6);
    return Container(
      width: 43,
      height: 20,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: R.textStyle.medium12.copyWith(fontSize: 11, color: Colors.white),
      ),
    );
  }

  Widget _iconItem(String path, bool showContent) {
    if (!showContent) {
      return const SizedBox(width: 43);
    }
    return Container(
      width: 43,
      alignment: AlignmentDirectional.center,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1, color: const Color(0xFF313131)),
        ),
        child: CommonAvatar(
          size: 28,
          path: path,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _arrowIconItem(bool showContent) {
    if (!showContent) {
      return const SizedBox(width: 31);
    }
    return Container(
      alignment: AlignmentDirectional.center,
      height: 10,
      child: R.img(Assets.draw_guess$ic_big_arrow_svg, width: 31, height: 10),
    );
  }

  Widget _buildReplayingHeader() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 8),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 20,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: const Color(0xFFB6B6B6),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              K.guess_which_turns([
                '${widget.room.config?.guessQueueRoomConfigData?.replay?.currentTurns ?? ''}',
                '${widget.room.config?.guessQueueRoomConfigData?.replay?.totalTurns ?? ''}'
              ]),
              style: R.textStyle.medium12
                  .copyWith(fontSize: 11, color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: _replayIconTitleItem(
                widget.room.config?.guessQueueRoomConfigData?.replay?.drawerInfo
                        ?.lastGuessWord ??
                    '',
                widget.room.config?.guessQueueRoomConfigData?.replay?.drawerInfo
                        ?.icon ??
                    '',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _replayIconTitleItem(String title, String path) {
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
            path: path,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          K.guess_on_base,
          maxLines: 1,
          style: R.textStyle.medium14.copyWith(color: const Color(0xFF313131)),
        ),
        const SizedBox(width: 2),
        Flexible(
            child: Text(
          title,
          maxLines: 1,
          style: R.textStyle.medium14.copyWith(color: const Color(0xFF5955FA)),
        )),
        const SizedBox(width: 2),
        Text(
          K.guess_draw_des,
          maxLines: 1,
          style: R.textStyle.medium14.copyWith(color: const Color(0xFF313131)),
        ),
      ],
    );
  }

  Widget _buildSelectPicHeader() {
    String str = K.guess_is_selecting_pic;
    if (widget.data.state == GuessQueueState.SelectPictureEnd) {
      str = K.guess_like_most_pic;
    }
    String icon =
        widget.room.config?.guessQueueRoomConfigData?.replayLike?.lineIcon ??
            '';
    return Container(
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: const Color(0xFF313131)),
            ),
            child: CommonAvatar(
              path: icon,
              shape: BoxShape.circle,
              size: 30,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            str,
            style: R.textStyle.medium14
                .copyWith(color: const Color(0xFF5955FA), fontSize: 15),
          )
        ],
      ),
    );
  }

  _buildDotLine() {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Color(0xFFE7DBCC),
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }
}
