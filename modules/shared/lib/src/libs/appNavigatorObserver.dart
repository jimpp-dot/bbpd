import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/bugly.dart';

typedef HistoryPredicate = bool Function(String name);

class AppNavigatorObserver extends NavigatorObserver {
  final List<String> _history = [];

  AppNavigatorObserver() {
    eventCenter.addListener("Boot.Page.Changed", _onBootPageChanged);
  }

  printHistory() {
    Log.d(_history);
  }

  int length() {
    return _history.length;
  }

  int getIndex(HistoryPredicate callback) {
    for (int i = 0; i < _history.length; i++) {
      if (callback(_history[i]) == true) {
        return i;
      }
    }
    return -1;
  }

  int appNavigatorObserverGetIndex(String path) {
    int index = getIndex((String name) {
      if (name.startsWith(path)) {
        return true;
      }
      return false;
    });
    return index;
  }

  String getLast() {
    if (_history.isNotEmpty) {
      return _history.last;
    }

    return '';
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d("AppNavigatorObserver didStartUserGesture");
    eventCenter.emit("Navigator.Gesture.Start", getPageName(previousRoute));
  }

  @override
  void didStopUserGesture() {
    Log.d("AppNavigatorObserver didStopUserGesture");
    eventCenter.emit("Navigator.Gesture.Stop");
  }

  int _bootIndex = 0;

  _onBootPageChanged(String type, dynamic page) {
    if (page is! int) return;
    _bootIndex = page;
  }

  /// 首页当前tab index，为了不影响现有的onPop，onPush event消息，新增一个变量
  int appBootTabIndex = 0;

  void setBootIndex(int index) {
    appBootTabIndex = index;
  }

  String getPageName(Route<dynamic>? route) {
    if (route == null || route.settings.name == null) return '';
    List<String> names = route.settings.name!.split("/");
    int length = names.length;
    if (length >= 2) {
      if (names[1].isEmpty) {
        if (_bootIndex == 0) {
          return '/';
        } else {
          return '/$_bootIndex';
        }
      } else {
        return '/${names[1]}';
      }
    } else {
      return route.settings.name!;
    }
  }

  String uppStrFirst(String str) {
    String firstW = str.substring(0, 1);
    String lastW = str.substring(1);
    return firstW.toUpperCase() + lastW;
  }

  Map getReportPageName(RouteSettings routeSettings) {
    String? routeName = routeSettings.name;
    var routeArguments = routeSettings.arguments;
    Map res = {'name': '', 'vid': 0};
    if (routeName == '/') {
      res['name'] = 'Boot';
      return res;
    } else if (routeName == null) {
      res['name'] = 'Unknown';
      return res;
    }

    List<String> names = routeName.split("/");
    int namesLength = names.length;
    Log.d(names);
    if (namesLength >= 2) {
      if (names[1].isEmpty) {
        res['name'] = 'Boot';
      } else {
        res['name'] = uppStrFirst(names[1]);
        switch (res['name']) {
          case 'Image':
            res['vid'] = (routeArguments as Map)['uid'];
            break;

          case 'UserChat':
            res['vid'] = (routeArguments as Map)['targetId'];
            break;

          case 'Room':
            res['name'] = 'ChatRoomDisplay';
            res['vid'] = (routeArguments as Map)['rid'];
            break;

          default:
            break;
        }
      }
    } else {
      res['name'] = routeName;
    }

    return res;
  }

  final Map<String, int> _viewRecord = {};
  final Map<String, int> _tabIndex = {};

  onPageChange(String curPage, String? prefPage, {dynamic vid, dynamic refId}) {
    int ct = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    // int duration = 0;
    // if (_viewRecord.containsKey(prefPage)) {
    //   duration = ct - _viewRecord[prefPage]!;
    // }
    _viewRecord[curPage] = ct;

    curPage = _getNameWithIndex(curPage, _tabIndex[curPage]);
    prefPage = _getNameWithIndex(prefPage, _tabIndex[prefPage]);

    eventCenter.emit(EventConstant.EventPageChanged, [curPage, prefPage]);

    // bugly跟踪日志
    Bugly.infoLog('Router: prePage: $prefPage, curPage: $curPage');
  }

  onRouteChange(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    if (route?.settings == null || previousRoute?.settings == null) return;
    Map routeN = getReportPageName(route!.settings);
    Map routeP = getReportPageName(previousRoute!.settings);

    onPageChange(routeN['name'], routeP['name'],
        vid: routeN['vid'], refId: routeP['vid']);
  }

