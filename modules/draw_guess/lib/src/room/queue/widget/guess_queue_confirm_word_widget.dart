import 'dart:math';

import 'package:draw_guess/assets.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_beans.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_board_container.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_count_down.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:provider/provider.dart' hide Selector;

/// 画猜接龙确认选词
class GuessQueueConfirmWordWidget extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;
  final GuessQueueConfirmWordRsp? resp;

  const GuessQueueConfirmWordWidget({
    super.key,
    required this.room,
    required this.countDownTime,
    this.resp,
  });

  @override
  _GuessQueueConfirmWordWidgetState createState() =>
      _GuessQueueConfirmWordWidgetState();
}

class _GuessQueueConfirmWordWidgetState
    extends State<GuessQueueConfirmWordWidget> {
  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: guessQueueDrawHeight(),
          child: _buildBody(),
        ),
        if (widget.resp?.success ?? false)
          PositionedDirectional(
            top: 4,
            end: 12,
            child: GuessQueueCountDown(
              room: widget.room,
              countDownTime: widget.countDownTime,
              timeOutCallback: timeOut,
            ),
          ),
      ],
    );
  }

  _buildBody() {
    if (widget.resp == null) {
      return const Center(child: CupertinoActivityIndicator());
    }

    if (!(widget.resp!.success == true) ||
        (widget.resp!.data?.list?.isEmpty ?? true)) {
      return EmptyWidget(
        size: guessQueueDrawHeight() - 50,
        paddingBottom: 0,
        onTap: () {
          GuessQueueModel model = context.read<GuessQueueModel>();
          model.loadQueueConfirmWords();
        },
        desc: widget.resp!.msg ?? base.K.no_data,
      );
    }

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widget.resp!.data!.list!.map((e) => _buildItem(e)).toList(),
    );
  }

  Widget _buildItem(GuessQueueConfirmWordData data) {
    bool select =
        _selectIndex > -1 && widget.resp!.data!.list![_selectIndex] == data;
    double width = (Util.width - 42 * 2 - 16) / 2.0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        _selectIndex = widget.resp!.data!.list!.indexOf(data);
        _submitWord(data.wordId);
        refresh();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: width,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
              width: 3,
              color: select ? const Color(0xFF343434) : Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: select
              ? const Color(0XFF737BFF)
              : const Color(0XFF737BFF).withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (select) ...[
              R.img(Assets.draw_guess$guess_queue_confirm_word_done_webp,
                  width: 16, height: 16),
              const SizedBox(width: 2),
            ],
            FlutterAutoText(
              width: width - (select ? 30.0 : 10.0),
              text: data.word ?? '',
              textSize: 15,
              minTextSize: 2,
              textColor: select ? Colors.white : const Color(0xFF242528),
            ),
          ],
        ),
      ),
    );
  }

  /// 提交猜词答案
  void _submitWord(String? wordId) async {
    if (Util.isStringEmpty(wordId)) return;

    GuessQueueModel model = context.read<GuessQueueModel>();
    BaseResponse rsp = await model.submitConfirmWord(wordId!);
    if (rsp.success != true) {
      Fluttertoast.showCenter(msg: rsp.msg ?? base.K.data_error);
    }
  }

  /// 超时随机一个词提交
  void timeOut() {
    List<GuessQueueConfirmWordData> result = widget.resp?.data?.list ?? [];

    if (result.isNotEmpty) {
      int index = Random().nextInt(result.length);
      _submitWord(result[index].wordId);
    }
  }
}

class FlutterAutoText extends StatefulWidget {
  final String text;
  final double width;
  final double minTextSize;
  final double textSize;
  final Color textColor;

  const FlutterAutoText({
    super.key,
    required this.text,
    required this.width,
    required this.minTextSize,
    required this.textColor,
    required this.textSize,
  });

  @override
  State<StatefulWidget> createState() => AutoTextState();
}

class AutoTextState extends State<FlutterAutoText>
    with TickerProviderStateMixin {
  final GlobalKey _autoTextKey = GlobalKey();

  double _fontSize = 0;
  late TextPainter _textPainter;
  late TextStyle _textFieldTextStyle;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _fontSize = widget.textSize;
    _textFieldTextStyle =
        TextStyle(fontSize: _fontSize, color: widget.textColor);
    _textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: widget.text,
        style: _textFieldTextStyle,
      ),
    );
    _textPainter.layout();
    var textWidth = _textPainter.width; // 当前没有缩放前的text宽度
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addStatusListener((status) {
        double containerWidth = widget.width; //始终是-2
        if (status == AnimationStatus.completed) {
          var fontSize = _textFieldTextStyle.fontSize ?? _fontSize;
          if (textWidth > containerWidth) {
            while (
                textWidth > containerWidth && fontSize > widget.minTextSize) {
              fontSize -= 0.5;
              _textPainter.text = TextSpan(
                text: widget.text,
                style: _textFieldTextStyle.copyWith(fontSize: fontSize),
              );
              _textPainter.layout();
              textWidth = _textPainter.width;
            }
            setState(() {
              _fontSize = fontSize;
            });
          }
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
      child: Text(
        widget.text,
        key: _autoTextKey,
        style: _textFieldTextStyle.copyWith(
            fontSize: _fontSize, color: widget.textColor),
      ),
    );
  }
}
