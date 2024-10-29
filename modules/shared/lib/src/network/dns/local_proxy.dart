import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'dns_cache.dart'; //解码和编码JSON

/// 使用HTTP over DNS（通过本地代理转发的方式）
bool useLocalDnsProxy = false;

///本代码文件中的日志开关
bool _debugPrint = false;

void _log(String log) {
  if (_debugPrint) {}
}

/// 通过DNS Over HTTP获取到IP，然后直连服务器IP，会导致SSL握手时证书校验在客户端通不过（因为证书是跟连接的host域名绑定的）
/// 通过本地代理直连服务器IP，然后代理把客户端的请求透传给服务器，这样客户端就能校验证书通过了。
/// 参考：http/1.1 tunnel proxy 协议（RFC 2817）
/// 原理参照 https://www.jianshu.com/p/59d1cbf34d67  https://blog.csdn.net/leelit/article/details/77829196
///
/// 一旦初始化完毕就应始终保持监听，不能再关闭
/// 接收应用层的请求，以ClientConnectionHandler包装一层（通过HTTP Over DNS请求到IP，然后本地代理与IP之间建立socket连接）
/// 其内部又通过ServerConnectionHandler包装一层发起真实的请求
/// 两个socket：
/// 1. ClientConnectionHandler中的client  直接代表本地应用层连接本地代理服务器
/// 2. ServerConnectionHandler中的server  作为代理服务器向真实服务器发起请求，接受响应

/// 备注：这个类不处理任何具体的业务逻辑，仅仅实现一个纯粹的本地代理服务器
class CustomHttpsProxy {
  static final CustomHttpsProxy _instance = CustomHttpsProxy._();
  CustomHttpsProxy._();
  static CustomHttpsProxy get instance => _instance;

  /// 本地的http proxy是否已经初始化完成
  bool localDnsProxyPortBinded = false;

  String host = '127.0.0.1';
  int port = 4041;
  static const _maxBindPort = 4050;
  late ServerSocket serverSocket;

  final String failedResponse =
      'HTTP/1.1 400 Connection Not Established\r\n\r\n';

  Future init() async {
    if (!useLocalDnsProxy) {
      return;
    }

    if (localDnsProxyPortBinded) {
      return 'ok';
    }

    //port 重试, 防止默认端口被本机其他APP占用
    _log('before _bindPort');
    await _bindPort();
    _log('after _bindPort');
    return serverSocket;
  }

  Future _bindPort() async {
    await ServerSocket.bind(InternetAddress.loopbackIPv4, port).then(
        (serverSocket) {
      this.serverSocket = serverSocket;
      _log('proxy server bind $port ok');
      serverSocket.listen((client) {
        _log('server listened to remotePort: ${client.remotePort}');
        try {
          ClientConnectionHandler(client).handle();
        } catch (e) {
          _log('ClientConnectionHandler exception $e');
        }
      });
      localDnsProxyPortBinded = true;
    }, onError: (e) async {
      _log('bind proxy port $port error: $e');
      localDnsProxyPortBinded = false;
      if (port < _maxBindPort) {
        close();
        port++;
        await _bindPort();
      } else {
        useLocalDnsProxy = false;
      }
    });
    _log('end _bindPort');
  }

  void close() {
    serverSocket.close();
    _log('proxy closed. port = $port');
  }
}

/// 处理从应用层发过来的原始请求，并把代理返回的结果转回给原始请求方
class ClientConnectionHandler {
  final RegExp regx = RegExp(r'CONNECT ([^ :]+)(?::([0-9]+))? HTTP/1.1\r\n');
  Socket? server;
  final Socket client;
  String content = '';

  ClientConnectionHandler(this.client);

  void closeSockets() {
    server?.destroy();
    client.destroy();
  }

  // 处理本地应用发来的请求：转发给代理服务器
  Future<void> dataHandler(data) async {
    if (server == null) {
      content += utf8.decode(data);
      final m = regx.firstMatch(content);
      if (m != null) {
        var host = m.group(1);
        var port = m.group(2) == null ? 443 : int.parse(m.group(2)!);

        var ip = LocalDnsCache.instance.queryIpFromCache(host!);
        // ip = '91.9.9.9'; // for test only
        if (ip == null) {
          // 通过DNS Over HTTP查询失败之后，不使用本地代理，还是走旧的流程
          _log(
              '!!!queryIPOverHttp ip == null, now mark invalidated and set useLocalDnsProxy = false !!!');
          useLocalDnsProxy = false;
          closeSockets();
          return;
        }

        try {
          await ServerConnectionHandler(ip, port, this).handle();
        } catch (e) {
          _log('!!! Establish connection with Server exception $e');
          client.write(CustomHttpsProxy.instance.failedResponse);
          closeSockets();
        }
      }
    } else {
      try {
        server?.add(data);
      } catch (e) {
        _log('sever has been shut down');
        closeSockets();
      }
    }
  }

  void errorHandler(error, StackTrace trace) {
    _log('client socket error: $error');
  }

  void doneHandler() {
    closeSockets();
  }

  void handle() {
    client.listen(dataHandler,
        onError: errorHandler, onDone: doneHandler, cancelOnError: true);
  }
}

/// 作为代理服务器，与真实服务器直接保持socket长连接，向真实服务器发包并接收回包
class ServerConnectionHandler {
  final String _successResponse = 'HTTP/1.1 200 Connection Established\r\n\r\n';
  final String host;
  final int port;
  final ClientConnectionHandler handler;
  late Socket server;
  late Socket client;

  ServerConnectionHandler(this.host, this.port, this.handler) {
    client = handler.client;
  }

  //接收真实服务器返回的报文，通过client socket转回给原始请求方
  void dataHandler(data) {
    try {
      _log(
          "received data from real server, host = $host, port = $port, length = ${data.length}");
      client.add(data);
    } on Exception catch (e) {
      _log('client has been shut down $e');
      handler.closeSockets();
    }
  }

  void errorHandler(error, StackTrace trace) {
    _log('server socket error: $error');
  }

  void doneHandler() {
    handler.closeSockets();
  }

  /// 与真实服务器建立socket连接(保持不断开)，该通道用来走真实的对外网络流量
  Future handle() async {
    _log('try connecting real server： $host:$port');
    server =
        await Socket.connect(host, port, timeout: const Duration(seconds: 3));
    _log('connected to real server： $host:$port');
    server.listen(dataHandler,
        onError: errorHandler, onDone: doneHandler, cancelOnError: true);
    handler.server = server;
    client.write(_successResponse);
  }
}

bool hostIsIP(String host) {
  List<String> segments = host.split('.');
  if (segments.length != 4) {
    return false;
  }
  bool returnValue = true;
  for (var segment in segments) {
    var result = int.tryParse(segment);
    if (result == null) {
      returnValue = false;
    } else {
      if (result > 255 || result < 0) {
        returnValue = false;
      }
    }
  }
  return returnValue;
}
