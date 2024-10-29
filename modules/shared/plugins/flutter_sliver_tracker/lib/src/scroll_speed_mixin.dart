import 'package:flutter/material.dart';

mixin ScrollSpeedMixin {
  double? _pixels;
  int? _timestamp;

  double velocity = 0;

  scrollSpeedEnd() {
    velocity = 0;
    _pixels = null;
    _timestamp = null;
  }

  scrollSpeedEndUpdate(ScrollUpdateNotification notification) {
    double pixels = notification.metrics.pixels;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    if (_pixels != null && _timestamp != null) {
      velocity = (pixels - _pixels!) / (timestamp - _timestamp!);
    }
    _pixels = pixels;
    _timestamp = timestamp;
  }
}
