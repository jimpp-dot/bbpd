library count_down_timer;

import 'dart:async';
import 'package:flutter/material.dart';

import 'countdown.dart';

///CountDownText : A simple text widget that display the countdown timer
///based on the dateTime given e.g DateTime.utc(2050)
class CountDownText extends StatefulWidget {
  const CountDownText(
      {Key? key,
      required this.due,
      required this.finishedText,
      this.style,
      this.showLabel = false,
      this.prefix = '',
      this.suffix = '',
      this.onFinish,
      this.showSAtOnlySecond = false})
      : super(key: key);

  final DateTime? due;
  final String? finishedText;
  final bool? showLabel;
  final String prefix;
  final String suffix;
  final TextStyle? style;
  final VoidCallback? onFinish;
  final bool showSAtOnlySecond;

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      CountDown().timeLeft(widget.due!, widget.finishedText!,
          showLabel: widget.showLabel,
          prefix: widget.prefix,
          suffix: widget.suffix,
          onFinish: widget.onFinish,
          showSAtOnlySecond: widget.showSAtOnlySecond),
      style: widget.style,
    );
  }
}
