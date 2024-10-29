// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' hide context;
import 'package:path_provider/path_provider.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/shared.dart';
import 'package:shared/util/log/console_body_with_level.dart';

import 'console_log_filter.dart';
import 'constant.dart';
import 'log_output.dart';

export 'asset_data_log.dart';
export 'socket_log.dart';

const String asIndicatorI = '<<i>> ';
const String asIndicatorD = '<<d>> ';
const String asIndicatorE = '<<e>> ';
const String asIndicatorW = '<<w>> ';
const String asIndicatorV = '<<v>> ';

const String _logColorRed = '\x1B[31m';
const String _logColorGreen = '\x1B[32m';
const String _logColorBlue = '\x1B[34m';
const String _logColorYellow = '\x1B[33m';

abstract class LoggerBase {
  void d(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false});

  void w(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false});

  void i(dynamic msg, {String? tag});

  void v(dynamic msg, {String? tag});

  void e(dynamic msg, {StackTrace? stackTrace, String? tag, int wrapWidth = -1, bool upload = true, FlutterErrorDetails? details});
}

mixin Loggable {
  LogHelper? _logger;

  LogHelper get log {
    return _logger ??= LogHelper(prefix: '[$runtimeType]', config: Log._config);
  }
}

/// A configuration class for logging settings.
///
/// This class encapsulates various configuration parameters related to logging.
/// It allows you to customize the logging behavior according to your needs.
class LyLogConfig {
  /// The log level for console logging.
  ///
  /// This specifies the minimum level of log messages that will be printed to
  /// the console. Log messages with a level equal to or higher than this value
  /// will be logged.
  Level logLevel;

  /// The log level for file logging.
  ///
  /// This specifies the minimum level of log messages that will be written to
  /// a log file. Log messages with a level equal to or higher than this value
  /// will be logged to the file.
  Level fileLogLevel;

  /// Creates a new instance of the [LogConfig] class with the specified
  /// configuration parameters.
  ///
  /// The [logLevel] parameter defaults to [Level.nothing].
  /// The [fileLogLevel] parameter defaults to [Level.nothing].
  LyLogConfig({
    this.logLevel = Level.nothing,
    this.fileLogLevel = Level.info,
  });
}

class Log {
  static LyLogConfig _config = LyLogConfig();

  static LyLogConfig get config => _config;
  static LogHelper _logger = LogHelper();

  static void init({bool isMainIsolate = true, LyLogConfig? config}) {
    _config = config ?? _config;

    if (Constant.isDevMode) {
      _config.logLevel = kProfileMode ? Level.verbose : Level.debug;
    }

    const levelName = String.fromEnvironment('LOG_LEVEL');
    Level? level;
    for (Level value in Level.values) {
      if (value.name == levelName) {
        level = value;
        break;
      }
    }

    if (level != null) {
      _config.logLevel = level;
    }

    Logger.level = _config.logLevel;

    if (!Constant.isDevMode) {
      // disable any log to console in production mode
      Logger.level = Level.nothing;
    }

    PulseLog.config(CommonLogConfig());

    /// 用本地的printer 不需要BBLog 的printer
    PulseLog.enablePrint = false;
    bool useBBLog = _config.fileLogLevel.index >= Level.info.index && _config.fileLogLevel.index != Level.nothing.index;
    if (isMainIsolate) {
      fileLogToggle(useBBLog);
    } else {
      fileLogToggle(false);
    }
    _logger = LogHelper(config: _config);
  }

  /// Logs a debug message.
  ///
  /// The [msg] parameter is the message to be logged.
  /// The [tag] parameter is an optional tag to be included with the log message.
  /// The [wrapWidth] parameter specifies the maximum line width for formatting the message. If set to -1, no line wrapping is performed.
  /// The [prettyJson] parameter, if set to true, formats the JSON message in a more human-readable way.
  static void d(dynamic msg, {String tag = '', int wrapWidth = -1, bool prettyJson = false}) {
    _logger.d(msg, tag: tag, wrapWidth: wrapWidth, prettyJson: prettyJson);
  }

  /// Logs a warning message.
  ///
  /// The [msg] parameter is the message to be logged.
  /// The [tag] parameter is an optional tag to be included with the log message.
  /// The [wrapWidth] parameter specifies the maximum line width for formatting the message. If set to -1, no line wrapping is performed.
  /// The [prettyJson] parameter, if set to true, formats the JSON message in a more human-readable way.
  static void w(dynamic msg, {String tag = '', int wrapWidth = -1, bool prettyJson = false}) {
    _logger.w(msg, tag: tag, wrapWidth: wrapWidth, prettyJson: prettyJson);
  }

