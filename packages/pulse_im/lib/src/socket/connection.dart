import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:pulse_im/src/pulse_im_client.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_config.dart';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class OnSocketConnection {
  void onData(String data) {}

  void onByteData(ByteData data) {}

  void onError(Object error) {}

  void onDone() {}

  void onConnectError(String sockAddress, Object error) {}

  void onConnected(String sockAddress) {}

  void onDisconnect(StackTrace stacktrace) {}
}

mixin SocketContainerMixin {
  SocketConnection? _socket;

  set socketConnection(SocketConnection? item) => _socket = item;

  SocketConnection? get socketConnection => _socket;
}

abstract class IMessageReceiver extends OnSocketConnection with SocketContainerMixin {}

abstract class IMessageSender with SocketContainerMixin {
  Future<bool> login(String pushToken, String pushVendor);
}

/// 取消单例，方便业务扩展自己的链接管理
class SocketConnection {
  SocketConnection(this.messageReceiver, this.messageSender) {
    messageReceiver.socketConnection = this;
    messageSender.socketConnection = this;
  }

  final IMessageReceiver messageReceiver;
  final IMessageSender messageSender;

  Connectivity? _connectivity;
  bool _logout = false;

  WebSocket? _channel;

  static const CONNECT_LOG = "WS_CONNECT";
  static const LOG_TAG = "SocketConnection_Common_IM";

  late String pushToken;
  late String pushVendor;
  String sockAddress = '';
  HttpClient? customClient;

  bool _isNetworkConnected = true;
  ConnectivityResult netType = ConnectivityResult.none;
  bool _connecting = false;
  bool _kickOut = false; //被踢下线
  bool _inLoopTrying = false;

  bool handleCancel = false; //手动取消
  bool forceClose = false;

  late int pingDur;

  ///随机的重连间隔时间范围。针对异常断连之后的首次重连，避免后台服务重启时瞬间出现大量并发连接请求
  static const int _minReconnectDelay = 2 * 1000;
  static const int _maxReconnectDelay = 10 * 1000;

  ///自动重连间隔时间，服务器连不通时循环尝试重新连接
  static const int _reconnectTimeDelay = 5 * 1000;

  /// 检测到登录成功后，会初始化
  /// - customClient 用于自定义的http请求，比如设置代理
  Future init(String pushToken, String pushVendor, {String? sockAddr, int? pingDur, HttpClient? customClient}) async {
    _logout = false;
    _kickOut = false;
    forceClose = false;
    handleCancel = false;
    this.customClient = customClient;
    _monitorNetworkConnectivityChanged();
    IMLog.d(LOG_TAG, "init ");
    this.pushToken = pushToken;
    this.pushVendor = pushVendor;
    sockAddress = sockAddr ?? IMConfig.getSocketAddress() ?? '';
    this.pingDur = pingDur ?? LocalUserData.heart;
    IMLog.d(LOG_TAG, "init $pushToken, sockAddress: $sockAddress, pingDur: $pingDur");
    await _tryConnect(forceStartNow: true, ignoreNetWork: true);
  }

  bool sendPacket(dynamic packet) {
    if (isConnected()) {
      try {
        IMLog.i(LOG_TAG, "$CONNECT_LOG sendPacket packet = $packet");
        _channel!.add(packet);
        return true;
      } catch (e) {
        IMLog.e(LOG_TAG, "$CONNECT_LOG sendPacket failed, error is ${e.toString()}");
        _tryConnect(
            forceStartNow: false, ignoreNetWork: false); //since _channel.add() failed, maybe the _channel is broken
      }
    } else {
      _tryConnect(forceStartNow: true, ignoreNetWork: true);
    }
    return false;
  }

  void reconnectIfNeed() {
    _tryConnect(forceStartNow: true, ignoreNetWork: true);
  }

  Future disconnectByLogout() async {
    IMLog.d(LOG_TAG, "$CONNECT_LOG disconnectByLogout......");
    _logout = true;
    await _disconnect();
  }

