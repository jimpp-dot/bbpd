import 'dart:convert';
import 'dart:io';

import 'package:thinking_analytics/src/tracker_uitl.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart';

class Reporter {
  /// 通用上报单例
  static Reporter? _instance;
  Reporter._();
  factory Reporter() {
    _instance ??= Reporter._();
    return _instance!;
  }

  /// 检测上报单例
  static Reporter? _monitorInstance;
  Reporter._monitor();
  factory Reporter.monitor() {
    _monitorInstance ??= Reporter._monitor();
    return _monitorInstance!;
  }

  /// 需要的属性
  // 余数数对齐的 appid
  late String _appId;
  // 上报的域名
  late String _serverUrl;
  // 上报的用户id
  String? _accountId;
  // 公共数据,设备/网络/包/用户数据等
  final Map<String, dynamic> _superProperties = {};
  final Map<String, dynamic> _superConfig = {};
  // 时间事件的缓存
  final Map<String, int> _cachedTimeEvents = {};
  // 上报失败的缓存
  final List<String> _cachedReportJsons = [];

  // 设备唯一标识,作为访客id
  String? _uuid;
  Future<String> _getUuid() async {
    if (_uuid == null) {
      String uuidPath = join(current, 'uuid', 'uuid.dat');
      File uuidFile = File(uuidPath);
      if (await uuidFile.exists()) {
        String value = await uuidFile.readAsString();
        if (value.isNotEmpty) {
          _uuid = value;
        }
      } else {
        await uuidFile.create(recursive: true);
      }

      if (_uuid == null) {
        var uuidObj = const Uuid();
        _uuid = uuidObj.v4();
        await uuidFile.writeAsString(_uuid!);
      }
    }
    return _uuid!;
  }

  /// 初始化
  Future<bool> init({required String appId, required String serverUrl, String? uid}) async {
    _appId = appId;
    _serverUrl = "$serverUrl/sync_json";
    _accountId = uid;
    await _getUuid();
    TrackerUtil.initNetworkListener();
    return true;
  }

  ///  上报封装
  Future<bool> track(String event, {Map<String, dynamic>? properties}) async {
    // 未登录 且未获取到游客id
    if (_accountId == null && _uuid == null) return false;
    // 如果是时间事件,相隔时间太短,就放弃上报
    if (_cachedTimeEvents.containsKey(event)) {
      int? beginMilliSecs = _cachedTimeEvents[event];
      int duration = (DateTime.now().millisecondsSinceEpoch - beginMilliSecs!) ~/ 1000;
      properties ??= {};
      properties['duration'] = duration;
      _cachedTimeEvents.remove(event);
    }
    // 将事件转为json
    String jsonStr = _generateTrackJson(event, properties: properties);
    bool success = await _report(jsonStr);
    return success;
  }

  /// 设置公共属性
  Future<bool> setSuperProperties(Map<String, dynamic> properties, {Map<String, dynamic>? superConfig}) async {
    _superProperties.addAll(properties);
    if (superConfig != null) {
      _superConfig.addAll(superConfig);
    }
    return true;
  }

  /// 用户属性：使用该接口上传的属性将会覆盖原有的属性值，如果之前不存在该用户属性，则会新建该用户属性
  Future<bool> userSet(Map<String, dynamic> properties) async {
    String jsonStr = _generateUserSetJson(properties: properties);
    bool success = await _report(jsonStr);
    return success;
  }

  /// 登录,
  login(String accountId) {
    _accountId = accountId;
  }

  ///登出
  logout() {
    _accountId = null;
  }

  /// 时间事件 锚点
  timeEvent(String event) {
    _cachedTimeEvents[event] = DateTime.now().millisecondsSinceEpoch;
  }

