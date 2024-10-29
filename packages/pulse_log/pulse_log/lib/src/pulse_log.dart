import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:pulse_log/src/gather2.dart';
import 'package:pulse_log/src/log_utils.dart';
import 'package:pulse_log/src/model/default_uploader.dart';
import 'package:pulse_log/src/model/log_print.dart';
import 'package:pulse_log/src/gatherInterface.dart';
import 'package:pulse_log/src/gather_windows.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:carrier_info/carrier_info.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'events.dart';

class PulseLog {
  static const MethodChannel _channel = MethodChannel('ly.plugins.pulse_log');
  static const EventChannel _eventChannel = EventChannel('ly.plugins.pulse_log.event');

  static PulseLog? _ins;

  static LogConfig? _config;

  static bool _enable = false;

  static bool enablePrint = true;

  static PulseLog get instance => _ins ??= PulseLog._();

  static String get deviceInfo => _config?.deviceInfoToString ?? '';

  static int get logFileSize => _config?.logFileMaxSize ?? kDefaultLogSize;

  static bool get isDeflate => _config?.isDeflate ?? true;

  static int get maxCacheFileLen => _config?.maxCacheFileLen ?? 100 * 1024;

  String? _currentUserIdentifier;
  StreamSubscription? _onPlatformEventSub;
  StreamSubscription<ConnectivityResult>? _onNetConnectSub;

  GatherInterface? _gather;

  final ReceivePort receivePort = ReceivePort();
  Isolate? isolate;

  final LogRecordData _logRecordData = LogRecordData();

  static void config(LogConfig config) {
    _config = config;
  }

  static void toggle(bool enable) {
    _enable = enable;
    if (_enable) {
      _ins ??= PulseLog._();
      _ins!._init();
    } else {
      if (_ins == null) return;
      _ins?._gather?.disable();
      _ins?._gather = null;
      WidgetsBinding.instance.removeObserver(bindingObserver);
      _ins?._onPlatformEventSub?.cancel();
      _ins?._onNetConnectSub?.cancel();
      _ins = null;
    }
  }

  PulseLog._() {
    assert(_config != null, "LogConfig is required!!!");
  }