  /// Logs an informational message.
  ///
  /// The [msg] parameter is the message to be logged.
  /// The [tag] parameter is an optional tag to be included with the log message.
  /// The [stackTrace] parameter is an optional stack trace associated with the error.
  static void i(dynamic msg, {String tag = '', StackTrace? stackTrace}) {
    final newMsg = stackTrace == null ? msg : '$msg\n$stackTrace';
    _logger.i(newMsg, tag: tag);
  }

  /// Logs a verbose message.
  ///
  /// The [msg] parameter is the message to be logged.
  /// The [tag] parameter is an optional tag to be included with the log message.
  static void v(dynamic msg, {String tag = ''}) {
    _logger.v(msg, tag: tag);
  }

  /// Logs an error message.
  ///
  /// The [msg] parameter is the message to be logged.
  /// The [stackTrace] parameter is an optional stack trace associated with the error.
  /// The [tag] parameter is an optional tag to be included with the log message.
  /// The [wrapWidth] parameter specifies the maximum line width for formatting the message. If set to -1, no line wrapping is performed.
  /// The [upload] parameter, if set to true, allows the error to be uploaded for reporting or analysis.
  /// The [details] parameter is an optional [FlutterErrorDetails] object containing additional information about the error.
  static void e(dynamic msg,
      {StackTrace? stackTrace, String tag = '', int wrapWidth = -1, bool upload = true, FlutterErrorDetails? details}) {
    _logger.e(msg, stackTrace: stackTrace, tag: tag, wrapWidth: wrapWidth, upload: upload, details: details);
  }

  static bool _isUploading = false;

  static void standardEvent(LogBody event) {
    if (_config.fileLogLevel != Level.nothing) {
      PulseLog.instance.log(event);
    }
  }

  static void event(String name, {Map<String, dynamic>? properties}) {
    if (_config.fileLogLevel != Level.nothing) {
      properties ??= {};
      // properties['networkType'] = Util.connectivityName;
      PulseLog.instance.event(name, properties: properties);
    }
  }

  static Future<String> getFileLogPath() async {
    await PulseLog.instance.flushCahce();
    Directory docDir = await getApplicationDocumentsDirectory();
    Directory dir = Directory(join(docDir.path, 'bblog'));

    if (!dir.existsSync()) {
      Log.e("getFileLogPath, dir $dir not exist!");
      return '';
    }
    String uploadPath = await compute(PulseLog.prepareUploadLogAsync, [dir, docDir, Session.uid.toString()]);
    return uploadPath;
  }

  /// Upload Log to DevOps
  static void uploadLog() async {
    final int lastUpdatedLogTime = Config.getInt('${BBConfigKey.lastUploadLogTime}_${Session.uid}', 0);
    final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

    final int differenceInMilliseconds = currentTimestamp - lastUpdatedLogTime;
    final int differenceInMinutes = Duration(milliseconds: differenceInMilliseconds).inMinutes;

    if (!_isUploading && differenceInMinutes >= 2) {
      _isUploading = true;
      try {
        await PulseLog.instance.uploadLogByDefault(onSendProgress: (count, total) {
          Config.set('${BBConfigKey.lastUploadLogTime}_${Session.uid}', Util.parseStr(DateTime.now().millisecondsSinceEpoch));
          Log.d('uploadProgress: $count : $total');
        }).whenComplete(() {
          Log.d('uploadCompleted');
        });
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
      Config.set('${BBConfigKey.lastUploadLogTime}_${Session.uid}', Util.parseStr(DateTime.now().millisecondsSinceEpoch));
      _isUploading = false;
    } else {
      Log.d('Uploading in Progress');
    }
  }

  static void fileLogToggle(bool enable) {
    PulseLog.toggle(enable);
  }

  /// Indicates whether to enable RTC console logging.
  ///
  /// Setting this to `true` will enable logging related to real-time communication
  /// (RTC) functionality, which can be useful for debugging and monitoring RTC
  /// issues.
  static bool enableRtcConsoleLog = false;
}

class LogHelper implements LoggerBase {
  LyLogConfig _config = Log._config;
  Logger _logger = Logger(
    filter: ConsoleLogFilter(),
    printer: HybridPrinter(
      SimplePrinter(),
      warning: PrettyPrinter(printEmojis: false),
      error: PrettyPrinter(printEmojis: false),
    ),
    output: LogOutputHelper.output,
  );

  final String prefix;

  LogHelper({LyLogConfig? config, Logger? logger, this.prefix = ''}) {
    _config = config ?? _config;
    _logger = logger ?? _logger;
  }

  @override
  void d(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false}) {
    if (_shouldLog(Level.debug)) {
      if (msg == null) return;

      tag ??= prefix;
      final output = '$asIndicatorD$tag $msg';
      // _custom(msg, tag: tag, level: Level.debug);

      _logger.d(output);
    }

    if (_shouldFileLog(Level.debug)) {
      ConsoleBodyWithLevel body = ConsoleBodyWithLevel(msg?.toString() ?? '', Level.debug);
      body.tag = tag ?? '';
      PulseLog.instance.log(body);
    }
  }

