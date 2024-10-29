import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';
import 'package:moment/src/statistic/moment_week_statistic_page.dart';

/// 动态一周广场情报局弹窗
class MomentWeekStatisticDialog extends StatelessWidget {
  final RespGetCfg_GetCfgData data;

  const MomentWeekStatisticDialog(this.data, {super.key});

  static Future show(BuildContext context, RespGetCfg_GetCfgData data) async {
    return DialogQueue.root.enqueue(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return MomentWeekStatisticDialog(data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            R.img(
              Assets.moment$statistic_bg_week_statistic_dialog_webp,
              width: 280.dp,
              height: 393.dp,
              fit: BoxFit.fill,
            ),
            PositionedDirectional(
              bottom: 12.dp,
              child: Column(
                children: [
                  Text(
                    data.desc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.dp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.dp),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      MomentWeekStatisticPage.launch(context);
                    },
                    child: R.img(
                        Assets.moment$statistic_btn_week_statistic_see_webp,
                        width: 157.dp,
                        height: 43.dp),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              start: -21.dp,
              bottom: 20.dp,
              child: R.img(Assets.moment$statistic_ic_cool_webp,
                  width: 66.dp, height: 45.dp),
            ),
            _renderTime(),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(16.dp),
            child: R.img(
              Assets.moment$statistic_ic_dialog_close_webp,
              width: 37.dp,
              height: 37.dp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderTime() {
    return PositionedDirectional(
      start: 65.dp,
      top: 155.dp,
      child: Transform.rotate(
        angle: -math.pi / 12.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data.weekStar,
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 10.dp),
            ),
            Transform.rotate(
              angle: -math.pi / 6,
              child: Text(
                '-',
                style: TextStyle(
                    height: 1.1,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10.dp),
              ),
            ),
            Text(
              data.weekEnd,
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 10.dp),
            ),
          ],
        ),
      ),
    );
  }
}
