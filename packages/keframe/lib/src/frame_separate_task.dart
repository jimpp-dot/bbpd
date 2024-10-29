import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import 'logcat.dart';

/// Copyright 2020 ke.com. All rights reserved.
/// @date    5/7/21 11:10 AM
/// @desc  Split the frame queue and add tasks to the queue through the ScheduleTask.

///  By default, there is no limit to the size of the queue, so limit the size after setting maxTaskSize.
///
///  Reference [SchedulerBinding], each task has a priority, there are three categories: Idle Animation Touch.
///  Each frame takes the first task (FIFO) out of the queue and schedules it until the queue is empty.
///  Use the [SchedulingStrategy] policy to determine whether the task should be executed:
///
///  If the policy is successful, the task is executed
///  If the policy fails, a scheduling attempt is made after the next frame is rendered
class FrameSeparateTaskQueue {
  FrameSeparateTaskQueue._();

  bool _hasRequestedAnEventLoopCallback = false;
  int maxTaskSize = 0;

  static FrameSeparateTaskQueue? _instance;

  static FrameSeparateTaskQueue? get instance {
    _instance ??= FrameSeparateTaskQueue._();
    return _instance;
  }

  SchedulingStrategy schedulingStrategy = defaultSchedulingStrategy;

  static int _taskSorter (TaskEntry<dynamic> e1, TaskEntry<dynamic> e2) {
    if (e1.priority == e2.priority) {
      return e2.now - e1.now;
    }
    return -e1.priority.compareTo(e2.priority);
  }

  final PriorityQueue<TaskEntry<dynamic>> _taskQueue = HeapPriorityQueue<TaskEntry<dynamic>>(_taskSorter);

  // final Queue<TaskEntry<dynamic>> _taskQueue = ListQueue();

  int get taskLength => _taskQueue.length;

  Future<bool> handleEventLoopCallback() async {
    if (_taskQueue.isEmpty) return false;
    final TaskEntry<dynamic> entry = _taskQueue.first;
    if (schedulingStrategy(
        priority: entry.priority, scheduler: SchedulerBinding.instance)) {
      try {
        _taskQueue.removeFirst();
        entry.run();
      } catch (exception, exceptionStack) {
        StackTrace? callbackStack;
        assert(() {
          callbackStack = entry.debugStack;
          return true;
        }());
        FlutterError.reportError(FlutterErrorDetails(
          exception: exception,
          stack: exceptionStack,
          library: 'scheduler library',
          context: ErrorDescription('during a task callback'),
          informationCollector: (callbackStack == null)
              ? null
              : () sync* {
                  yield DiagnosticsStackTrace(
                    '\nThis exception was thrown in the context of a scheduler callback. '
                    'When the scheduler callback was _registered_ (as opposed to when the '
                    'exception was thrown), this was the stack',
                    callbackStack,
                  );
                },
        ));
      }
      return _taskQueue.isNotEmpty;
    }
    return true;
  }

  /// Ensures that the scheduler services a task scheduled by [scheduleTask].
  Future<void> _ensureEventLoopCallback() async {
    assert(_taskQueue.isNotEmpty);
    if (_hasRequestedAnEventLoopCallback) return;
    _hasRequestedAnEventLoopCallback = true;
    Timer.run(() {
      _removeIgnoreTasks();
      _runTasks();
    });
  }

  /// Scheduled by _ensureEventLoopCallback.
  Future<void> _runTasks() async {
    _hasRequestedAnEventLoopCallback = false;
    await SchedulerBinding.instance.endOfFrame;
    if (await handleEventLoopCallback()) _ensureEventLoopCallback();
  }

  void shuffleTask(bool Function(TaskEntry taskEntry) condition) {
    // _taskQueue.removeWhere((TaskEntry e) => condition(e));
  }

  void _removeIgnoreTasks() {
    while (_taskQueue.isNotEmpty) {
      if (!_taskQueue.first.canIgnore()) {
        break;
      }
      _taskQueue.removeFirst();
    }
  }

  int _now() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  Future<T> scheduleTask<T>(
      TaskCallback<T> task, Priority priority, ValueGetter<bool> canIgnore,
      {String? debugLabel, Flow? flow, int? id}) {
    final int now = _now();
    // print('FrameSeparateTaskQueue.scheduleTask now = $now');
    final TaskEntry<T> entry =
        TaskEntry<T>(task, priority.value, canIgnore, debugLabel, flow, now, id: id);
    _addTask(entry);
    _ensureEventLoopCallback();
    return entry.completer.future;
  }

  void _addTask(TaskEntry _taskEntry) {
    if (maxTaskSize != 0 && _taskQueue.length >= maxTaskSize) {
      logcat('remove Task');
      _taskQueue.removeFirst();
    }
    _taskQueue.add(_taskEntry);
  }

  void resetMaxTaskSize() {
    maxTaskSize = 0;
  }
}

class TaskEntry<T> {
  TaskEntry(
      this.task, this.priority, this.canIgnore, this.debugLabel, this.flow, this.now,
      {this.id}) {
    // ignore: prefer_asserts_in_initializer_lists
    assert(() {
      debugStack = StackTrace.current;
      return true;
    }());
    completer = Completer<T>();
  }

  final TaskCallback<T> task;
  final int priority;
  final String? debugLabel;
  final Flow? flow;
  final int? id;
  final ValueGetter<bool> canIgnore;
  final int now;
  StackTrace? debugStack;
  late Completer<T> completer;

  void run() {
    // print('TaskEntry.run now = $now, priority = $priority');
    if (!kReleaseMode) {
      Timeline.timeSync(
        debugLabel ?? 'Scheduled Task',
        () {
          completer.complete(task());
        },
        flow: flow != null ? Flow.step(flow!.id) : null,
      );
    } else {
      completer.complete(task());
    }
  }
}