  @override
  void w(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false}) {
    if (_shouldLog(Level.warning)) {
      if (msg == null) return;

      tag ??= prefix;
      final output = '$asIndicatorW$tag $msg';
      // _custom(msg, tag: tag, level: Level.warning);
      _logger.w(output);
    }

    if (_shouldFileLog(Level.warning)) {
      ConsoleBodyWithLevel body = ConsoleBodyWithLevel(msg?.toString() ?? '', Level.warning);
      body.tag = tag ?? '';
      PulseLog.instance.log(body);
    }
  }

  @override
  void i(dynamic msg, {String? tag}) {
    if (_shouldLog(Level.info)) {
      tag ??= prefix;
      final output = '$asIndicatorI$tag $msg';
      _logger.i(output);

      // _custom(msg, tag: tag, level: Level.info);
    }

    if (_shouldFileLog(Level.info)) {
      ConsoleBodyWithLevel body = ConsoleBodyWithLevel(msg?.toString() ?? '', Level.info);
      body.tag = tag ?? prefix;
      PulseLog.instance.log(body);
    }
  }

  @override
  void v(dynamic msg, {String? tag}) {
    if (_shouldLog(Level.verbose)) {
      tag ??= prefix;
      final output = '$asIndicatorV$tag $msg';
      _logger.v(output);

      // _custom(msg, tag: tag, level: Level.verbose);
    }

    if (_shouldFileLog(Level.verbose)) {
      ConsoleBodyWithLevel body = ConsoleBodyWithLevel(msg?.toString() ?? '', Level.verbose);
      body.tag = tag ?? prefix;
      PulseLog.instance.log(body);
    }
  }

  @override
  void e(dynamic msg, {StackTrace? stackTrace, String? tag, int wrapWidth = -1, bool upload = true, FlutterErrorDetails? details}) {
    tag ??= prefix;
    if (_shouldLog(Level.error)) {
      _logger.e("$asIndicatorE$tag: $msg", stackTrace: stackTrace);

      // _custom(msg, tag: tag, level: Level.error);
    }

    final isEmptyStackTrace = (stackTrace?.toString() ?? '').isEmpty;

    final uploadError = (msg is! SocketException && msg is! TimeoutException);

    // skip uploading if stack trace is empty
    if (upload && !isEmptyStackTrace && !kDebugMode && uploadError) {
      //FirebaseCrashlytics.instance.recordError(msg, stackTrace);
    }

    if (_shouldFileLog(Level.error)) {
      if (tag == 'main' && details != null) {
        PulseLog.instance.flutterError(details);
        return;
      }

      String str = msg?.toString() ?? '';
      String? result = LogConstant.ignoreExceptions.firstWhereOrNull((item) => str.contains(item));
      if (result != null) {
        return;
      }

      ExceptionBody body = ExceptionBody(str, stack: stackTrace?.toString() ?? '', platform: 0);
      PulseLog.instance.log(body);
    }
  }

  void _custom(dynamic message, {String? tag, Level level = Level.trace}) {
    tag ??= '';
    DateTime time = DateTime.now();
    String colorANSI = '';
    String asIndicator = '';
    switch (level) {
      case Level.info:
        colorANSI = _logColorBlue;
        asIndicator = '<<i>> ';
        break;
      case Level.debug:
        colorANSI = _logColorBlue;
        asIndicator = '<<d>> ';
        break;
      case Level.warning:
        colorANSI = _logColorYellow;
        asIndicator = '<<w>> ';
        break;
      case Level.error:
      case Level.fatal:
        colorANSI = _logColorRed;
        asIndicator = '<<e>> ';
        break;
      default:
        colorANSI = '';
        asIndicator = '';
    }

    if (Constant.useVscode) {
      // vscode支持ANSI颜色，不需要指示符
      asIndicator = '';
    } else {
      //vscode 打印可以显示颜色，但在Android Studio中有问题
      colorANSI = '';
    }

    if (kReleaseMode) {
      if (Constant.isDevMode) {
        // 仅 发布模式且开发者，使用logger打印日志
        if (tag.isNotEmpty) tag = '[$tag] ';
        _logger.log(level, '$tag$colorANSI$asIndicator${time.toHHmmssSSS()} $message');
      }
    } else {
      // 使用developer.log不会截断字符串。kReleaseMode不打印日志
      developer.log(
        '$colorANSI$asIndicator${time.toHHmmssSSS()} $message',
        name: tag,
        time: time,
        level: level.value,
      );
    }
  }

  bool _shouldLog(Level level) {
    if (System.debug && level.index >= _config.logLevel.index) {
      return true;
    }

    return false;
  }

  bool _shouldFileLog(Level level) {
    return level.index >= _config.fileLogLevel.index;
  }
}
