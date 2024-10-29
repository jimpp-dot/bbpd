import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../_log.dart';
import '../manifest.pb.dart';
import '../ota_asset_bundle.dart';
import 'manifest_model.dart';

@visibleForTesting
class IsolateData {
  final RootIsolateToken token;
  final ManifestModel manifests;
  final SendPort sendport;
  final String domainUrl;
  IsolateData({required this.token, required this.manifests, required this.sendport, required this.domainUrl});
}

class OtaUpdateAssetDownloader {
  static const _kTag = "OtaUpdateAssetDownloader";

  OtaUpdateAssetDownloader({required this.bundle});

  static const String kTag = "OtaUpdateAssetDownloader";

  static const String kAssetManifestVersionKey = "asset_manifest.version";

  // This ReceivePort is used to receive version to update current version.
  // It also receives a message to know when the isolate exits.
  final ReceivePort _recievePort = ReceivePort();

  @visibleForTesting
  OtaAssetBundle bundle;

  bool _hasDownloadIsolateStarted = false;
  SharedPreferences? _preferences;

  // --------- This is the only function that runs in the foreground ------
  void start(String domainUrl) async {
    _preferences = await SharedPreferences.getInstance();
    final versionConfig = await bundle.otaProviders!.getHeadVersionConfig();
    if (versionConfig == null) {
      if (kReleaseMode) {
        log?.w("Version config is null, not updating", tag: _kTag);
      }
      return;
    }

    final manifests = await bundle.otaProviders.getManifests(versionConfig);
    if (manifests == null) {
      log?.w("Manifests are null. Not updating", tag: _kTag);
      return;
    }
    final versionComparison = versionComparator(versionConfig.targetVersion);
    if (versionComparison == 0) {
      log?.i("Current asset version is up to date, proceeding with simple verification", tag: _kTag);

      final assetIntegrity = await verifyOtaAssetIntegrity(manifest: manifests.diffedManifest);
      if (assetIntegrity.key) {
        if (assetIntegrity.value.isEmpty) {
          log?.i("Assets are fully integrous. Successful verification.", tag: _kTag);
          return;
        }
        // There are some assets that are not verified. Will download on use.
        log?.i("Assets are partially integrous.", tag: _kTag);
        return;
      } else {
        log?.e("Unknown error. Unable to verify assets in the up-to-date asset verification step", tag: _kTag);
        return;
      }
    }

    if (versionComparison == -1) {
      log?.w("Version comparison is -1. Something went wrong. Returning", tag: _kTag);
      return;
    }

    try {
      if (ServicesBinding.rootIsolateToken != null) {
        if (_hasDownloadIsolateStarted) {
          return;
        }
        log?.i("Spawning download isolate", tag: _kTag);
        _hasDownloadIsolateStarted = true;
        final isolate = await Isolate.spawn(
            startOtaUpdate,
            IsolateData(
                token: ServicesBinding.rootIsolateToken!,
                manifests: manifests,
                sendport: _recievePort.sendPort,
                domainUrl: domainUrl),
            paused: true);

        _recievePort.listen((message) {
          if (message is String) {
            if (message == "done") {
              _hasDownloadIsolateStarted = false;
              _recievePort.close();
              return;
            }
          }
          if (message is Map<String, String> && message.containsKey("version")) {
            _preferences?.setString(kAssetManifestVersionKey, message['version']!);
          }
        });

        if (isolate.pauseCapability == null) {
          log?.e("Unable to start download as pause capability is missing even though it was started in paused state.",
              tag: _kTag);
          _hasDownloadIsolateStarted = false;
          return;
        }
        isolate.resume(isolate.pauseCapability!);
      } else {
        log?.e("Attempt to start OTA Update asset download from background isolate",
            stackTrace: StackTrace.current, tag: _kTag);
      }
    } catch (e, s) {
      log?.e(e, stackTrace: s, tag: _kTag);
    }
  }

  // --------------------------------------------------------

