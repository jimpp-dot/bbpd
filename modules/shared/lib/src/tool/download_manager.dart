import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class DownloadManager {
  static const String _imagePath = 'image';

  /// 下载图片
  static Future<String?> downloadImage(String url) async {
    try {
      var digest = md5.convert(const Utf8Encoder().convert(url));
      String fileName = hex.encode(digest.bytes).toLowerCase();
      String baseDir = path.join(Constant.documentsDirectory.path, _imagePath);
      File file = File(path.join(baseDir, fileName));
      if (!(await file.exists())) {
        await Directory(baseDir).create(recursive: true);
        String tmpFilePath = '${file.path}.tmp';
        await DownloadManager.download(url, tmpFilePath);
        File tmpFile = File(tmpFilePath);
        await tmpFile.rename(file.path);
      }
      return file.path;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  static File getDownloadFileByUrl(String url, {String? dir}) {
    var digest = md5.convert(const Utf8Encoder().convert(url));
    String fileName = hex.encode(digest.bytes).toLowerCase();
    String baseDir =
        path.join(dir ?? Constant.documentsDirectory.path, _imagePath);
    File file = File(path.join(baseDir, fileName));
    return file;
  }

  static Future<Response> download(String url, String savePath,
      {ProgressCallback? onReceiveProgress}) async {
    var start = DateTime.now();
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };

    Response response =
        await dio.download(url, savePath, onReceiveProgress: onReceiveProgress);
    var end = DateTime.now();

    Duration duration = end.difference(start);
    Log.d('DownloadManager.download duration(ms): ${duration.inMilliseconds}');
    return response;
  }

  /// Downloading by spiting as file in chunks
  static Future downloadWithChunks(String url, String savePath,
      {ProgressCallback? onReceiveProgress,
      int? maxChunk,
      int? size,
      CancelToken? cancelToken}) async {
    var start = DateTime.now();

    const firstChunkSize = 102;
//    const maxChunk = 3;
    if (maxChunk == null && size != null && size > 0) {
      maxChunk = (size / (500 * 1000)).floor();
      if (maxChunk > 7) {
        maxChunk = 7;
      }
    }

    int total = 0;
    var dio = Dio();
    var progress = <int>[];

    createCallback(no) {
      return (int received, _) {
        progress[no] = received;
        if (onReceiveProgress != null && total != 0) {
          int currentSum = progress.reduce((a, b) => a + b);
          //Log.d('DownloadManager.createCallback progress list: $progress');
          //Log.d('DownloadManager.createCallback no: $no, currentSum: $currentSum, total: $total');
          onReceiveProgress(currentSum, total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no) async {
      progress.add(0);
      --end;
      return dio.download(
        url,
        "${savePath}temp$no",
        onReceiveProgress: createCallback(no),
        cancelToken: cancelToken,
        options: Options(
          headers: {"range": "bytes=$start-$end"},
        ),
      );
    }

    Future mergeTempFiles(chunk) async {
      File f = File("${savePath}temp0");
      IOSink ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
      for (int i = 1; i < chunk; ++i) {
        File f0 = File("${savePath}temp$i");
        await ioSink.addStream(f0.openRead());
        await f0.delete();
      }
      await ioSink.close();
      await f.rename(savePath);
    }

    Response response = await downloadChunk(url, 0, firstChunkSize, 0);
    if (response.statusCode == 206) {
      total = Util.parseInt(response.headers
          .value(HttpHeaders.contentRangeHeader)
          ?.split("/")
          .last);
      int reserved = total -
          Util.parseInt(
              response.headers.value(HttpHeaders.contentLengthHeader));
      int chunk = (reserved / firstChunkSize).ceil() + 1;
      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk! + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserved / maxChunk).ceil();
        }
        var futures = <Future>[];
        for (int i = 0; i < maxChunk; ++i) {
          int start = firstChunkSize + i * chunkSize;
          int end = start + chunkSize;
          if (end > total) {
            end = total;
          }
          futures.add(downloadChunk(url, start, end, i + 1));
        }
        await Future.wait(futures);
      }
      await mergeTempFiles(chunk);
    }

    var end = DateTime.now();
    Duration duration = end.difference(start);
    Log.d(
        'DownloadManager.download duration: ${duration.inMilliseconds} ms, average speed: ${(total * 1000.0 / duration.inMilliseconds / 1000).toStringAsFixed(1)} KB/s');
  }
}
