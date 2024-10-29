import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/src/network/dns/dns_cache.dart';
import 'package:shared/src/network/dns/local_proxy.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:http2/http2.dart';

///符合条件的请求优先使用http2
bool useHttp2 = true;

///符合条件的请求仅使用http2，如果为false，那么当http2请求返回null时会走老的http请求
bool useHttp2Only = true;

///本代码文件中的日志开关
bool _debugPrint = false;
bool _verbose = false;

///等待初始化本地Proxy，用来实现DNS over HTTP的同时，又能通过TLS的证书校验
Completer? _initDnsProxyCompleter;

Map<String, ClientTransportConnection> _connMap = {};
Map<String, Completer> _connectingCompleters = {};
GZipCodec _gzip = GZipCodec(level: ZLibOption.maxLevel);
bool _networkListenerRegistered = false;
int _lastResponseTime = 0;
const int _maxValidResponseGapInMilliSecs = 60 * 1000;

ConnectivityResult? _lastResult;

Future<http.Response?> http2Request(
    String queryUrl, Map<String, String> headers, Map<String, String>? body,
    {bool isGet = false, int timeout = 5, bool pb = false}) async {
  // queryUrl = "https://xxx.yinjixetd.com/"; // for DNS test only
  // ===第一阶段：判断是否应该走http2通道，如果不是直接返回null
  useHttp2 = Util.parseBool(Config.getBool(HTTP2_KEY, useHttp2));
  if (!useHttp2) {
    return null;
  }
  if (!isHttp2FirstUrl(queryUrl)) {
    return null;
  }

  // 如果检测到网络曾经断开，或者距离上一次有效回包时间间隔超过一分钟，废弃掉_connMap里缓存的长连接
  Uri uri = Uri.parse(queryUrl);
  String addressKey = '${uri.host}:${uri.port}';

  ConnectivityResult? newResult = Util.connectivityResult;
  if (_lastResult != newResult && _connMap.containsKey(addressKey)) {
    _connMap.remove(addressKey);
  }
  _lastResult = newResult;

  int now = _now();
  if (now - _lastResponseTime > _maxValidResponseGapInMilliSecs &&
      _connMap.containsKey(addressKey)) {
    _connMap.remove(addressKey);
  }

  onConnectivityChanged(String type, dynamic data) {
    bool isNetworkConnected = data as bool;
    if (!isNetworkConnected) {
      _connMap.remove(addressKey);
    }
  }

  if (!_networkListenerRegistered) {
    eventCenter.addListener(
        EventConstant.EventConnectivityChanged, onConnectivityChanged);
    _networkListenerRegistered = true;
  }

  // ===第二阶段：如果当前本地DNS代理开关打开，且DNS代理端口尚未绑定，先绑定DNS代理服务端口
  LocalDnsCache.instance.visitedHosts.add(uri.host);
  if (!LocalDnsCache.instance.isInited) {
    await LocalDnsCache.instance.init();
  }

  if (useLocalDnsProxy) {
    if (_initDnsProxyCompleter == null) {
      _initDnsProxyCompleter = Completer();
      await _initLocalDnsProxy();

      // LocalDnsCache.instance.removeOutdatedDNSEntry(uri.host);
      // String ip = LocalDnsCache.instance.queryIpFromCache(uri.host);
      // ip ??= await LocalDnsCache.instance.queryIPOverHttp(uri.host);

      // if (ip == null) {
      //   useLocalDnsProxy = false;
      // }
      _initDnsProxyCompleter!.complete();
    } else {
      await _initDnsProxyCompleter!.future;
    }
  }

  // ===第三阶段：建立到真实服务器的长连接，如果使用本地DNS代理，那么该连接的数据包是通过代理中转的
  int startTime = _now();

  ClientTransportConnection? transport =
      await _getTransport(addressKey, uri, queryUrl);
  if (transport == null) {
    // 最终建立连接失败，返回null
    return null;
  }

  // ===第四阶段：发出请求包，等待返回包并解析
  http.Response? response;
  try {
    bool requestCanceled = false;
    Timer requestTimeoutTimer = Timer(Duration(seconds: timeout), () async {
      if (_connMap.containsKey(addressKey)) {
        _connMap.remove(addressKey);
        await transport?.terminate();
        transport = null;
        requestCanceled = true;
      }
    });

    int start = DateTime.now().millisecondsSinceEpoch;
    ClientTransportStream stream =
        _sendStream(queryUrl, uri, headers, transport!, isGet, body);

    // if (queryUrl.contains('room/config')) { // for timeout test only
    //   await Future.delayed(Duration(milliseconds: 5950));
    // }
    int? statusCode;
    List<int> receivedChunks = [];
    Map<String, String> rspHeaders = {};
    await for (StreamMessage message in stream.incomingMessages) {
      if (message is HeadersStreamMessage) {
        for (Header header in message.headers) {
          String name = utf8.decode(header.name);
          String value = utf8.decode(header.value);
          if (name == ':status') {
            statusCode = int.parse(value);
          }
          rspHeaders[name] = value;
        }
      } else if (message is DataStreamMessage) {
        // Use [message.bytes] (but respect 'content-encoding' header)
        receivedChunks.addAll(message.bytes);
      }
    }

    if (requestCanceled) {
      throw TimeoutException('TimeoutException url: $queryUrl');
    }

    requestTimeoutTimer.cancel();

    List<int> uncompressedBytes;
    if (rspHeaders.containsKey('content-encoding') &&
        rspHeaders['content-encoding'] == 'gzip') {
      uncompressedBytes = _gzip.decode(receivedChunks);
    } else {
      uncompressedBytes = receivedChunks;
    }

    if (statusCode != null) {
      if (statusCode == 301 || statusCode == 302) {
        String? redirectedUrl = rspHeaders['location'] ?? '';
        return await http2Request(redirectedUrl, headers, body,
            isGet: isGet, timeout: timeout);
      }

      response = http.Response.bytes(uncompressedBytes, statusCode,
          headers: rspHeaders);
      int endTime = _now();
      int requestDuration = endTime - start;
      //上报请求时间

      String respBody = '';
      if (response.bodyBytes.lengthInBytes < 512 * 1024) {
        if (pb) {
          respBody = String.fromCharCodes(response.bodyBytes);
        } else {
          respBody = const Utf8Decoder().convert(response.bodyBytes);
        }
      }
    }
  } catch (e, s) {
    Log.e(e, stackTrace: s, tag: queryUrl);
  }
//    await transport.finish(); // for test only

  if (response == null) {
  } else {
    _lastResponseTime = _now();
  }
  return response;
}