  Future _init() async {
    WidgetsBinding.instance.addObserver(bindingObserver);
    _onPlatformEventSub = _eventChannel.receiveBroadcastStream().listen(_onPlatformEvent);

    _onNetConnectSub = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      await doNetConnLog(result);
    });
    await _initGather();
  }

  Future<void> _initGather({String? userIdentifier}) async {
    Directory directory = await getApplicationDocumentsDirectory();
    _currentUserIdentifier = userIdentifier ?? _config!.userIdentifier;
    _isolateExec([_currentUserIdentifier, directory.path]);

    _logCommonInfo();
  }

  void _logCommonInfo() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    await doNetConnLog(connectivityResult);
  }

  Future<void> doNetConnLog(ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.mobile) {
      try {
        CarrierData? carrierData = await CarrierInfo.all;
        NetworkInfoBody body = NetworkInfoBody({'type': 'mobile', 'detail': carrierData.toString()});
        _isolateExec(body);
      } catch (e) {
        NetworkInfoBody body = NetworkInfoBody({'type': 'mobile', 'detail': ''});
        _isolateExec(body);
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      try {
        Map<String, dynamic> detail = {};
        //如果是iOS
        if (Platform.isIOS) {
          final info = NetworkInfo();
          String bssid = await info.getWifiBSSID() ?? '';
          String wifiName = await info.getWifiName() ?? '';
          String ip = await info.getWifiIP() ?? '';
          detail = {
            'bssid': bssid,
            'ssid': wifiName,
            'ip': ip,
          };
        } else {
          WifiInfoWrapper? wifiObject = await WifiInfoPlugin.wifiDetails;
          if (wifiObject != null) {
            detail = {
              'bssid': wifiObject.bssId,
              'ssid': wifiObject.ssid,
              'ip': wifiObject.ipAddress,
              'linkSpeed': wifiObject.linkSpeed,
              'singalStrength': wifiObject.signalStrength,
            };
          }
        }

        NetworkInfoBody body = NetworkInfoBody({'type': 'wifi', 'detail': detail});
        _isolateExec(body);
      } catch (e) {
        NetworkInfoBody body = NetworkInfoBody({'type': 'wifi', 'detail': ''});
        _isolateExec(body);
      }
    } else {
      NetworkInfoBody body = NetworkInfoBody({
        'type': connectivityResult.name,
      });
      _isolateExec(body);
    }
  }

  Future _recordExecTime(int size, Future Function() call) async {
    if (_config?.isWriteAnalyse ?? false) {
      int startTime = DateTime.now().microsecondsSinceEpoch;
      await call();
      int endTime = DateTime.now().microsecondsSinceEpoch;

      _logRecordData.addData(endTime - startTime, size);
    } else {
      await call();
    }
  }

  void _isolateExec(dynamic message) async {
    if (!_enable) return;

    logPrint(message.toString());
    if (message is ExceptionBody) {
      await _recordExecTime(message.description.length, () async {
        if (message.platform == 0) {
          await _gather?.saveLog(message);
        } else {
          await _gather?.saveErrorLog(message);
        }
      });
    } else if (message is LogBody) {
      await _recordExecTime(message.description.length, () async {
        await _gather?.saveLog(message);
      });
    } else if (message is List) {
      if (Platform.isWindows) {
        _gather ??= GatherWindows(userIdentifier: message[0], directoryPath: message[1]);
      } else {
        _gather ??= Gather2(userIdentifier: message[0], directoryPath: message[1]);
      }
    } else if (message is String) {
      if (message == 'clean') {
        _gather?.clean();
      } else if (message == 'disable') {
        _gather?.disable();
        _gather = null;
      }
    }
  }

  Future<void> login(String userIdentifier) async {
    if (!_enable) return;
    if (userIdentifier.isNotEmpty && userIdentifier != _currentUserIdentifier) {
      _isolateExec(UserBody(userIdentifier));
    }
  }

  Future<void> logout() async {
    if (!_enable) return;
    _currentUserIdentifier = '';
    _isolateExec(UserBody(''));
  }

  Future<void> log(LogBody msg) async {
    if (!_enable) return;
    _isolateExec(msg);
  }

  /// 控制台日志
  Future<void> console(dynamic msg, {String? tag}) async {
    if (!_enable) return;
    ConsoleBody body = ConsoleBody(msg.toString());
    body.tag = tag;
    await log(body);
  }

  /// flutter error
  Future<void> flutterError(FlutterErrorDetails details) async {
    if (!_enable) return;

    _error(details.exceptionAsString(), stack: details.stack.toString(), platform: 0);
  }

  Future<void> _error(String msg, {String? stack, int platform = 0}) async {
    if (!_enable) return;
    ExceptionBody body = ExceptionBody(msg, stack: stack, platform: platform);
    await log(body);
  }

  /// 事件上报
  Future<void> event(String name, {Map<String, dynamic>? properties, bool noPublicProps = false}) async {
    if (!_enable) return;
    EventBody body = EventBody(name);
    properties ??= {};
    if (_config?.superProperties != null && !noPublicProps) {
      _config?.superProperties.forEach((key, value) {
        properties?.putIfAbsent(key, () => value);
      });
    }
    body.properties = properties;
    await log(body);
  }

  /// 通过默认的方式上传log
  /// [onSendProgress] 上传进度
  /// [cancelToken] 取消上传
  /// [logDirPath] 自定义上传日志的完整目录路径
  /// [id] 远程触发自动上传日志时回传给后台的id，由触发的IM消息传进来
  /// + 默认为空，压缩pulse_log目录并上传；若指定目录，则压缩该目录并上传，上传成功后清空该目录
  Future<bool> uploadLogByDefault(
      {ProgressCallback? onSendProgress, CancelToken? cancelToken, String? logDirPath, int? id}) async {
    Directory dir;
    if (logDirPath != null) {
      dir = Directory(logDirPath);
    } else {
      Directory docDir = await getApplicationDocumentsDirectory();
      dir = Directory(join(docDir.path, 'pulse_log'));
    }
    if (!dir.existsSync()) {
      logPrint("dir $logDirPath not exist!");
      return false;
    }

    UploadConfig? uploadConfig = _config?.uploadConfig;
    if (uploadConfig == null) {
      logPrint('Use uploadLogByDefault(),must setup uploadConfig!!!');
      return false;
    }

    PulseLog.instance.event(EventNames.prepareUpload);

    //写缓存日志
    await flushCahce();
    bool haveCrash = await _gather!.haveCrash();
    Directory rootDir = await getApplicationDocumentsDirectory();

    String uploadPath = await compute(prepareUploadLogAsync, [dir, rootDir, _config!.userIdentifier]);
    DefaultUploader uploader = DefaultUploader();
    bool suc = await uploader.uploadLogAsync(uploadConfig, File(uploadPath), haveCrash,
        onSendProgress: onSendProgress, cancelToken: cancelToken, id: id);
    uploadComplete(suc, uploadPath, logsDir: logDirPath != null ? dir : null);
    return suc;
  }

  Future<String> prepareUploadLog(Directory dir) async {
    PulseLog.instance.event(EventNames.prepareUpload);

    Directory rootDir = await getApplicationDocumentsDirectory();
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    String outputPath = join(join(rootDir.path, 'log_${_config!.userIdentifier}_$nowTime.zip'));
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(dir, filename: outputPath);
    return outputPath;
  }

  Future flushCahce() async {
    await _gather!.flush();
  }

  /// 准备需要上传的log
  static Future<String> prepareUploadLogAsync(List params) async {
    final Directory dir = params[0];
    final Directory rootDir = params[1];
    final String userIdentifier = params[2];

    final nowTime = DateTime.now().millisecondsSinceEpoch;
    String outputPath = join(join(rootDir.path, 'log_${userIdentifier}_$nowTime.zip'));
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(dir, filename: outputPath);
    return outputPath;
  }

  /// 上传完成的回调
  Future<void> uploadComplete(bool suc, String path, {Directory? logsDir}) async {
    File uploadFile = File(path);
    if (uploadFile.existsSync()) {
      await uploadFile.delete();
    }
    if (suc) {
      if (logsDir == null) {
        _isolateExec('clean');
      } else {
        if (logsDir.existsSync()) {
          await logsDir.delete(recursive: true);
        }
      }
    }
  }

  void _onPlatformEvent(event) {
    if (event != null) {
      Map<String, dynamic> data = Map<String, dynamic>.from(event);
      String eventName = data['event'] ?? '';
      if (eventName.isEmpty) return;
      switch (eventName) {
        case 'crash':
          _error(data['data'], platform: 1);
      }
    }
  }

  int get nowTime => DateTime.now().millisecondsSinceEpoch;

  void disable() {
    _isolateExec('disable');
  }

  void flushLogs() async {
    await _gather?.flush();
  }
}
