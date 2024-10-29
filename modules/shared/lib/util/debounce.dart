import 'dart:async';

/// 防抖类：在触发事件时，不立即执行目标操作，而是给出一个延迟的时间，在该时间范围内
/// 如果再次触发了事件，则重置延迟时间，直到延迟时间结束才会执行目标操作。
/// [func] 行为方法
/// 可选 [duration] 单位时间
class Debounce {
  Duration duration;
  Timer? _timer;

  Debounce({this.duration = const Duration(milliseconds: 800)});

  Function? _delayFunc;

  void call(Function()? func) {
    if (func == null) return;
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _delayFunc = func;
    _timer = Timer(duration, () {
      _delayFunc?.call();
    });
  }

  /// 取消之前设置的任务
  void cancel() {
    _delayFunc = null;
  }

  /// 立即执行任务
  void callNow() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _delayFunc?.call();
    _delayFunc = null;
  }

  dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
