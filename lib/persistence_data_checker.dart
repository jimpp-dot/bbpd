import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:shared/shared.dart';
import 'package:shared/util/cache_util.dart';

/// 覆盖安装版本检查，根据安装前后的版本号，检查持久化数据
class PersistenceDataChecker {
  static String? get preVersion {
    return Config.get('pdc_preVersion');
  }

  static set preVersion(String? value) {
    Config.set('pdc_preVersion', value);
  }

  static fixnum.Int64 get modifyTime {
    String value = Config.get('pdc_modifyTime', '0');
    return fixnum.Int64.parseInt(value);
  }

  static set modifyTime(fixnum.Int64 value) {
    Config.set('pdc_modifyTime', value.toString());
  }

  static Future check() async {
    String nowVersion = Constant.appVersion;
    if (preVersion == null || nowVersion != preVersion) {
      preVersion = nowVersion;

      // 处理版本迭代需要操作的本地数据
    }

    try {
      // 通过接口下发的需要处理的缓存数据，接口根据header中的app版本号返回对应数据
      XhrResponse response =
          await Xhr.get('go/yy/config/imgCacheCfg', pb: true);
      ClientDataCheckerResponse res =
          ClientDataCheckerResponse.fromBuffer(response.bodyBytes);
      if (res.success) {
        if (res.data.modifyTime > modifyTime) {
          // 有需要清理的本地数据
          if (res.data.isGlobal) {
            // 清除所有缓存
            CacheUtil.clearCache();
          } else {
            CachedImageManager.instance().removeCaches(res.data.invalidImgUrls);
          }

          modifyTime = res.data.modifyTime;
        }
      }
    } catch (e) {
      Log.d(e);
    }
  }
}
