import 'dart:async';

import 'package:logger/src/log_output.dart';
import 'package:logger/src/output_event.dart';

class StreamLogOutput extends LogOutput {
  late StreamController<OutputEvent> _controller;
  bool _shouldForward = false;

  StreamLogOutput() {
    _controller = StreamController<OutputEvent>(
      onListen: () => _shouldForward = true,
      onPause: () => _shouldForward = false,
      onResume: () => _shouldForward = true,
      onCancel: () => _shouldForward = false,
    );
  }

  Stream<OutputEvent> get stream => _controller.stream.asBroadcastStream();

  @override
  void output(OutputEvent event) {
    if (!_shouldForward) {
      return;
    }

    _controller.add(event);
  }

  @override
  Future<void> destroy() async {
    _controller.close();
  }
}
