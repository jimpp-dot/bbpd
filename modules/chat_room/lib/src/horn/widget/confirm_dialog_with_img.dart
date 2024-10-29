import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

enum TYPE { TYPE_PURCHASE, TYPE_AVAILABLE, TYPE_RE_PURCHASE, TYPE_RE_AVAILABLE }

class ConfirmDialogWithImg extends StatelessWidget {
  final TYPE type;
  final int price;
  final String name;

  const ConfirmDialogWithImg(
      {super.key, required this.type, required this.price, required this.name});

  static Future<bool?> show(BuildContext context,
      {required TYPE type, required int price, required String name}) async {
    return showDialog(
      context: context,
      builder: (context) =>
          ConfirmDialogWithImg(type: type, price: price, name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    String content = '';
    switch (type) {
      case TYPE.TYPE_RE_AVAILABLE:
        title = K.horn_btn_resend;
        content = K.room_horn_confirm_tip_re_send([name]);
        break;
      case TYPE.TYPE_RE_PURCHASE:
        title = K.horn_btn_resend;
        content = K.room_horn_confirm_tip_re_buy([name]);
        break;
      case TYPE.TYPE_AVAILABLE:
        title = K.room_confirm_send;
        content = K.room_horn_confirm_tip_send([name]);
        break;
      case TYPE.TYPE_PURCHASE:
        title = K.room_confirm_buy;
        content = K.room_horn_confirm_tip_buy([name]);
        break;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 295.dp,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(18.dp),
              color: R.color.mainBgColor),
          padding: EdgeInsetsDirectional.only(
              top: 24.dp, bottom: 20.dp, start: 16.dp, end: 16.dp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: R.textStyle.medium18),
              SizedBox(height: 6.dp),
              Text(content, style: R.textStyle.regular14),
              SizedBox(height: 16.dp),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Container(
                  width: 263.dp,
                  height: 48.dp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24.dp),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: type == TYPE.TYPE_RE_PURCHASE ||
                          type == TYPE.TYPE_PURCHASE
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(K.room_consume,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(width: 4.dp),
                            NumText('$price',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            R.img(MoneyConfig.moneyIcon,
                                width: 18, height: 18, wholePath: true),
                            SizedBox(width: 4.dp),
                            Text(K.room_buy_send,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      : Text(K.room_confirm,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.dp),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
              width: 50.dp, height: 50.dp),
        )
      ],
    );
  }
}
