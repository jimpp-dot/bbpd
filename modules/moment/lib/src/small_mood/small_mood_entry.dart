import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';

import '../../assets.dart';
import 'small_mood_screen.dart';

class SmallMoodEntry extends StatelessWidget {
  const SmallMoodEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 16.0, end: 16.0, top: 10, bottom: 10.0),
      child: InkWell(
        onTap: () {
          SmallMoodScreen.show(context);
        },
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(
                colors: [Color(0xFFCFF5FF), Color(0xFFFEECFF)]),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              R.img(Assets.moment$small_mood_entry_webp, width: 28, height: 28),
              const SizedBox(width: 8),
              Text(
                K.moment_receive_small_mood,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 66,
                    height: 32,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: R.color.mainBgColor,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      K.moment_go_look,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const PositionedDirectional(
                    end: 0,
                    top: 0,
                    child: IgnorePointer(
                      child: RedDot(width: 8.0, height: 8.0, showBorder: false),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
