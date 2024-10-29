/// 方法重复调用检测工具
class RepeatCallChecker {
  final Map<String, int> _quickCallCache = {};
  final Map<String, bool> _callStatusCache = {};

  /// 是否快速调用
  bool _isQuickCall(String key, int duration) {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (nowTime - (_quickCallCache[key] ?? 0) < duration) {
      return true;
    }
    _quickCallCache[key] = nowTime;
    return false;
  }

  /// 是否正在调用
  bool _isCalling(String key) {
    return _callStatusCache[key] ?? false;
  }

  /// 设置调用状态
  void setCalling(bool value, {String key = ''}) {
    _callStatusCache[key] = value;
  }

  /// 是否无效的调用
  bool isInvalidCall(
      {String key = '', int duration = 1000, bool checkStatus = false}) {
    bool isCalling = checkStatus ? _isCalling(key) : false;
    bool isQuickCall = _isQuickCall(key, duration);
    return isCalling || isQuickCall;
  }
}
