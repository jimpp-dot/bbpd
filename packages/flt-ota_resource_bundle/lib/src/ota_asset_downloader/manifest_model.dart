import '../manifest.pb.dart';

class ManifestModel {
  final Manifest baseManifest;
  final Manifest headManifest;
  Manifest? _cachedDiffManifest;

  ManifestModel({required this.baseManifest, required this.headManifest});

  /// Returns a new manifest with:
  /// Version = head manifest version
  /// Files = {Head files} - {Base files} (comparator being md5 values)
  Manifest get diffedManifest {
    if (_cachedDiffManifest != null) {
      return _cachedDiffManifest!;
    }

    Set<String> headManifestMd5 = {};
    Set<String> baseManifestMd5 = {};
    Map<String, String> headManifestMd5FilenameMap = {};

    for (final entry in headManifest.files.entries) {
      headManifestMd5.add(entry.value.md5);
      headManifestMd5FilenameMap[entry.value.md5] = entry.key;
    }
    for (final entry in baseManifest.files.entries) {
      baseManifestMd5.add(entry.value.md5);
    }
    final diffedMd5 = headManifestMd5.difference(baseManifestMd5);

    final diffedManifest = Manifest();

    diffedManifest.version = headManifest.version;
    for (final md5 in diffedMd5) {
      assert(headManifestMd5FilenameMap[md5] != null);
      final fileName = headManifestMd5FilenameMap[md5]!;
      diffedManifest.files[fileName] = headManifest.files[fileName]!;
    }
    _cachedDiffManifest = diffedManifest;
    return _cachedDiffManifest!;
  }
}
