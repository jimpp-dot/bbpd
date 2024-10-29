import 'ota_asset_providers.dart';

class FirebaseConfigProvider extends AssetConfigProvider {
  const FirebaseConfigProvider();

  @override
  Future<AssetConfigData?> getHeadVersionConfig() async {
    throw Exception("Unimplement getHeadVersionConfig");
  }
}
