import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:gift/k.dart';
import 'package:flutter/material.dart';

class UseTrumpetDialog {
  final int id;
  final int rid;
  final int num = 1;
  final TextEditingController _controller = TextEditingController();

  UseTrumpetDialog(this.id, this.rid);

  Future<bool?> show(BuildContext context) async {
    bool result = await showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          contentBuilder: (context) {
            return Container(
              height: 108,
              padding: const EdgeInsetsDirectional.only(
                start: 12,
                end: 12,
                top: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(8))),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                ),
                controller: _controller,
                autocorrect: true,
                autofocus: true,
                maxLength: 30,
                maxLines: 3,
                buildCounter: (BuildContext context,
                    {required int currentLength,
                    required int? maxLength,
                    required bool isFocused}) {
                  return currentLength > 0
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$currentLength',
                              style: TextStyle(
                                fontSize: 13,
                                color: R.color.mainTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '/$maxLength',
                              style: TextStyle(
                                fontSize: 13,
                                color: R.color.thirdTextColor,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '$currentLength/$maxLength',
                          style: TextStyle(
                            fontSize: 13,
                            color: R.color.thirdTextColor,
                          ),
                        );
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsetsDirectional.only(),
                  hintText: K.gift_input_trumpet_hint,
                  hintStyle:
                      TextStyle(fontSize: 16, color: R.color.thirdTextColor),
                ),
              ),
            );
          },
          negativeButton: const NegativeButton(),
          positiveButton: PositiveButton(
            text: BaseK.K.base_send,
            onPressed: () async {
              String text = _controller.text;
              if (Util.isStringEmpty(text)) {
                Toast.show(context, K.gift_send_trumpet_check_tip);
                return;
              }
              var rsp =
                  await sendTrumpet(ChatRoomData.getInstance()!.realRid, text);
              if (rsp.success) {
                Navigator.of(context).pop(true);
              } else {
                Toast.show(context, rsp.msg);
              }
            },
          ),
        );
      },
    );

    return result;
  }

  Future<NormalNull> sendTrumpet(int rid, String text) async {
    String url = '${System.domain}go/mate/commodity/useTrumpet';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'id': '$id',
            'rid': '$rid',
            'num': '$num',
            'text': text,
          },
          pb: true,
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
