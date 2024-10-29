import 'package:commonrtc_api/commonrtc_api.dart';

/// rtc event
class RtcEngineEventHandler {

  final AudioVolumeCallback? audioVolumeCallback;
  final ConnectionStateCallback? connectionStateCallback;
  final ErrorCallback? errorCallback;
  final VideoFrameWithUidCallback? videoFrameWithUidCallback;
  final AudioMixingStateCallback? audioMixingStateCallback;
  final UidWithElapsedCallback? userJoinedCallback;
  final UserOfflineCallback? userOfflineCallback;
  final WarningCallback? warningCallback;
  final LocalAudioStateChangeCallback? localAudioStateChangeCallback;
  final AudioRouteCallback? audioRouteCallback;
  final CapturedDataRecordStateUpdate? capturedDataRecordStateUpdate;

  const RtcEngineEventHandler({
    this.audioVolumeCallback,
    this.connectionStateCallback,
    this.errorCallback,
    this.videoFrameWithUidCallback,
    this.audioMixingStateCallback,
    this.userJoinedCallback,
    this.userOfflineCallback,
    this.warningCallback,
    this.localAudioStateChangeCallback,
    this.audioRouteCallback,
    this.capturedDataRecordStateUpdate,
  });
}
