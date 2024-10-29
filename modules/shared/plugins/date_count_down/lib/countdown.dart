import 'package:flutter/material.dart';

class CountDown {
  String timeLeft(DateTime due, String finishedText,
      {bool? showLabel,
      String prefix = '',
      String suffix = '',
      VoidCallback? onFinish,
      bool showSAtOnlySecond = false}) {
    String retVal;

    Duration timeUntilDue = due.difference(DateTime.now());

    int daysUntil = timeUntilDue.inDays;
    int hoursUntil = timeUntilDue.inHours - (daysUntil * 24);
    int minUntil =
        timeUntilDue.inMinutes - (daysUntil * 24 * 60) - (hoursUntil * 60);
    int secUntil = timeUntilDue.inSeconds - (minUntil * 60);
    // //Fixed Invalid Range Value
    String s = secUntil.toString().length <= 2
        ? secUntil.toString()
        : secUntil.toString().substring(secUntil.toString().length - 2);

    bool finished = false;

    if (daysUntil > 0) {
      if (showLabel == false) {
        retVal =
            "${daysUntil.toString().padLeft(2, '0')}:${hoursUntil.toString().padLeft(2, '0')}:${minUntil.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
      } else {
        retVal = "$daysUntil天$hoursUntil时$minUntil分$s秒";
      }
    } else if (hoursUntil > 0) {
      if (showLabel == false) {
        retVal =
            "${hoursUntil.toString().padLeft(2, '0')}:${minUntil.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
      } else {
        retVal = "$hoursUntil时$minUntil分$s秒";
      }
    } else if (minUntil > 0) {
      if (showLabel == false) {
        retVal =
            "${minUntil.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
      } else {
        retVal = "$minUntil分$s秒";
      }
    } else if (secUntil > 0) {
      if (showLabel == false) {
        retVal = s.toString() + (showSAtOnlySecond ? "s" : "");
      } else {
        retVal = "$s秒";
      }
    } else {
      retVal = finishedText;
      finished = true;

      if (onFinish != null) onFinish();
    }

    if (suffix.isNotEmpty && !finished) {
      retVal += suffix;
    }

    if (prefix.isNotEmpty && !finished) {
      prefix += retVal;
      retVal = prefix;
    }

    return retVal;
  }
}
