import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import 'package:ota_resource_bundle/src/ota_asset_downloader/manifest_provider.dart';
import 'package:path_provider/path_provider.dart';

import '../_log.dart';
import '../ota_asset_bundle.dart';
import 'manifest_model.dart';

abstract class AssetDownloader {
  Future<List<int>> downloadFile(String url);
}

class DioAssetDownloader implements AssetDownloader {
  final Dio? dio;

  Dio get _dio => dio ?? Dio();

  const DioAssetDownloader({this.dio});

  @override
  Future<List<int>> downloadFile(String url) async {
    try {
      int bodySize = 0;
      _dio.options.connectTimeout = const Duration(seconds: 10);
      _dio.options.receiveTimeout = const Duration(seconds: 30);
      Response res = await _dio.get<List<int>>(
        url,
        options: Options(
          headers: {HttpHeaders.acceptEncodingHeader: "*"},
          responseType: ResponseType.bytes,
        ),
        onReceiveProgress: (int received, int total) {
          if (bodySize != total) {
            bodySize = total;
          }
        },
      );
      if ((res.headers[Headers.contentLengthHeader] != null &&
          int.tryParse(res.headers[Headers.contentLengthHeader]?.firstOrNull ?? "0") == bodySize)) {
        return res.data;
      }
    } catch (e, s) {
      if (kDebugMode) {
        return [];
      }
      log?.e(e, stackTrace: s, upload: kReleaseMode);
      return [];
    }
    return [];
  }
}

abstract class AssetPathProvider {
  Future<String> getAssetDirPath(String version);
}

class DefaultAssetPathProvider implements AssetPathProvider {
  const DefaultAssetPathProvider();
  @override
  Future<String> getAssetDirPath(String version) async {
    final docPath = await getApplicationDocumentsDirectory();
    return "${docPath.path}/ota_assets/$version";
  }
}

abstract class AssetConfigProvider {
  const AssetConfigProvider();

  Future<AssetConfigData?> getHeadVersionConfig();

  AssetConfigData getDefaultVersionConfig() {
    Uint8List bytes = otaAssetBundle.assetMetaManifest?.writeToBuffer() ?? Uint8List.fromList([]);
    final targetVersion = otaAssetBundle.assetMetaManifest?.version ?? "0";
    final assetManifestMd5 = md5.convert(bytes).toString();
    return AssetConfigData(targetVersion: targetVersion, assetManifestHash: assetManifestMd5, domainUrl: '');
  }
}

class AssetConfigData {
  final String targetVersion;
  final String assetManifestHash;
  final String domainUrl;

  const AssetConfigData({required this.targetVersion, required this.assetManifestHash, required this.domainUrl});
}

class DefaultConfigProvider extends AssetConfigProvider {
  const DefaultConfigProvider();

  @override
  Future<AssetConfigData?> getHeadVersionConfig() async {
    return null;
  }
}

class OtaAssetProviders {
  final AssetDownloader assetDownloader;
  final AssetPathProvider assetPathProvider;
  final AssetConfigProvider assetConfigProvider;

  static ManifestProvider? _manifestProvider;

  const OtaAssetProviders({
    this.assetDownloader = const DioAssetDownloader(),
    this.assetPathProvider = const DefaultAssetPathProvider(),
    required this.assetConfigProvider,
  });

  Future<List<int>> downloadFile({required String url}) {
    return assetDownloader.downloadFile(url);
  }

  Future<String> getAssetDirPath(String version) {
    return assetPathProvider.getAssetDirPath(version);
  }

  Future<AssetConfigData?> getHeadVersionConfig() {
    return assetConfigProvider.getHeadVersionConfig();
  }

  AssetConfigData getDefaultVersionConfig() {
    return assetConfigProvider.getDefaultVersionConfig();
  }

  Future<ManifestModel?> getManifests(AssetConfigData versionConfig) {
    _manifestProvider ??= ManifestProvider(this);
    return _manifestProvider!.getManifests(versionConfig);
  }
}
