import 'dart:async';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:path/path.dart';

enum ResourceType {
  webp,
  png,
}

String get giftSubDir => 'resource_screen';

/// 通过id下载资源，最多下载3次
Future<bool> cacheResourceWithTry(
    int resourceId, int size, String resourceType) async {
  for (int i = 0; i < 3; i++) {
    bool r = await _cacheResource(resourceId, size, typeResource(resourceType));
    if (r == true) return true;
  }
  return false;
}

Future<bool> _cacheResource(int resourceId, int size, ResourceType type) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = getResourceFile(resourceId);
  if (await _isValidFile(file, size)) {
    return true;
  }
  String suffix = suffixResource(type);
  String url = "${System.imageDomain}static/$giftSubDir/$resourceId.$suffix";
  await _downloadGift(size, url, file);
  return _isValidFile(file, size);
}

// 获取资源后缀
String suffixResource(ResourceType type) {
  String suffix = 'webp';
  switch (type) {
    case ResourceType.png:
      suffix = 'png';
      break;
    case ResourceType.webp:
      suffix = 'webp';
      break;
  }
  return suffix;
}

// 获取资源类型
ResourceType typeResource(String resourceType) {
  if (resourceType == 'webp') {
    return ResourceType.webp;
  }
  return ResourceType.png;
}

File getResourceFile(int resourceId) {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  File file = File(join(baseDir, '$resourceId'));
  return file;
}

// size匹配本地存在，不匹配删除本地的资源重新下载
Future<bool> _isValidFile(File file, int size) async {
  if (await file.exists()) {
    FileStat stat = await file.stat();
    Log.d('file real size ${stat.size}, config size $size');
    if (stat.size == size) {
      return true;
    }
    Log.d('file size error');
    await file.delete();
  }
  return false;
}

Future _downloadGift(int size, String url, File file) async {
  Log.d('_downloadGift, url: $url');
  if (size < 1 * 1000000) {
    // 小于1MB直接下载
    try {
      await DownloadManager.download(url, file.path);
    } catch (e) {
      Log.d('_downloadGift, DownloadManager.download error: $e');
    }
  } else {
    // 大于1MB并发下载以提高速度
    try {
      await DownloadManager.downloadWithChunks(url, file.path, size: size);
    } catch (e) {
      Log.d('_downloadGift, DownloadManager.downloadWithChunks error: $e');
    }
  }
}
