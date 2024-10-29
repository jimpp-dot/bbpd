import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:logger/logger.dart';

import 'package:shared/util/log/stream_log_output.dart';
import 'package:shared/util/log/event_log/model/output_event_with_time.dart';

typedef OnEventAdded = Function(OutputEventWithTime event);

class EventLogStream {
  final int MAXIMUM_BUFFER_SIZE = 50;

  late ListQueue<OutputEventWithTime> currentEvents;

  late StreamLogOutput streamLogOutput;

  OnEventAdded? onEventAdded;

  EventLogStream() {
    currentEvents = ListQueue();
    streamLogOutput = StreamLogOutput();
    streamLogOutput.stream.listen((e) {
      if (currentEvents.length == MAXIMUM_BUFFER_SIZE) {
        currentEvents.removeFirst();
      }
      final eventWithTime = OutputEventWithTime(
        outputEvent: e,
        dateTime: DateTime.now(),
      );
      currentEvents.add(eventWithTime);
      onEventAdded?.call(eventWithTime);
    });
  }

  void clearAll() {
    currentEvents.clear();
  }

  void add(OutputEvent msg) {
    final isAnalyticsEvent =
        msg.lines.any((line) => line.toLowerCase().contains('track event:'));
    if (isAnalyticsEvent) {
      streamLogOutput.output(msg);
    }
  }

  static EventLogStream? _instance;

  static EventLogStream? get instance {
    if (_instance == null && Constant.isDevMode) {
      _instance = EventLogStream();
    }
    return _instance;
  }
}
