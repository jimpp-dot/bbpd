import 'dart:async';

typedef VoidCallback = Function();

/// When multiple calls are repeated, only the first time is valid.
///
/// Like rxdart `throttle` method
class Throttle {
  Duration duration;

  VoidCallback? onCall;

  bool _isRunning = false;

  Timer? _timer;

  Throttle({
    required this.onCall,
    this.duration = const Duration(seconds: 2),
  });

  void call(call) {
    if (!_isRunning) {
      _startTimer();
      onCall?.call();
    }
  }

  void _startTimer() {
    if (_timer != null) {
      _stopTimer();
    }
    _isRunning = true;
    _timer = Timer(duration, () {
      _isRunning = false;
      _timer = null;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _isRunning = false;
    _timer = null;
  }

  void dispose() {
    onCall = null;
    _stopTimer();
  }
}
