import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/util/developer/guagua/pluggable.dart';

import 'event_log_screen.dart';

class EventLogPlugin implements Pluggable {
  @override
  String get displayName => 'Event Tracking Log';

  @override
  IconData get iconData => Icons.account_tree;

  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'EventTracking';

  @override
  void onTrigger() async {
    if (_active) return;

    _active = true;
    DialogTransition.scaleShow(
            context: Constant.context,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 400),
            builder: (context) => const EventLogScreen())
        .then((value) => _active = false);
  }

  bool _active = false;
}
