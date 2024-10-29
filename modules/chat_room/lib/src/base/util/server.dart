import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:shared/shared.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http_server/http_server.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

typedef OnUpload = Future<String?> Function(HttpBodyFileUpload upload);

class Server {
  HttpServer? _server;
  String? _ip;
  final int _port = 7078;
  final Map<String, ByteData> _cache = {};

  late Directory applicationDocumentsDirectory;

  final OnUpload _onUpload;

  Server(this._onUpload);

  String get address {
    return "http://$_ip:$_port";
  }

  bool get ok {
    return _ip != null;
  }

  start() async {
    Log.d("server start");
    _ip = await getWifiIpAddress();
    await loadFiles();
    if (_ip == null) return;
    try {
      _server = await HttpServer.bind(InternetAddress.anyIPv4, _port);
      _server!.transform(HttpBodyHandler()).listen(_onListen);
    } catch (e) {
      Log.d(e);
    }
  }

  stop() {
    _server?.close(force: true);
    _server = null;
    _cache.clear();
  }

  _uploadComplete(HttpRequestBody body) async {
    HttpRequest request = body.request;
    Map res = body.body;
    HttpBodyFileUpload upload = res['file'];

    String? errorMessage = await _onUpload(upload);

    request.response.statusCode = 200;
    request.response.headers.contentType =
        ContentType("application", "json", charset: "utf-8");
    request.response.write(
        json.encode({'success': errorMessage == null, 'data': errorMessage}));
    request.response.close();
  }

  _onListen(dynamic event) async {
    HttpRequestBody body = event;
    HttpRequest request = body.request;
    Log.d(request.uri.toString());
    String file = request.uri.path.substring(1);
    if (file.isEmpty) file = 'index.html';
    if (file == 'upload' &&
        request.method == 'POST' &&
        request.headers.contentType?.value == 'multipart/form-data') {
      await _uploadComplete(body);
      return;
    }
    int index = file.lastIndexOf(".");
    String ext;
    ContentType contentType;
    if (index > -1) {
      ext = file.substring(index + 1).toLowerCase();
      if (ext == 'html') {
        contentType = ContentType("text", "html", charset: "utf-8");
      } else if (ext == 'js') {
        contentType =
            ContentType("application", "javascript", charset: "utf-8");
      } else if (ext == 'swf') {
        contentType = ContentType("application", "x-shockwave-flash");
      } else if (ext == 'xap') {
        contentType = ContentType("application", "x-silverlight-app");
      } else {
        contentType = ContentType("application", "octet-stream");
      }
    } else {
      contentType = ContentType("application", "octet-stream");
    }
    try {
      if (_cache.containsKey(file) == false) {
        File appFile =
            File(join(applicationDocumentsDirectory.path, 'upload/$file'));
        ByteData bytes = (await appFile.readAsBytes()).buffer.asByteData();
        _cache[file] = bytes;
      }

      request.response.statusCode = 200;
      request.response.headers.contentType = contentType;
      request.response.add(_cache[file]!.buffer.asUint8List());
    } catch (e) {
      request.response.statusCode = 404;
      request.response.headers.contentType =
          ContentType("text", "html", charset: "utf-8");
      request.response.write("<h1>404 Not Found</h1>");
    }
    request.response.close();
  }

  Future<String?> getWifiIpAddress() async {
    String? ip;
    if (Platform.isIOS) {
      ip = await _getIOSWifiIpAddress();
    } else if (Platform.isAndroid) {
      ip = await _getAndroidWifiIpAddress();
    }
    return ip;
  }

  Future<String?> _getIOSWifiIpAddress() async {
    String? ip;
    List<NetworkInterface> res = await NetworkInterface.list();
    for (int i = 0; i < res.length; i++) {
      List<InternetAddress> addresses = res[i].addresses;
      for (int j = 0; j < addresses.length; j++) {
        InternetAddress address = addresses[j];
        if (isValidIp(address)) {
          ip = addresses[j].address;
          break;
        }
      }
    }
    return ip;
  }

  static Future<String?> _getAndroidWifiIpAddress() async {
    String? ip = await SharedAppPlugin.getWifiIpAddress();
    bool isValid = isValidIpString(ip);
    if (isValid) {
      return ip;
    } else {
      return null;
    }
  }

  static bool isValidIp(InternetAddress ipAddress) {
    if (ipAddress.type == InternetAddressType.IPv4 &&
        ipAddress.isLoopback == false &&
        ipAddress.isLinkLocal == false &&
        ipAddress.isMulticast == false) {
      return true;
    }
    return false;
  }

  static bool isValidIpString(String? ip) {
    if ('127.0.0.0' == ip) {
      //环回地址
      return false;
    } else if (ip?.startsWith('169.254.') ?? false) {
      //Link local地址
      return false;
    } else if (ip?.startsWith('224.0.0.') ?? false) {
      //组播地址
      return false;
    } else if ('0.0.0.0' == ip) {
      //本机地址
      return false;
    }
    return true;
  }

  Future loadFiles() async {
    applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
    await loadUploadFile('index.html');
    await loadUploadFile('jquery.js');
    await loadUploadFile('plupload.js');
    await loadUploadFile('Moxie.swf');
    await loadUploadFile('Moxie.xap');
  }

  Future loadUploadFile(String fileName) async {
    Directory subDirectory =
        await Directory(join(applicationDocumentsDirectory.path, 'upload'))
            .create(recursive: true);
    File file = File(join(subDirectory.path, fileName));

    bool exist = await file.exists();
    //本地文件不存在，拷贝assets文件到本地或者下载（Android下载，iOS拷贝）
    if (!exist) {
      ByteData? bytes;
      try {
        bytes = await otaResourceBundle.load("assets/images/upload/$fileName");
      } catch (e) {
        bytes = null;
      }

      if (bytes != null) {
        Log.d('file.writeAsBytes');
        await file.writeAsBytes(bytes.buffer.asUint8List());
      } else {
        await downloadFromServer();
      }
    } else {
      Log.d('exist');
    }
  }

  Future downloadFromServer() async {
    Log.d('downloadFromServer');
    if (Util.isVerify) {
      return;
    }

    File file = File('${applicationDocumentsDirectory.path}/uploadFile.zip');

    if (await file.exists()) {
      await file.delete();
    }

    try {
      await DownloadManager.download(
          '${System.imageDomain}uploadsong.zip', file.path);

      if (await file.exists()) {
        if ('7683cc124f7b5a2a374b1b8d9e9cba8c' !=
            md5.convert(file.readAsBytesSync()).toString().toLowerCase()) {
          await file.delete();
          return;
        }
        FileStat stat = await file.stat();
        if (162463 != stat.size) {
          await file.delete();
          return;
        }

        List<int> bytes = file.readAsBytesSync();
        Archive archive = await compute(decodeZip, bytes);
        for (ArchiveFile fileInZip in archive) {
          String name = fileInZip.name;
          if (fileInZip.isFile) {
            List<int> data = fileInZip.content;
            File(join(applicationDocumentsDirectory.path, name))
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          } else {
            Directory(join(applicationDocumentsDirectory.path, name))
                .create(recursive: true);
          }
        }
        await file.delete();
      }
    } catch (e) {
      Log.d('downloadFromServer, DownloadManager.download error: $e');
    }
  }
}
