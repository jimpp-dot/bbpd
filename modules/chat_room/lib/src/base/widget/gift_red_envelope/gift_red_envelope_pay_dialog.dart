import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../../assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as CommonCore;
import '../../../../chat_room.dart';

/// 礼物红包支付确认弹窗
class GiftRedEnvelopePayDialog extends StatefulWidget {
  final ChatRoomData room;
  final int totalMoney;
  final int durationId;
  final int beginTimeId;
  final int redId;

  const GiftRedEnvelopePayDialog({
    Key? key,
    required this.room,
    required this.totalMoney,
    required this.durationId,
    required this.beginTimeId,
    required this.redId,
  }) : super(key: key);

  @override
  State<GiftRedEnvelopePayDialog> createState() =>
      _GiftRedEnvelopePayDialogState();

  static Future show(BuildContext context, ChatRoomData room, int totalMoney,
      int durationId, int beginTimeId, int redId) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color(0xB3000000),
      builder: (context) => GiftRedEnvelopePayDialog(
          room: room,
          totalMoney: totalMoney,
          durationId: durationId,
          beginTimeId: beginTimeId,
          redId: redId),
    );
  }
}

class _GiftRedEnvelopePayDialogState extends State<GiftRedEnvelopePayDialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 14.dp,
        color: const Color(0xE6000000),
        fontWeight: FontWeight.w400);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 290.dp,
        width: 280.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.dp),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC2D4),
              Color(0xFFFFE6E0),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF), // 两次相同颜色保持颜色段的平滑过渡
            ],
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: -50.dp,
              end: 0,
              child: Column(
                children: [
                  R.img(
                      RoomAssets
                          .chat_room$gift_red_envelope_gift_red_envelope_pay_bg_webp,
                      width: 280.dp,
                      height: 160.dp,
                      fit: BoxFit.contain),
                  R.img(
                      RoomAssets
                          .chat_room$gift_red_envelope_pay_red_envelope_bg_webp,
                      width: 64.dp,
                      height: 19.dp,
                      fit: BoxFit.contain),
                  SizedBox(height: 20.dp),
                  Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: K.room_bonus, style: style),
                        TextSpan(text: K.in_all, style: style),
                        WidgetSpan(
                          child: NumText(
                            '${widget.totalMoney}',
                            style: TextStyle(
                              fontSize: 21.dp,
                              color: const Color(0xFFFF356E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: CommonCore.K.base_money_diamond,
                            style: style),
                        TextSpan(text: '，', style: style),
                        TextSpan(
                            text: K.confirm_send_red_envelope, style: style),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.dp),
                  GestureDetector(
                    onTap: () {
                      pay();
                    },
                    child: Container(
                      width: 212.dp,
                      height: 50.dp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                          colors: [
                            Color(0xFFFF35AE),
                            Color(0xFFFF356E),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24.dp),
                      ),
                      child: Text(
                        K.give_red_envelope,
                        style: TextStyle(
                            fontSize: 16.dp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.dp),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      K.cancel,
                      style: TextStyle(
                          fontSize: 13.dp,
                          color: const Color(0x4D000000),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            // Your other children go here
          ],
        ),
      ),
    );
  }

  void pay() async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(context, widget.totalMoney);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    payManager.pay(context,
        key: 'available',
        type: result.value?.key ?? '',
        args: {
          'money': widget.totalMoney,
          'type': 'slp-consume',
          'params': {
            'consume_type': 'buy_room_red_packet',
            'rid': widget.room.rid,
            'uid': Session.uid,
            'red_id': widget.redId,
            'duration_id': widget.durationId,
            'delay_time_id': widget.beginTimeId,
          }
        },
        showLoading: true,
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    Fluttertoast.showToast(msg: K.pay_sucess, gravity: ToastGravity.CENTER);
    Navigator.of(context).pop();
  }

  void _onPayError(bool isErrorCatch) {}
}
