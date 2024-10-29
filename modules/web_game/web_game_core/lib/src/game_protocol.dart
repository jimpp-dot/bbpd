import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:shared/shared.dart' hide describeEnum;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../web_game_core.dart';

abstract class IGameProtocol {
  /// 获取协议版本
  int getProtocolVersion();

  /// 获取用户信息
  Map<String, dynamic> getUserInfo();

  /// 获取app信息
  Map<String, dynamic> getAppInfo();

  /// 获取设备info
  Map<String, dynamic> getDeviceInfo();

  /// 获取基本信息
  void getBaseInfo(GamePayload payload);

  /// 游戏加载成功
  void onStartupSuccess(GamePayload payload);

  /// (批量)获取关注状态
  void getFollowStatus(GamePayload payload);

  /// 点击关注、取消关注
  void followClick(GamePayload payload);

  /// 上报异常
  void reportError(GamePayload payload);

  /// 游戏弹toast
  void toast(GamePayload payload);

  /// 退出游戏
  void quitGame(GamePayload payload);

  /// 清除缓存
  void clearCache(GamePayload payload);

  /// 禁用/启用鼠标事件响应
  /// ios平台需要在特定场景下屏蔽手势，避免widget上的手势穿透到webview里
  /// [timeout] 单位秒，不传的话就是恢复鼠标事件响应
  void disableMouseEvent({int timeout = 15});

  /// 打开充值页
  void openRechargePage(GamePayload payload);

  /// 打开钱包页
  void openWalletPage(GamePayload payload);

  /// 埋点
  void trackEvent(GamePayload payload);

  /// 埋点计时
  void timeEvent(GamePayload payload);
}

typedef GameMessageCallback = void Function(GamePayload payload);

/// 与游戏对接的协议
///
/// 销毁时记得调用dispose并将引用置为null
class GameProtocol with WidgetsBindingObserver implements IGameProtocol {
  GameProtocol(this.state, {this.onStartupCallback});

  final State state;
  final VoidCallback? onStartupCallback;
  final Map<String, GameMessageCallback> gameMessageCallbacks = {};

  DateTime loadingTime = DateTime.now();
  WebViewController? webViewController;
  GameResourceManager? gameResManager;
  Timer? trackTimer;
  final StreamController<ProgressInfo> stateStreamController =
      StreamController.broadcast(onListen: () {}, onCancel: () {});

  GameState _gameState = GameState.initial;

  GameState get gameState => _gameState;

  set gameState(GameState gameState) {
    _gameState = gameState;
    stateStreamController.add(ProgressInfo(state: gameState));
    if (gameState == GameState.loading) {
      loadingTime = DateTime.now();
    }
    refreshState();
  }

  bool get gameBooted => _gameState == GameState.successful; // 游戏是否已启动

  BuildContext get context => state.context;

  @mustCallSuper
  void init() {
    initAndroidWebViewPlatform();
    reset();
    registerGameMessageCallback();
    WidgetsBinding.instance.addObserver(this);
  }