  Future disconnectByKickOut() async {
    IMLog.d(LOG_TAG, "$CONNECT_LOG disconnectByKickOut......");
    _kickOut = true;
    await _disconnect();
  }

  bool isConnected() {
    return _channel != null && _channel!.readyState == WebSocket.open;
  }

  bool _isConnecting() {
    if (_connecting) {
      return true;
    }
    return _channel != null && _channel!.readyState == WebSocket.connecting;
  }

  Future _tryConnect({bool forceStartNow = false, bool ignoreNetWork = false}) async {
    if (sockAddress.isEmpty) {
      return;
    }
    IMLog.d(
        LOG_TAG,
        "$CONNECT_LOG tryConnect enter......  _kickOut = $_kickOut"
        " and _logout = $_logout _isNetworkConnected = $_isNetworkConnected  isConnected = ${isConnected()} _isConnecting = ${_isConnecting()}");

    if (PulseIMClient.onTryConnect != null) {
      Map<String, dynamic> reportParams = {
        'forceStartNow': forceStartNow,
        'ignoreNetWork': ignoreNetWork,
        '_kickOut': _kickOut,
        '_logout': _logout,
        '_isNetworkConnected': _isNetworkConnected,
        'isConnected': isConnected(),
        '_isConnecting': _isConnecting(),
        '_inLoopTrying': _inLoopTrying,
        'socketAddress': IMConfig.getSocketAddress() ?? ''
      };
      PulseIMClient.onTryConnect?.call(reportParams);
    }

    if (IMUtil.isStringEmpty(IMConfig.getSocketAddress())) {
      return;
    }

    bool nc = _isNetworkConnected;

    /// _isNetworkConnected不是绝对精准，某些场景不做网络判断直接重连
    if (ignoreNetWork == true) {
      nc = true;
    }

    if (isConnected() || _isConnecting()) {
      return;
    }

    if (!nc || _logout || _kickOut) {
      await _disconnect();
      return;
    }

    int delay = 0;
    if (!forceStartNow) {
      delay = _getRandomConnectDelayInMilliSecs();
      await Future.delayed(Duration(milliseconds: delay));
    }
    if (isConnected() || _isConnecting()) {
      return;
    }
    if (!nc || _logout || _kickOut) {
      await _disconnect();
      return;
    }

    if (_inLoopTrying) {
      return;
    }

    IMLog.d(LOG_TAG, "$CONNECT_LOG _tryConnect after delay $delay ms......");

    bool connected = false;
    while (!connected) {
      if (handleCancel) {
        break;
      }
      _inLoopTrying = true;
      connected = await _doWebsocketConnect();
      if (connected) {
        _inLoopTrying = false;
        break;
      }
      await Future.delayed(const Duration(milliseconds: _reconnectTimeDelay));
      if (connected) {
        _inLoopTrying = false;
        break;
      }
    }
  }

  Future<bool> _doWebsocketConnect() async {
    if (isConnected()) {
      IMLog.d(LOG_TAG, "$CONNECT_LOG.................isConnected true..............");
      return true;
    }

    if (_isConnecting()) {
      IMLog.d(LOG_TAG, "$CONNECT_LOG................._isConnecting true..............");
      return false;
    }

    _connecting = true;
    try {
      int connStartTime = _now();
      IMLog.d(LOG_TAG, "$CONNECT_LOG................._doWebsocketConnect $sockAddress begin..............");
      if (PulseIMClient.onRealConnect != null) {
        PulseIMClient.onRealConnect?.call(sockAddress, _isNetworkConnected);
      }
      _channel = await WebSocket.connect(sockAddress, customClient: customClient);
      int connEndTime = _now();
      IMLog.d(LOG_TAG,
          "$CONNECT_LOG................._doWebsocketConnect $sockAddress success, cost time is ${connEndTime - connStartTime} ms..............");
      _channel?.pingInterval = Duration(seconds: pingDur);
      _receivePackages();
      messageSender.login(pushToken, pushVendor);
    } catch (e) {
      IMLog.e(LOG_TAG, '$CONNECT_LOG connect to server [$sockAddress] failed: $e');
      _connecting = false;
      if (PulseIMClient.onConnectError != null) {
        PulseIMClient.onConnectError?.call(e, _isNetworkConnected, null);
      }
      try {
        messageReceiver.onConnectError(sockAddress, e);
      } catch (e) {}
      return false;
    }
    _connecting = false;
    if (PulseIMClient.onConnectSucc != null) {
      PulseIMClient.onConnectSucc?.call();
    }
    try {
      messageReceiver.onConnected(sockAddress);
    } catch (e) {}
    return true;
  }

