import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Rive 网络图片缓存
class RiveCacheManager {
  static const key = 'rive_cache';
  static CacheManager instance = CacheManager(Config(key));
}
