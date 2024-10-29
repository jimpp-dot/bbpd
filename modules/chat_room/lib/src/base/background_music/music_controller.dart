import 'dart:io';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../ktv/utils/progress_provider.dart';
import '../../ktv/widget/ktv_download_song_dialog.dart';
import '../model/music_bean.dart';
import 'model/music_model.dart';
import 'room_background_music_screen.dart';

RtcEngine? get _engine => ChatRoomData.getInstance()?.rtcController.engine;

class MusicController {
  static const String tag = 'MusicController';

  /// 是否退出播放 （start/stop）
  static bool isRelease = true;

  /// 是否处于播放状态 (play/pause)
  static bool _isPlaying = false;

  /// 音频音量
  static int _volume = 50;

  /// 当前播放音频文件数据
  static Music? _data;

  static List<Music> _musicDatas = [];
  static int _playIndex = 0;
  static final _random = Random();
  static MusicPlayType _playType = MusicPlayType.Cycle;
  static final GlobalKey<RoomBackgroundMusicScreenState> _keyMusicScreen =
      GlobalKey();

  static void destroy() {
    isRelease = true;
    _isPlaying = false;
    _data = null;
  }

  static void playNextMusic({bool auto = false}) {
    int nextIndex = 0;

    /// 单曲循环时，播放完毕时继续播放本首
    if (MusicPlayType.Single == _playType && auto) {
      nextIndex = _playIndex;
    } else {
      if (MusicPlayType.Cycle == _playType ||
          MusicPlayType.Single == _playType) {
        // 循环播放/单首循环播放下，下一首顺序到下一首
        nextIndex = _playIndex + 1;
        if (nextIndex >= _musicDatas.length) {
          nextIndex = 0;
        }
      } else {
        // 随机播放
        nextIndex = _random.nextInt(_musicDatas.length);
      }
    }

    Log.d(
        tag: tag,
        'playNextMusic, _playType: $_playType, _playIndex: $_playIndex, nextIndex: $nextIndex');
    _playIndex = nextIndex;
    startPlayMusic(_musicDatas[_playIndex]);
  }

  static void playPreMusic() {
    int nextIndex = 0;
    if (_playType == MusicPlayType.Cycle || _playType == MusicPlayType.Single) {
      // 循环播放/单首循环播放下，上一首顺序到上一首
      nextIndex = _playIndex - 1;
      if (nextIndex < 0) {
        nextIndex = _musicDatas.length - 1;
      }
    } else {
      // 随机播放
      nextIndex = _random.nextInt(_musicDatas.length);
    }

    Log.d(
        tag: tag,
        'playNextMusic, _playType: $_playType, _playIndex: $_playIndex, nextIndex: $nextIndex');
    _playIndex = nextIndex;
    startPlayMusic(_musicDatas[_playIndex]);
  }

  static void startPlayMusic(Music music, {int? index}) {
    _data = music.copy();
    if (index != null) {
      _playIndex = index;
    }
    if (music.isZegoMusic) {
      _onPlayZegoMusic(music);
    } else {
      _onPlay(music.id);
    }
  }

  static _onPlayZegoMusic(Music music) async {
    bool success = false;
    bool hasPreload = await _engine?.isMusicPreloaded(music.musicId) ?? false;
    if (hasPreload == false) {
      var dialog = KtvDownloadSongDialog(providerBuilder:
          (ProgressCallBack onProgressChanged, CompleteCallBack onCompleted) {
        return ZegoMusicProgressProvider(music.musicId,
            ChatRoomData.getInstance()!, onProgressChanged, onCompleted);
      });
      success = (await dialog.show(System.context)) ?? false;
    } else {
      success = true;
    }

    if (success) {
      ZegoMusicResource? requestResult =
          await _engine?.requestResource(music.musicId);
      if (requestResult != null && requestResult.resources.isNotEmpty) {
        String resourceId = requestResult.resources[0].resource_id;
        await _engine?.stopAudioMixing();
        await _engine?.startAudioMixing("", false, false,
            resourceID: resourceId);
        Tracker.instance.track(TrackEvent.play_room_bg_music);
      }
      await _engine?.adjustAudioMixingVolume(_volume);

      _engine?.setAudioTrackIndex(1);

      _isPlaying = true;
      isRelease = false;
      // 更新时长/播放列表UI
      if (_keyMusicScreen.currentState != null) {
        _keyMusicScreen.currentState!.refreshUi();
      }
    } else {
      _isPlaying = false;
      isRelease = true;
      Fluttertoast.showToast(msg: K.room_invalid_cant_play);
    }
  }

  /// 播放本地文件
  static _onPlay(int id) async {
    Log.d(tag: tag, '_onPlay, id: $id');
    List<Map<String, dynamic>> res = await LocalStorage.db
            ?.rawQuery("select * from $musicTable where id = $id") ??
        [];
    if (res.isNotEmpty) {
      String oldPath = res[0]['path'];
      String newPath;
      if (Platform.isIOS && oldPath.contains('music')) {
        // IOS绝对路径，需要转换
        newPath =
            join(Constant.documentsDirectory.path, "music", basename(oldPath));
      } else {
        newPath = oldPath;
      }

      File file = File(newPath);
      if (await file.exists()) {
        Log.d(tag: tag, '_onPlay, path: ${file.path}');

        /// 混音设置
        /// filePath:混音文件路径
        /// loopback:文件音频流是否发送给对端；如果设置为 true，文件音频流仅在本地可以听见，不会发送到对端
        /// replace:是否替换麦克风采集的音频
        /// cycle:-1无限循环播放混音文件；设置为正整数表示混音文件播放的次数

        // 在这里我们每次都设置为1，因为：在切换播放模式时，Agora并未提供单独的接口设置cycle，
        // 每次都设置为播放1次，手动切换上下首/播放完毕后根据模式切换到对应的歌曲播放。
        await _engine?.startAudioMixing(file.path, false, false);
        await _engine?.adjustAudioMixingVolume(MusicController.volumn);

        /// 上报背景音乐播放次数
        Tracker.instance.track(TrackEvent.play_room_bg_music);

        _isPlaying = true;
        isRelease = false;

        // 更新时长/播放列表UI
        if (_keyMusicScreen.currentState != null) {
          _keyMusicScreen.currentState!.refreshUi();
        }
        return;
      } else {
        _isPlaying = false;
        isRelease = true;
        Fluttertoast.showToast(msg: K.room_music_file_not_exits);
      }
    } else {
      _isPlaying = false;
      isRelease = true;
      Fluttertoast.showToast(msg: K.room_invalid_cant_play);
    }
  }

  static stopPlay() async {
    if (false == isRelease) {
      isRelease = true;
      await _engine?.stopAudioMixing();
      setIsPlaying(false);
    }
  }

  static setIsPlaying(bool value) {
    _isPlaying = value;
  }

  static bool get isPlaying {
    return _isPlaying;
  }

  static Music? get data {
    return _data;
  }

  static List<Music> get musicDatas {
    return _musicDatas;
  }

  static set musicDatas(datas) {
    _musicDatas = datas;
  }

  static GlobalKey<RoomBackgroundMusicScreenState> get keyMusicScreen {
    return _keyMusicScreen;
  }

  static int get volumn {
    return _volume;
  }

  static set volumn(int value) {
    _volume = value;
  }

  static int get playIndex {
    return _playIndex;
  }

  static set playIndex(int index) {
    _playIndex = index;
  }

  static MusicPlayType get playType {
    return _playType;
  }

  static set playType(MusicPlayType type) {
    _playType = type;
  }
}
