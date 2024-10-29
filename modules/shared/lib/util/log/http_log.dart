import 'dart:collection';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/util/log/http_req_log_item.dart';
import 'package:shared/util/log/web_console/web_console_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:protobuf/protobuf.dart';

import 'ansi_parser.dart';
import 'curl_util.dart';
import 'constant.dart';

typedef HttpLogCallback = void Function(HttpLog log);

class HttpLog {
  static final ListQueue<HttpLog> _buffer = ListQueue<HttpLog>();
  static HttpLogCallback? outputCallback;

  static const int _bufferSize = 50;
  static ValueNotifier<ListQueue<HttpLog>> logs =
      ValueNotifier<ListQueue<HttpLog>>(_buffer);
  static int _currentLogId = 0;

  static void clearAll() {
    _buffer.clear();
    logs.value = _buffer;
  }

  static void _addLog(HttpLog record) {
    if (_buffer.length == _bufferSize) {
      _buffer.removeFirst();
    }
    _buffer.add(record);
    logs.value = _buffer;

    if (outputCallback != null) {
      outputCallback!(record);
    }

    WebConsoleManager.instance.printHttpLog(record);
  }

  static void addLog(
      String url, Map<String, String>? headers, XhrResponse? response,
      {dynamic requestBody,
      int duration = -1,
      GeneratedMessage? responsePb,
      GeneratedMessage? requestPb,
      Map<String, bool>? flagMap}) {
    // HttpReqLogItem? logItem = LogConstant.reportUrls.firstWhereOrNull((item) => url.contains(item.url));

    if (!Constant.isDevMode) return;

    if (url.startsWith('https://log.') ||
        url.startsWith('https://data.') ||
        url.startsWith('https://lemon-log.') ||
        url.startsWith('https://log.')) {
      return;
    }

    try {
      final log = HttpLog._(url, Util.prettyJson(headers));
      log.statusCode = '${response!.httpResponse?.statusCode}';
      log.responseHeader =
          Util.prettyJson(response.httpResponse?.headers ?? {});
      log.duration = duration;
      if (requestBody is Map) {
        log.requestBody = Util.prettyJson((requestBody ?? {}));
      } else if (requestBody is GeneratedMessage) {
        log.requestBody = Util.prettyJson(requestBody.toProto3Json());
      }

      if (response.error != null) {
        log.responseBody = response.error?.toString() ?? 'empty error';
        log.success = false;
      } else {
        final respText =
            responsePb != null ? jsonEncode(responsePb.toProto3Json()) : null;

        if (responsePb == null &&
            (response.httpResponse?.headers['content-type']
                    ?.contains('application/protobuf') ??
                false)) {
          response.onParsePb = log._onParsePb;
        } else {
          log.responseBody = respText ?? response.httpResponse?.body ?? '';
        }
      }
      log.reqMethod = response.httpResponse?.request?.method;
      log.flagData = flagMap;
      // FIXME: toCurl should be lazily called only when user tap 'copy curl'
      log.curlString =
          toCurl(response.httpResponse?.request as Request?, requestPb);

      // if (logItem != null) {
      //   Log.event(LogConstant.httpRequest, properties: log.toLogMap(logItem.logRespBody));
      // }
      // if (response.onParsePb == null) {
      _addLog(log);
      // }
    } catch (e, s) {
      // ignore: avoid_print
      print('$e$s');
    } // ignore empty catch
  }

  HttpLog._(String requestUrl, String? header) {
    url = requestUrl;
    requestHeader = header;
    time = DateTime.now();
    success = true;
    reqMethod = 'GET';
    requestBody = '';
    statusCode = '';
    responseHeader = '';
    responseBody = '';
    duration = 0;
    curlString = '';
    flagData = null;
    logId = _currentLogId++;
  }

  String? url;
  DateTime? time;
  String? requestHeader;
  String? requestBody;
  String? statusCode;
  String? responseHeader;
  String? responseBody;
  int? duration;
  bool? success;
  String? reqMethod;
  String? curlString;
  int? logId;
  Map<String, bool>? flagData;

  void _onParsePb(String respText) {
    responseBody = respText ?? '';
    _addLog(this);
  }

  List<TextSpan>? toTextSpans() {
    String descrition = '';

    final parser = AnsiParser(false);
    descrition =
        "$reqMethod\nstatusCode:$statusCode \nduration:$duration ms \n\nrequest body:\n $requestBody\n\nrequest header:\n $requestHeader\n\nresponseHeader:\n$responseHeader\n";
    parser.parse(descrition);
    return parser.spans;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['time'] = time.toString();
    map['requestHeader'] = requestHeader;
    map['requestBody'] = requestBody;
    map['statusCode'] = statusCode;
    map['responseHeader'] = responseHeader;
    map['responseBody'] = responseBody;
    map['duration'] = duration;
    map['success'] = success;
    map['reqMethod'] = reqMethod;
    map['curlString'] = curlString;
    map['logId'] = logId;
    return map;
  }

  Map<String, dynamic> toLogMap(bool respBody) {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['time'] = time.toString();
    // map['requestHeader'] = requestHeader;
    map['requestBody'] = requestBody;
    map['statusCode'] = statusCode;
    if (respBody) {
      map['responseBody'] = responseBody;
    }
    map['duration'] = duration;
    map['success'] = success;
    return map;
  }
}
