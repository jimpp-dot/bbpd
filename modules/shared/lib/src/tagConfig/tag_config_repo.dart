import 'package:shared/shared.dart';

class TagConfigRepo {
  static String TAG_CONFIG_VERSION_KEY = 'tag_config_version_v2';

  static Future<void> updateTagConfig() async {
    String url = "${System.domain}go/yy/tag/config";

    ResTagConfig tagConfig;
    int dbVersion = Config.getInt(TAG_CONFIG_VERSION_KEY, 0);

    try {
      XhrResponse response = await Xhr.post(url, {'version': '$dbVersion'},
          throwOnError: true, pb: true);
      tagConfig = ResTagConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      Log.d('updateTagConfig error: $e');
      return;
    }

    if (tagConfig.success != true) {
      Log.d('updateTagConfig get tag config fail');
      return;
    }

    int netVersion = tagConfig.data.hasVersion() ? tagConfig.data.version : 0;

    Log.d(
        'updateTagConfig, netVersion: $netVersion, dbVersion: $dbVersion, length: ${tagConfig.data.config.length}');
    // Log.d('go/yy/tag/config${tagConfig.data}');
    if (netVersion > dbVersion) {
      if (tagConfig.data.config.isNotEmpty) {
        await TagConfigDb.deleteAllData();
        // await TagConfigDb.queryConfigNum();
        await TagConfigDb.batchInsertData(tagConfig.data.config);
        // await TagConfigDb.queryConfigNum();
        Config.set(TAG_CONFIG_VERSION_KEY, '$netVersion');
      }
    }
  }
}
