final ObjectCache objectCache = ObjectCache();

const String Friend_Card_Cache_Key = 'friendCard_';

class ObjectCache {
  final Map<String, Object> _cacheMap = {};

  Object? getObj(String key) {
    return _cacheMap[key];
  }

  T? get<T>(String key) {
    Object? obj = _cacheMap[key];
    if (obj != null && obj is T) {
      return obj as T;
    }
    return null;
  }

  void put(String key, Object obj) {
    _cacheMap[key] = obj;
  }

  bool contains(String key) {
    return _cacheMap.containsKey(key);
  }
}
