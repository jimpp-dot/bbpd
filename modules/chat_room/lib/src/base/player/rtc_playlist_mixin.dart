import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/music_bean.dart';
import 'package:chat_room/src/base/player/rtc_music_player.dart';
import 'package:chat_room/src/music/music_config.dart';

class MusicModel {
  int id;
  String path;

  MusicModel({
    required this.id,
    required this.path,
  });

  @override
  String toString() {
    return 'MusicModel{id: $id, path: $path}';
  }
}

/// 包含播放列表的数据
mixin RtcPlayList {
  MusicModel? _data;
  List<MusicModel> _playList = [];
  int _playIndex = 0;
  final _random = Random();
  MusicPlayType _playType = MusicPlayType.Cycle;

  RtcAudioPlayer player = RtcAudioPlayer.instance;

  void resetCurrentPlay() {
    _playIndex = 0;
    _data = null;
  }

  MusicModel? getNextMusic({bool? auto}) {
    if (Util.isCollectionEmpty(_playList)) {
      return null;
    }
    int nextIndex = 0;

    // 单曲循环时，播放完毕时继续播放本首
    if (_playType == MusicPlayType.Single && auto != null && auto) {
      nextIndex = _playIndex;
    } else {
      if (_playType == MusicPlayType.Cycle ||
          _playType == MusicPlayType.Single) {
        // 循环播放/单首循环播放下，下一首顺序到下一首
        nextIndex = _playIndex + 1;
        if (nextIndex >= _playList.length) {
          nextIndex = 0;
        }
      } else {
        // 随机播放
        nextIndex = _random.nextInt(_playList.length);
      }
    }

    Log.d(
        tag: TAG,
        'playNextMusic, _playType: $_playType, _playIndex: $_playIndex, nextIndex: $nextIndex');
    return _playList[nextIndex];
  }

  MusicModel getPreMusic() {
    int nextIndex = 0;
    if (_playType == MusicPlayType.Cycle || _playType == MusicPlayType.Single) {
      // 循环播放/单首循环播放下，上一首顺序到上一首
      nextIndex = _playIndex - 1;
      if (nextIndex < 0) {
        nextIndex = _playList.length - 1;
      }
    } else {
      // 随机播放
      nextIndex = _random.nextInt(_playList.length);
    }

    Log.d(
        tag: TAG,
        'playNextMusic, _playType: $_playType, _playIndex: $_playIndex, nextIndex: $nextIndex');

    return _playList[nextIndex];
  }

  /// 更新当前播放的索引
  void updateCurrentPlay(int index) {
    if (index >= 0 && index < _playList.length) {
      _data = _playList[index];
      _playIndex = index;
    }
  }

  void startPlayMusic(MusicModel model) {
    _data = model;
    _playIndex = _playList.indexOf(model);
    _onPlay(model);
  }

  _onPlay(MusicModel model) async {
    Log.d(tag: TAG, '_onPlay, id: $model');
    onPlay(model);
  }

  stopPlay() async {
    RtcAudioPlayer.instance.stopPlay();
  }

  MusicModel? get currentPlayData {
    return _data;
  }

  List<MusicModel> get playList {
    return _playList;
  }

  set playList(List<MusicModel> list) {
    _playList = list;
  }

  int get volume {
    return player.audioMixingVolume;
  }

  set volume(int value) {
    player.adjustAudioMixingVolume(value);
  }

  MusicPlayType get playType {
    return _playType;
  }

  set playType(MusicPlayType type) {
    _playType = type;
  }

  void onPlay(MusicModel model);
}
