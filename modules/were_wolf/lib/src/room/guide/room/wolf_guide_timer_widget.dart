import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

///
///
class WolfGuideTimerWidget extends StatefulWidget {
  final Duration period;
  final Duration stop;
  final VoidCallback? onComplete;
  final WidgetBuilder? builder;

  const WolfGuideTimerWidget(
      {super.key,
      this.period = const Duration(seconds: 1),
      this.onComplete,
      this.builder,
      this.stop = const Duration(seconds: 5)});

  @override
  _WolfGuideTimerWidgetState createState() => _WolfGuideTimerWidgetState();
}

class _WolfGuideTimerWidgetState extends State<WolfGuideTimerWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer?.cancel();
    _timer = Timer.periodic(widget.period, (_) {
      Log.d('Timer tick, stop: ${widget.stop}, left: ${_.tick}');
      setState(() {});
      if (_.tick >=
          widget.stop.inMilliseconds ~/ widget.period.inMilliseconds) {
        _.cancel();
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(context) ?? Container();
  }
}