Future<ClientTransportConnection?> _getTransport(
    String addressKey, Uri uri, String queryUrl) async {
  ClientTransportConnection? transport = _connMap[addressKey];

  if (transport == null || !transport.isOpen) {
    // 如果没有已经存在的有效连接
    if (!_connectingCompleters.containsKey(addressKey)) {
      // 如果连接不是在建立中，则重新建立连接
      Completer connectingCompleter = Completer();
      _connectingCompleters[addressKey] = connectingCompleter;
      transport = await _establishConnection(addressKey, uri, queryUrl,
          useProxy: useLocalDnsProxy);
    } else {
      // 如果连接已经在建立中，则等待建立连接完成

      Completer? connectingCompleter = _connectingCompleters[addressKey];
      await connectingCompleter?.future;
    }
  }

  transport = _connMap[addressKey];
  return transport;
}

Future<void> _initLocalDnsProxy() async {
  if (!CustomHttpsProxy.instance.localDnsProxyPortBinded) {
    await CustomHttpsProxy.instance.init();
  }
}

ClientTransportStream _sendStream(
    String queryUrl,
    Uri uri,
    Map<String, String> headers,
    ClientTransportConnection transport,
    bool isGet,
    Map<String, String>? body) {
  int pathIndexInUrl = queryUrl.indexOf(uri.path);
  String path = queryUrl.substring(pathIndexInUrl);
  List<Header> appendHeaders = _http2Headers(headers);
  ClientTransportStream? stream = transport.makeRequest(
    [
      Header.ascii(':method', isGet ? 'GET' : 'POST'),
      Header.ascii(':path', path),
      Header.ascii(':scheme', uri.scheme),
      Header.ascii(':authority', uri.host),
      Header.ascii(
          'content-type', 'application/x-www-form-urlencoded; charset=utf-8'),
      Header.ascii('accept-encoding', 'gzip'),
      ...appendHeaders,
    ],
    endStream: isGet || body == null,
  );

  if (body != null) {
    List<int> bodyBytes = _http2BodyBytes(body);
    stream.sendData(bodyBytes, endStream: true);
  }
  return stream;
}

///符合该条件的请求应优先走http2通道
bool isHttp2FirstUrl(String queryUrl) {
  Uri uri = Uri.parse(queryUrl);
  bool useSSL = _useSSL(uri);
  bool http2first = queryUrl.contains(System.domain) && useSSL;
  return http2first;
}

