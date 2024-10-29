import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import '../../../chat_room.dart';
import 'lottery_ui_helper.dart';

/// 房间获奖对话框
class LotteryCongratulationsDialog extends StatefulWidget {
  final LotteryDraw draw;

  const LotteryCongratulationsDialog(this.draw, {super.key});

  @override
  _LotteryCongratulationsDialogState createState() =>
      _LotteryCongratulationsDialogState();

  static Future<T?> show<T>(BuildContext context, LotteryDraw draw) {
    return LotteryUiHelper.showLotteryDialog(
        context, LotteryCongratulationsDialog(draw));
  }
}

class _LotteryCongratulationsDialogState
    extends State<LotteryCongratulationsDialog> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(RoomConstant.Event_Room_Lottery_Start, _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.Event_Room_Lottery_Start, _onEvent);
    super.dispose();
  }

  void _onEvent(String name, dynamic data) {
    if (!mounted) return;
    if (LotteryManager.instance.isSameLottery(widget.draw.lotteryId)) return;
    if (ModalRoute.of(context)?.isCurrent ?? false) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(16))),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    String text;
    if (widget.draw.win) {
      text = widget.draw.joinWay == LotteryType.TYPE_GIFT
          ? K.room_lottery_gift_con_content
          : K.room_lottery_congratulations_content;
    } else {
      text = K.room_lottery_result_no_get;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Text(
          widget.draw.win
              ? K.room_lottery_congratulations_title
              : K.room_lottery_sorry,
          style: TextStyle(
              fontSize: 18,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildIKnowButton(context)
      ],
    );
  }

  /// "我知道了"按钮
  Widget _buildIKnowButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 48,
        margin: const EdgeInsetsDirectional.only(
            top: 24, bottom: 24, start: 24, end: 24),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 13),
        alignment: AlignmentDirectional.center,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0XFFF71C6F), Color(0XFFFA9E61)]),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              K.room_btn_confirm,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
