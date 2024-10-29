import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';

enum IntimateCardBindPeriod {
  day('每日', 1),
  week('每周', 2),
  month('每月', 3);

  final String text;
  final int value;

  const IntimateCardBindPeriod(this.text, this.value);

  static IntimateCardBindPeriod parse(int value) {
    for (IntimateCardBindPeriod item in IntimateCardBindPeriod.values) {
      if (item.value == value) {
        return item;
      }
    }
    return IntimateCardBindPeriod.month;
  }
}

class IntimateCardBindPeriodDialog extends StatelessWidget {
  const IntimateCardBindPeriodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 122,
      margin: const EdgeInsetsDirectional.only(start: 2, end: 3),
      padding: const EdgeInsetsDirectional.only(top: 11.5),
      alignment: AlignmentDirectional.topCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                R.imagePath(Assets.personaldata$bg_bubble_right_top_webp))),
      ),
      child: Column(
        children: IntimateCardBindPeriod.values
            .map((e) => _renderItem(context, e))
            .toList(),
      ),
    );
  }

  Widget _renderItem(BuildContext context, IntimateCardBindPeriod e) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, e);
      },
      child: Container(
        width: 70,
        height: 32,
        alignment: AlignmentDirectional.center,
        child: Text(
          e.text,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
        ),
      ),
    );
  }
}
