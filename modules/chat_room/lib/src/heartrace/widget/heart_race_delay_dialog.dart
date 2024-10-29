import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

/// 心跳竞速：延时时间选择dialog
class HeartRaceDelayDialog extends StatefulWidget {
  const HeartRaceDelayDialog({super.key});

  @override
  HeartRaceDelayState createState() {
    return HeartRaceDelayState();
  }
}

class HeartRaceDelayState extends State<HeartRaceDelayDialog> {
  int currentMin = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 312,
          constraints: const BoxConstraints(
            maxHeight: 230,
          ),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 24, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.room_cplink_delay,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: R.color.mainTextColor,
                      ),
                    ),
                    _buildContent(context),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNegativeButton(),
                  buildPositiveButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackShape: const GradientRectSliderTrackShape(
              gradient: LinearGradient(
                  colors: [Color(0xFF9068FE), Color(0xFFFF6CE1)]),
            ),
            trackHeight: 8,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            overlayColor: R.color.mainBgColor.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            valueIndicatorColor: R.color.thirdBgColor,
            valueIndicatorTextStyle:
                TextStyle(fontSize: 11, color: R.color.secondTextColor),
          ),
          child: Slider(
            min: 3,
            max: 30,
            value: 0.0 + currentMin,
            activeColor: R.color.mainTextColor,
            inactiveColor: R.color.thirdBgColor,
            label: '${currentMin}min',
            thumbColor: R.color.mainBgColor,
            divisions: 30,
            onChanged: (double value) {
              setState(() {
                currentMin = value.toInt();
              });
            },
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            buildText('3min'),
            const Spacer(),
            buildText('${currentMin}min'),
            const Spacer(),
            buildText('30min'),
          ],
        ),
      ],
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11,
        color: R.color.secondTextColor,
      ),
    );
  }

  Widget buildNegativeButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(0);
        },
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 105,
          height: 40,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              K.cancel,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 14,
              ),
              textScaleFactor: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPositiveButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(currentMin * 60);
        },
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 105,
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              K.sure,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
