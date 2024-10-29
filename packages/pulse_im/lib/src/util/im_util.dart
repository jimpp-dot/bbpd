import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'im_config.dart';

class IMUtil {
  IMUtil._();

  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value == 'null') return defaultValue;

    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is bool) return value ? 1 : 0;
    return defaultValue;
  }

  static String parseStr(dynamic value, [String defaultValue = '']) {
    if (value == null) return '';
    if (value is Map) return jsonEncode(value);
    return '$value';
  }

  static double parseDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static List<T> parseList<T>(dynamic value, T Function(dynamic e) f) {
    if (value == null) return [];
    List list = [];
    if (value is String && value.isNotEmpty) {
      try {
        list = jsonDecode(value);
      } catch (e) {
        list = [];
      }
    } else if (value is List) {
      list = value;
    }

    if (list.isNotEmpty) {
      return list.map((e) => f(e)).toList();
    } else {
      return [];
    }
  }

  static Map<String, dynamic> parseMap(dynamic value) {
    if (value == null) return {};
    if (value is Map<String, dynamic>) return value;
    if (value is String && value.isNotEmpty) {
      try {
        return jsonDecode(value);
      } catch (e) {
        return {};
      }
    }
    return {};
  }

  /// 移除map中数据
  static Map<String, dynamic> mapExcludeKeys(Map<String, dynamic> map, List<String> keys) {
    final data = Map.of(map);
    for (var key in keys) {
      data.remove(key);
    }
    return data;
  }

  static Future<String?> makeBase64(String? path) async {
    try {
      if (path == null) return null;
      File file = File(path);
      var contents = await file.readAsBytes();
      var base64File = base64.encode(contents);

      return base64File;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static bool isCollectionEmpty(Iterable? it) {
    return it == null || it.isEmpty;
  }

  static bool isStringEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static Future<String> fmd5AndBase64(String filePath) async {
    File file = File(filePath);
    if (await file.exists()) {
      return base64.encode(md5.convert(file.readAsBytesSync()).bytes).toString();
    }
    return "";
  }

  static bool isHttpUrl(String? s) {
    if (isStringEmpty(s)) {
      return false;
    }

    return s!.startsWith(RegExp(r'http(s?):\/\/'));
  }

  static int getPlatform() {
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    } else if (Platform.isWindows) {
      if (IMConfig.isChatPlugin) {
        // BBChat, windows, 不会挤掉主账号
        return 8;
      }
      return 4;
    } else if (Platform.isMacOS) {
      return 5;
    }
    return 0;
  }
}
