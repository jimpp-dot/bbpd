import 'package:flutter/foundation.dart';
import 'package:ota_resource_bundle/ota_resource_bundle.dart';

import '../src/system.dart';
import '../src/xhr.dart';
import '../util/log/log.dart';
import 'proto/api_config.pb.dart';

class HttpConfigProvider extends AssetConfigProvider {
  const HttpConfigProvider();

  @override
  Future<AssetConfigData?> getHeadVersionConfig() async {
    String configUrl = '${System.domain}go/yy/config/assetConfig';
    try {
      XhrResponse response =
          await Xhr.postPb(configUrl, {}, timeout: 5, throwOnError: false);
      ResAppAssetUpdateConfig? config =
          response.formatProtobuf(ResAppAssetUpdateConfig.create());
      Log.d('getHeadVersionConfig:$config');
      if (config?.success ?? false) {
        return AssetConfigData(
            targetVersion: config.data.targetVersion,
            assetManifestHash: config.data.assetManifestMd5,
            domainUrl: config.data.domainUrl);
      } else {
        if (!kDebugMode) {
          Log.w(config.msg);
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    return null;
  }
}
