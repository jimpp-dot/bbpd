import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

typedef DialogBuilder = Future<T> Function<T>(BuildContext context);

/// Dialog 队列
/// 同时显示多个Dialog时，将会排队显示，而不是覆盖显示
/// 支持取消显示排队中的Dialog
class DialogQueue {
  final String name;

  final Queue<_DialogBean> _queue = ListQueue();

  DialogQueue._internal(this.name);

  static final Map<String, DialogQueue> _cache = {};

  /// 创建队列
  factory DialogQueue(String name) {
    return _cache.putIfAbsent(name, () => DialogQueue._internal(name));
  }

  /// 默认队列
  static DialogQueue get root => DialogQueue('root');

  /// 入队
  Future<T?> enqueue<T>({
    required BuildContext context,
    Key? key,
    bool barrierDismissible = true,
    Color? barrierColor,
    WidgetBuilder? builder,
    DialogBuilder? dialogBuilder,
    RouteSettings? routeSettings,
    bool useRootNavigator = true,
  }) async {
    assert(builder != null || dialogBuilder != null);
    Completer<T?> completer;
    _DialogBean<T?> bean;
    if (key != null && _queue.any((e) => e.key == key)) {
      bean = _queue.firstWhere((e) => e.key == key) as _DialogBean<T?>;
      completer = bean.completer;
      return completer.isCompleted ? null : completer.future;
    } else {
      completer = Completer();
      if (dialogBuilder != null) {
        bean = _DialogBean.custom(
          key: key ?? UniqueKey(),
          context: context,
          completer: completer,
          dialogBuilder: dialogBuilder,
          routeSettings: routeSettings,
        );
      } else {
        bean = _DialogBean(
          context: context,
          key: key ?? UniqueKey(),
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor ?? Colors.black54,
          builder: builder!,
          useRootNavigator: useRootNavigator,
          completer: completer,
          routeSettings: routeSettings,
        );
      }

      _queue.addLast(bean); // 插入到队列的尾部

      // 队列只有一个元素，则直接show出来
      if (_queue.length == 1) {
        _show<T>(_queue.first);
      }

      return completer.future;
    }
  }

  _show<T>(_DialogBean bean) async {
    T? result;
    if (bean.dialogBuilder != null) {
      result = await bean.dialogBuilder!(bean.context);
    } else {
      result = await showDialog<T>(
        context: bean.context,
        barrierDismissible: bean.barrierDismissible,
        barrierColor: bean.barrierColor,
        useRootNavigator: bean.useRootNavigator,
        builder: bean.builder!,
      );
    }
    _queue.remove(bean); // 显示后移出队列
    bean.completer.complete(result);
    // 循环queue
    if (_queue.isNotEmpty) {
      _DialogBean next = _queue.first;
      await _show(next);
    }
  }

  bool containsKey(Key? key) {
    return key != null && _queue.any((e) => e.key == key);
  }

  /// 清空队列
  void clear() {
    _queue.clear();
  }

  /// 根据key从等待队列中移除Dialog
  bool remove(Key key) {
    if (containsKey(key)) {
      _queue.removeWhere((e) => e.key == key);
      return true;
    }
    return false;
  }
}

class _DialogBean<T> {
  final Key key;
  final BuildContext context;
  final bool barrierDismissible;
  final Color? barrierColor;
  final WidgetBuilder? builder;
  final bool useRootNavigator;
  final Completer<T> completer;
  final DialogBuilder? dialogBuilder;
  final RouteSettings? routeSettings;

  _DialogBean({
    required this.context,
    required this.key,
    required this.builder,
    required this.completer,
    this.barrierDismissible = true,
    this.barrierColor,
    this.useRootNavigator = true,
    this.dialogBuilder,
    this.routeSettings,
  });

  _DialogBean.custom({
    required this.key,
    required this.context,
    required this.completer,
    required this.dialogBuilder,
    this.barrierDismissible = true,
    this.barrierColor,
    this.builder,
    this.useRootNavigator = true,
    this.routeSettings,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DialogBean &&
          runtimeType == other.runtimeType &&
          key == other.key;

  @override
  int get hashCode => key.hashCode;
}
