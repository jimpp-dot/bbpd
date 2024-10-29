import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:chat_room/k.dart';

class MissedDialog extends StatelessWidget {
  final String? msg;

  const MissedDialog({super.key, this.msg});

  static Future<bool?> show(BuildContext context, {String? msg}) {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        context: context,
        builder: (context) {
          return MissedDialog(msg: msg);
        });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: AlignmentDirectional.center,
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(K.room_red_packet_missed_title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w900)),
      content: Text(
          (msg != null && msg!.isNotEmpty)
              ? msg!
              : K.room_red_packet_missed_content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.normal)),
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context, false);
            },
            child: Container(
              height: 48.dp,
              width: 263.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: R.colors.mainBrandGradientColors,
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd),
                  borderRadius: BorderRadiusDirectional.circular(24.dp)),
              child: Text(K.room_confirm,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.bold)),
            )),
      ],
    );
  }
}
