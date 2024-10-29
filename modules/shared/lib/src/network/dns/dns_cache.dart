import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'local_proxy.dart';

class DNSEntry {
  String ip;
  int ttl;
  int timestampInSecs;

  DNSEntry(this.ip, this.ttl, this.timestampInSecs);

  Map toMap() {
    return {'ip': ip, 'ttl': ttl, 'timestampInSecs': timestampInSecs};
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

class LocalDnsCache {
  static final LocalDnsCache _instance = LocalDnsCache._();

  LocalDnsCache._();

  static LocalDnsCache get instance => _instance;

  final Map<String, DNSEntry> _dnsCache = {};

  Timer? _refreshDnsCacheTimer;

  Set<String> visitedHosts = {};

  bool _inited = false;

  ///本代码文件中的日志开关
  final bool _debugPrint = true;

  Future<void> init() async {
    if (_inited) {
      return;
    }

    _log('init begin');
    _inited = true;
    await _loadEntriesFromDB();
    _initRefreshTimer();
    _log('init end');
  }

  bool get isInited {
    return _inited;
  }

  List<String> getHosts() {
    return _dnsCache.keys.toList();
  }

  void putItem(String host, DNSEntry entry) {
    _dnsCache[host] = entry;
    _saveEntryToDB(host, entry);
  }

  DNSEntry? getItem(String host) {
    return _dnsCache[host];
  }

  void removeItem(String host) {
    _dnsCache.remove(host);
    _deleteEntryInDB(host);
  }

  bool contains(String host) {
    return _dnsCache.containsKey(host);
  }

  Database? _db;
  StoreRef<String, Map>? _store;

  Future _initDnsDB() async {
    String dbFilePath =
        join(Constant.documentsDirectory.path, 'sembast', 'dns.db');
    _db = await databaseFactoryIo.openDatabase(dbFilePath);
    _store = stringMapStoreFactory.store('dns_db');
  }

  Future _loadEntriesFromDB() async {
    if (_db == null) {
      await _initDnsDB();
    }

    var records = await _store!.find(_db!);
    _dnsCache.clear();
    for (var record in records) {
      String host = record.key;
      Map entryMap = record.value;
      _dnsCache[host] = DNSEntry(
          Util.notNullStr(entryMap['ip']),
          Util.parseInt(entryMap['ttl']),
          Util.parseInt(entryMap['timestampInSecs']));
    }
  }

  Future _saveEntryToDB(String host, DNSEntry entry) async {
    if (_db == null) {
      await _initDnsDB();
    }

    // Log.d('PushChannel._saveTokenToDB tokenInfo = $info');
    await _store!.record(host).put(_db!, entry.toMap(), merge: true);
  }

  Future _deleteEntryInDB(String host) async {
    if (_db == null) {
      await _initDnsDB();
    }

    // Log.d('PushChannel._deleteTokenInDB');
    await _store!.record(host).delete(_db!);
  }

  String? queryIpFromCache(String host) {
    if (hostIsIP(host)) {
      return host;
    }
    DNSEntry? entry = getItem(host);
    return entry?.ip;
  }

  final _dnsServers = {'223.5.5.5', '223.6.6.6'};

  Future<String?> queryIPOverHttp(String host) async {
    DNSEntry? dnsEntry;
    for (var dnsServer in _dnsServers) {
      dnsEntry = await _doQueryDNS(host, dnsServer);
      if (dnsEntry != null) {
        break;
      }
    }
    if (dnsEntry == null) {
      return null;
    }
    _log(
        'queryIPOverHttp: get ip $host => ${dnsEntry.ip}, ttl = ${dnsEntry.ttl}');
    return dnsEntry.ip;
  }

  final _defaultTTLInSecs = 10 * 60;

  Future<DNSEntry?> _doQueryDNS(String host, String dnsServer) async {
    DNSEntry? dnsEntry;
    try {
      var httpClient = HttpClient();
      var request = await httpClient
          .getUrl(Uri.parse('http://$dnsServer/resolve?type=A&name=$host'))
          .timeout(const Duration(milliseconds: 3000));
      var response = await request.close();
      var responseBody = await response.transform(const Utf8Decoder()).join();
      var data = json.decode(responseBody);
      if (data['Answer'] != null) {
        var ip = data['Answer'][0]['data'];
        // var ttl = data['Answer'][0]['TTL'];
        var ttl = _defaultTTLInSecs; // for test only
        dnsEntry = DNSEntry(ip, ttl, _secondsSinceEpoch());
        putItem(host, dnsEntry);
      }
    } catch (e) {
      _log('_doQueryDNS host=$host dnsServer=$dnsServer error = $e');
    }
    return dnsEntry;
  }

  bool removeOutdatedDNSEntry(String host) {
    if (contains(host)) {
      var entry = getItem(host);
      var now = _secondsSinceEpoch();
      var pastSecs = now - entry!.timestampInSecs;
      if (pastSecs > entry.ttl) {
        _log('*** removeOutdatedDNSEntry host = $host, ttl = ${entry.ttl}');
        removeItem(host);
        return true;
      }
    }
    return false;
  }

  int _secondsSinceEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  void _log(String log) {
    if (_debugPrint) {
      Log.d('LocalDnsCache: $log');
    }
  }

  void _initRefreshTimer() {
    _requeryDns();
    _refreshDnsCacheTimer ??= Timer(const Duration(minutes: 2), _requeryDns);
  }

  void _requeryDns() {
    _log('_requeryDns visitedHosts.length = ${visitedHosts.length}');
    for (var host in visitedHosts) {
      if (!hostIsIP(host)) {
        queryIPOverHttp(host);
      }
    }
  }
}
