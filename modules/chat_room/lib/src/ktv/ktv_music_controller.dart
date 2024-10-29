import 'dart:io';
import 'dart:typed_data';

import 'package:rtc_audio_effects/rtc_audio_effects.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/kugou/kugou_repo.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/utils/ktv_lrc_util.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:chat_room/src/ktv/spectrum/song_record_helper.dart';
import 'package:chat_room/src/ktv/spectrum/song_spectrum_model.dart';
import 'package:chat_room/src/ktv/spectrum/song_spectrum_widget.dart';

import 'agora/agora_music_util.dart';
import 'model/export_model.dart';
import 'model/sound_type.dart';
import 'utils/song_download_util.dart';

class KtvMusicController {
  static int DEFAULT_VOLUME_ACCOMPANY = 50;
  static int DEFAULT_VOLUME_VOICE = 80;
  static int accompanyVolume = DEFAULT_VOLUME_ACCOMPANY;

  static RoomRtcController? get _rtcController =>
      ChatRoomData.getInstance()?.rtcController;

  static int voiceVolume = DEFAULT_VOLUME_VOICE;

  static bool _isPlaying = false; // 是否处于播放状态 (play/pause)

  static bool isPaused = false;

  static setIsPlaying(bool value) {
    _isPlaying = value;
    isPaused = !value;
  }

  static bool get isPlaying {
    if ((ChatRoomData.getInstance()?.config?.ktvInfo?.currentSong?.uid !=
            Session.uid) &&
        (!isChorus)) {
      // 非演唱者，用后台数据判断状态
      return KtvSingStatus.sing ==
          ChatRoomData.getInstance()?.config?.ktvInfo?.currentSong?.status;
    }
    return _isPlaying;
  }

  static int totalTime = 0;
  static KtvInfo? _ktvInfo;

  static void init() {
    ChatRoomData.getInstance()
        ?.addListener(RoomConstant.Event_Ktv_Info, onKtvInfo);
  }

  static SoundType currentSoundType = SoundType.accompany;