  String _getNameWithIndex(String? routeName, int? index) {
    if (index == null || index == 0) {
      return routeName ?? 'Unknown';
    } else if (index > 0) {
      return '${routeName}Tab$index';
    } else {
      return 'Unknown';
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d(
        'AppNavigatorObserver didPush route: ${route}, preRoute: $previousRoute');
    Log.d(
        'AppNavigatorObserver didPush route name: ${route.settings.name}, preRoute: ${previousRoute?.settings.name}');
    eventCenter.emit("Navigator.Page.Push.AnyWay");

    ///专用
    String preName = getPageName(previousRoute);
    String curName = getPageName(route);
    if (route is ModalRoute) {
      _addHistory(route);
      if (previousRoute is ModalRoute) {
        eventCenter.emit("Navigator.Page.Push", preName);
        // 数据上报：didPushP
        onRouteChange(route, previousRoute);
      }
    }

    eventCenter.emit("Navigator.Route.Push", preName);
    eventCenter.emit(EventConstant.EventRouteChanged, [curName, preName]);
  }

  /*
	* previousRoute 最终显示的
	* route 被移除的
	* */
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d(
        'AppNavigatorObserver didPop route: $route, preRoute: $previousRoute');
    _onRemovePage(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d(
        'AppNavigatorObserver didRemove route: $route, preRoute: $previousRoute');

    _onRemovePage(route, previousRoute);
  }

  Element? _getElementByRoute(Route route) {
    Element? element;
    if (route is ModalRoute) {
      route.subtreeContext?.visitChildElements((child) {
        child.visitChildElements((child) {
          child.visitChildElements((child) {
            element = child;
          });
        });
      });
    }
    return element;
  }

  _onRemovePage(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // if (!kReleaseMode) {
    //   final element = _getElementByRoute(route);
    //   if (element != null) {
    //     IMainManager mgr = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    //     mgr.watch(element);
    //     mgr.watch(element.widget);
    //     if (element is StatefulElement) {
    //       mgr.watch(element.state);
    //     }
    //   }
    // }

    if (route is ModalRoute) {
      _history.removeLast();
      _debugHistory();
      eventCenter.emit(EventConstant.EventNavigatorPageRemove,
          RouteRemovedEvent(route: route, previousRoute: previousRoute));
    }

    String preName = getPageName(previousRoute);
    String curName = getPageName(route);

    eventCenter.emit(EventConstant.EventRouteChanged, [preName, curName]);

    if (previousRoute is ModalRoute) {
      eventCenter.emit("Navigator.Page.Pop", preName);
    }

    if (route is ModalRoute) {
      // 数据上报：didPop
      onRouteChange(previousRoute, route);
    }

    String pageName = getReportPageName(route.settings)['name'];
    _tabIndex.remove(pageName);
    _viewRecord.remove(pageName);
  }

  @override
  void didReplace({Route<dynamic>? oldRoute, Route<dynamic>? newRoute}) {
    Log.d("AppNavigatorObserver didReplace");
    if (oldRoute is ModalRoute) {
      _history.removeLast();
      eventCenter.emit(
          EventConstant.EventNavigatorPageRemove, getPageName(oldRoute));
    }
    _addHistory(newRoute);

    // 数据上报：didReplace
    onRouteChange(newRoute, oldRoute);
  }

  _addHistory(Route<dynamic>? route) {
    Log.d('AppNavigatorObserver addHistory route: $route');
    if (route is ModalRoute) {
      String name = '/unknown';
      if (route.settings.name != null) {
        name = route.settings.name!;
      }
      _history.add(name);
    }
    _debugHistory();
  }

  _debugHistory() {}

  onResumed() {
    Log.d('View resumed, ');

    String? curPage = _viewRecord.keys.lastWhereOrNull(
      (pageName) => pageName != 'Unknown',
    );

    if (curPage == null) {
      return;
    }

    onPageChange(curPage, 'System');
  }

  onPaused() {
    Log.d('View paused');

    String? curPage = _viewRecord.keys.lastWhereOrNull(
      (pageName) => pageName != 'Unknown',
    );

    if (curPage == null) {
      return;
    }

    onPageChange('System', curPage);
  }
}

class RouteRemovedEvent {
  Route<dynamic>? route;
  Route<dynamic>? previousRoute;

  RouteRemovedEvent({this.route, this.previousRoute});
}

final AppNavigatorObserver appNavigatorObserver = AppNavigatorObserver();
final RouteObserver<Route<dynamic>> routeObserver = RouteObserver();
final List<NavigatorObserver> defaultNavigatorObservers = [
  appNavigatorObserver,
  routeObserver,
];