  @mustCallSuper
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _dispose();
    stateStreamController.close();
  }

  void _dispose() {
    trackTimer?.cancel();
    _gameState = GameState.initial;
    webViewController = null;
  }

  /// 重置，一般用于切房场景
  @mustCallSuper
  void reset() {
    _dispose();
    loadingTime = DateTime.now();
  }

  @mustCallSuper
  void registerGameMessageCallback() {
    gameMessageCallbacks['get_base_info'] = (payload) {
      // 请求基本信息
      getBaseInfo(payload);
    };
    gameMessageCallbacks['startup_success'] = (payload) {
      // 游戏启动成功
      onStartupSuccess(payload);
    };
    gameMessageCallbacks['get_follow_status'] = (payload) {
      // 查询关注状态
      getFollowStatus(payload);
    };
    gameMessageCallbacks['follow_click'] = (payload) {
      followClick(payload);
    };
    gameMessageCallbacks['report_error'] = (payload) {
      // 游戏上报异常
      reportError(payload);
    };
    gameMessageCallbacks['toast'] = (payload) {
      // 游戏弹toast
      toast(payload);
    };
    gameMessageCallbacks['quit_game'] = (payload) {
      Navigator.of(context).maybePop();
    };
    gameMessageCallbacks['clear_cache'] = (payload) {
      // 清除缓存
      clearCache(payload);
    };
    gameMessageCallbacks['open_recharge_page'] = (payload) {
      // 打开充值页
      openRechargePage(payload);
    };
    gameMessageCallbacks['open_wallet_page'] = (payload) {
      // 打开钱包页
      openWalletPage(payload);
    };
    gameMessageCallbacks['track_event'] = (payload) {
      trackEvent(payload);
    };
    gameMessageCallbacks['time_event'] = (payload) {
      timeEvent(payload);
    };
  }

  /// 游戏发过来的消息
  void onGameMessage(String message) async {
    GamePayload? payload;
    try {
      payload =
          GamePayload.fromJson(Map<String, dynamic>.from(jsonDecode(message)));
    } catch (e) {
      Log.e(e);
      return;
    }
    gameMessageCallbacks[payload.name]?.call(payload);
  }

  @override
  int getProtocolVersion() => 20230413;

  @override
  Map<String, dynamic> getUserInfo() {
    return {
      'uid': Session.uid,
      'name': Session.name,
      'icon': System.imageDomain + Session.icon,
      'gender': Session.sex,
      'token': Session.token,
    };
  }

  @override
  Map<String, dynamic> getAppInfo() {
    return {
      'brandColor':
          R.color.mainBrandColor.value.toRadixString(16).padLeft(8, '0'),
      'lan': Translations.getLan(),
      'domain': System.domain,
      'imageDomain': System.imageDomain,
      'protocolVersion': getProtocolVersion(),
    };
  }

  @override
  Map<String, dynamic> getDeviceInfo() {
    return {
      'platform': describeEnum(defaultTargetPlatform).toLowerCase(),
      'systemVersion': DeviceInfo.systemVersion,
      'devicePixelRatio': window.devicePixelRatio,
      'width': Util.width,
      'height': Util.height,
      'paddingTop': Util.statusHeight,
      'paddingBottom': Util.iphoneXBottom,
    };
  }

  @override
  void quitGame(GamePayload payload) {
    Navigator.of(context).maybePop();
  }

  /// test
  void writeLayaLog(String log) {
    sendMessageToGame(GamePayload(
      name: 'test_laya_log',
      id: DateTime.now().millisecondsSinceEpoch,
      data: {'log': log},
    ));
  }

  /// 传递消息给webview
  /// js端需挂载一个func接收
  Future<String>? sendMessageToGame(GamePayload payload) {
    // 直接传json串会解析报错，而且中文会乱码，这里uri编码一次
    return webViewController?.evaluateJavascript(
        'window.sendToGame && window.sendToGame("${Uri.encodeComponent(payload.toString())}")');
  }

  void refreshState() {
    if (state.mounted) {
      state.setState(() {});
    }
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    sendMessageToGame(GamePayload(
      name: 'app_lifecycle_state',
      data: {'state': state.name},
    ));
  }

  /// 禁用游戏对鼠标事件的响应
  @override
  void disableMouseEvent({int timeout = 60}) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      sendMessageToGame(GamePayload(
        name: 'disable_mouse_event',
        id: DateTime.now().millisecondsSinceEpoch,
        data: {'timeout': timeout},
      ));
    }
  }

  /// 启用游戏对鼠标事件的响应
  void enableMouseEvent() {
    disableMouseEvent(timeout: 0);
  }

  /// 游戏请求基本信息
  @override
  void getBaseInfo(GamePayload payload) {
    String name = payload.name ?? '';
    if (name == 'get_base_info') {
      // 请求基本信息
      Map<String, dynamic> data = {};
      data['user'] = getUserInfo();
      data['app'] = getAppInfo();
      data['device'] = getDeviceInfo();
      sendMessageToGame(payload.response(data));
    }
  }

  /// 游戏启动成功的通知消息
  @override
  void onStartupSuccess(GamePayload payload) {
    gameState = GameState.successful;
    writeLayaLog(MediaQueryData.fromView(window).toString());
    // Log.i('加载游戏总耗时: ${DateTime.now().difference(loadingTime).inMilliseconds}ms');
    onStartupCallback?.call();
  }

  /// 获取关注状态
  @override
  void getFollowStatus(GamePayload payload) async {
    assert(payload.isRequest);
    List<int> uids = List<int>.from(payload.data);
    if (uids.isNotEmpty) {
      Map<int, int>? res =
          await BaseRequestManager.batchQueryFollowStatus(uids);
      Log.d(res, tag: 'get_follow_status');
      // 把key转成String
      sendMessageToGame(payload.response(res
          .map<String, int>((key, value) => MapEntry(key.toString(), value))));
    }
  }

  /// 点击关注、取消关注
  @override
  void followClick(GamePayload payload) async {
    assert(payload.isRequest);
    Map<String, dynamic> map = Map<String, dynamic>.from(payload.data);
    if (map['follow'] == true) {
      NormalNull res = await BaseRequestManager.onFollow(
        map['uid'].toString(),
        gameType: map['gameType'] ?? '',
        refer: map['refer'] ?? '',
      );
      Log.d(res.toProto3Json(), tag: 'follow');
      sendMessageToGame(
          payload.response({'success': res.success, 'msg': res.msg}));
    } else {
      NormalNull res = await BaseRequestManager.unFollow(map['uid'].toString());
      Log.d(res.toProto3Json(), tag: 'unfollow');
      sendMessageToGame(
          payload.response({'success': res.success, 'msg': res.msg}));
    }
  }

  /// 游戏上报异常
  @override
  void reportError(GamePayload payload) {
    try {
      Map data = payload.data;
      String exception = data['exception'].toString();
      FlutterError.reportError(FlutterErrorDetails(
        exception: exception,
        // stack: StackTrace.fromString(data['stack'].toString()), // web上的stack在debug模式下会解析报错
        library: 'FlutterWebGame',
      ));
    } catch (e) {
      Log.e(e);
    }
  }

  /// 游戏弹toast
  @override
  void toast(GamePayload payload) {
    Toast.showCenter(context, payload.data);
  }

  /// 清除缓存
  @override
  void clearCache(GamePayload payload) async {
    if (isGameOnlineDev) {
      await webViewController?.clearCache(); // 清除webview缓存
    } else {
      GameResourceManager.clearCache(); // 清除本地资源包缓存
    }
  }

  @override
  void openRechargePage(GamePayload payload) {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.openRechargeScreen(context);
  }

  @override
  void openWalletPage(GamePayload payload) {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.openBalanceScreen(context);
  }

  @override
  void trackEvent(GamePayload payload) {
    Map data = payload.data;
    if (data.containsKey('name')) {
      String name = data['name'];
      Map properties = data['properties'];
      Tracker.instance.track(TrackEvent(name),
          properties: Map<String, dynamic>.from(properties));
    }
  }

  @override
  void timeEvent(GamePayload payload) {
    Map data = payload.data;
    if (data.containsKey('name')) {
      String name = data['name'];
      Tracker.instance.timeEvent(TrackEvent(name));
    }
  }
}