  /// 切换原声伴奏
  static void switchSoundType() async {
    if (!ChatRoomData.exists()) return;
    SoundType soundType = SoundType.accompany;
    if (currentSoundType == SoundType.accompany) {
      soundType = SoundType.voice;
    } else if (currentSoundType == SoundType.voice) {
      soundType = SoundType.accompany;
    }

    /// 切伴奏
    var resp = await KtvRepo.setBacktrack(
        Session.uid, ChatRoomData.getInstance()!.rid, soundType);
    if (resp.success == true) {
      if ([SongPlatform.AGORA, SongPlatform.KUGOU]
          .contains(ktvCurrentSong?.platform)) {
        int trackIndex = (soundType == SoundType.accompany) ? 1 : 0;
        Log.d('setAudioTrackIndex:$trackIndex');
        await _rtcController?.setAudioTrackIndex(trackIndex);
        currentSoundType = soundType;
      } else if (SongPlatform.ZEGO_V2 == ktvCurrentSong?.platform) {
        int trackIndex = soundType == SoundType.accompany ? 0 : 1;
        await _rtcController?.setAudioTrackIndex(trackIndex);
        currentSoundType = soundType;
      }
      Log.d('switchSoundType success');
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  static bool get singStatus =>
      _ktvInfo?.currentSong?.status == KtvSingStatus.sing ||
      _ktvInfo?.currentSong?.status == KtvSingStatus.pause;

  static String lastFilePath = '';
  static String lastMusicId = '';
  static final playerLock = Lock();

  static Future toReadyPlayMusic() async {
    if (ktvCurrentSong == null) return;

    if (SongPlatform.AGORA == ktvCurrentSong!.platform) {
      await _startPlayAgoraMusic();
      return;
    }

    if (SongPlatform.ZEGO_V2 == ktvCurrentSong!.platform) {
      await _startPlayZegoV2Music();
      return;
    }

    Log.d('startPlayMusic, pid: ${ktvCurrentSong?.pid}');
    int pid = ktvCurrentSong!.pid;
    String? filePath;
    if (ktvCurrentSong!.platform == SongPlatform.AME) {
      if (_rtcController?.engine == null) {
        Log.d('startPlayMusic, engine is null');
        return;
      }

      if (!Util.validStr(ktvCurrentSong?.musicId)) {
        Log.d('startPlayMusic, musicId is null');
        return;
      }
      filePath = await _rtcController?.engine?.genAMEMusicURI(
          ktvCurrentSong!.musicId,
          currentSoundType == SoundType.voice
              ? AMEMusicInterface.musicTypeOrigin
              : AMEMusicInterface.musicTypeAccompany);
    } else {
      filePath = await SongDownloadUtil.getSongFilePath(pid, currentSoundType);
      Log.d(
          'ktv startPlayMusic soundType=$currentSoundType,filePath=$filePath sid = $pid');
      if (Util.isStringEmpty(filePath, trim: true) &&
          currentSoundType == SoundType.accompany) {
        Log.d('ktv startPlayMusic no accompany,use voice to play');
        filePath = await SongDownloadUtil.getSongFilePath(pid, SoundType.voice);
      }
      if (Util.isStringEmpty(filePath, trim: true)) {
        Log.d('ktv startPlayMusic filePath is Empty,can not play any');
        return;
      }
    }

    await playerLock.synchronized(() async {
      // File file = File(filePath);
      bool exist;
      if (ktvCurrentSong?.platform == SongPlatform.AME) {
        if (Util.validStr(filePath)) {
          exist = true;
        } else {
          exist = false;
        }
      } else {
        File file = File(filePath!);
        exist = await file.exists();
      }
      Log.d('startPlayMusic, file exist: $exist');
      if (exist) {
        if (lastFilePath != filePath) {
          Log.d('_rtcController.startAudioMixing');
          await _rtcController?.startAudioMixing(filePath!, hasChorus, false, 1,
              startPos: _currentMixingPosition);
          lastFilePath = filePath!;
          KtvReporter.reportSingSong(
            ChatRoomData.getInstance()?.rid ?? 0,
            currentSongId,
            currentSongName,
            ChatRoomData.getInstance()?.config?.originalRFT ?? '',
            ktvCurrentSong!.platform,
          );
        } else {
          Log.d('_rtcController.resumeAudioMixing');
          await _rtcController?.resumeAudioMixing();
          await _rtcController?.setAudioMixingPosition(_currentMixingPosition);
        }
        await _rtcController?.adjustAudioMixingVolume(accompanyVolume);
        ChatRoomData? room = ChatRoomData.getInstance();
        if (room != null && !room.mute) {
          // 当前为关麦状态不设置人声
          await _rtcController?.adjustRecordingSignalVolume(voiceVolume);
        }

        // 打开混响，模式设置为KTV
        await _rtcController
            ?.setAudioEffectPreset(AudioEffectPreset.RoomAcousticsKTV);
        setIsPlaying(true);

        int count = await _rtcController?.audioTrackCount() ?? 0;

        if (count > 1) {
          _rtcController?.setAudioTrackIndex(0);
        }

        Log.d(
            tag: 'KtvMusicController',
            'song name = ${ktvCurrentSong?.sname} count = $count');
      }
    });
  }

  static Future _startPlayAgoraMusic() async {
    if (ktvCurrentSong == null) return;
    await playerLock.synchronized(() async {
      ChatRoomData? room = ChatRoomData.getInstance();
      if (lastMusicId != ktvCurrentSong!.musicId) {
        await startPlayMusic();
        lastMusicId = ktvCurrentSong!.musicId;
      } else {
        await resumePlayMusic();
      }

      await _rtcController?.adjustAudioMixingVolume(accompanyVolume);

      // 当前为关麦状态不设置人声
      if (room != null && !room.mute) {
        await _rtcController?.adjustRecordingSignalVolume(voiceVolume);
      }

      // 打开混响，模式设置为KTV
      await _rtcController
          ?.setAudioEffectPreset(AudioEffectPreset.RoomAcousticsKTV);

      await _rtcController
          ?.setAudioTrackIndex(currentSoundType == SoundType.accompany ? 1 : 0);
    });
  }

  static Future _startPlayZegoV2Music() async {
    Log.d('_startPlayZegoV2Music, musicId: ${ktvCurrentSong?.musicId}');

    if (ktvCurrentSong == null) return;

    if (ktvCurrentSong!.musicId.isEmpty) {
      Log.w(
          tag: 'KtvMusicController',
          '_startPlayZegoV2Music error musicId is empty');
      return;
    }

    await playerLock.synchronized(() async {
      ChatRoomData? room = ChatRoomData.getInstance();

      if (lastMusicId != ktvCurrentSong!.musicId) {
        ZegoMusicResource? requestResult = await _rtcController?.engine
            ?.requestResource(ktvCurrentSong!.musicId);
        if (requestResult != null && requestResult.resources.isNotEmpty) {
          String resourceId = requestResult.resources[0].resource_id;
          await _rtcController?.stopAudioMixing();
          await _rtcController?.startAudioMixing("", false, false, 1,
              startPos: _currentMixingPosition, resourceID: resourceId);
          lastMusicId = ktvCurrentSong!.musicId;
        }
      } else {
        await _rtcController?.resumeAudioMixing();
        await _rtcController?.setAudioMixingPosition(_currentMixingPosition);
      }

      await _rtcController?.adjustAudioMixingVolume(accompanyVolume);

      // 当前为关麦状态不设置人声
      if (room != null && !room.mute) {
        await _rtcController?.adjustRecordingSignalVolume(voiceVolume);
      }

      // 打开混响，模式设置为KTV
      await _rtcController
          ?.setAudioEffectPreset(AudioEffectPreset.RoomAcousticsKTV);

      setIsPlaying(true);

      _rtcController
          ?.setAudioTrackIndex(currentSoundType == SoundType.accompany ? 0 : 1);
    });
  }

  static Future<void> startPlayMusic() async {
    Log.d('KtvMusicController startPlayMusic');
    _registerRTCListener();
    _initBaseEffectSpectrum();
    await _rtcController?.stopAudioMixing();
    await _rtcController?.startAudioMixing("", false, false, 1,
        startPos: 0, resourceID: ktvCurrentSong!.musicId);
    setIsPlaying(true);
    _currentMixingPosition = 0;
  }

  static Future<void> stopPlayMusic() async {
    Log.d('KtvMusicController stopPlayMusic');
    await _rtcController?.stopAudioMixing();
    // 关闭混响
    await _rtcController
        ?.setAudioEffectPreset(AudioEffectPreset.AudioEffectOff);
    // 关闭耳返
    // await _rtcEngine.enableInEarMonitoring(false);

    _isPlaying = false;
    lastFilePath = '';
    lastMusicId = '';
  }

  static Future<void> pausePlayMusic() async {
    Log.d('KtvMusicController pausePlayMusic');
    if (!_isPlaying) return;
    setIsPlaying(false);
    spectrumController?.pause();
    await _rtcController?.pauseAudioMixing();
    if (_initMidiMark) {
      await BaseEffectApi.inst.pause();
    }
  }

  static Future<void> resumePlayMusic() async {
    Log.d('KtvMusicController resumePlayMusic');
    if (_isPlaying) return;
    setIsPlaying(true);
    int mixingPosition = _currentMixingPosition;
    spectrumController?.start(start: Duration(milliseconds: mixingPosition));
    await _rtcController?.resumeAudioMixing();
    await _rtcController?.setAudioMixingPosition(mixingPosition);
    if (_initMidiMark) {
      await BaseEffectApi.inst.resume();
      await BaseEffectApi.inst.setAudioMixingPosition(mixingPosition);
    }
    _currentMixingPosition = mixingPosition;
  }

  static int currentSongId = 0;

  static int currentSingerUid = 0;

  static String currentSongName = '';

  static KtvCurrentSong? ktvCurrentSong;

  /// only for 音速达上报
  static int _currentMixingPositionForReport = 0;

  static int _currentMixingPosition = 0;

  static int get currentMixingPosition => _currentMixingPosition;

  static set currentMixingPosition(int? positionInMilliSecs) {
    _currentMixingPosition = positionInMilliSecs ?? 0;
    if (_currentMixingPosition > totalTime) {
      _currentMixingPosition = totalTime;
    }

    if (_currentMixingPosition < 0) {
      _currentMixingPosition = 0;
    }

    if (positionInMilliSecs != null && positionInMilliSecs > 0) {
      _currentMixingPositionForReport = positionInMilliSecs;
      if (_currentMixingPositionForReport > totalTime) {
        _currentMixingPositionForReport = totalTime;
      }
    }
  }

  static Future<void> dispose() async {
    Log.d('KtvMusicController dispose, current musicId: $lastMusicId');
    _currentMixingPosition = 0;
    currentSoundType = SoundType.accompany;
    currentSongId = 0;
    currentSingerUid = 0;
    totalTime = 0;
    lastFilePath = '';
    lastMusicId = '';
    if (_rtcController?.initialized ?? false) {
      await _rtcController?.stopAudioMixing();
      _unregisterRTCListener();
    }
    _isPlaying = false;
    isPaused = false;
    _releaseSpectrum();
  }

  static void release() {
    ChatRoomData.getInstance()
        ?.removeListener(RoomConstant.Event_Ktv_Info, onKtvInfo);
  }

  static const int maxDelta = 1000;

  /// 根据房间推送消息调整歌曲和歌词的播放，有三种可能产生的结果：
  /// 1. 自己是当前的歌手，并且不是暂停状态，开始播放歌曲
  /// 2. 是暂停状态，停止播放歌曲
  /// 3. 自己不是当前的歌手，而且歌词进度跟服务端有较大偏差，则调整本地歌词进度
  static Future<void> _reloadData() async {
    if (ChatRoomData.getInstance()?.config == null ||
        ChatRoomData.getInstance()?.config?.ktvInfo == null) {
      return;
    }

    KtvInfo ktvInfo = ChatRoomData.getInstance()!.config!.ktvInfo!;
    if (ktvInfo.currentSong == null) {
      return;
    }

    if (ktvInfo.currentSong!.status == KtvSingStatus.start ||
        ktvInfo.currentSong!.status == KtvSingStatus.wait) {
      dispose();
      return;
    }

    //sing状态下避免websocket刷新消息过多触发太多重刷导致声音卡顿
    if (ktvInfo.currentSong!.status == KtvSingStatus.sing && isPlaying) {
      if (ktvInfo.currentSong!.sid == currentSongId &&
          ktvInfo.currentSong!.uid == currentSingerUid &&
          (ktvInfo.currentSong!.brcProgress - _currentMixingPosition).abs() <
              maxDelta &&
          ktvInfo.currentSong!.soundType == currentSoundType) {
        return;
      }
    }

    await _prepareToPlay(ktvInfo);
  }

  static Future _prepareToPlay(KtvInfo ktvInfo) async {
    currentSongId = ktvInfo.currentSong!.sid;
    currentSingerUid = ktvInfo.currentSong!.uid;
    currentSongName = ktvInfo.currentSong!.sname;
    ktvCurrentSong = ktvInfo.currentSong;
    currentSoundType = ktvInfo.currentSong!.soundType;
    totalTime = ktvInfo.currentSong!.playTime;

    bool isSinger = ktvInfo.currentSong!.uid == Session.uid;
    if (!isSinger && !isChorus) {
      currentMixingPosition = ktvInfo.currentSong!.brcProgress;
      await stopPlayMusic();
    } else {
      if (ktvInfo.currentSong!.status == KtvSingStatus.pause) {
        await pausePlayMusic();
      } else {
        await toReadyPlayMusic();
      }
    }
  }

  /// 响应房间内带ktvInfo的服务端推送消息
  static onKtvInfo(String type, Object? data) async {
    if (data is! KtvInfo || ChatRoomData.exists() == false) return;

    KtvInfo ktvInfo = data;
    _tryReport(ktvInfo);
    ChatRoomData room = ChatRoomData.getInstance()!;
    Log.d('KtvMusicController onKtvInfo: ${ktvInfo.currentSong?.toString()}');

    _ktvInfo = ktvInfo;
    _chorusUid = _ktvInfo?.chorus?.uid ?? 0;
    room.leadSingerRtcStreamId = _ktvInfo?.currentSong?.rtcStreamID ?? '';
    room.chorusRtcStreamIds = [_ktvInfo?.chorus?.rtcStreamID ?? ''];
    KuGouRepo.initConfig(ktvInfo.appKey ?? '', ktvInfo.pid ?? '');
    await setKtvRoleToRtc();
    await _reloadData();
  }

  static _tryReport(KtvInfo newKtvInfo) {
    if (_ktvInfo == null ||
        _ktvInfo?.currentSong?.platform != SongPlatform.KUGOU ||
        _ktvInfo?.currentSong?.needReport == false) {
      return;
    }

    if (_ktvInfo!.currentSong?.uid == Session.uid) {
      int lastSongId = _ktvInfo!.currentSong?.sid ?? 0;
      int currentSongId = newKtvInfo.currentSong?.sid ?? 0;

      if (lastSongId > 0 && lastSongId != currentSongId) {
        KuGouRepo.report(
            lastSongId,
            _ktvInfo!.currentSong!.playTime,
            _currentMixingPositionForReport,
            '${_ktvInfo!.currentSong!.platformRankId}');
      }
    }
  }

  static KtvClientRole _ktvRole = KtvClientRole.None;
  static int _chorusUid = 0;

  static setKtvRoleToRtc() async {
    KtvClientRole oldKtvRole = _ktvRole;
    if ((_ktvInfo?.currentSong?.uid ?? 0) == 0 || !hasChorus) {
      _ktvRole = KtvClientRole.None;
    } else {
      if (_ktvInfo?.currentSong?.uid == Session.uid) {
        _ktvRole = KtvClientRole.LeadSinger;
      } else if (isChorus) {
        _ktvRole = KtvClientRole.Chorus;
      } else {
        _ktvRole = KtvClientRole.Audience;
      }
    }

    if (oldKtvRole == KtvClientRole.Chorus &&
        _ktvRole != KtvClientRole.Chorus) {
      await dispose();
    }

    if (_rtcController != null &&
        _rtcController?.engine != null &&
        _rtcController?.initialized == true) {
      await _rtcController?.setKtvRole(_ktvRole);
    }
  }

  static bool get hasChorus {
    return _chorusUid > 0;
  }

  static bool get isChorus {
    return Session.uid == _chorusUid;
  }

  static int getChorusUid() {
    return _chorusUid;
  }

  static bool get isSinger {
    return _ktvInfo?.currentSong?.uid == Session.uid;
  }

  static bool get isAgoraPlatform =>
      SongPlatform.AGORA == ktvCurrentSong?.platform;

  static bool get canShowSpectrum => isSinger && spectrumModel != null;

  /// 是否注册已经注册RTC监听
  static bool _rtcListenerRegistered = false;

  /// 闭麦状态下填充静音数据
  static ExportMuteAudioDataMark? _muteAudioData;

  static bool _initSpectrum = false;

  /// 注册RTC监听
  static void _registerRTCListener() {
    if (_rtcListenerRegistered || _rtcController?.engine == null) return;
    _rtcListenerRegistered = true;
    _rtcController?.engine?.setAudioDataHandler(_audioDataHandler);
    _rtcController?.engine
        ?.addMixingStateChangedCallback(_audioMixingStateCallback);
  }

  /// 解除RTC监听
  static void _unregisterRTCListener() {
    _rtcController?.engine?.setAudioDataHandler(null);
    _rtcController?.engine
        ?.removeMixingStateChangedCallback(_audioMixingStateCallback);
    _rtcListenerRegistered = false;
  }

  /// RTC音频数据回调
  static void _audioDataHandler(Uint8List samples,
      {int? channels, int? dataLength, int? sampleRate}) {
    if (_initMidiMark &&
        _rtcListenerRegistered &&
        channels != null &&
        dataLength != null &&
        sampleRate != null) {
      // 预置静音数据
      _muteAudioData ??= ExportMuteAudioDataMark.detectSize(
        data: samples,
        sampleRate: sampleRate,
        channels: channels,
        samples: dataLength ~/ 2,
      );

      if (ChatRoomData.getInstance()?.mute != false) {
        // 房间静音时使用预置静音数据
        BaseEffectApi.inst.pushAudioDataMark(
          data: _muteAudioData!.data,
          sampleRate: _muteAudioData!.sampleRate,
          channels: _muteAudioData!.channels,
          samples: _muteAudioData!.samples,
        );
      } else {
        BaseEffectApi.inst.pushAudioDataMark(
          data: samples,
          sampleRate: sampleRate,
          channels: channels,
          samples: dataLength ~/ 2,
        );
      }
    }
  }

  static void _audioMixingStateCallback(
      AudioMixingStateCode state, AudioMixingReason reason) async {
    if (reason == AudioMixingReason.TooFrequentCall) {
      return;
    }
    if (state == AudioMixingStateCode.Playing) {
      _instanceSpectrumModel();
    }
  }

  /// 打分器模块是否已经初始化
  static bool _initMidiMark = false;

  /// 打分器控制器
  static SoundSpectrumController? spectrumController;

  static SpectrumModel? spectrumModel;

  static VoidCallback? onSpectrumLoaded;

  static final ValueNotifier<double> score = ValueNotifier(0);

  /// 初始化BaseEffectCore处理打分器
  static void _initBaseEffectSpectrum() async {
    if (!isSinger || _initMidiMark) return;
    _initMidiMark = true;
    var midiPath = AgoraMusicUtil.getMidiSrcPath(
        Util.parseInt(_ktvInfo?.currentSong!.musicId));
    BaseEffectApi.inst.createEffectCore();
    BaseEffectApi.inst.initialize(BaseEffectConstants.audioEffectCoreMark);
    BaseEffectApi.inst.setMidiFilePath(midiPath, 0);
    List<Lyric> lyricList = await KtvLrcUtil.prepareLyrics(_ktvInfo);
    var lyricsInfo = lyricList
        .mapIndexed((i, e) => LyricsInfo(
              beginTimeMs: e.startTime.inMilliseconds,
              endTimeMs: e.endTime.inMilliseconds,
              index: i,
            ))
        .toList();
    BaseEffectApi.inst.setLyricsInfo(lyricsInfo);
    BaseEffectApi.inst.setTolerance(0.1);
    BaseEffectApi.inst.start();
    BaseEffectApi.inst.setAudioMixingPosition(0);
    BaseEffectApi.onKMarkSliceScoreUpdate = _onKMarkSliceScoreUpdate;
  }

  /// 实例化打分器数据类
  static Future<void> _instanceSpectrumModel() async {
    if (!isAgoraPlatform || _initSpectrum || _ktvInfo?.currentSong == null)
      return;
    _initSpectrum = true;
    String musicId = _ktvInfo!.currentSong!.musicId;
    File midiFile = AgoraMusicUtil.getMidiFile(Util.parseInt(musicId));
    if (!await midiFile.exists()) {
      _initSpectrum = false;
      return;
    }
    var loadMidiSpectrum =
        await SongRecordHelper.loadBidi2Spectrum(midiFile.path);
    if (loadMidiSpectrum != null && loadMidiSpectrum.nodeList.isNotEmpty) {
      spectrumModel = SongRecordHelper.fillBlankSpectrum(
        loadMidiSpectrum,
        _ktvInfo!.currentSong!.playTime,
      );
      onSpectrumLoaded?.call();
    }
  }

  /// 分数同步器
  static void syncScore() async {
    if (isSinger && _initMidiMark) {
      int totalScore = await BaseEffectApi.inst.getKMarkResult();
      int curPos = await _rtcController?.getAudioMixingCurrentPosition() ?? 0;
      List<Lyric> lyricList = await KtvLrcUtil.prepareLyrics(_ktvInfo);
      int singCount = SongRecordHelper.getLyricSingCount(lyricList, 0, curPos);
      if (singCount > 0) {
        score.value = totalScore / singCount;
      }
    }
  }

  /// 分数更新
  static void _onKMarkSliceScoreUpdate(
      int beginPosMs, int endPosMs, double pitch, double score) async {
    if (spectrumModel != null && isPlaying) {
      double len = spectrumModel!.maxVal - spectrumModel!.minVal;
      if (len != 0) {
        double percent = (pitch - spectrumModel!.minVal) / len;
        if (percent > 1) {
          percent = 1;
        }
        if (percent < 0) {
          percent = 0;
        }
        spectrumController?.updateCurrentValue(
            beginPosMs, endPosMs, pitch, percent, score);
      }
    }
  }

  /// 释放打分器
  static void _releaseSpectrum() {
    if (_initMidiMark) {
      BaseEffectApi.onKMarkSliceScoreUpdate = null;
      BaseEffectApi.onKMarkSentenceScoreUpdate = null;
      BaseEffectApi.inst.stop();
      BaseEffectApi.inst.release();
      _initMidiMark = false;
    }
    _initSpectrum = false;
    spectrumModel = null;
    score.value = 0;
  }
}
