library ota_resource_bundle;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '_log.dart';
import 'manifest.pb.dart' as pb;
import 'ota_asset_downloader/firebase_config_provider.dart';
import 'ota_asset_downloader/ota_asset_providers.dart';
import 'ota_asset_downloader/ota_update_asset_downloader.dart';

mixin _LocalAssetBundle {
  final String _kAssetMd5ManifestFileName = 'AssetManifest.pb';
  List<String> _listAssets = [];
  pb.Manifest? _assetMetaManifest;
  pb.Manifest? get assetMetaManifest => _assetMetaManifest;

  SharedPreferences? _preferences;

  Future<void> loadLocalManifest() async {
    _preferences = await SharedPreferences.getInstance();
    if (kDebugMode) {
      // The CI build will definitely update the assetmanifest.pb,
      // but in debug situations, assetmanifest.pb might not be the latest,
      // so we load assetmanifest.json here as a fallback
      AssetManifest assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      _listAssets = assetManifest.listAssets();
    } else {
      AssetManifest.loadFromAssetBundle(rootBundle).then((asset) => _listAssets = asset.listAssets());
    }
    try {
      ByteData assetMetaData = (await _rawLoad('assets/$_kAssetMd5ManifestFileName') as ByteData);
      _assetMetaManifest = pb.Manifest.fromBuffer(assetMetaData.buffer.asInt8List());
    } catch (e, s) {
      if (kDebugMode) return;
      // _rawLoad might return null and fail for some weird reason. It probably shouldnt.
      log?.e(e.toString(), stackTrace: s, upload: kReleaseMode);
    }
  }

  // Check if local bundled assets contains key.
  bool localContains(String key) {
    return _assetMetaManifest?.files.containsKey(key) ?? _listAssets.contains(key);
  }

  Future<ByteData?> _rawLoad(String key) async {
    final Uint8List encoded = utf8.encoder.convert(Uri(path: Uri.encodeFull(key)).path);
    final ByteData? asset = await ServicesBinding.instance.defaultBinaryMessenger
        .send('flutter/assets', encoded.buffer.asByteData()); // ignore: deprecated_member_use_from_same_package
    return asset;
  }
}

class OtaAssetBundle extends CachingAssetBundle with _LocalAssetBundle {
  @visibleForTesting
  pb.Manifest? otaAssetMetaManifest;

  @visibleForTesting
  bool areManifestsLoaded = false;

  final String? defaultOtaAssetDomain; // Default to production url
  String get otaAssetDomain => _otaAssetDomain!;
  String? _otaAssetDomain;

  final String? defaultOtaAssetDirPath;
  String _otaAssetDirPath = "";

  final OtaAssetProviders otaProviders;

  OtaUpdateAssetDownloader? _assetDownloader;
  OtaUpdateAssetDownloader get assetDownloader {
    _assetDownloader ??= OtaUpdateAssetDownloader(bundle: this);
    return _assetDownloader!;
  }

  OtaAssetBundle(
      {this.otaProviders = const OtaAssetProviders(assetConfigProvider: FirebaseConfigProvider()),
      this.defaultOtaAssetDomain,
      this.defaultOtaAssetDirPath}) {
    _otaAssetDirPath = defaultOtaAssetDirPath ?? '';
    _otaAssetDomain = defaultOtaAssetDomain;
  }

  Future<void> loadOtaManifest() async {
    final versionConfig = (await otaProviders.getHeadVersionConfig()) ?? otaProviders.getDefaultVersionConfig();
    _otaAssetDomain = versionConfig.domainUrl.isNotEmpty ? versionConfig.domainUrl : defaultOtaAssetDomain ?? '';

    try {
      // The manifest for assets that need to be update/download
      otaAssetMetaManifest = (await otaProviders.getManifests(versionConfig))?.diffedManifest;
      _otaAssetDirPath = defaultOtaAssetDirPath ?? await otaProviders.getAssetDirPath(versionConfig.targetVersion);

      // Initiate background task to download update package
      assetDownloader.start(versionConfig.domainUrl);
      areManifestsLoaded = true;
    } catch (e, s) {
      if (kDebugMode) return;
      // _rawLoad might return null and fail for some weird reason. It probably shouldnt.
      log?.e(e.toString(), stackTrace: s, upload: kReleaseMode);
    }
  }

  // Check if the ota assets contains key.
  bool otaContains(String key) {
    return ((_preferences!.getString(OtaUpdateAssetDownloader.kAssetManifestVersionKey) ??
                otaAssetBundle.assetMetaManifest?.version ??
                "0") ==
            otaAssetMetaManifest?.version) &&
        (otaAssetMetaManifest?.files.containsKey(key) ?? false);
  }

  @override
  Future<ByteData> load(String key) async {
    if (otaContains(key)) {
      final assetFile = File(p.join(_otaAssetDirPath, key));
      if ((await assetFile.exists())) {
        final fileBytes = await assetFile.readAsBytes();
        return ByteData.view(fileBytes.buffer);
      }
    }
    // We try to raw load if manifests arent loaded yet.
    if (localContains(key) || !areManifestsLoaded) {
      ByteData? data = await _rawLoad(key);
      if (data != null) {
        return data;
      }
    }
    // We first try to check if it is already downloaded before
    final localFile = File(p.join(_otaAssetDirPath, key));
    if (localFile.existsSync()) {
      return ByteData.view(localFile.readAsBytesSync().buffer);
    }

    // Not downloaded, download then lmao.
    final fileBytes = await otaProviders.downloadFile(url: p.join(_otaAssetDomain!, "latest", key));
    // Save it in asset folder. Will probably be overwritten after patch
    if (fileBytes.isNotEmpty) {
      await localFile.create(recursive: true);
      await localFile.writeAsBytes(fileBytes);

      return ByteData.view(Uint8List.fromList(fileBytes).buffer);
    }
    log?.w("Unable to retrive assets from ota folder, asset folder or through download");
    return await _rawLoad(key) ?? ByteData(0);
  }
}

OtaAssetBundle? _otaAssetBundle;
OtaAssetBundle get otaAssetBundle => _otaAssetBundle ?? OtaAssetBundle();

set otaAssetBundle(OtaAssetBundle bundle) => _otaAssetBundle = bundle;
