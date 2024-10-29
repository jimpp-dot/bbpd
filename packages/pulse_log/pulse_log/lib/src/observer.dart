import 'package:pulse_log/pulse_log.dart';
import 'package:flutter/widgets.dart';

import 'events.dart';

typedef ScreenNameExtractor = String? Function(RouteSettings? settings);

String? defaultNameExtractor(RouteSettings? settings) => settings?.name;

class BindingObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    PulseLog.instance.event(EventNames.appLifecycle, properties: {'state': state.name});

    //退后台写缓存日志
    if (state == AppLifecycleState.paused) {
      PulseLog.instance.flushLogs();
    }
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    PulseLog.instance.event(EventNames.memoryPressure);
  }
}

/// 页面路由
class PulseLogRouterObserver extends NavigatorObserver {
  final ScreenNameExtractor nameExtractor;

  PulseLogRouterObserver({this.nameExtractor = defaultNameExtractor});

  void _recordScreenView(Route<dynamic>? preRoute, Route<dynamic>? curRoute) {
    final String? preName = nameExtractor(preRoute?.settings);
    final String? curName = nameExtractor(curRoute?.settings);
    RouterBody body = RouterBody(preName ?? '', curName ?? '');
    if (curRoute != null) {
      body.routeArgs = curRoute.settings.arguments;
    }
    PulseLog.instance.log(body);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _recordScreenView(previousRoute, route);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _recordScreenView(previousRoute, route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _recordScreenView(oldRoute, newRoute);
  }
}

BindingObserver bindingObserver = BindingObserver();
PulseLogRouterObserver pulseLogRouterObserver = PulseLogRouterObserver();
