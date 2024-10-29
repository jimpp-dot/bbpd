// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gbk2utf8/flutter_gbk2utf8.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:intl/intl.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:shared/shared.dart';
import 'package:shared/util/log/http_log.dart';

enum XhrErrorCode {
  Unknown,
  Network,
  Domain,
  Conn,
  Timeout,
  Forbidden,
  HttpStatus,
  Encoding,
  Iconv,
  Json,
  Api,
  Overloaded,

  /// 503 error
}

class XhrError extends Error {
  final XhrErrorCode code;
  final String? message;

  XhrError(this.code, [this.message]);

  @override
  String toString() {
    String afterFix = message == null ? '' : " : $message";
    switch (code) {
      case XhrErrorCode.Domain:
        return R.array('xhr_error_type_array')[0] + afterFix;
      case XhrErrorCode.Network:
        return R.array('xhr_error_type_array')[1] + afterFix;
      case XhrErrorCode.Conn:
        return R.array('xhr_error_type_array')[2] + afterFix;
      case XhrErrorCode.Timeout:
        return R.array('xhr_error_type_array')[3] + afterFix;
      case XhrErrorCode.Encoding:
        return R.array('xhr_error_type_array')[4] + afterFix;
      case XhrErrorCode.Iconv:
        return R.array('xhr_error_type_array')[5] + afterFix;
      case XhrErrorCode.Json:
        return R.array('xhr_error_type_array')[6];
      case XhrErrorCode.Forbidden:
        return R.array('xhr_error_type_array')[7] + afterFix;
      case XhrErrorCode.HttpStatus:
        return R.array('xhr_error_type_array')[8] + afterFix;
      case XhrErrorCode.Unknown:
        return R.array('xhr_error_type_array')[9];
      case XhrErrorCode.Overloaded:
        return R.array('xhr_error_type_array')[10];
      case XhrErrorCode.Api:
        return message ?? '';
    }
  }
}

class XhrResponse {
  XhrResponse(this.response, this.error, this.httpResponse);

  final http.Response? httpResponse;
  final Object? response;
  final XhrError? error;
  Function(String respText)? onParsePb;

  Map value() {
    if (response is String) {
      return Util.parseMap(jsonDecode(response as String));
    }
    return Util.parseMap(response);
  }

  Uint8List get bodyBytes => httpResponse?.bodyBytes ?? Uint8List(0);

  /// 按需格式化pb数据
  T formatProtobuf<T extends pb.GeneratedMessage>(T pbMsg) {
    if (error != null) {
      pbMsg.setField(pbMsg.getTagNumber('success')!, false);
      pbMsg.setField(pbMsg.getTagNumber('msg')!, error.toString());
    } else {
      if (!Constant.proxyShowPb || response is Map) {
        pbMsg.mergeFromProto3Json(response, ignoreUnknownFields: true);
      } else {
        pbMsg.mergeFromBuffer(bodyBytes);
      }
    }
    if (error == null && onParsePb != null) {
      String respText = '';
      try {
        respText = jsonEncode(pbMsg.toProto3Json(typeRegistry: const pb.TypeRegistry.empty()));
      } catch (e, s) {
        respText = e.toString();
        Log.e(respText, stackTrace: s);
      }
      onParsePb!(respText);
    }
    return pbMsg;
  }
}

enum XhrMethod { GET, POST }

Connectivity _conn = Connectivity();

Future<XhrError> _parseXhrError(Object? e) async {
  if (e == null) return XhrError(XhrErrorCode.Unknown);
  try {
    ConnectivityResult conn = await _conn.checkConnectivity();
    if (conn == ConnectivityResult.none) {
      return XhrError(XhrErrorCode.Network);
    }
  } catch (e, s) {
    Log.e(e, stackTrace: s);
  }
  String message = e.toString();
  if (message.contains("Failed host lookup")) {
    return XhrError(XhrErrorCode.Domain);
  } else if (message.contains("Connection failed") || message.contains('Network is unreachable')) {
    return XhrError(XhrErrorCode.Conn);
  } else if (message.contains("TimeoutException")) {
    return XhrError(XhrErrorCode.Timeout);
  } else if (message.contains("503 Error")) {
    return XhrError(XhrErrorCode.Overloaded);
  } else {
    return XhrError(XhrErrorCode.Unknown, e.toString());
  }
}

