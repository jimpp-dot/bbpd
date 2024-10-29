import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared/src/pbModel/generated/api_relation.pb.dart';
import 'package:quiver/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:pulse_log/pulse_log.dart';

class FamiliarCache {
  static const String familiarTableName = 'familiar';
  static const String tempGroupTableName = 'temp_group';

  static const String msgAddFamiliar = 'add.familiar.relation';
  static const String msgRefreshFamiliar = 'update.familiar.relation';

  static FamiliarCache? _instance;

  final Completer _completer = Completer();

  late _Cache familiar;
  late _Cache tempGroup;

  bool _syncing = false;

  FamiliarCache._();

  final List<ValueChanged<List<FamiliarItem>>> _familiarListeners = [];
  final List<ValueChanged<List<FamiliarItem>>> _groupListeners = [];

  void addFamiliarListener(ValueChanged<List<FamiliarItem>> listener) {
    if (_familiarListeners.contains(listener)) {
      rmFamiliarListener(listener);
    }
    _familiarListeners.add(listener);
  }

  void rmFamiliarListener(ValueChanged<List<FamiliarItem>> listener) =>
      _familiarListeners.remove(listener);

  void addGroupListener(ValueChanged<List<FamiliarItem>> listener) {
    if (_groupListeners.contains(listener)) {
      rmGroupListener(listener);
    }
    _groupListeners.add(listener);
  }

  void rmGroupListener(ValueChanged<List<FamiliarItem>> listener) =>
      _groupListeners.remove(listener);

  static FamiliarCache get instance {
    _instance ??= FamiliarCache._();
    return _instance!;
  }

  Future<void> init() async {
    if (Session.isLogined) {
      familiar = _Cache(
          tableName: '${familiarTableName}_${Session.uid}',
          loader: (maxId) =>
              RelationshipApi.syncFamiliar(maxId: maxId, group: false));
      tempGroup = _Cache(
          tableName: '${tempGroupTableName}_${Session.uid}',
          loader: (maxId) =>
              RelationshipApi.syncFamiliar(maxId: maxId, group: true));

      await familiar.init(_familiarListeners);
      await tempGroup.init(_groupListeners);

      await sync();
    }
    _initListener();
  }

  Future<void> sync({bool notify = false}) async {
    PulseLog.instance
        .console('FamiliarCache sync, _syncing: $_syncing', tag: 'msgLoading');
    if (_syncing) return;

    _syncing = true;
    await familiar.syncAndLoad(notify: notify);
    await tempGroup.syncAndLoad(notify: notify);
    _syncing = false;

    familiarComplete();
    PulseLog.instance
        .console('FamiliarCache Sync familiar cache end', tag: 'msgLoading');
  }

  Future get familiarReady => _completer.future;

  void familiarComplete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }

  void _initListener() {
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onFamiliarRefresh);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);

    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onFamiliarRefresh);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  void _onLogin(String name, dynamic data) => init();

  void _onFamiliarRefresh(String name, dynamic data) {
    // Log.d('Receive socket message in FamiliarDataMixin, name: $name, data: $data');
    if (!Session.isLogined || data is! Map<String, dynamic>) return;

    Map<String, dynamic> dataMap = data;
    if (dataMap['name'] == msgRefreshFamiliar) {
      FamiliarMsg familiarMsg =
          FamiliarMsg.fromBuffer(List<int>.from(dataMap['data']));
      Log.d('FamiliarCache onFamiliarRefresh-familiarMsg: $familiarMsg');
      switch (familiarMsg.type) {
        case FamiliarType.familiar:
          familiar.update(familiarMsg.data, notify: true);
          break;
        case FamiliarType.group:
          tempGroup.update(familiarMsg.data, notify: true);
          break;
      }
    }
  }
}

typedef _CacheLoader = Future<ResFamiliar> Function(int maxId);

class _Cache {
  final String tableName;
  final _CacheLoader loader;

  List<ValueChanged<List<FamiliarItem>>> _listeners = [];

  final LruMap<int, FamiliarItem> _cache =
      LruMap<int, FamiliarItem>(maximumSize: 1000);

  final Map<int, int> _syncRecord = {};

  _Cache({required this.tableName, required this.loader});

  Future<void> init(List<ValueChanged<List<FamiliarItem>>> listeners) async {
    _listeners = listeners;
    await _createTable(LocalStorage.db);
  }

