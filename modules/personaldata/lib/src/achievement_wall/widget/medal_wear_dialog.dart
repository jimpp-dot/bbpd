import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';

///勋章穿戴确认
class MedalWearDialog extends StatelessWidget {
  const MedalWearDialog({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) async {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        context: context,
        routeSettings: const RouteSettings(name: 'MedalWearDialog'),
        builder: (BuildContext context) {
          return const MedalWearDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: AlignmentDirectional.center,
      backgroundColor: Colors.white,
      title: Text(K.achieve_wear_tips,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w900)),
      content: Text(K.achieve_wear_content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.normal)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context, false);
            },
            child: Container(
              height: 48.dp,
              width: 110.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadiusDirectional.circular(24.dp)),
              child: Text(K.achieve_wear_cancel,
                  style: TextStyle(
                      color: const Color(0xFF080A31).withOpacity(0.9),
                      fontSize: 16.dp,
                      fontWeight: FontWeight.w900)),
            )),
        GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Container(
              height: 48.dp,
              width: 110.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: R.dColor.mainBrandGradientColors,
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd),
                  borderRadius: BorderRadiusDirectional.circular(24.dp)),
              child: Text(K.achieve_wear_confirm,
                  style: TextStyle(
                      color: const Color(0xFF080A31).withOpacity(0.9),
                      fontSize: 16.dp,
                      fontWeight: FontWeight.w900)),
            )),
      ],
    );
  }
}
