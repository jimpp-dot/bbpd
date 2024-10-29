import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

class ResultDialog extends StatelessWidget {
  final int money;

  const ResultDialog({super.key, required this.money});

  static Future<bool?> show(BuildContext context, int money) {
    return DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        routeSettings: const RouteSettings(name: 'ResultDialog'),
        builder: (_) {
          return ResultDialog(money: money);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        width: Util.width,
        height: 406.dp,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              alignment: AlignmentDirectional.topCenter,
              width: Util.width,
              height: 406.dp,
              padding: EdgeInsetsDirectional.only(
                  start: 60.dp, end: 60.dp, top: 120.dp),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$red_packet_dialog_result_bg_webp),
                    fit: BoxFit.fitWidth),
              ),
              child: _buildContent(context),
            ),
            PositionedDirectional(
                bottom: 80.dp,
                child: GestureDetector(
                  child: Container(
                      height: 80.dp,
                      width: Util.width,
                      color: Colors.transparent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            PositionedDirectional(
                bottom: 5.dp,
                child: GestureDetector(
                  child: R.img(
                      BaseAssets.shared$ic_close_with_circle_border_svg,
                      width: 44.dp,
                      height: 44.dp,
                      fit: BoxFit.contain),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
        height: 60.dp,
        alignment: AlignmentDirectional.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$money",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 54.dp,
                  fontWeight: FontWeight.bold,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
            SizedBox(width: 1.dp),
            R.img(RoomAssets.chat_room$red_packet_ic_diamond_webp,
                height: 20.dp),
          ],
        ));
  }
}