  /// 创建表
  Future<void> _createTable(Database? db) async {
    try {
      String createFamiliar =
          'CREATE TABLE IF NOT EXISTS $tableName (id UNSIGNED BIG INT PRIMARY KEY,uid INTEGER,time INTEGER)';
      await db?.execute(createFamiliar);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  /// sync服务端数据，更新 本地数据库 & 内存cache
  Future<void> syncAndLoad({bool notify = false}) async {
    await _sync(notify: notify);

    /// 不需要提前放缓存，即用即存即可。
  }

  Future<void> _sync({bool notify = false}) async {
    int maxId = await getMaxId();

    // 过滤一分钟内的同一id的同步请求，避免服务端出错导致客户端轮询
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - (_syncRecord[maxId] ?? 0) <= 60 * 1000) {
      PulseLog.instance.console(
          'FamiliarCache _sync maxId:$maxId during 60s, ignore this sync',
          tag: 'msgLoading');
      Log.d('Already synced with maxId: $maxId during 60s, ignore this sync');
      return;
    }
    PulseLog.instance
        .console('FamiliarCache _sync start maxId:$maxId', tag: 'msgLoading');
    Log.d('Sync familiar cache with maxId: $maxId');

    ResFamiliar resp = await loader(maxId);

    _syncRecord[maxId] = now;
    if (resp.success && (resp.data.isNotEmpty)) {
      PulseLog.instance.console(
          'FamiliarCache _sync result length:${resp.data.length}',
          tag: 'msgLoading');
      await update(resp.data, notify: notify, batchUpdate: true);

      // 两次sync至少间隔1秒
      if (DateTime.now().millisecondsSinceEpoch - now < 1000) {
        PulseLog.instance.console('FamiliarCache _sync maxId: $maxId, wait 1s',
            tag: 'msgLoading');
        Log.d('Frequently sync with maxId: $maxId, wait 1s');
        await Future.delayed(const Duration(milliseconds: 1000));
      }

      await _sync(notify: notify);
    }
  }

  Future<void> update(List<FamiliarItem> items,
      {bool notify = false, bool batchUpdate = false}) async {
    /// 有更新，清空缓存
    _cache.clear();
    if (batchUpdate) {
      Batch? batch = LocalStorage.db?.batch();
      for (FamiliarItem item in items) {
        if (item.familiar) {
          batch?.insert(
              tableName,
              {
                'id': item.id.toInt(),
                'uid': item.toId,
                'time': item.time,
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        } else {
          batch?.delete(tableName, where: 'id=${item.id.toInt()}');
        }
      }
      await batch?.commit();
      if (notify) {
        for (var _ in _listeners) {
          _(items);
        }
      }
    } else {
      for (FamiliarItem item in items) {
        await updateSingle(item, notify: notify);
      }
    }
  }

  Future<void> updateSingle(FamiliarItem familiar,
      {bool notify = false, bool force = false}) async {
    try {
      FamiliarItem item = await get(familiar.toId);

      // 更新的familiar时间戳比本地的小，忽略
      if (item.time > familiar.time && !force) return;

      // familiar值一样，不更新
      if ((item.familiar) == familiar.familiar) return;

      if (familiar.familiar) {
        // familiar为true，添加familiar
        await LocalStorage.db?.insert(
            tableName,
            {
              'id': familiar.id.toInt(),
              'uid': familiar.toId,
              'time': familiar.time,
            },
            conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        // familiar为false，删除familiar
        await deleteById(familiar.id.toInt());
      }

      if (notify) {
        for (var _ in _listeners) {
          _([familiar]);
        }
      }
    } catch (e) {
      Log.d(
          'FamiliarCache insert FamiliarItem(${familiar.toProto3Json()}) error $e');
    }
  }

  Future<int> getMaxId() async {
    List<Map<String, dynamic>>? res = await LocalStorage.db
        ?.rawQuery("SELECT id FROM $tableName ORDER BY id DESC LIMIT 1");
    if (res?.isEmpty ?? true) return 0;

    int maxId = res!.first['id'];
    return maxId;
  }

  Future<FamiliarItem> get(int uid) async {
    FamiliarItem? cachedItem = _cache[uid];
    Log.d("FamiliarCache get cachedItem:$cachedItem");
    if (cachedItem != null) {
      return cachedItem;
    }

    FamiliarItem result = FamiliarItem(toId: uid, familiar: false);

    try {
      String sql = 'SELECT * FROM $tableName WHERE uid = $uid';
      List<Map<String, dynamic>>? res = await LocalStorage.db?.rawQuery(sql);
      if (res?.isNotEmpty ?? false) {
        List<FamiliarItem> items = res!.map((_) {
          FamiliarItem item = FamiliarItem.create();
          item.id = Int64(Util.parseInt(_['id']));
          item.toId = Util.parseInt(_['uid']);
          item.time = Util.parseInt(_['time']);
          item.familiar = true;
          return item;
        }).toList();

        //超过一个，留时间最大的，其余的都删掉
        if (items.length > 1) {
          items.sort((a, b) => a.time.compareTo(b.time));
          for (FamiliarItem _ in items.take(items.length - 1).toList()) {
            await deleteById(_.id.toInt());
          }
        }

        result = items.last;
      }
      Log.d("FamiliarCache get result:$result");
      _cache[uid] = result;
    } catch (e) {}
    return result;
  }

  Future<int> deleteById(int id) async {
    try {
      String sql = 'DELETE FROM $tableName WHERE id = $id';
      return await LocalStorage.db?.rawDelete(sql) ?? 0;
    } catch (e) {
      Log.d(e);
    }
    return 0;
  }

  Future<bool> clear() async {
    bool result = false;
    try {
      String sql = 'DELETE FROM $tableName';
      await LocalStorage.db?.rawDelete(sql);
      _cache.clear();
      result = true;
    } catch (e) {
      Log.d('Clear $tableName cache with error: $e');
    }
    return result;
  }
}
