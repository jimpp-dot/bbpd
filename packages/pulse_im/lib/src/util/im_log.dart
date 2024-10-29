class IMLog {
  static const String TAG = "IMLog";

  static bool? _debug;

  static const int _LOG_LEVEL_INFO = 0;
  static const int _LOG_LEVEL_DEBUG = 1;
  static const int _LOG_LEVEL_WARNING = 2;
  static const int _LOG_LEVEL_ERROR = 3;
  static const int _LOG_LEVEL_NONE = 4;

  static int _logLevel = _LOG_LEVEL_NONE;

  /// 自定义logger实现
  static IImLogger? _logger;

  static set logger(IImLogger logger) {
    _logger = logger;
  }

  static i(String tag, String msg) {
    if (_doPrint(_LOG_LEVEL_INFO)) print('$tag=>info: ${DateTime.now().toString()} $msg');
    if (_logger != null) return _logger?.i(tag, msg);
  }

  static d(String tag, String msg) {
    if (_doPrint(_LOG_LEVEL_DEBUG)) print('$tag=>debug: ${DateTime.now().toString()} $msg');
    if (_logger != null) return _logger?.d(tag, msg);
  }

  static w(String tag, String msg) {
    if (_doPrint(_LOG_LEVEL_WARNING)) print('$tag=>warn: ${DateTime.now().toString()} $msg');
    if (_logger != null) return _logger?.w(tag, msg);
  }

  static e(String tag, String msg) {
    if (_doPrint(_LOG_LEVEL_ERROR)) print('$tag=>error: ${DateTime.now().toString()} $msg');
    if (_logger != null) return _logger?.e(tag, msg);
  }

  static bool _doPrint(final int logLevel) {
    return true;
    if (_debug == null) {
      assert(() {
        _debug = true;
        return true;
      }());
      _debug ??= false;

      _logLevel = _debug! ? _LOG_LEVEL_DEBUG : _LOG_LEVEL_NONE;
    }

    return logLevel >= _logLevel;
  }
}

abstract class IImLogger {
  void i(String tag, String msg);

  void d(String tag, String msg);

  void w(String tag, String msg);

  void e(String tag, String msg);
}