Future<ClientTransportConnection?> _establishConnection(
    String addressKey, Uri uri, String queryUrl,
    {int connectTimeout = 5, bool useProxy = false}) async {
  ClientTransportConnection? transport;

  Completer? connectingCompleter = _connectingCompleters[addressKey];
  int start = _now();
  try {
    transport = ClientTransportConnection.viaSocket(useProxy
        ? await getProxySocket(CustomHttpsProxy.instance.host,
                CustomHttpsProxy.instance.port, uri.host, uri.port)
            .timeout(Duration(seconds: connectTimeout))
        : await SecureSocket.connect(
            uri.host,
            uri.port,
            supportedProtocols: ['h2'],
            onBadCertificate: _onBadCertificate,
            // timeout: Duration(milliseconds: 3), // for connect timeout test only
            timeout: Duration(seconds: connectTimeout),
          ));

    int connectDuration = _now() - start;

    _connMap[addressKey] = transport;
    _connectingCompleters.remove(addressKey);
    connectingCompleter?.complete();
  } catch (e, s) {
    String? reportFailMsg;
    if (e
        is SocketException /* && e.toString().contains('SocketException: Failed host lookup:')*/) {
      //上报连接异常
      reportFailMsg = e.message;
    } else if (e is String &&
        CustomHttpsProxy.instance.failedResponse.startsWith(e)) {
      reportFailMsg =
          'DNS Proxy failed to establish connection with remote server';
    }

    _connectingCompleters.remove(addressKey);
    connectingCompleter?.complete();
    Log.e(e, stackTrace: s);

    bool isNetworkConnected =
        Util.connectivityResult != ConnectivityResult.none;
    if (isNetworkConnected) {
      // 不是因为网络断开时才会切换
      useLocalDnsProxy =
          !useLocalDnsProxy; // 建立连接失败时，连接模式切换（使用dns proxy/不使用 ），下次请求时生效
    }

    return null;
  }

  transport = _connMap[addressKey];
  return transport;
}

bool _onBadCertificate(X509Certificate cr) {
  // 开发模式 + 未开启浣熊市验证 => 可以抓包
  //bool check = Constant.isDevMode && !Constant.debugLimit;
  return false; // true => 不校验证书可以抓包，false => 校验证书不可以抓包
}

bool _useSSL(Uri uri) => uri.scheme == 'https';

/// 与本地proxy建立连接，发送CONNECT命令告诉它要连接到的真实服务器host域名
Future<Socket> getProxySocket(
    String proxyHost, int proxyPort, String targetHost,
    [int targetPort = 443]) async {
  // proxyHost = '192.168.128.22'; proxyPort = 8888; // for test only
  if (System.debug && (Constant.proxy?.isNotEmpty ?? false)) {
    List<String> ipAndPort = Constant.proxy!.split(':');
    proxyHost = ipAndPort[0];
    proxyPort = int.parse(ipAndPort[1]);
  }
  var proxy = await Socket.connect(proxyHost, proxyPort,
      timeout: const Duration(seconds: 3));
  const CRLF = "\r\n";
  proxy.write("CONNECT $targetHost:$targetPort HTTP/1.1"); // request line
  proxy.write(CRLF);
  proxy.write("Host: $targetHost:$targetPort"); // header
  proxy.write(CRLF);
  proxy.write(CRLF);
  var completer = Completer<bool>.sync();
  // ignore: cancel_subscriptions
  var sub = proxy.listen((event) {
    var response = ascii.decode(event);
    var lines = response.split(CRLF);
    // status line
    var statusLine = lines.first;
    if (statusLine.startsWith("HTTP/1.1 200")) {
      // proxy应答200表示接受了代理请求，并且已经与目标服务器建立了socket连接
      completer.complete(true);
    } else {
      completer.completeError(statusLine);
    }
  }, onError: completer.completeError);
  await completer.future; // established
  sub.pause();

  /// 通过代理socket建立指向真实服务器的安全socket连接
  var socket = await SecureSocket.secure(proxy,
      host: targetHost,
      supportedProtocols: const ["h2"],
      onBadCertificate: _onBadCertificate);
  return socket;
}

List<Header> _http2Headers(Map<String, String> headers) {
  List<Header> appendHeaders = [];
  headers.forEach((name, value) {
    Header header = Header.ascii(name.toLowerCase(), value);
    appendHeaders.add(header);
  });
  return appendHeaders;
}

List<int> _http2BodyBytes(Map<String, String> body) {
  Encoding encoding = utf8;
  Map<String, String> fields = body.cast<String, String>();
  String bodyStr = _mapToQuery(fields, encoding: encoding);
  List<int> bodyBytes = encoding.encode(bodyStr);
  return bodyBytes;
}

String _mapToQuery(Map<String, String> map, {Encoding encoding = utf8}) {
  var pairs = <List<String>>[];
  map.forEach((key, value) => pairs.add([
        Uri.encodeQueryComponent(key, encoding: encoding),
        Uri.encodeQueryComponent(value, encoding: encoding)
      ]));
  return pairs.map((pair) => "${pair[0]}=${pair[1]}").join("&");
}

int _now() {
  return DateTime.now().millisecondsSinceEpoch;
}
