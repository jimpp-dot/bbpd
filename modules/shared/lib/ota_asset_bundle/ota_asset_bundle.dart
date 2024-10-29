import 'package:ota_resource_bundle/ota_resource_bundle.dart';

import '../src/constant.dart';
import '../util/log/log.dart';
import 'http_asset_config_provider.dart';
import 'package:path/path.dart' as path;

class OtaAssetLogger extends LogHelper implements OtaLogBase {
  OtaAssetLogger() : super(prefix: '[otaAsset]');
}

OtaAssetBundle otaResourceBundle = OtaAssetBundle(
    otaProviders:
        const OtaAssetProviders(assetConfigProvider: HttpConfigProvider()),
    defaultOtaAssetDirPath:
        path.join(Constant.documentsDirectory.path, 'ota_assets', '0'),
    defaultOtaAssetDomain:
        'https://bbpd-image.oss-cn-hangzhou.aliyuncs.com/app-assets/');
