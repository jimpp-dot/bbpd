import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import '../../assets.dart';

class RulesDialog extends StatelessWidget {
  final int? money;
  final int? dura;
  final bool showVip;

  const RulesDialog({super.key, this.money, this.dura, this.showVip = false});

  static Future<bool?> show(
      BuildContext context, int? money, int? dura, bool showVip) {
    return DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        routeSettings: const RouteSettings(name: 'RulesDialog'),
        builder: (_) {
          return RulesDialog(money: money, dura: dura, showVip: showVip);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        width: Util.width,
        height: 450.dp,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              alignment: AlignmentDirectional.topCenter,
              width: Util.width,
              height: 450.dp,
              padding: EdgeInsetsDirectional.only(
                  start: 60.dp, end: 60.dp, bottom: showVip ? 170.dp : 180.dp),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(RoomAssets
                        .chat_room$red_packet_dialog_bg_rules_long_webp),
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
                bottom: 15.dp,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30.dp),
            Text(
              "$money",
              style: TextStyle(
                  color: const Color(0xFFFF2062),
                  fontSize: 54.dp,
                  fontWeight: FontWeight.bold,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
            SizedBox(width: 1.dp),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                R.img(RoomAssets.chat_room$red_packet_dialog_total_money_webp,
                    height: 20.dp),
                SizedBox(height: 2.dp),
                R.img(RoomAssets.chat_room$red_packet_ic_diamond_webp,
                    height: 16.dp, color: const Color(0xFFFF2062)),
              ],
            )
          ],
        ),
        Text(K.room_red_packet_rule_tips1(["$dura"]),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xFFFF2062),
                fontSize: 14.dp,
                fontWeight: FontWeight.bold)),
        if (showVip) ...[
          SizedBox(height: 8.dp),
          Text(K.room_red_packet_rule_tips2,
              style: TextStyle(
                  color: const Color(0xFFBF0E0E).withOpacity(0.6),
                  fontSize: 12.dp,
                  fontWeight: FontWeight.bold)),
        ]
      ],
    );
  }
}