  /// 将事件转化为json
  String _generateTrackJson(String event, {Map<String, dynamic>? properties, List<Map<String, dynamic>>? items}) {
    List data = [];
    if (items == null) {
      Map eventItem = _getTrackItem(properties, event);
      data.add(eventItem);
    } else {
      for (var properties in items) {
        Map eventItem = _getTrackItem(properties, event);
        data.add(eventItem);
      }
    }
    var content = {"appid": _appId, "data": data};
    String jsonStr = json.encode(content);
    return jsonStr;
  }

  /// 将事件转化为map
  Map _getTrackItem(Map<String, dynamic>? properties, String event) {
    Map<String, dynamic> props = {};
    if (properties != null) {
      props = Map<String, dynamic>.from(_superProperties);
      props.addAll(properties);
    }

    Map eventItem = {
      "#account_id": _accountId,
      "#distinct_id": _uuid, //uuid设为访客ID
      "#type": "track",
      "#event_name": event,
      "#time": _timestampStr(),
      // "#app_version": Constant.appVersion,
      // "#pc_version": Constant.pcVersion,
      '#lib': 'windows',
      "properties": props,
    };
    eventItem.addAll(_superConfig);
    return eventItem;
  }

  String _generateUserSetJson({required Map<String, dynamic> properties}) {
    List data = [];
    Map eventItem = {
      "#account_id": _accountId,
      "#distinct_id": _uuid,
      "#type": "user_set",
      "#time": _timestampStr(),
      "properties": properties
    };
    data.add(eventItem);
    var content = {"appid": _appId, "data": data};
    String jsonStr = json.encode(content);
    return jsonStr;
  }

  String _timestampStr() {
    var now = DateTime.now();
    print('main: now = $now');
    String time = '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}.${now.millisecond}';
    /*  var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = format.format(now);*/
    print('main: time = $time');
    return time;
  }

  final GZipCodec _gzip = GZipCodec(level: ZLibOption.maxLevel);
  Future<bool> _report(String jsonStr) async {
    try {
      HttpClient client = _initHttpClient();
      HttpClientRequest request = await client.postUrl(Uri.parse(_serverUrl));

      List<int> rawBytes = utf8.encode(jsonStr);
      List<int> compressedBytes = _gzip.encode(rawBytes);
      // request.headers.set("Content-Length", rawBytes.length);
      request.headers.set("Content-Length", compressedBytes.length);
      request.headers.set("compress", "gzip");
      // request.add(rawBytes);
      request.add(compressedBytes);

      final HttpClientResponse response = await request.close();
      String resultStr = await _readResponse(response);
      Map result = json.decode(resultStr);
      return response.statusCode == 200 && result.containsKey('code') && result['code'] == 0;
    } catch (e) {
      print(e);
      _cachedReportJsons.add(jsonStr);
      return false;
    } finally {
      if (TrackerUtil.connectivityResult != ConnectivityResult.none && _cachedReportJsons.isNotEmpty) {
        _reportCachedJsons();
      }
    }
  }

  // 上报失败重新上传
  bool _cacheReportComplete = true;
  void _reportCachedJsons() async {
    //数量多的话容易爆内存
    if (_cacheReportComplete == false) return;
    _cacheReportComplete = false;
    while (_cachedReportJsons.isNotEmpty) {
      String jsonStr = _cachedReportJsons[0];
      await _report(jsonStr);
      _cachedReportJsons.remove(jsonStr);
    }
    _cacheReportComplete = true;
  }

  HttpClient _initHttpClient() {
    HttpClient client = HttpClient();
    client.badCertificateCallback = _badCertificateCallback;
    client.findProxy = null;
    return client;
  }

  bool _badCertificateCallback(X509Certificate cr, String host, int port) {
    return true;
  }

  Future<String> _readResponse(HttpClientResponse response) async {
    final contents = StringBuffer();
    await for (var data in response.transform(utf8.decoder)) {
      contents.write(data);
    }
    return contents.toString();
  }

  Map<String, dynamic> get superProperties {
    return _superProperties;
  }
}
