import 'package:logger/src/log_filter.dart';
import 'package:logger/src/log_event.dart';

class ConsoleLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