  /// Helper function for updating.
  /// True means to not retry.
  /// False means nothing is updated. Retry again.
  Future<bool> _otaUpdateHelper({required int retryCount, required IsolateData data}) async {
    final manifests = data.manifests;

    // Download updated files and store in disk
    await downloadUpdatedFiles(manifests: manifests, domainUrl: data.domainUrl);

    // Verify asset integrity
    final assetIntegrity = await verifyOtaAssetIntegrity(manifest: manifests.diffedManifest);

    final isPartiallyOrFullyVerified = assetIntegrity.key;
    if (isPartiallyOrFullyVerified) {
      // Update the current version as long as at least one file is updated/added.
      data.sendport.send({"version": manifests.headManifest.version});

      if (assetIntegrity.value.isEmpty) {
        /// OTA assets are downloaded and verified.
        log?.i("Files are fully downloaded", tag: _kTag);
        return true;
      }

      log?.w(
          "Initial download of assets for head manifest version ${manifests.headManifest.version} failed, retrying downloads for assets that failed",
          tag: _kTag);

      final filesThatFailed =
          await redownload(filesToRetry: assetIntegrity.value, manifests: manifests, domainUrl: data.domainUrl);
      if (filesThatFailed.isEmpty) {
        log?.i("Redownloads of head manifest version ${manifests.headManifest.version} succeeded", tag: _kTag);
      } else {
        /// Files failed redownloading. Assume already updated and try to download from OSS when needed.
        log?.e(
            "Redownloads of files in head manifest version ${manifests.headManifest.version} failed. Files that failed: ${filesThatFailed.join(", ")}",
            tag: _kTag);
      }
      return true;
    } else {
      return false;
    }
  }

  @visibleForTesting
  static void startOtaUpdate(IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);

