import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/dart/lru_cache.dart';
import 'package:chat/src/model/pbModel/generated/emoticon.pb.dart';

/// 表情加载结果回调
typedef OnResultCallback = Function(List<EmoticonSearchListItem>? images);
typedef OnFirstResultCallback = Function(List<EmoticonSearchListItem>? images);

/// 表情数据仓库
class EmoticonRepo {
  /// 日志debug开关
  static const debug = false;

  /// 表情图片数据库表
  static const String tab = 'emoticon';

  /// 表情图片在数据库中，最大的存放时间（6小时）
  static const int expireInMilliseconds = 6 * DateUtils.hourInMilliseconds;

  /// 返回结果，最多返回50条记录，因为表情列表最多只展示50条记录
  static const int resultMaxSize = 50;

  /// 内存最多缓存N个关键字表情列表
  static const int memoryMaxSize = 8;

  /// 内存缓存（一级缓存，生命周期与当前界面一致）
  final LruCache<String, List<EmoticonSearchListItem>> _memoryCache =
      LruCache(memoryMaxSize);

  /// 表情查询结果回调
  final OnResultCallback callback;
  final OnFirstResultCallback firstResultCallback;

  EmoticonRepo(this.callback, this.firstResultCallback);

  /// 初始化
  void init() {
    _deleteExpire();
  }

  /// 加载第一次推荐表情
  Future<void> loadFirst() async {
    ResEmoticonSearch search = await _loadFromNetwork(true, '');
    if (search.success && search.hasData() && search.data.list.isNotEmpty) {
      firstResultCallback(search.data.list);
    }
  }

  /// 从3级缓存中加载表情信息
  Future<void> load(String? keyword) async {
    if ((keyword ?? '') == '') {
      callback([]);
      return;
    }
    List<EmoticonSearchListItem>? images = _memoryCache[keyword];
    if (_doCallback(images)) {
      /// 缓存中有记录
      if (debug) Log.d('EmoticonRepo#_loadFromCache, $keyword: $images');
      return;
    }
    images = await _loadFromDatabase(keyword!);
    if (_doCallback(images)) {
      /// 数据库中有记录
      /// 缓存至Memory
      _memoryCache[keyword] = images;
      return;
    }

    ResEmoticonSearch res = await _loadFromNetwork(false, keyword);
    if (res.success && res.hasData()) {
      EmoticonSearchData emoticon = res.data;
      images = emoticon.list;
      if (_doCallback(images)) {
        /// 从网络中获取成功
        if (!emoticon.userDefault) {
          /// 缓存至Memory
          _memoryCache[keyword] = images;

          /// 保存至数据库
          _saveToDatabase(keyword, images, emoticon.expireSec);
        }
        return;
      }

      callback([]);
    }
  }

  /// 将加载结果，回调出去
  bool _doCallback(List<EmoticonSearchListItem>? images) {
    if (images?.isNotEmpty == true) {
      callback(images!.length <= resultMaxSize
          ? images
          : images.sublist(0, resultMaxSize));
      return true;
    }
    return false;
  }

  /// 从网络上加载表情信息
  static Future<ResEmoticonSearch> _loadFromNetwork(
      bool firstChat, String keyword) async {
    String url = '${System.domain}go/yy/emoticon/search';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {
            'keyword': keyword,
            'first_chat': firstChat ? '1' : '0'
          },
          pb: true);
      return ResEmoticonSearch.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResEmoticonSearch(msg: e.toString(), success: false);
    }
  }

  /// 从数据库中加载表情信息
  static Future<List<EmoticonSearchListItem>?> _loadFromDatabase(
      String keyword) async {
    try {
      List<Map<String, dynamic>>? res = await LocalStorage.db?.rawQuery(
          'SELECT id, gif, webp, width, height FROM $tab WHERE _key = ?',
          [keyword]);
      if (res?.isNotEmpty ?? false) {
        List<EmoticonSearchListItem>? result = res!
            .map((e) => EmoticonSearchListItem.create()..mergeFromProto3Json(e))
            .toList();
        if (debug) Log.d('EmoticonRepo#_loadFromDatabase, $keyword: $result');
        return result;
      }
      return null;
    } catch (e) {
      if (debug) Log.d('EmoticonRepo#_loadFromDatabase, e: $e');
      return null;
    }
  }

  /// 将表情信息保存至数据库
  static void _saveToDatabase(
      String keyword, List<EmoticonSearchListItem>? images, int expire) {
    if (images?.isEmpty ?? false) {
      if (debug)
        Log.d(
            'EmoticonRepo#_saveToDatabase, the param images is null or empty!');
      return;
    }
    images?.forEach((e) {
      if (e.id.isNotEmpty) {
        _saveOneToDatabase(keyword, e, expire);
      }
    });
  }

  /// 记录超时时间
  static int _recordExpireTime(int expire) {
    int expire0 = (expire) <= 0
        ? expireInMilliseconds
        : (expire * DateUtils.secondInMilliseconds);
    int time = expire0 + DateUtils.nowSinceEpoch;
    return time;
  }

  /// 保存一条表情信息记录
  static void _saveOneToDatabase(
      String keyword, EmoticonSearchListItem image, int expire) async {
    try {
      List<Map<String, dynamic>>? res = await LocalStorage.db
          ?.rawQuery('SELECT id FROM $tab WHERE id = ? LIMIT 1', [image.id]);
      Map<String, Object?> map = jsonDecode(jsonEncode(image.toProto3Json()));
      map['_key'] = keyword;
      map['_time'] = _recordExpireTime(expire);
      if ((res?.isNotEmpty ?? false) &&
          res?.first is Map &&
          (res?.first.containsKey('id') ?? false)) {
        /// 有记录，更新
        int? updateResult = await LocalStorage.db
            ?.update(tab, map, where: 'id = ?', whereArgs: [image.id]);
        if (debug)
          Log.d('EmoticonRepo#_saveOneToDatabase, updateResult: $updateResult');
        return;
      }

      /// 无记录，插入
      int? insertResult = await LocalStorage.db?.insert(tab, map);
      if (debug)
        Log.d('EmoticonRepo#_saveOneToDatabase, insertResult: $insertResult');
    } catch (e) {
      if (debug) Log.d('EmoticonRepo#_saveOneToDatabase, e: $e');
    }
  }

  /// 删掉过时的记录
  static void _deleteExpire() async {
    int? deleteResult = await LocalStorage.db?.delete(tab,
        where: '_time <= ?', whereArgs: [DateUtils.nowSinceEpoch]);
    if (debug) Log.d('EmoticonRepo#_deleteExpire, deleteResult: $deleteResult');
  }

  /// 释放资源
  void release() {
    _memoryCache.clear();
    _deleteExpire();
  }
}
