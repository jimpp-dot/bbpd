import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import '../_log.dart';
import '../manifest.pb.dart';
import '../ota_asset_bundle.dart';
import 'manifest_model.dart';
import 'ota_asset_providers.dart';

class ManifestProvider {
  @visibleForTesting
  final OtaAssetProviders providers;

  ManifestProvider(this.providers);

  static AssetConfigData? headVersionConfig;

  @visibleForTesting
  static Manifest? headManifest;

  Future<Manifest> _downloadHeadManifest() async {
    final versionConfig = headVersionConfig;
    if (versionConfig == null) {
      throw Exception("Head Version config is null");
    }

    final headManifestUrl = "${otaAssetBundle.otaAssetDomain}/manifest/${versionConfig.targetVersion}.pb";
    final pbFile = await providers!.downloadFile(url: headManifestUrl);
    final fileMd5 = md5.convert(pbFile).toString();
    if (fileMd5 == versionConfig.assetManifestHash) {
      final manifest = Manifest.fromBuffer(pbFile);
      return manifest;
    } else {
      throw Exception("MD5 of manifest does not match config");
    }
  }

  Future<Manifest?> _loadDownloadedHeadManifest(String headVersion) async {
    final otaUpdateDirPath = await providers!.getAssetDirPath(headVersion);
    final manifestPath = p.join(otaUpdateDirPath, "assets/AssetManifest.pb");
    final manifestFile = File(manifestPath);
    if (!(await manifestFile.exists())) {
      log?.d("Unable to find AssetManifest.pb in path $manifestPath for version $headVersion");
      return null;
    }
    try {
      final manifestPbBytes = await File(manifestPath).readAsBytes();
      return Manifest.fromBuffer(manifestPbBytes);
    } catch (e, s) {
      log?.e(e.toString(), stackTrace: s);
      return null;
    }
  }

  Future<Manifest> _loadHeadManifest(String headVersion) async {
    final downloadedManifest = await _loadDownloadedHeadManifest(headVersion);
    if (downloadedManifest != null) {
      return downloadedManifest;
    }
    return await _downloadHeadManifest();
  }

  Manifest _loadBaseManifest() {
    return otaAssetBundle.assetMetaManifest ?? Manifest();
  }

  Future<ManifestModel?> getManifests(AssetConfigData versionConfig) async {
    headVersionConfig = versionConfig;
    // The manifest in the bundle
    final baseManifest = _loadBaseManifest();
    try {
      // Load or download remote manifest
      final manifest = await _loadHeadManifest(versionConfig.targetVersion);
      headManifest = manifest;
      return ManifestModel(baseManifest: baseManifest, headManifest: manifest);
    } catch (e, s) {
      if (kDebugMode) return null;
      log?.e(e.toString(), stackTrace: s, upload: false);
    }
    return null;
  }
}
