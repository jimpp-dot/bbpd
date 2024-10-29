import 'package:pulse_log/pulse_log.dart';
import 'package:flutter/foundation.dart';

const tag = 'pulse_log::';
void logPrint(dynamic msg) {
  if (PulseLog.enablePrint) {
    debugPrint('$tag$msg');
  }
}
