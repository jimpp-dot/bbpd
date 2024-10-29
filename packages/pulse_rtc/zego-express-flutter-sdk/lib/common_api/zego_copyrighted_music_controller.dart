import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

import 'zego_engine.dart';

extension ZegoCopyrightedMusicController on ZegoEngine {
  void registerMusicListeners() {
    /// 歌曲下载进度
    ZegoExpressEngine.onDownloadProgressUpdate = (ZegoCopyrightedMusic copyrightedMusic, String resourceID, double progressRate) {
      rtcLog('onDownloadProgressUpdate, resourceID:$resourceID, progressRate:$progressRate');
      musicDownloadProgress?.call(resourceID, progressRate);
    };
  }

  void unregisterMusicListeners() {
    ZegoExpressEngine.onDownloadProgressUpdate = null;
  }
}

mixin ZegoResourceCache {
  /// resource 缓存
  final Map<String, ZegoMusicResource> _resources = {};

  String _getResourcesKey(String songID, int resourceType) => '${songID}_$resourceType';

  ZegoMusicResource? getResource(String songID, {int resourceType = 1}) {
    ZegoMusicResource? zegoMusicResource = _resources[_getResourcesKey(songID, resourceType)];
    if (zegoMusicResource != null && zegoMusicResource.isExpire == false) return zegoMusicResource;

    return null;
  }

  void saveResource(String songID, ZegoMusicResource zegoMusicResource, {int resourceType = 1}) {
    _resources[_getResourcesKey(songID, resourceType)] = zegoMusicResource;
  }

  void clearResource() {
    _resources.clear();
  }
}
