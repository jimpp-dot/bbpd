import 'package:logger/logger.dart';

class OutputEventWithTime {
  final OutputEvent outputEvent;
  final DateTime dateTime;

  const OutputEventWithTime({
    required this.outputEvent,
    required this.dateTime,
  });
}
