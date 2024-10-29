import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'dart:ui';

import 'db_helper.dart';
import '../socket/local_user_data.dart';
import '../util/im_log.dart';

typedef StringCallback = void Function(String uid);

/// 小号 消息数据库 管理
class DatabaseManager {
  static const LOG_TAG = "Message-DatabaseManager";

  static final DatabaseManager _instance = DatabaseManager._internal();

  DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  final Map<String, int> _newMsgNotifyCount = {};

  /// 后台发送的新消息通知 次数
  final Map<String, Timer> _newMsgNotifyTimer = {};

  /// 后台发送的新消息通知 计时器

  final Map<String, int> _lastReceiveMsgIdMap = {};
  final Map<String, DatabaseHelper> _dbMap = {};
  final List<Map<String, dynamic>> _userInfoList = [];

  final List<VoidCallback> _updateListeners = [];

  Future init() async {
    await closeByLogout();
    _add(LocalUserData.senderUserId);
    _addLocalUserInfo();
    IMLog.d(LOG_TAG, "init - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
  }

  Future update(List<String> userIds) async {
    /// 先移除 不存在的
    List<String> toRemove = [];
    for (var key in _lastReceiveMsgIdMap.keys) {
      if (!userIds.contains(key) && key != LocalUserData.senderUserId) {
        toRemove.add(key);
      }
    }
    for (var key in toRemove) {
      await _remove(key);
    }
    toRemove.clear();

    /// 添加 不存在的
    for (var key in userIds) {
      if (!_lastReceiveMsgIdMap.containsKey(key)) {
        _add(key);
      }
    }
    IMLog.d(LOG_TAG, "update - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
  }

  void updateInfo(List<Map<String, dynamic>> userInfos) {
    _userInfoList.clear();
    _userInfoList.addAll(userInfos);
    _addLocalUserInfo();
    IMLog.d(LOG_TAG, "updateInfo - userInfoList: $_userInfoList, length: ${_userInfoList.length}");
  }

  void _addLocalUserInfo() {
    if (!_userInfoList.contains(LocalUserData.senderUserId)) {
      _userInfoList.add({'uid': LocalUserData.senderUserId, 'name': LocalUserData.senderName, 'icon': LocalUserData.senderPortraitUri});
    }
  }

  Map<String, dynamic> getUserInfo(String? userId) {
    String uid = userId ?? LocalUserData.senderUserId;
    Map<String, dynamic> map = {};
    for (var element in _userInfoList) {
      if (element['uid'].toString() == uid) {
        map = element;
      }
    }
    return map;
  }

  void _add(String userId) {
    IMLog.d(LOG_TAG, "add - userId: $userId");
    if (!_newMsgNotifyCount.containsKey(userId)) {
      _newMsgNotifyCount[userId] = 0;
    }
    if (!_lastReceiveMsgIdMap.containsKey(userId)) {
      _lastReceiveMsgIdMap[userId] = -1;
    }
    if (!_dbMap.containsKey(userId)) {
      _dbMap[userId] = DatabaseHelper(userId);
    }
    for (var element in _updateListeners) {
      element.call();
    }

    IMLog.d(LOG_TAG, "add - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
  }

  Future _remove(String userId) async {
    IMLog.d(LOG_TAG, "remove - userId: $userId");
    if (_lastReceiveMsgIdMap.containsKey(userId)) {
      _lastReceiveMsgIdMap.remove(userId);
    }
    if (_dbMap.containsKey(userId)) {
      DatabaseHelper db = _dbMap.remove(userId)!;
      await db.closeByLogout();
    }
    IMLog.d(LOG_TAG, "remove - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
  }

  void addUpdateListener(VoidCallback callback) {
    _updateListeners.add(callback);
  }

  void removeUpdateListener(VoidCallback callback) {
    _updateListeners.remove(callback);
  }

  /// 兜底 计时器
  Timer? _getNewMsgNotifyTimer({String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_newMsgNotifyTimer.containsKey(uid)) {
      return _newMsgNotifyTimer[uid];
    }
    return null;
  }

  /// 兜底 计时器
  void _setNewMsgNotifyTimer(Timer? timer, {String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (timer == null) {
      _newMsgNotifyTimer.remove(uid);
    } else {
      _newMsgNotifyTimer[uid] = timer;
    }
  }

  /// 新消息通知数
  int getNewMsgNotifyCount({String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_newMsgNotifyCount.containsKey(uid)) {
      return _newMsgNotifyCount[uid] ?? 0;
    }
    return 0;
  }

  /// 新消息通知数
  void _setNewMsgNotifyCount(int value, {String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_newMsgNotifyCount.containsKey(uid)) {
      _newMsgNotifyCount[uid] = value;
    }
  }

  /// 收到 服务端发送的 onGetMsgResponse 后取消计时器
  void receiveGetMsgResponse({String? userId}) {
    Timer? timer = _getNewMsgNotifyTimer(userId: userId);
    if (timer != null) {
      timer.cancel();
      timer = null;
      _setNewMsgNotifyTimer(timer, userId: userId);
    }
  }

  /// 新消息通知次数 +1
  void increaseNewMsgNotifyCount({String? userId}) {
    int value = getNewMsgNotifyCount(userId: userId) + 1;
    _setNewMsgNotifyCount(value, userId: userId);
    IMLog.d(LOG_TAG, "increaseNewMsgNotifyCount - client：+1, curCount: $value");

    /// 加入本地兜底方案，若客户端没有收到 onGetMsgResponse 则清空新 消息通知数
    Timer? timer = _getNewMsgNotifyTimer(userId: userId);
    if (timer == null) {
      IMLog.d(LOG_TAG, "increaseNewMsgNotifyCount - client：initTimer");
      // 10s内未收到服务端消息后 清空新消息通知数
      timer = Timer(const Duration(seconds: 10), () => resetNewMsgNotifyCount(userId: userId));
      _setNewMsgNotifyTimer(timer, userId: userId);
    }
  }

  /// 处理完后 新消息通知次数 -1
  void reduceNewMsgNotifyCount({String? userId}) {
    /// 收到 服务端发送的 onGetMsgResponse 后取消计时器
    receiveGetMsgResponse(userId: userId);
    int value = max(getNewMsgNotifyCount(userId: userId) - 1, 0);
    _setNewMsgNotifyCount(value, userId: userId);
    IMLog.d(LOG_TAG, "reduceNewMsgNotifyCount - server：-1, curCount: $value");
  }

  /// 重置 新消息通知次数 =0
  void resetNewMsgNotifyCount({String? userId}) {
    receiveGetMsgResponse(userId: userId);
    _setNewMsgNotifyCount(0, userId: userId);
    IMLog.d(LOG_TAG, "resetNewMsgNotifyCount - curCount：0");
  }

  int getLastReceiveMsgId({String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_lastReceiveMsgIdMap.containsKey(uid)) {
      return _lastReceiveMsgIdMap[uid]!;
    }
    return -1;
  }

  void setLastReceiveMsgId(int lastReceiveMsgId, {String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_lastReceiveMsgIdMap.containsKey(uid)) {
      _lastReceiveMsgIdMap[uid] = lastReceiveMsgId;
    }
    IMLog.d(LOG_TAG, "set - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
  }

  DatabaseHelper? getDatabaseHelp({String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (_dbMap.containsKey(uid)) {
      return _dbMap[uid];
    }
    return null;
  }

  // 获取需要拉取消息的小号列表
  List<String> getSmallAccountListByNeedPull() {
    List<String> result = [];
    IMLog.d(LOG_TAG, "check - lastReceiveMsgIdMap: $_lastReceiveMsgIdMap, length: ${_lastReceiveMsgIdMap.length}");
    if (!_canPullSmallAccount()) {
      return result;
    }
    _lastReceiveMsgIdMap.forEach((key, value) {
      if (key != LocalUserData.senderUserId && value == -1) {
        result.add(key);
      }
    });
    return result;
  }

  bool _canPullSmallAccount() {
    return getLastReceiveMsgId() != -1;
  }

  // 校验 小号uid 是否合法
  bool checkValidByUid(String userId) {
    return _lastReceiveMsgIdMap.containsKey(userId);
  }

  Future closeByLogout() async {
    IMLog.d(LOG_TAG, "Manager closeByLogout");
    _newMsgNotifyCount.clear();
    for (Timer value in _newMsgNotifyTimer.values) {
      value.cancel();
    }
    _newMsgNotifyTimer.clear();

    _userInfoList.clear();
    _lastReceiveMsgIdMap.clear();
    for (DatabaseHelper db in _dbMap.values) {
      await db.closeByLogout();
    }
    _dbMap.clear();
    IMLog.d(LOG_TAG, "Manager closeByLogout finish");
  }
}
