import 'dart:collection';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/util/log/event_log/event_log_stream.dart';
import 'package:shared/util/log/web_console/web_console_manager.dart';
import 'package:logger/logger.dart';

import 'stream_log_output.dart';

class LogOutputHelper {
  static ListQueue<OutputEvent> outputEventBuffer = ListQueue();

  static const int _bufferSize = 50;
  static OutputCallback? outputCallback;
  static Level? filterLevel = Level.error;

  static LogOutput get output {
    LogOutput output = ConsoleOutput();

    if (Constant.isDevMode) {
      final streamOutput = StreamLogOutput();
      output = MultiOutput([DefaultConsoleOutput(), streamOutput]);

      streamOutput.stream.listen((e) {
        // Tracking events are emitted at [Debug] level, so we listen to it regardless of filter levels set in Log Console.
        if (e.level == Level.debug) {
          EventLogStream.instance?.add(e);
        }

        // ignore log level less than filter level
        if (filterLevel!.index > e.level.index) return;

        if (outputEventBuffer.length == _bufferSize) {
          outputEventBuffer.removeFirst();
        }
        outputEventBuffer.add(e);

        if (outputCallback != null) {
          outputCallback!(e);
        }

        WebConsoleManager.instance.printConsoleLog(e);
      });
    }
    return output;
  }
}

class DefaultConsoleOutput extends LogOutput {
  bool _shouldLog = false;
  @override
  Future<void> init() async {
    assert(() {
      _shouldLog = true;
      return true;
    }());
  }

  @override
  void output(OutputEvent event) {
    if (!_shouldLog) return;

    if (Platform.isIOS) {
      developer.log(event.lines.join('\n'),
          name: DateTime.now().toyyyyMMddHHmmss());
    } else {
      // ignore: avoid_print
      event.lines.forEach(print);
    }
  }
}
