import 'dart:io';
import 'package:shared/shared.dart';
import 'package:path_provider/path_provider.dart';

class CacheUtil {
  static const String _tag = "CacheUtil";

  static dynamic loadCache() async {
    try {
      final tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      Log.d(tag: _tag, '_tempDir:$tempDir, temp size: $value');
      return _renderSize(value);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  ///递归方式删除目录
  static Future<void> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  static Future<double> _getTotalSizeOfFilesInDir(
      final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        for (final FileSystemEntity child in children) {
          total += await _getTotalSizeOfFilesInDir(child);
        }
        return total;
      }
      return 0;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return 0;
    }
  }

  ///格式化文件大小
  static _renderSize(double value) {
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future clearCache([bool silent = true]) async {
    //此处展示加载loading
    try {
      final tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      if (value.toInt() <= 0) {
        if (!silent) {
          Fluttertoast.showToast(msg: "no cache");
        }
      } else if (value >= 0) {
        if (!silent) {
          Fluttertoast.showToast(msg: "start deleting cache,please wait");
        }
        Future.delayed(const Duration(seconds: 1), () async {
          //删除缓存目录
          await delDir(tempDir);
          await loadCache();
          if (!silent) {
            Fluttertoast.showToast(msg: "清理成功");
          }
        });
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      if (!silent) {
        Fluttertoast.showToast(msg: "delete cache failed , please retry");
      }
    } finally {}
  }
}