    try {
      final downloaderInstance = OtaUpdateAssetDownloader(bundle: OtaAssetBundle());
      var fullRetryCount = 0;
      var downloadSucceded = false;
      while (!downloadSucceded && fullRetryCount < 3) {
        downloadSucceded = await downloaderInstance._otaUpdateHelper(retryCount: fullRetryCount, data: data);
        if (!downloadSucceded) {
          fullRetryCount += 1;
        }
      }
      if (fullRetryCount == 3) {
        log?.e("Tried to downloaded full asset patch for 3 times and failed", tag: _kTag);
      } else {
        log?.i("Patch download succeeded", tag: _kTag);
      }
    } catch (e, s) {
      log?.e(e, stackTrace: s, tag: _kTag);
    } finally {
      // All routes lead here. Isolate will always exit regardless of success or failure.
      Isolate.exit(data.sendport, "done");
    }
  }

  ///  This function tries to redownload the list of files that failed to be downloaded in downloadUpdatedFiles.
  ///  There will be an exponential backoff retry of 200ms, 400ms and 800ms.
  ///  We then do not retry if there are more failed files.
  ///  We will just then rely download on the fly (Either through R.img or CachedNetworkImage) should the user require it.
  ///  Returns a list of files that failed even after retrying.
  @visibleForTesting
  Future<List<String>> redownload(
      {required ManifestModel manifests, required List<String> filesToRetry, required String domainUrl}) async {
    int exponentialBackoffMs = 0;
    List<String> retryList = filesToRetry;

    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(milliseconds: exponentialBackoffMs));

      final assetDirPath = await bundle.otaProviders!.getAssetDirPath(manifests.headManifest.version);
      final downloadFutures = retryList.map((fileKey) {
        return bundle.otaProviders!.downloadFile(url: p.join(domainUrl, fileKey)).then((value) async {
          if (value.isNotEmpty) {
            final file = await File(p.join(assetDirPath, fileKey)).create(recursive: true);
            await file.writeAsBytes(value);
            return file;
          }
        });
      });
      await Future.wait(downloadFutures);
      // Construct a reduced version of the file check so that we only need
      // to verify the subset of files downloaded here.
      final reducedManifest = Manifest();
      reducedManifest.version = manifests.headManifest.version;
      for (final fileKey in retryList) {
        // Should never be null
        if (manifests.headManifest.files[fileKey] != null) {
          reducedManifest.files[fileKey] = manifests.headManifest.files[fileKey]!;
        }
      }
      // Verify assets that have been downloaded in this iteration.
      final assetIntegrity = await verifyOtaAssetIntegrity(manifest: reducedManifest);

      final isPartiallyOrFullyVerified = assetIntegrity.key;
      if (isPartiallyOrFullyVerified) {
        if (assetIntegrity.value.isEmpty) {
          /// OTA assets are downloaded and verified.
          return [];
        }
        // Try to download files that have failed to downloaded in this iteration.
        filesToRetry = assetIntegrity.value;
      }
      // Increase exponential backoff.
      exponentialBackoffMs = exponentialBackoffMs == 0 ? 200 : exponentialBackoffMs * 2;
    }
    return filesToRetry;
  }

  /// This function verifies the integrity of OTA assets and returns a list of assets
  /// that fails the integrity check.
  /// Returns a MapEntry:
  /// A boolean key that signifies if assets are partially/fully verified. False means none of the assets are verified,
  /// trigger redownload of updated asset. True means that it is partially verified. Check value.
  ///
  /// The value is a list of asset keys that have not been verified. An empty list means ota assets are fully verified.
  @visibleForTesting
  Future<MapEntry<bool, List<String>>> verifyOtaAssetIntegrity({required Manifest manifest}) async {
    final otaAssetPath = await bundle.otaProviders!.getAssetDirPath(manifest.version);
    final assetDirectory = Directory(otaAssetPath);

    /// We can assume that as long as this directory exists, one of the files have already been written in.
    /// Whether it is the correct file or not is a different problem.
    if (!assetDirectory.existsSync()) {
      log?.e("$otaAssetPath does not exist during integrity verification for manifest version ${manifest.version}",
          tag: _kTag);
      return const MapEntry(false, []);
    }

    final List<String> filesToRedownload = [];

    final List<Future<void>> integrityVerificationFutures = [];

    manifest.files.forEach(
      (filePath, metadata) {
        Future<void> verify() async {
          final file = File(p.join(otaAssetPath, filePath));
          final integrous = await verifyFileIntegrity(file, metadata);
          if (!integrous) {
            filesToRedownload.add(filePath);
          }
        }

        integrityVerificationFutures.add(verify());
      },
    );

    await Future.wait(integrityVerificationFutures);

    return MapEntry(true, filesToRedownload);
  }

  /// Verifies integrity of a single file by:
  /// 1) Existence
  /// 2) Size
  /// 3) MD5 checksum
  @visibleForTesting
  Future<bool> verifyFileIntegrity(File file, FileMeta metadata) async {
    if (!(await file.exists())) {
      return false;
    }
    final fileSize = await file.length();
    if (fileSize != metadata.size) {
      return false;
    }
    try {
      final stream = file.openRead();
      final hash = await md5.bind(stream).first;
      return hash.toString() == metadata.md5;
    } catch (e, s) {
      log?.e(e.toString(), stackTrace: s, tag: _kTag);
      return false;
    }
  }

  /// Download a zip file containing new/modified assets from base version to head version.
  /// This function also unzips it and saves it to the relevant folders.
  /// Integrity check is not done here.
  @visibleForTesting
  Future<void> downloadUpdatedFiles({required ManifestModel manifests, required String domainUrl}) async {
    final otaAssetDirPath = await bundle.otaProviders!.getAssetDirPath(manifests.headManifest.version);
    final url = p.join(domainUrl, "patch", "${manifests.headManifest.version}-${manifests.baseManifest.version}.zip");
    try {
      final zipBytes = await bundle.otaProviders!.downloadFile(url: url);
      final archive = ZipDecoder().decodeBytes(zipBytes);
      final List<Future<void>> fileCreationFutures = [];
      for (final file in archive.files) {
        final filename = file.name;

        /// `file.isFile` doesnt work for some reason.
        final isFile = !file.name.endsWith("/");
        final filePath = p.join(otaAssetDirPath, filename);
        if (isFile) {
          final data = file.content as List<int>;
          final createdFileFuture = File(filePath).create(recursive: true).then((value) => value.writeAsBytes(data));
          fileCreationFutures.add(createdFileFuture);
        } else {
          // fileCreationFutures.add(Directory(filePath).create(recursive: true));
        }
      }
      await Future.wait(fileCreationFutures);
      log?.i(
          "Patch ${manifests.headManifest.version}-${manifests.baseManifest.version}.zip finished downloading and saved to disk",
          tag: _kTag);
    } catch (e, s) {
      log?.e(e.toString(), stackTrace: s, tag: _kTag);
    }
  }

  /// Version comparator
  /// Returns:
  /// 0 if version number is the same
  /// 1 if head version is higher than base, therefore needing update.
  /// -1 if head version is lower than base. Should never happen. Error.
  @visibleForTesting
  int versionComparator(String headVersion) {
    final localAssetVersion =
        _preferences?.getString(kAssetManifestVersionKey) ?? bundle.assetMetaManifest?.version ?? "0";
    // If head asset version more than or equal manfifest version, need check for update.
    final comparator = headVersion.compareTo(localAssetVersion);
    if (comparator == -1) {
      log?.e("local asset version ($localAssetVersion) is higher than head asset version ($headVersion)", tag: _kTag);
    }
    return comparator;
  }
}
