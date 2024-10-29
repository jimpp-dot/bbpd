import 'dart:typed_data';

import 'beans.dart';
import 'enums.dart';

typedef ConnectionStateCallback = void Function(
    ConnectionStateType state, ConnectionChangedReason reason);

typedef WarningCallback = void Function(WarningCode warn);

typedef ErrorCallback = void Function(ErrorCode err);

typedef AudioVolumeCallback = void Function(
    List<AudioVolumeInfo> speakers, int totalVolume);

typedef AudioMixingStateCallback = void Function(
    AudioMixingStateCode state, AudioMixingReason reason);

typedef UidWithElapsedCallback = void Function(int uid, int elapsed);

typedef UserOfflineCallback = void Function(int uid, UserOfflineReason reason);

typedef VideoFrameWithUidCallback = void Function(
    int uid, int width, int height, int elapsed);

typedef AudioRouteCallback = void Function(AudioOutputRouting routing);

typedef LocalAudioStateChangeCallback = void Function(
    AudioLocalError error, AudioLocalState state);

typedef CapturedDataRecordStateUpdate = void Function(RecordState state, int errorCode, RecordConfig config);

/// 目前 dataLength后面的参数只测试了Zego.
typedef CapturedAudioFrameCallback = void Function(Uint8List samples, {int? dataLength, int? sampleRate, int? channels});

typedef AMEListener = void Function(Map arguments);

typedef RemoteRobotListener = void Function(Map arguments);

typedef PlayerRecvSEICallback = Function(String streamID, Uint8List data);

typedef AgoraMusicLyricCallback = void Function(String requestId, String lyricUrl);

typedef AgoraMusicPreloadCallback = void Function(int songCode, int percent, PreloadStatusCode status,
    String msg, String lyricUrl);

/// userID == "" 代表本地用户（我）的网络质量
/// 目前只实现了Zego
typedef NetworkQualityCallback = void Function(
    String userID, StreamQualityLevel upstreamQuality, StreamQualityLevel downstreamQuality);

typedef ZegoMusicDownloadProgress = Function(String songId, double percent);
