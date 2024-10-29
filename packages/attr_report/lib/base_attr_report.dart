library base_attr_report;

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 上报行为
/// + [install] 第一次启动上报
/// + [start] App 启动上报
/// + [inactive] 进入后台上报，最短间隔5分钟
/// + [active] 进入前台上报，最短间隔5分钟
/// + [reg] 注册上报
/// + [login] 登录上报
enum BASEAttrReportAction {
  install,
  start,
  inactive,
  active,
  reg,
  login,
}

class BASEAttrReport {
  static final BASEAttrReport instance = BASEAttrReport._internal();

  factory BASEAttrReport() {
    return instance;
  }

  BASEAttrReport._internal();

  static const String secret = 'XEghhFIBC4NMpMxo';

  Map<String, dynamic> _regularParams = {};

  bool _overseas = false;
  late String _domain;

  DateTime? _lastOnBackground;
  DateTime? _lastOnForeground;

  String _aaid = '';

  ///初始化，传入上报通用参数
  /// + [overseas] 是否为海外APP true|false
  /// + [regularParams] 上报必需参数：参数见 readme
  /// + [aaid] 谷歌广告ID：海外APP必须设置，国内无需设置
  /// + [domainOverseas] 上报域名: 设置为各APP的主域名，如: yinjietd.com
  void init({
    required bool overseas,
    required String domain,
    required Map<String, dynamic> regularParams,
    String aaid = '',
  }) {
    _overseas = overseas;
    _regularParams = regularParams;
    _aaid = aaid;
    _domain = 'https://help.$domain';
  }

  /// 归因上报
  /// + [action] 上报行为
  Future<bool> report(BASEAttrReportAction action, {String? uid}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      bool? hasInstall = prefs.getBool('BASEAttrReportType_install');

      if ((hasInstall == null || !hasInstall) && action == BASEAttrReportAction.start) {
        action = BASEAttrReportAction.install;
        prefs.setBool('BASEAttrReportType_install', true);
      }

      DateTime nowTime = DateTime.now();
      if (action == BASEAttrReportAction.inactive) {
        if (_lastOnBackground != null && nowTime.difference(_lastOnBackground!).inMinutes < 5) {
          return false;
        }
      } else if (action == BASEAttrReportAction.active) {
        if (_lastOnForeground != null && nowTime.difference(_lastOnForeground!).inMinutes < 5) {
          return false;
        }
      }

      final connectivityResult = await (Connectivity().checkConnectivity());
      String net = connectivityResult.toString().split('.').last;

      int ct = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      Map<String, dynamic> data = {
        'ct': ct,
        'platform': Platform.isIOS ? 'ios' : 'android',
        'net': net,
        'action': action.toString().split('.').last,
      };

      _regularParams.addAll(data);
      if (_overseas) {
        _regularParams.addAll({'aaid': _aaid});
      }

      if (uid != null) {
        _regularParams['uid'] = uid;
      }

      LinkedHashMap<String, dynamic> signMap = _sort(_regularParams);
      String sign = _getSign(signMap);

      String url = '$_domain/sdk/app?sign=$sign';
      debugPrint('base_attr_report： $url');
      Response response = await Dio().post(url, data: signMap);
      if (response.statusCode != 200) {
        return false;
      } else {
        var respBody = response.data;
        debugPrint('base_attr_report： ${action.name.toString()}$respBody');
        if (!respBody['success']) {
          return false;
        }

        if (action == BASEAttrReportAction.inactive) {
          _lastOnBackground = nowTime;
        } else if (action == BASEAttrReportAction.active) {
          _lastOnForeground = nowTime;
        }
      }
    } catch (e) {
      debugPrint('base_attr_report： ${action.name.toString()}$e');
      return false;
    }

    return true;
  }

  String _getSign(LinkedHashMap<String, dynamic> params) {
    String mapString = jsonEncode(params);
    String sign = _md5(_md5(mapString) + secret);
    return sign.substring(0, 10);
  }

  LinkedHashMap<String, dynamic> _sort(Map<String, dynamic> params) {
    List<String> sortedKeys = params.keys.toList()..sort();

    LinkedHashMap<String, dynamic> signMap = LinkedHashMap();
    for (var key in sortedKeys) {
      signMap[key] = params[key];
    }
    return signMap;
  }

  String _md5(String source) {
    var content = const Utf8Encoder().convert(source);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }
}