  void _receivePackages() {
    IMLog.d(LOG_TAG, "$CONNECT_LOG begin _receivePackages......");
    _channel?.listen(_onData, onError: _onError, cancelOnError: true, onDone: _onDone);
  }

  void _onData(message) {
    IMLog.i(LOG_TAG, "$CONNECT_LOG _receivePackages message = $message");
    if (message is String) {
      String data = message;
      messageReceiver.onData(data);
    } else if (message is Uint8List || message is List<int>) {
      ByteData data = Uint8List.fromList(message).buffer.asByteData();
      messageReceiver.onByteData(data);
    }
  }

  void _onError(Object error, StackTrace stackTrace) async {
    if (PulseIMClient.onConnectError != null) {
      PulseIMClient.onConnectError?.call(e, _isNetworkConnected, stackTrace);
    }
    IMLog.e(LOG_TAG, "$CONNECT_LOG _onError error=$error, stackTrace=$stackTrace");
    messageReceiver.onError(error);
    await _disconnect();
    _tryConnect(forceStartNow: false);
  }

  void _onDone() async {
    if (PulseIMClient.onConnectOnDone != null) {
      PulseIMClient.onConnectOnDone?.call();
    }
    IMLog.e(LOG_TAG, "$CONNECT_LOG _onDone");
    messageReceiver.onDone();
    await _disconnect();
    if (!forceClose) {
      _tryConnect(forceStartNow: false);
    }
  }

  Future _disconnect() async {
    IMLog.d(LOG_TAG, "$CONNECT_LOG begin _disconnect......");
    if (_channel != null) {
      IMLog.d(LOG_TAG,
          "connection closed --------- closeCode: ${_channel!.closeCode} , closeReason: ${_channel!.closeReason}");
      await _channel!.close();
      _channel = null;

      try {
        messageReceiver.onDisconnect(StackTrace.current);
      } catch (e) {}
    }
    _connecting = false;
  }

  void _monitorNetworkConnectivityChanged() async {
    if (_connectivity == null) {
      _connectivity = Connectivity();
      ConnectivityResult? result = await _connectivity?.checkConnectivity();
      netType = result ?? ConnectivityResult.none;
      _isNetworkConnected = netType != ConnectivityResult.none;

      _connectivity!.onConnectivityChanged.listen((ConnectivityResult result) async {
        _isNetworkConnected = result != ConnectivityResult.none;
        bool isChange = result != netType;
        netType = result;
        IMLog.d(LOG_TAG,
            "onConnectivityChanged result = $result, _isNetworkConnected = $_isNetworkConnected, isChange: $isChange");

        if (isChange || !_isNetworkConnected) {
          /// 网络发生类型变化或者断网，_disconnect
          IMLog.d(LOG_TAG, "disconnect by network change");
          await _disconnect();
        }

        if (_isNetworkConnected && isChange) {
          /// 网络发生类型变化且网已连上，_tryConnect
          IMLog.d(LOG_TAG, "_tryConnect by network change");
          _tryConnect();
        }
      });
    }
  }

  int _now() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int _getRandomConnectDelayInMilliSecs() {
    return Random().nextInt(_maxReconnectDelay - _minReconnectDelay) + _minReconnectDelay;
  }
}
