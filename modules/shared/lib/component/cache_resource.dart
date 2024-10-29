import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart';

const String _cacheDir = 'resource_cache';

/// 缓存Url资源
Future<String?> cacheUrlWithTry(String url, int size,
    {String subDir = _cacheDir}) async {
  for (int i = 0; i < 3; i++) {
    String? path = await _cache(Util.getRemoteImgUrl(url), size, subDir);
    if (path != null && path.isNotEmpty) return path;
  }
  return null;
}

File getFileByUrl(String url, {String subDir = _cacheDir}) {
  String baseDir = join(Constant.documentsDirectory.path, subDir);
  File file = File(join(baseDir, _generateFilePath(url)));
  Log.d('cache_resource getFileByUrl file=${file.path}');
  return file;
}

Future<String?> _cache(String url, int size, String subDir) async {
  String baseDir = join(Constant.documentsDirectory.path, subDir);
  await Directory(baseDir).create(recursive: true);

  File file = File(join(baseDir, _generateFilePath(url)));
  Log.d('cache_resource _cache url=$url, size=$size, file=${file.path}');
  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d(
        'cache_resource _cache file real size ${stat.size}, config size $size');
    if (stat.size == size || size == 0) {
      return file.path;
    }
    Log.d('cache_resource _cache size error');
    await file.delete();
  }
  await _downloadGift(size, url, file);

  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d(
        'cache_resource _cache file real size ${stat.size}, config size $size');
    if (stat.size == size || size == 0) {
      return file.path;
    }
    Log.d('cache_resource _cache size error');
    await file.delete();
  }
  return null;
}

String _generateFilePath(String url) {
  var digest = md5.convert(const Utf8Encoder().convert(url));
  String fileName = hex.encode(digest.bytes).toLowerCase();
  int lastPointIndex = url.lastIndexOf('.');
  if (lastPointIndex > 0) {
    fileName = fileName + url.substring(lastPointIndex);
  }
  return fileName;
}

Future _downloadGift(int size, String url, File file) async {
  Log.d('cache_resource _downloadGift, url: $url');
  if (size < 1 * 1000000) {
    // 小于1MB直接下载
    try {
      await DownloadManager.download(url, file.path);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  } else {
    // 大于1MB并发下载以提高速度
    try {
      await DownloadManager.downloadWithChunks(url, file.path, size: size);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
}
