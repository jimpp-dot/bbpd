import 'package:flutter/foundation.dart';
import 'package:flutter_bugly/bugly.dart';

typedef ObjectCallback = Function(String type, dynamic data);

class Events {
  final Map<String, ObserverList<ObjectCallback>> _data = {};

  void addListener(String type, ObjectCallback listener) {
    ObserverList<ObjectCallback> list =
        _data[type] ??= ObserverList<ObjectCallback>();
    list.add(listener);
  }

  void addListeners(List<String> types, ObjectCallback listener) {
    for (var type in types) {
      addListener(type, listener);
    }
  }

  void removeListener(String type, ObjectCallback listener) {
    ObserverList<ObjectCallback>? list = _data[type];
    list?.remove(listener);
    if (list?.isEmpty ?? false) {
      _data.remove(type);
    }
  }

  void removeListeners(List<String> types, ObjectCallback listener) {
    for (var type in types) {
      removeListener(type, listener);
    }
  }

  @mustCallSuper
  void dispose() {
    _data.clear();
  }

  void emit(String type, [dynamic data]) {
    Bugly.infoLog('Event: $type'); // bugly跟踪日志
    ObserverList<ObjectCallback>? list = _data[type];
    if (list?.isNotEmpty ?? false) {
      final List<ObjectCallback> listeners = List<ObjectCallback>.from(list!);
      for (var listener in listeners) {
        try {
          if (listeners.contains(listener)) listener(type, data);
        } catch (exception, stack) {
          FlutterError.reportError(FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: 'events library',
          ));
        }
      }
    }
  }
}

Events eventCenter = Events();