XhrResponse _parseResponse(http.Response? response, String charset) {
  if (response != null) {
    Map<String, String> headers = response.headers;
    if (headers.containsKey('user-status')) {
      Map? userStatus;
      try {
        userStatus = json.decode(headers['user-status']!);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
      if (userStatus != null && userStatus.containsKey('status') && userStatus['status'] == 403) {
        Log.w("parseJson need login");
        Session.logout();
        eventCenter.emit('System.Need.Login');
        return XhrResponse({'success': false, 'msg': userStatus['msg'].toString()}, null, response);
      }
    }
  }

  if (response?.statusCode == 403) {
    return XhrResponse(null, XhrError(XhrErrorCode.Forbidden), response);
  } else if (response?.statusCode == 429) {
    return XhrResponse(null, XhrError(XhrErrorCode.Overloaded), response);
  }
  if (response?.statusCode != 200) {
    return XhrResponse(null, XhrError(XhrErrorCode.HttpStatus), response);
  }

  var encoding = Encoding.getByName(charset);
  if (encoding != null) {
    try {
      XhrResponse xhrResponse;
      String contentType = response!.headers['content-type'] ?? '';
      if (contentType.contains('application/protobuf')) {
        xhrResponse = XhrResponse(null, null, response);
      } else {
        String decodedStr = encoding.decode(response.bodyBytes);
        xhrResponse = XhrResponse(decodedStr, null, response);
      }
      return xhrResponse;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return XhrResponse(null, XhrError(XhrErrorCode.Encoding), response);
    }
  }

  if (charset.toLowerCase() == 'gbk' || charset.toLowerCase() == 'gb2312') {
    try {
      return XhrResponse(gbk.decode(response!.bodyBytes), null, response);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
  return XhrResponse(null, XhrError(XhrErrorCode.Iconv), response);
}

String _md5(String data) {
  var content = const Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes).toLowerCase();
}

String? _salt;
const String KEY_SALT = 'net.salt';

void _updateSalt({bool forceReacquire = false, bool fromConfig = false}) async {
  if (fromConfig && _salt == null) {
    String saltOrigin = Config.get(KEY_SALT);
    if (saltOrigin.isNotEmpty) {
      _salt = await SharedAppPlugin.decrypt(saltOrigin);
    }
  }
  if (!forceReacquire && _salt != null) {
    return;
  }

  CryptSaltRsp? cryptSaltRsp = await BaseRequestManager.getCryptSalt();
  if (cryptSaltRsp != null && cryptSaltRsp.success) {
    String? saltOrigin = cryptSaltRsp.data.salt;
    if (Util.validStr(saltOrigin)) {
      _salt = await SharedAppPlugin.decrypt(saltOrigin!);
      if (_salt != null) {
        Config.set(KEY_SALT, saltOrigin);
      }
    }
  }
}

int _queryIndex = 0;

String _withUrl(String url, {Map<String, dynamic>? params, bool pb = false, bool formatJson = false}) {
  _queryIndex++;
  Map<String, String> args = {
    'package': DeviceInfo.packageInfo.packageName,
    '_ipv': Util.isVerify ? '1' : '0',
    '_platform': (Platform.isIOS ? 'ios' : 'android'),
    '_index': _queryIndex.toString(),
    '_model': DeviceInfo.model,
    '_timestamp': (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
  };

  if (pb == true) {
    args['format'] = 'pb';
  } else if (formatJson == true) {
    args['format'] = 'json';
  }

  List<String> keys = args.keys.toList(growable: false);
  keys.sort();

  List<String> hashArgs = [];
  for (var key in keys) {
    if (args[key] != null) {
      hashArgs.add('$key=${args[key]}');
    }
  }
  args['_sign'] = _md5('${hashArgs.join('&')}!rilegoule#');

  if (Session.uid > 0) {
    args['_dk'] = _md5('${Session.uid}');
  }

  List<String> query = [];
  args.forEach((key, val) => query.add('$key=${Uri.encodeComponent(val)}'));

  if (params != null && params.isNotEmpty) {
    params.forEach((key, value) {
      if (value != null) {
        query.add('$key=${Uri.encodeComponent(value.toString())}');
      }
    });
  }

  if (!url.startsWith(RegExp(r'http(s?)://'))) {
    url = System.domain + url;
    var s = url.split(':/');
    url = '${s[0]}:/${s[1].replaceAll('//', '/')}';
  }

  return '$url${url.contains('?') ? '&' : '?'}${query.join('&')}';
}

bool canChangeDomain(String changeDomain) => Util.validStr(changeDomain) && _safeDomains.contains(changeDomain);

bool _isSafeDomain(String url) => Constant.isDevMode || isSelfDomain(url);

bool isSelfDomain(String url) => _safeDomains.where((e) => Uri.parse(url).host.contains(e)).isNotEmpty;

List<String> _safeDomains = [System.ipCheckDomain, 'happyxq.cc.cn'];

class Xhr {
  static const GBK = 'gbk';
  static const UTF8 = 'utf-8';

  static const domainSecret = '.domain.backup.Kr<R^&!4ESDk';

  static init() async {
    String domainJson = Config.get('System.Domain');
    if (domainJson.isNotEmpty) {
      try {
        Map map = json.decode(domainJson);
        String domain = Util.notNullStr(map['domain']);
        String port = Util.notNullStr(map['port']);
        if (!Util.isStringEmpty(domain)) {
          System.mainDomain = domain;
        }
        if (!Util.isStringEmpty(port)) {
          System.mainPort = port;
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }

    await _updateDomain();
    _updateSalt(forceReacquire: true, fromConfig: true);
    await _initEmulatorInfo();
  }

  static bool _checkKey(String origin, String key) => _md5(origin).toLowerCase() == key;

  /// 更新备用域名
  static Future<void> _updateDomain() async {
    for (int i = 0; i < 10; i++) {
      try {
        XhrResponse response = await Xhr.getJson('${System.imageOriginDomain}bbpd.png');
        if (response.error == null) {
          Map res = response.value();
          if (res['success'] == true &&
              res.containsKey("__domain") &&
              res.containsKey("__port") &&
              res.containsKey("__key") &&
              res['__domain'] != System.mainDomain &&
              canChangeDomain(res['__domain']) &&
              _checkKey('${res['__domain']}${res['__port']}$domainSecret', res['__key'])) {
            System.mainDomain = Util.notNullStr(res['__domain']);
            if (!Util.isStringEmpty(res['__port'])) {
              System.mainPort = Util.notNullStr(res['__port']);
            }
            Config.set("System.Domain", json.encode({"domain": res['__domain'], "port": res['__port']}));
          }
          return;
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
      await Future.delayed(const Duration(seconds: 6));
    }
  }

  static Future<bool> changeDomain(Map res) async {
    if (res.containsKey('domain') &&
        res.containsKey('port') &&
        res.containsKey('key') &&
        res['domain'] != System.mainDomain &&
        canChangeDomain(res['domain']) &&
        _md5(res['domain'].toString() + res['port'].toString() + domainSecret).toLowerCase() == res['key'].toString()) {
      System.mainDomain = Util.notNullStr(res['domain']);
      if (!Util.isStringEmpty(res['port'])) {
        System.mainPort = Util.notNullStr(res['port']);
      }
      Config.set('System.Domain', json.encode({'domain': res['domain'], 'port': res['port']}));
      return true;
    }
    return false;
  }

  static String getAgent() {
    String platform;
    if (Platform.isIOS) {
      platform = 'ios';
    } else {
      platform = 'android';
    }
    String agent = DeviceInfo.userAgent;
    if (agent.isEmpty) {
      agent = 'Agent';
    } else {
      agent = agent.replaceAll(RegExp(r'[\u4E00-\u9FA5]'), '');
    }

    return '$agent / Xs $platform V${Constant.appVersion} / Js V1.0.0.0 / Login V${Session.version}';
  }

  static Map<String, String> get globalHeaders {
    return {
      'User-Agent': getAgent(),
      'User-Version': getAppVersion(),
      'User-Tag': Uri.encodeComponent(DeviceInfo.mac),
      'User-Imei': Uri.encodeComponent(Platform.isIOS ? "" : DeviceInfo.deviceId),
      'User-Oaid': Uri.encodeComponent(DeviceInfo.oaid),
      'User-Idfa': Uri.encodeComponent(DeviceInfo.idfa),
      'User-Channel': Uri.encodeComponent(DeviceInfo.channel),
      'User-Model': Uri.encodeComponent(DeviceInfo.model),
      'User-Machine': Uri.encodeComponent(DeviceInfo.machine),
      'User-Language': Translations.getLan(),
      'System-Language': DeviceInfo.systemLocale?.languageCode ?? '',
      'User-IsSimulator': '${DeviceInfo.isSimulator}',
      'User-IsRoot': '${DeviceInfo.isRoot}',
      'User-Mac': Uri.encodeComponent(DeviceInfo.mac),
      'User-Did': DeviceInfo.did,
      'User-Brand': DeviceInfo.brand,
    };
  }

  static String getAppVersion() {
    return Constant.versionCode;
  }

  /// 返回pb数据
  static Future<XhrResponse> postPb(
    String url,
    Map<String, String> body, {
    String charset = UTF8,
    int timeout = 10,
    throwOnError = false,
    Map<String, String>? headers,
  }) async {
    return post(url, body, pb: true, charset: charset, timeout: timeout, throwOnError: throwOnError, headers: headers);
  }

  /// 返回pb数据
  static Future<XhrResponse> getPb(
    String url, {
    String charset = UTF8,
    int timeout = 10,
    throwOnError = false,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool formatJson = false,
  }) async {
    return get(url,
        pb: true,
        charset: charset,
        timeout: timeout,
        throwOnError: throwOnError,
        queryParameters: queryParameters,
        headers: headers,
        formatJson: formatJson);
  }

  static Future<XhrResponse> post(
    String url,
    Map<String, String>? body, {
    String charset = UTF8,
    int timeout = 10,
    throwOnError = false,
    bool pb = false,
    Map<String, String>? headers,
    bool formatJson = false,
  }) async {
    XhrResponse xhrResponse;
    if (headers == null) {
      if (pb == true) {
        /// pb接口加上globalHeaders
        headers = globalHeaders;
      } else {
        headers = {};
      }
    }

    if (body != null && body.isNotEmpty) {
      List<String> nullKeys = [];
      body.forEach((key, value) {});

      if (nullKeys.isNotEmpty) {
        for (var key in nullKeys) {
          body.remove(key);
        }
      }
    }

    String queryUrl = _withUrl(url, pb: pb, formatJson: formatJson);

    if (Session.isLogined && _isSafeDomain(queryUrl)) {
      headers['user-token'] = Session.token;
    }

    _hookProcessBodyByUrl(url, body);
    if (_salt != null && _needSign(url)) {
      String sign = await _getSign(queryUrl, body: body);
      queryUrl += '&sign=$sign';
    }
    IOClient? io;
    final int start = DateTime.now().millisecondsSinceEpoch;
    try {
      http.Response? response;
      bool http2firstUrl = isHttp2FirstUrl(queryUrl);
      if (http2firstUrl) {
        response = await http2Request(Uri.parse(queryUrl).toString(), headers, body, pb: pb).timeout(Duration(seconds: timeout));
      }
      if (response == null && (!useHttp2Only || !http2firstUrl || !useHttp2)) {
        HttpClient client = _initHttpClient(headers);
        io = IOClient(client);
        response = await io.post(Uri.parse(queryUrl), body: body, headers: headers).timeout(Duration(seconds: timeout));
      }
      xhrResponse = _parseResponse(response, charset);
      if (System.debug && xhrResponse.httpResponse?.request == null) {
        final request = _makeRequest(isGet: false, url: queryUrl, headers: headers, body: body);
        final responseWithRequest = http.Response.bytes(xhrResponse.httpResponse!.bodyBytes, xhrResponse.httpResponse!.statusCode,
            headers: xhrResponse.httpResponse!.headers,
            isRedirect: xhrResponse.httpResponse!.isRedirect,
            persistentConnection: xhrResponse.httpResponse!.persistentConnection,
            reasonPhrase: xhrResponse.httpResponse!.reasonPhrase,
            request: request);
        xhrResponse = _parseResponse(responseWithRequest, charset);
      }
    } catch (e) {
      xhrResponse = XhrResponse(null, await _parseXhrError(e), null);
    } finally {
      io?.close();
    }

    if (Constant.isDevMode) {
      final flagMap = {"isHttp2": isHttp2FirstUrl(queryUrl), "isFallbackHttp": false, "useCliNetClient": false};
      HttpLog.addLog(queryUrl, headers, xhrResponse,
          requestBody: body, duration: DateTime.now().millisecondsSinceEpoch - start, flagMap: flagMap);
      Log.d("req url===>$url", tag: 'http');
      Log.d("response data===>${xhrResponse.value()}");
    }

    if (throwOnError && xhrResponse.error != null) {
      throw xhrResponse.error!;
    } else {
      return xhrResponse;
    }
  }

  static Future<String> _getSign(String queryUrl, {Map<String, String>? body}) async {
    Map<String, String> totalMap = {};
    Uri uri = Uri.parse(queryUrl);
    Map<String, String> queryParams = uri.queryParameters;
    totalMap.addAll(queryParams);
    if (body != null) {
      totalMap.addAll(body);
    }
    totalMap['_uid'] = Session.uid.toString();
    List<String> sortedKeys = totalMap.keys.toList()..sort();

    LinkedHashMap signMap = LinkedHashMap();
    for (var key in sortedKeys) {
      signMap[key] = totalMap[key];
    }

    String signValue = '$_salt${jsonEncode(signMap)}';
    String? sign = await SharedAppPlugin.hFunc(signValue);
    return sign ?? '';
  }

  static bool _badCertificateCallback(X509Certificate cr, String host, int port) {
    // 开发模式 + 未开启浣熊市验证 => 可以抓包
    //bool check = Constant.isDevMode && !Constant.debugLimit;
    return false; // true => 不校验证书可以抓包，false => 校验证书不可以抓包
  }

  static Future<XhrResponse> get(
    String url, {
    String charset = UTF8,
    int timeout = 10,
    throwOnError = false,
    Map<String, dynamic>? queryParameters,
    bool pb = false,
    Map<String, String>? headers,
    bool formatJson = false,
  }) async {
    XhrResponse? xhrResponse;

    String queryUrl = _withUrl(url, params: queryParameters, pb: pb, formatJson: formatJson);

    if (headers == null) {
      if (pb == true) {
        headers = globalHeaders;
      } else {
        headers = {};
      }
    }
    if (Session.isLogined && _isSafeDomain(queryUrl)) {
      headers['user-token'] = Session.token;
    }

    if (_salt != null && _needSign(queryUrl)) {
      String sign = await _getSign(queryUrl);
      queryUrl += '&sign=$sign';
    }

    IOClient? io;
    final int start = DateTime.now().millisecondsSinceEpoch;
    try {
      http.Response? response;
      bool http2firstUrl = isHttp2FirstUrl(queryUrl);
      if (http2firstUrl) {
        response =
            await http2Request(Uri.parse(queryUrl).toString(), headers, null, isGet: true, pb: pb).timeout(Duration(seconds: timeout));
      }
      if (response == null && (!useHttp2Only || !http2firstUrl || !useHttp2)) {
        HttpClient client = _initHttpClient(headers);
        io = IOClient(client);
        response = await io.get(Uri.parse(queryUrl), headers: headers).timeout(Duration(seconds: timeout));
      }

      if (response?.headers != null && (response?.headers.containsKey("content-type") ?? false)) {
        String contentType = response?.headers['content-type']?.toLowerCase() ?? '';
        if (contentType.contains("utf-8")) {
          xhrResponse = _parseResponse(response, UTF8);
        } else if (contentType.contains("gbk") || contentType.contains("gb2312")) {
          xhrResponse = _parseResponse(response, GBK);
        }
      }
      xhrResponse ??= _parseResponse(response, charset);
      if (System.debug && xhrResponse.httpResponse?.request == null) {
        final request = _makeRequest(isGet: false, url: queryUrl, headers: headers, body: {});
        final responseWithRequest = http.Response.bytes(xhrResponse.httpResponse!.bodyBytes, xhrResponse.httpResponse!.statusCode,
            headers: xhrResponse.httpResponse!.headers,
            isRedirect: xhrResponse.httpResponse!.isRedirect,
            persistentConnection: xhrResponse.httpResponse!.persistentConnection,
            reasonPhrase: xhrResponse.httpResponse!.reasonPhrase,
            request: request);
        xhrResponse = _parseResponse(responseWithRequest, charset);
      }
    } catch (e) {
      xhrResponse = XhrResponse(null, await _parseXhrError(e), null);
    } finally {
      io?.close();
    }

    if (Constant.isDevMode) {
      final flagMap = {"isHttp2": isHttp2FirstUrl(queryUrl), "isFallbackHttp": false, "useCliNetClient": false};

      HttpLog.addLog(queryUrl, headers, xhrResponse,
          requestBody: {}, duration: DateTime.now().millisecondsSinceEpoch - start, flagMap: flagMap);
      Log.d("req url===>$url", tag: 'http');
      Log.d("response data===>${xhrResponse.value()}");
    }

    if (throwOnError && xhrResponse.error != null) {
      throw xhrResponse.error!;
    } else {
      return xhrResponse;
    }
  }

  static HttpClient _initHttpClient(Map<String, String> headers) {
    HttpClient client = HttpClient();
    client.badCertificateCallback = _badCertificateCallback;
    client.findProxy = null;
    if (System.debug && (Constant.proxy?.isNotEmpty ?? false)) {
      client.findProxy = (url) {
        return HttpClient.findProxyFromEnvironment(url,
            environment: {"https_proxy": 'http://${Constant.proxy}', "http_proxy": 'http://${Constant.proxy}'});
      };
    }
    if (headers.containsKey('User-Agent')) {
      client.userAgent = Util.parseStr(headers['User-Agent']);
    }
    return client;
  }

  static XhrResponse _parse(XhrResponse res, {throwOnError = false}) {
    dynamic value;
    bool success = false;
    XhrError? error = res.error;
    if (res.response != null && res.response.toString().isNotEmpty) {
      try {
        value = json.decode(res.response!.toString());
        success = true;
      } catch (e, s) {
        Log.e(e, stackTrace: s);
        error = XhrError(XhrErrorCode.Json);
      }
    }
    if (success == false) {
      if (throwOnError) {
        throw error!;
      } else {
        return XhrResponse(null, error, res.httpResponse);
      }
    }
    if (throwOnError && value is Map) {
      Map v = value;
      if (v.containsKey('success') && v['success'] == false) {
        throw XhrError(XhrErrorCode.Api, v.containsKey('msg') ? v['msg'] : null);
      }
    }
    return XhrResponse(value, null, res.httpResponse);
  }

  static Future<XhrResponse> getJson(String url,
      {bool throwOnError = false, bool optimize = false, Map<String, dynamic>? params, bool formatJson = false}) async {
    int begin = DateTime.now().millisecondsSinceEpoch;
    XhrResponse res = await Xhr.get(
      url,
      charset: Xhr.UTF8,
      headers: Xhr.globalHeaders,
      throwOnError: throwOnError,
      queryParameters: params,
      formatJson: formatJson,
    );
    XhrResponse response = _parse(res, throwOnError: throwOnError);
    int now = DateTime.now().millisecondsSinceEpoch;
    if (optimize == false || now - begin >= 250) {
      return response;
    } else {
      await Future.delayed(Duration(milliseconds: 250 - (now - begin)));
      return response;
    }
  }

  static Future<XhrResponse> postJson(String url, Map<String, String>? post,
      {bool throwOnError = false,
      bool optimize = false,
      int tryNum = 0,
      Duration? delay,
      int timeout = 10,
      bool formatJson = false}) async {
    int begin = DateTime.now().millisecondsSinceEpoch;
    XhrError? lastError;
    int maxNum = max(1, tryNum);
    for (int i = 0; i < maxNum; i++) {
      try {
        XhrResponse res = await Xhr.post(url, post,
            charset: Xhr.UTF8, headers: Xhr.globalHeaders, throwOnError: throwOnError, timeout: timeout, formatJson: formatJson);
        XhrResponse response = _parse(res, throwOnError: throwOnError);
        int now = DateTime.now().millisecondsSinceEpoch;
        if (optimize == false || now - begin >= 250) {
          return response;
        } else {
          await Future.delayed(Duration(milliseconds: 250 - (now - begin)));
          return response;
        }
      } catch (e) {
        lastError = e as XhrError;
        if (i != maxNum - 1) {
          await Future.delayed(delay ?? const Duration(milliseconds: 500));
        }
      }
    }
    throw lastError!;
  }

  static void postJsonWithoutParse(String url, Map<String, String>? post, {throwOnError = false, pb = false}) async {
    if (post != null && !post.containsKey('uid')) {
      post['uid'] = Session.uid.toString();
      post['version'] = '1';
    }
    await Xhr.post(url, post, charset: Xhr.UTF8, headers: Xhr.globalHeaders, throwOnError: throwOnError, pb: pb);
  }

  static getCharset(String charset) {
    switch (charset.toLowerCase()) {
      case UTF8:
        return UTF8;
      case GBK:
        return GBK;
      default:
        return UTF8;
    }
  }

  static Future<bool> reportVersion({bool force = false}) async {
    bool isDiff = false;

    Map<String, String> oldData = {
      'v': Config.get('report.user.v', ''),
      'jv': Config.get('report.user.jv', ''),
      'p': Config.get('report.user.p', ''),
      'c': Config.get('report.user.c', ''),
      'm': Config.get('report.user.m', ''),
      'u': Config.get('report.user.u', ''),
      'i': Config.get('report.user.i', ''),
      'oaid': Config.get('report.user.oaid', ''),
      'ip': Config.get('report.user.ip', ''),
    };

    int newPublicIP = await DeviceInfo.getPublicIP(true);
    Map<String, String> newData = {
      'v': Constant.appVersion,
      'jv': '2.0.0.0',
      'p': Platform.isIOS ? 'ios' : 'android',
      'c': DeviceInfo.channel, // channel
      'm': DeviceInfo.mac,
      'i': Platform.isIOS ? "" : DeviceInfo.deviceId, // imei
      'oaid': Platform.isIOS ? "" : DeviceInfo.oaid, // oaid
      'ip': newPublicIP.toString(),
      'u': "",
    };
    int daytime = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now())).millisecondsSinceEpoch ~/ 1000;
    newData['u'] = "${Session.uid}_${daytime.toString()}";

    String idfa = DeviceInfo.idfa;
    String syv = DeviceInfo.systemVersion;
    String mt = getMt();
    String pname = Constant.packageName;
    String isSimulator = DeviceInfo.isSimulator ? '1' : '0';
    String size = '${Util.physicalSize.width}*${Util.physicalSize.height}';
    String pixelRatio = '${Util.devicePixelRatio}';
    String root = DeviceInfo.isRoot ? '1' : '0';
    // String bootTimeInSec = DeviceInfo.bootTimeInSec;
    // String countryCode = DeviceInfo.countryCode;
    // String language = DeviceInfo.language;
    // String deviceName = DeviceInfo.deviceName;
    // String machine = DeviceInfo.machine;
    // String carrierInfo = DeviceInfo.carrierInfo;
    // String memory = DeviceInfo.memory;
    // String disk = DeviceInfo.disk;
    // String sysFileTime = DeviceInfo.sysFileTime;
    // String caidModel = DeviceInfo.caidModel;
    // String timeZone = DeviceInfo.timeZone;

    if (!isDiff) {
      newData.forEach((String k, String v) {
        if (oldData[k] != v) isDiff = true;
      });
    }

    if (isDiff || force) {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}cloud/uversion?version=${newData['v']}&jversion=${newData['jv']}&platform=${newData['p']}&channel=${newData['c']}&mac=${newData['m']}&idfa=$idfa&mt=$mt&syv=$syv&imei=${newData['i']}&oaid=${newData['oaid']}&pname=$pname&simulator=$isSimulator&size=$size&pr=$pixelRatio&root=$root&ip=${newData['ip']}');
      if (response.error != null) {
        return false;
      }
      Config.set('report.user.v', newData['v']);
      Config.set('report.user.jv', newData['jv']);
      Config.set('report.user.p', newData['p']);
      Config.set('report.user.c', newData['c']);
      Config.set('report.user.m', newData['m']);
      Config.set('report.user.u', newData['u']);
      Config.set('report.user.i', newData['i']);
      Config.set('report.user.oaid', newData['oaid']);
      Config.set('report.user.ip', newData['ip']);
    }
    return true;
  }

  static String getMt() {
    return Platform.isIOS ? "${DeviceInfo.model}_${DeviceInfo.deviceId}" : DeviceInfo.model;
  }

  static void _hookProcessBodyByUrl(String url, Map<String, String>? body) {
    try {
      bool needEmulatorInfo = _needEmulatorInfo(url);
      if (needEmulatorInfo) {
        body?['emulatorInfo'] = Util.emulatorInfo;
        body?['isRooted'] = Util.isRooted ? '1' : '0';
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  static final Set<String> _apiNeedEmulationInfo = {
    'friend/follow',
    'account/profile',
    'mission/fivestars',
    'certify/checkIdcard',
    'account/money/?type=all',
    'cloud/profile',
    'fleet/config',
    'go/yy/group/create',
    'go/yy/group/add',
    'circle/recommend',
    'room/config',
    'home/profile',
  };

  static bool _needEmulatorInfo(String url) {
    return _apiNeedEmulationInfo.any((String api) => url.contains(api));
  }

  static Future _initEmulatorInfo() async {
    Map? emulatorInfo = await Util.getEmulatorInfo();
    bool isRooted = await SharedAppPlugin.isRooted();
    Util.emulatorInfo = jsonEncode(emulatorInfo);
    Util.isRooted = isRooted;
  }

  static final Set<String> _apiNeedSign = {
    'account/profile',
    'friend/follow',
    'mission/fivestars',
    'mission/signin',
    'mission/showEvaluate',
    'mission/evaluate',
    'mission/getaward',
    'mission/getReward',
    'mission/getSignReward'
  };

  static bool _needSign(String url) {
    return _apiNeedSign.any((String api) => url.contains(api));
  }

  // Generate http request for debugging purposes
  static http.Request? _makeRequest({bool? isGet, required String url, Map<String, String>? headers, body}) {
    if (!Constant.isDevMode) return null;

    http.Request? request;
    try {
      request = http.Request(isGet! ? 'GET' : 'POST', Uri.parse(url));

      if (headers != null) request.headers.addAll(headers);
      if (body != null) {
        if (body is String) {
          request.body = body;
        } else if (body is List) {
          request.bodyBytes = body.cast<int>();
        } else if (body is Map) {
          request.bodyFields = body.cast<String, String>();
        }
      }
    } catch (_) {} // ignore_empty_catch

    return request;
  }
}
