import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:shared/shared.dart';

extension DateTimeExt on DateTime {
  /// 2020-02-02 02:02:02
  String toyyyyMMddHHmmss({String dateSplit = '-'}) {
    return DateFormat('yyyy${dateSplit}MM${dateSplit}dd HH:mm:ss').format(this);
  }

  /// 2020-02-02 02:02
  String toyyyyMMddHHmm({String dateSplit = '-', String timeSplit = ':'}) {
    return DateFormat('yyyy${dateSplit}MM${dateSplit}dd HH${timeSplit}mm').format(this);
  }

  /// 02-20 20:20
  String toMMddHHmm() {
    return DateFormat('MM-dd HH:mm').format(this);
  }

  /// 2020-02-02
  String toyyyyMMdd({String dateSplit = '-'}) {
    return DateFormat('yyyy${dateSplit}MM${dateSplit}dd').format(this);
  }

  /// 20:20
  String toHHmm() {
    return DateFormat('HH:mm').format(this);
  }

  /// 20:20:20
  String toHHmmss() {
    return DateFormat('HH:mm:ss').format(this);
  }

  String toHHmmssSSS() {
    return DateFormat('HH:mm:ss.SSS').format(this);
  }

  int get secondsSinceEpoch {
    return millisecondsSinceEpoch ~/ 1000; // 整除
  }
}

extension DoubleExt on double {
  double get dp {
    return this * Util.ratio;
  }

  int get px {
    return (this * Util.devicePixelRatio).toInt();
  }
}

extension IntExt on int {
  double get dp => this * Util.ratio;

  int get px => (this * Util.devicePixelRatio).toInt();

  String get msStr {
    if (this <= 0) return '00:00';
    return '${(this ~/ 60).padLeft2}:${(this % 60).padLeft2}';
  }

  String get padLeft2 => toString().padLeft(2, '0');

  bool toBool({bool pb = false}) {
    if (pb) {
      /// 当该int值是从pb中来的时候，默认 1 - true ,2 - false
      return this == 1;
    } else {
      return this > 0;
    }
  }

  /// 皮队友 - 当该int值是从pb中来的时候，默认 1 - true ,2 - false
  bool toPbBool() => toBool(pb: true);
}

extension StringExtension on String {
  String safeSubstring(int start, [int? end]) {
    List<int> runeList = runes.toList();

    end ??= runeList.length;

    if (end > runeList.length) {
      Log.d(
          "RangeError: end:$end great than string length ${runeList.length}, auto-correct end to ${runeList.length} now, but you should check your code");
      end = runeList.length;
    }

    return String.fromCharCodes(runeList.sublist(start, end));
  }

  /// fix:中英文混合自动换行或者单词截断问题，多用于单行TextOverflow.ellipsis模式
  /// 将flutter系统默认的单词截断模式转换成字符截断模式
  /// 通过向文本中插入宽度为0的空格实现
  String toCharacterBreakStr() {
    if (isEmpty) {
      return this;
    }
    return Characters(this).join('\u200B');
  }

  /// 超长字符串截取
  /// [maxLen] 最大字符长度，超过长度截取
  /// [suffix] 超过长度，截取加后缀，比如...
  String cut(int maxLen, {String suffix = ''}) {
    int limitLen = maxLen;
    if (suffix.isNotEmpty) limitLen += 2;
    if (length > limitLen) {
      return safeSubstring(0, maxLen) + suffix;
    }
    return this;
  }

  bool isNumeric() {
    return RegExp(r'^-?[0-9]+$').hasMatch(this);
  }
}

/// 集合扩展
extension ExtendedIterable<E> on Iterable<E> {
  /// forEach index
  void forEachIndexed(void Function(E e, int i) fun) {
    var i = 0;
    forEach((e) => fun(e, i++));
  }
}

extension DioExt on Dio {
  /// 是否启用网络代理
  void enableDebugProxy() {
    if (Constant.isDevMode) {
      (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        if (Constant.proxy?.isNotEmpty ?? false) {
          client.findProxy = (url) {
            return HttpClient.findProxyFromEnvironment(
              url,
              environment: {"https_proxy": 'http://${Constant.proxy}', "http_proxy": 'http://${Constant.proxy}'},
            );
          };
        }
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }
  }
}
