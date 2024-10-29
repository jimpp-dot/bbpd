import 'dart:async';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';

abstract class QueueConsumer {
  /// 处理单一消息滑动到底部事件
  handleEndFrame();

  /// 处理缓冲区满消息滑动到底部事件
  handleFlushEndFrame();
}

abstract class QueueProducer {
  initMsgList(List<MessageContent>? list);

  addLastThrottleMsg(MessageContent? msg);

  clearMsg();

  shrinkList(int widgetNum);

  startConsumer();

  pauseConsume();
}

/// 节流队列控制器
/// 测试接口：填入房间id和数量，一次性推送公屏消息
/// https://dev.iambanban.com/roomgrouppk/testmessage?rid=193185538&count=60
///
class ThrottleQueue implements QueueProducer {
  static const String TAG = 'MsgQueue';

  static const bool DEBUG = false;

  final List<MessageContent> _queue = <MessageContent>[];

  final List<MessageContent> _widgetDataList = <MessageContent>[];

  /// 由客户端控制的最大容量
  final int inputMaxNum;

  /// 消息队列/UI控件数据，最大容量
  /// 初始容量
  static const int maxInitNum = 50;

  /// 房间前台进行中容量
  static const int _maxOngoingNum = 1000;

  /// 消息队列一次性刷新的阈值
  int _flushNum = 30;
  int _milliseconds = 150;
  int _animationMilliseconds = 250;
  int _currentPeriodic = 0;
  bool _startConsumer = false;
  bool _isEmptyDuration = true;

  Timer? _timer;

  QueueConsumer? queueConsumer;

  /// 之前已经进入frame状态的再次点击，不重置状态
  bool _onFreezeFrame = false;

  /// 点击的时候就标记为冻结状态
  bool _freezeFrame = false;

  /// 标记来自手指暂停后的滑动到底部行为
  bool _fromPauseEnd = false;

  /// 确保滑动到底部的重试最大次数
  static const int _ensureEndTotalCount = 3;

  /// 确保滑动到底部的初始值
  static const int _ensureEndInitVal = -1;

  int _curEnsureEndCount = _ensureEndInitVal;

  /// 标记点击的时候是否有新消息达到，如果有，N秒冻结后需要滑动到底部
  bool _endFlag = false;

  int _startFreezeTime = 0;

  /// freeze状态，显示未读数
  int unreadMsg = 0;

  ThrottleQueue({this.inputMaxNum = _maxOngoingNum});

  ///当前有触摸时不滚动，触摸释放时N秒后可以滚动
  set freezeFrame(bool freeze) {
    _freezeFrame = freeze;
    _startFreezeTime = DateTime.now().millisecondsSinceEpoch;
  }

  bool get freezeFrame => _freezeFrame;

  final Debounce _stopEndDebounce =
      Debounce(duration: const Duration(milliseconds: 4000));

  void setThrottleDuration(
      int? milliseconds, int? animationMilliseconds, int? flushNum) {
    if (milliseconds != null && milliseconds > 0) {
      _milliseconds = milliseconds;
    }
    if (animationMilliseconds != null && animationMilliseconds > 0) {
      _animationMilliseconds = animationMilliseconds;
    }
    if (flushNum != null && flushNum > 0) {
      _flushNum = flushNum;
    }
  }

  void dispose() {
    _cancelTimer();
    _stopEndDebounce.dispose();
    _curEnsureEndCount = _ensureEndInitVal;
    queueConsumer = null;
  }

  _startTimer() {
    _cancelTimer();
    if (_isEmptyDuration) {
      _currentPeriodic = _milliseconds;
    } else {
      _currentPeriodic = _milliseconds + _animationMilliseconds;
    }
    _timer =
        Timer.periodic(Duration(milliseconds: _currentPeriodic), _handleMsg);
  }

  _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  int get widgetDataListLength => _widgetDataList.length;

  @override
  addLastThrottleMsg(MessageContent? msg, {int? shrinkNum}) {
    if (msg == null) return;

    if (checkExistMsg(msg)) {
      Log.d(
          tag: TAG,
          'addLastThrottleMsg => message[${msg.messageId}] is repeat!');
      return;
    } else {
      if (!_startConsumer) {
        /// 未开始消费：房间支持多TAB，不在当前TAB暂停消费
        /// 新消息过来直接添加进_widgetDataList，避免直接在add _queue时被抛掉
        /// 切换到当前TAB，会重新消费，并滑倒最底部
        if (_queue.isNotEmpty) {
          consumerMgs(_queue);
          _queue.clear();
        }
        consumerMgs([msg]);
      } else {
        _queue.add(msg);
      }
    }
    if (_freezeFrame) {
      unreadMsg++;
    }
    if (shrinkNum != null && shrinkNum > 0) {
      shrinkList(shrinkNum);
    }
    ChatRoomData.getInstance()?.emit(
        RoomConstant.Event_Public_Screen_Get_New_Msg,
        {'self': (msg.user?.uid ?? 0) == Session.uid});
  }

  void consumerMgs(List<MessageContent> msg) {
    _widgetDataList.addAll(msg);
    int max = inputMaxNum;
    if (_widgetDataList.length > max) {
      /// 超过最大限制，删除一部分。剩下max - maxInitNum条
      _widgetDataList.removeRange(
          0, _widgetDataList.length - (max - maxInitNum));
    }
  }

