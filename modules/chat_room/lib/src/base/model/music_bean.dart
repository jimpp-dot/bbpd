import 'package:chat_room/assets.dart';

/// 播放模式
enum MusicPlayType {
  /// 循环播放
  Cycle,

  /// 随机播放
  Random,

  /// 单曲循环
  Single,
}

extension MusicPlayTypeExt on MusicPlayType {
  String getPlayAssetPath() {
    String playTypeAssetPath =
        RoomAssets.chat_room$music_music_paly_type_cycle_svg;
    if (this == MusicPlayType.Random) {
      playTypeAssetPath = RoomAssets.chat_room$music_music_play_type_random_svg;
    } else if (this == MusicPlayType.Single) {
      playTypeAssetPath = RoomAssets.chat_room$music_music_paly_type_single_svg;
    }
    return playTypeAssetPath;
  }
}
