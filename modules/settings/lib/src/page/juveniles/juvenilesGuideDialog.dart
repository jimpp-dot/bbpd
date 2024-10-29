import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';
import 'juveniles_mode.dart';

// 开启青少年模式提醒弹窗
class JuvenilesGuideDialog extends StatelessWidget {
  const JuvenilesGuideDialog({super.key});

  static void show() {
    DialogQueue.root.enqueue(
        key: const Key('JuvenilesGuide'),
        context: System.context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            contentPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            content: JuvenilesGuideDialog(),
            shape: StadiumBorder(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double dialogWidth = min(Util.width - 48, 328);
    double detailPadding = dialogWidth == 328 ? 36 : 26;
    return Container(
      width: dialogWidth,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        // color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            child: R.img(Assets.settings$juveniles_guide_icon_webp,
                package: ComponentManager.MANAGER_SETTINGS,
                width: 160,
                height: 120),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: detailPadding, end: detailPadding, bottom: 20),
            child: Text(
              K.juveniles_guide_detail_new([Util.appName]),
              style: TextStyle(color: R.color.secondTextColor, fontSize: 14),
            ),
          ),
          GestureDetector(
              onTap: () {
                if (!Session.isLogined) {
                  ILoginManager loginManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_LOGIN);
                  loginManager.show(context);
                  return;
                }
                Navigator.pop(context);
                JuvenilesMode.show(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    K.go_juveniles_protect,
                    style: TextStyle(
                        color: R.color.mainBrandColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  R.img(
                    Assets.settings$ic_next_svg,
                    width: 16,
                    height: 16,
                    color: R.color.mainBrandColor,
                    package: ComponentManager.MANAGER_SETTINGS,
                  )
                ],
              )),
          Container(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              eventCenter.emit("Juveniles.Guide.Cancel");
            },
            child: Container(
              height: 48,
              margin: const EdgeInsetsDirectional.only(start: 40, end: 40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Text(
                K.juveniles_guide_cancel,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