  @override
  clearMsg() {
    _queue.clear();
    _widgetDataList.clear();
  }

  @override
  initMsgList(List<MessageContent>? list) {
    if (list == null) return;
    _queue.clear();
    _widgetDataList.clear();
    _widgetDataList.addAll(list);
    _endFlag = true;
  }

  @override
  shrinkList(int widgetNum) {
    _shrinkQueue();
    _shrinkWidgetData(widgetNum);
  }

  /// 压缩消息，会丢弃老消息
  _shrinkQueue() {
    _shrinkList(_queue, maxInitNum);
  }

  _shrinkWidgetData(int num) {
    _shrinkList(_widgetDataList, num);
  }

  _shrinkList(List list, int num) {
    /// 先进行最大容量检查
    if (list.length > inputMaxNum) {
      list.removeRange(0, list.length - (inputMaxNum - maxInitNum));
    }
    if (list.length <= num) {
      return;
    }
    int anchor = list.length - num;
    _widgetDataList.removeRange(0, anchor);
  }

  _handleMsg(Timer timer) {
    if (_startConsumer == false) {
      return;
    }
    if (_queue.isEmpty) {
      bool ensureToEnd = false;

      if (_isEmptyDuration != true) {
        _isEmptyDuration = true;
        _startTimer();
        ensureToEnd = true;
      } else if (_fromPauseEnd) {
        Log.d(tag: TAG, '_handleMsg _fromPauseEnd');
        _fromPauseEnd = false;
        ensureToEnd = true;
      }

      if (ensureToEnd == true && _curEnsureEndCount == _ensureEndInitVal) {
        _curEnsureEndCount = _ensureEndTotalCount;
        _ensureToEnd();
      }

      return;
    } else {
      if (_isEmptyDuration != false) {
        _isEmptyDuration = false;
        _startTimer();
      }
    }

    _curEnsureEndCount = _ensureEndInitVal;

    var queueLen = _queue.length;

    if (queueLen >= _flushNum) {
      var flushMsg = _queue.toList();
      _queue.clear();
      _endFlag = true;
      consumerMgs(flushMsg);
      if (_freezeFrame == false) {
        _endFlag = false;
        queueConsumer?.handleFlushEndFrame();
      }
    } else {
      var addList = <MessageContent>[];
      var msgSize = 1;
      if (queueLen < 5) {
        msgSize = 1;
      } else if (queueLen < 10) {
        msgSize = 2;
      } else if (queueLen < 30) {
        msgSize = 3;
      } else {
        msgSize = (queueLen / 10).ceil();
      }
      while (msgSize > 0 && _queue.isNotEmpty) {
        var msg = _queue.removeAt(0);
        addList.add(msg);
        msgSize--;
      }

      _endFlag = true;

      consumerMgs(addList);
      if (_freezeFrame == false) {
        _endFlag = false;
        queueConsumer?.handleEndFrame();
      }
    }
  }

  /// 开始消费消息
  @override
  startConsumer() {
    _startConsumer = true;
    _startTimer();
  }

  /// 暂停消费消息
  @override
  pauseConsume() {
    _cancelTimer();
    _startConsumer = false;
  }

  bool hasStartConsumer() {
    return _startConsumer;
  }

  /// 暂停[milliseconds]时间的滑动到底部刷新
  pauseEndFrame() {
    if (_startFreezeTime <= 0) {
      return;
    }
    var pauseDuration =
        DateTime.now().millisecondsSinceEpoch - _startFreezeTime;

    _startFreezeTime = 0;
    if (pauseDuration < 200 && !_onFreezeFrame) {
      _freezeFrame = false;
      return;
    }
    _freezeFrame = true;
    _onFreezeFrame = true;
    _stopEndDebounce.call(() {
      _freezeFrame = false;
      _onFreezeFrame = false;

      /// 冻结结束，如有期间有新消息，立即执行一次滑动到底部行为
      if (_startConsumer && _endFlag) {
        _endFlag = false;
        queueConsumer?.handleEndFrame();
        _fromPauseEnd = true;
      }
    });
  }

  MessageContent elementAt(int index) {
    return _widgetDataList[index];
  }

  /// 轮询[_ensureEndTotalCount]次确保滑动到底部
  _ensureToEnd() {
    if (queueConsumer == null) return;

    _curEnsureEndCount--;
    if (_curEnsureEndCount < 0) {
      _curEnsureEndCount = _ensureEndInitVal;
      return;
    }
    Future.delayed(const Duration(milliseconds: 1000), () {
      queueConsumer?.handleEndFrame();
      _ensureToEnd();
    });
  }

  bool checkExistMsg(MessageContent msg) {
    if (_widgetDataList.isNotEmpty) {
      MessageContent? item = _widgetDataList.lastWhereOrNull(
        (e) => e.messageId == msg.messageId,
      );
      return item != null;
    } else {
      return false;
    }
  }

  MessageContent? elementAtMsgId(int msgId) {
    if (_widgetDataList.isNotEmpty) {
      MessageContent? item =
          _widgetDataList.lastWhereOrNull((e) => e.messageId == msgId);
      return item;
    } else {
      return null;
    }
  }

  /// 删除消息
  removeMessage(int msgId) {
    if (_widgetDataList.isNotEmpty) {
      int index =
          _widgetDataList.indexWhere((element) => element.messageId == msgId);
      if (index >= 0) {
        _widgetDataList.removeAt(index);
      }
    }
  }
}
