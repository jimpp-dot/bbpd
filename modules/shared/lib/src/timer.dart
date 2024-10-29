import 'dart:async';

import 'package:shared/shared.dart';

typedef TimerVoidCallback = void Function();

class _CallBackTimer {
  _CallBackTimer(this.timer, this.callback, this.index);

  final int index;
  final Timer timer;
  final TimerVoidCallback callback;
}

Map<int, _CallBackTimer> _timer = {};
int _index = 0;

void onTimeOut(int index) {
  if (_timer.containsKey(index)) {
    try {
      _timer[index]!.callback();
    } catch (e) {
      Log.d(e);
    }
    _timer.remove(index);
  }
}

class JsTimer {
  static int setTimeout(TimerVoidCallback callback, int milliseconds) {
    _index++;
    int index = _index;
    Duration timeout = Duration(milliseconds: milliseconds);
    _timer[_index] = _CallBackTimer(
        Timer(timeout, () {
          onTimeOut(index);
        }),
        callback,
        _index);
    return _index;
  }

  static bool clearTimeout(int key) {
    if (_timer.containsKey(key)) {
      _timer[key]!.timer.cancel();
      _timer.remove(key);
      return true;
    }
    return false;
  }
}
