import 'dart:typed_data';

import 'package:commonrtc_api/commonrtc_api.dart';

import 'package:flutter/material.dart';

/// Rtc Proxy 类，目前主要是做保护/提示错误处理
///
class RtcEngineProxy implements RtcEngineInterface {
  final RtcEngineInterface _realEngine;

  RtcEngineProxy(this._realEngine);

  @override
  RtcBridge get bridge => _realEngine.bridge;

  @override
  set bridge(RtcBridge bridge) {
    _realEngine.bridge = bridge;
  }

  bool get _isEngineSafe {
    assert(isInitialize, 'Error ${_realEngine.getEnum()} not initialize,check you code.');
    return isInitialize;
  }

  @override
  Future<void> adjustAudioMixingVolume(int id, int volume) async {
    if (!_isEngineSafe) return;
    await _realEngine.adjustAudioMixingVolume(id, volume);
  }

  @override
  Future<void> adjustRecordingSignalVolume(int volume) async {
    if (!_isEngineSafe) return;
    await _realEngine.adjustRecordingSignalVolume(volume);
  }

  @override
  audioRouteCallback(AudioRouteCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.audioRouteCallback(callback);
  }

  @override
  Future<int> audioTrackCount() async {
    if (!_isEngineSafe) return 0;
    return await _realEngine.audioTrackCount();
  }

  @override
  audioVolumeIndicationCallback(AudioVolumeCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.audioVolumeIndicationCallback(callback);
  }

  @override
  captureDataRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    if (!_isEngineSafe) return;
    _realEngine.captureDataRecordStateCallback(callback);
  }

  @override
  connectionStateChangeCallback(ConnectionStateCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.connectionStateChangeCallback(callback);
  }

  @override
  Future<RtcMultiChannel?> createRtcChannel(String channel) async {
    if (!_isEngineSafe) return null;
    return await _realEngine.createRtcChannel(channel);
  }

  @override
  Widget createVideoRenderWidget(int uid, {bool local = false, int facing = 0, Map<String, dynamic> args = const <String, dynamic>{}}) {
    if (!_isEngineSafe) return const SizedBox.shrink();
    return _realEngine.createVideoRenderWidget(uid, local: local, facing: facing, args: args);
  }

  @override
  Future<void> muteLocalVideoStream(bool muted) async {
    await _realEngine.muteAllRemoteVideoStreams(muted);
  }

  @override
  Future<bool> setBeauty(bool enableBeauty) async {
    if (!_isEngineSafe) return false;
    return await _realEngine.setBeauty(enableBeauty);
  }

  @override
  Future<void> destroy() async {
    if (!_isEngineSafe) return;
    await _realEngine.destroy();
  }

  @override
  Future<void> destroyRtcChannel() async {
    if (!_isEngineSafe) return;
    await _realEngine.destroyRtcChannel();
  }

  @override
  Future<void> disableAudio() async {
    if (!_isEngineSafe) return;
    await _realEngine.disableAudio();
  }

  @override
  Future<void> disableVideo() async {
    if (!_isEngineSafe) return;
    await _realEngine.disableVideo();
  }

  @override
  Future<void> enableAudio() async {
    if (!_isEngineSafe) return;
    await _realEngine.enableAudio();
  }

  @override
  Future<void> enableAudioVolumeIndication(int interval, int smooth, bool reportVad) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableAudioVolumeIndication(interval, smooth, reportVad);
  }

  @override
  Future<void> enableInEarMonitoring(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableInEarMonitoring(enabled);
  }

  @override
  Future<void> enableLocalAudio(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableLocalAudio(enabled);
  }

  @override
  Future<void> enableVideo() async {
    if (!_isEngineSafe) return;
    await _realEngine.enableVideo();
  }

  @override
  Future<void> enableLocalVideo(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableLocalVideo(enabled);
  }

  @override
  Future<void> enableWebSdkInteroperability(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableWebSdkInteroperability(enabled);
  }

  @override
  errorCallback(ErrorCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.errorCallback(callback);
  }

  @override
  firstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.firstRemoteVideoFrameCallback(callback);
  }

  @override
  Future<int> getAudioMixingCurrentPosition(int id) async {
    if (!_isEngineSafe) return 0;
    return _realEngine.getAudioMixingCurrentPosition(id);
  }

  @override
  Future<int> getAudioMixingDuration(String path) async {
    if (!_isEngineSafe) return 0;
    return _realEngine.getAudioMixingDuration(path);
  }

  @override
  RtcEngineEnum getEnum() {
    return _realEngine.getEnum();
  }

  @override
  String getTag() {
    return _realEngine.getTag();
  }

  @override
  Future<void> initEngine(EngineConfig config) async {
    await _realEngine.initEngine(config);
  }

  @override
  bool get isInitialize => _realEngine.isInitialize;

  @override
  bool isMediaReplaySuccess(String destRid) {
    if (!_isEngineSafe) return false;
    return _realEngine.isMediaReplaySuccess(destRid);
  }

  @override
  Future<void> joinRoom(String token, String channelName, int optionalUid, {String? optionalInfo}) async {
    if (!_isEngineSafe) return;
    return await _realEngine.joinRoom(token, channelName, optionalUid, optionalInfo: optionalInfo);
  }

  @override
  Future<void> leaveChannel() async {
    if (!_isEngineSafe) return;
    return await _realEngine.leaveChannel();
  }

  @override
  Future<void> renewToken(String token) async {
    if (!_isEngineSafe) return;
    return _realEngine.renewToken(token);
  }

  @override
  localAudioStateCallback(LocalAudioStateChangeCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.localAudioStateCallback(callback);
  }

  @override
  mixingStateChangedCallback(AudioMixingStateCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.mixingStateChangedCallback(callback);
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteAllRemoteAudioStreams(muted);
  }

  @override
  Future<void> muteAllRemoteVideoStreams(bool muted) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteAllRemoteVideoStreams(muted);
  }

  @override
  Future<void> muteLocalAudioStream(bool muted) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteLocalAudioStream(muted);
  }

  @override
  Future<void> muteMicrophone(bool mute) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteMicrophone(mute);
  }

  @override
  Future<void> muteLocalMediaPlayer(bool mute) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteLocalMediaPlayer(mute);
  }

  @override
  Future<void> muteRoom(bool mute) async {
    if (!_isEngineSafe) return;
    return await _realEngine.muteRoom(mute);
  }

  @override
  Future<int> muteRemoteAudioStream(int uid, bool muted) async {
    if (!_isEngineSafe) return 0;
    return await _realEngine.muteRemoteAudioStream(uid, muted);
  }

  @override
  Future<void> pauseAudioMixing(int id) async {
    if (!_isEngineSafe) return;
    await _realEngine.pauseAudioMixing(id);
  }

  @override
  Future<void> playEffect(
      {int soundId = 0,
      required String filePath,
      int loopCount = 0,
      double pitch = 1,
      double pan = 0,
      double gain = 100,
      int publish = 1}) async {
    if (!_isEngineSafe) return;
    await _realEngine.playEffect(
        soundId: soundId.toUnsigned(32), filePath: filePath, loopCount: loopCount, pitch: pitch, pan: pan, gain: gain, publish: publish);
  }

  @override
  Future<void> registerAudioFrameObserver({int? uid, int? rid}) async {
    if (!_isEngineSafe) return;
    await _realEngine.registerAudioFrameObserver(uid: uid, rid: rid);
  }

  @override
  Future<void> resumeAudioMixing(int id) async {
    if (!_isEngineSafe) return;
    await _realEngine.resumeAudioMixing(id);
  }

  @override
  setAudioDataHandler(CapturedAudioFrameCallback? callback) {
    if (!_isEngineSafe) return;
    _realEngine.setAudioDataHandler(callback);
  }

  @override
  Future<void> setAudioEffectPreset(AudioEffectPreset preset) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioEffectPreset(preset);
  }

  @override
  Future<void> setAudioMixingPitch(int pitch) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioMixingPitch(pitch);
  }

  @override
  Future<void> setAudioMixingPosition(int id, int pos) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioMixingPosition(id, pos);
  }

  @override
  Future<void> setAudioProfile(AudioProfile profile, AudioScenario scenario) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioProfile(profile, scenario);
  }

  @override
  Future<void> setAudioTrackIndex(int index) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioTrackIndex(index);
  }

  @override
  Future<void> setAudioTrackMode(int index) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAudioTrackMode(index);
  }

  @override
  Future<void> setChannelProfile(ChannelProfile profile) async {
    if (!_isEngineSafe) return;
    await _realEngine.setChannelProfile(profile);
  }

  @override
  Future<void> setClientRole(ClientRole role) async {
    if (!_isEngineSafe) return;
    await _realEngine.setClientRole(role);
  }

  @override
  Future<void> setDefaultAudioRouteToSpeakerPhone(bool defaultToSpeaker) async {
    if (!_isEngineSafe) return;
    await _realEngine.setDefaultAudioRouteToSpeakerPhone(defaultToSpeaker);
  }

  @override
  Future<void> setEnableSpeakerphone(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.setEnableSpeakerphone(enabled);
  }

  @override
  Future<void> setInEarMonitoringVolume(int volume) async {
    if (!_isEngineSafe) return;
    await _realEngine.setInEarMonitoringVolume(volume);
  }

  @override
  Future<void> setParameters(String param) async {
    if (!_isEngineSafe) return;
    await _realEngine.setParameters(param);
  }

  @override
  Future<void> setRecordingAudioFrameParameters({int? sampleRate, int? channel, int? mode, int? samplesPerCall}) async {
    if (!_isEngineSafe) return;
    await _realEngine.setRecordingAudioFrameParameters(
        sampleRate: sampleRate, channel: channel, mode: mode, samplesPerCall: samplesPerCall);
  }

  @override
  Future<void> setVideoEncoderConfiguration(VideoEncoderConfiguration config) async {
    if (!_isEngineSafe) return;
    await _realEngine.setVideoEncoderConfiguration(config);
  }

  @override
  Future<void> setVoiceProfile({double? pitch, List<double>? equalization}) async {
    if (!_isEngineSafe) return;
    await _realEngine.setVoiceProfile(pitch: pitch, equalization: equalization);
  }

  @override
  Future<void> startAudioMixing(int id, String path, bool noPublish, bool noMixMic,
      {int cycle = 1, int startPos = 0, String? resourceID}) async {
    if (!_isEngineSafe) return;
    await _realEngine.startAudioMixing(id, path, noPublish, noMixMic, cycle: cycle, startPos: startPos, resourceID: resourceID);
  }

  @override
  Future<void> startChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    if (!_isEngineSafe) return;
    await _realEngine.startChannelMediaRelay(channelMediaRelayConfiguration);
  }

  @override
  Future<void> startPreview() async {
    if (!_isEngineSafe) return;
    await _realEngine.startPreview();
  }

  @override
  Future<void> startRecordingCapturedData(RecordConfig config) async {
    if (!_isEngineSafe) return;
    await _realEngine.startRecordingCapturedData(config);
  }

  @override
  Future<void> stopAllEffects() async {
    if (!_isEngineSafe) return;
    await _realEngine.stopAllEffects();
  }

  @override
  Future<void> stopAudioMixing(int id) async {
    if (!_isEngineSafe) return;
    await _realEngine.stopAudioMixing(id);
  }

  @override
  Future<void> stopChannelMediaRelay() async {
    if (!_isEngineSafe) return;
    await _realEngine.stopChannelMediaRelay();
  }

  @override
  Future<void> stopEffect(int soundId) async {
    if (!_isEngineSafe) return;
    await _realEngine.stopEffect(soundId.toUnsigned(32));
  }

  @override
  Future<void> stopPreview() async {
    if (!_isEngineSafe) return;
    await _realEngine.stopPreview();
  }

  @override
  Future<void> stopRecordingCapturedData() async {
    if (!_isEngineSafe) return;
    await _realEngine.stopRecordingCapturedData();
  }

  @override
  Future<void> switchCamera() async {
    if (!_isEngineSafe) return;
    await _realEngine.switchCamera();
  }

  @override
  Future<void> syncPullExtraStream(List<UserStream>? streamList) async {
    if (!_isEngineSafe) return;
    await _realEngine.syncPullExtraStream(streamList);
  }

  @override
  Future<void> unRegisterAudioFrameObserver() async {
    if (!_isEngineSafe) return;
    await _realEngine.unRegisterAudioFrameObserver();
  }

  @override
  userJoinedCallback(UidWithElapsedCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.userJoinedCallback(callback);
  }

  @override
  userOffline(UserOfflineCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.userOffline(callback);
  }

  @override
  warningCallback(WarningCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.warningCallback(callback);
  }

  @override
  Future<void> preloadEffect(int soundId, String filePath) async {
    if (!_isEngineSafe) return;
    return await _realEngine.preloadEffect(soundId.toUnsigned(32), filePath);
  }

  @override
  Future<void> setKtvRole(KtvClientRole role) async {
    if (!_isEngineSafe) return;
    await _realEngine.setKtvRole(role);
  }

  @override
  Future<void> unloadEffect(int soundId) async {
    if (!_isEngineSafe) return;
    await _realEngine.unloadEffect(soundId.toUnsigned(32));
  }

  @override
  Future<void> cancelPreloadAMEMusic(String musicId) async {
    if (!_isEngineSafe) return;
    await _realEngine.cancelPreloadAMEMusic(musicId);
  }

  @override
  Future<void> clearAMEMusicCache() async {
    if (!_isEngineSafe) return;
    await _realEngine.clearAMEMusicCache();
  }

  @override
  Future<void> destroyAME() async {
    if (!_isEngineSafe) return;
    await _realEngine.destroyAME();
  }

  @override
  Future<String> genAMEMusicURI(String musicId, int musicType) async {
    if (!_isEngineSafe) return '';
    return await _realEngine.genAMEMusicURI(musicId, musicType);
  }

  @override
  Future<void> initAME() async {
    if (!_isEngineSafe) return;
    await _realEngine.initAME();
  }

  @override
  Future<bool> isAMEMusicPreloaded(String musicId) async {
    if (!_isEngineSafe) return false;
    return await _realEngine.isAMEMusicPreloaded(musicId);
  }

  @override
  Future<void> preloadAMEMusic(String musicId, String playToken) async {
    if (!_isEngineSafe) return;
    await _realEngine.preloadAMEMusic(musicId, playToken);
  }

  @override
  Future<void> setAMEDownloadListener(AMEListener listener) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAMEDownloadListener(listener);
  }

  @override
  Future<void> setAMELicense(String licenseUrl, String key) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAMELicense(licenseUrl, key);
  }

  @override
  Future<void> setAMEMusicCacheMaxCount(int maxCount) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAMEMusicCacheMaxCount(maxCount);
  }

  @override
  Future<void> enableDualStreamMode(bool enabled) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableDualStreamMode(enabled);
  }

  @override
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType) async {
    if (!_isEngineSafe) return;
    await _realEngine.setRemoteDefaultVideoStreamType(streamType);
  }

  @override
  Future<void> setRemoteVideoStreamType(int uid, VideoStreamType streamType) async {
    if (!_isEngineSafe) return;
    await _realEngine.setRemoteVideoStreamType(uid, streamType);
  }

  @override
  Future<void> enableCustomCaptureRender(bool enabled, {VideoEncoderConfiguration? config}) async {
    if (!_isEngineSafe) return;
    await _realEngine.enableCustomCaptureRender(enabled, config: config);
  }

  @override
  Future<void> startCustomCapture() async {
    if (!_isEngineSafe) return;
    await _realEngine.startCustomCapture();
  }

  @override
  Future<void> stopCustomCapture() async {
    if (!_isEngineSafe) return;
    await _realEngine.stopCustomCapture();
  }

  @override
  ChannelMediaRelayConfiguration? getMediaRelayConfiguration() {
    if (!_isEngineSafe) return null;
    return _realEngine.getMediaRelayConfiguration();
  }

  @override
  Future<void> updateChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    if (!_isEngineSafe) return;
    return await _realEngine.updateChannelMediaRelay(channelMediaRelayConfiguration);
  }

  @override
  Future<void> setRemoteRobotListener(RemoteRobotListener listener) async {
    if (!_isEngineSafe) return;
    await _realEngine.setRemoteRobotListener(listener);
  }

  @override
  Future<void> setRemoteRobotUserId(int remoteRobotUserId) async {
    if (!_isEngineSafe) return;
    await _realEngine.setRemoteRobotUserId(remoteRobotUserId);
  }

  @override
  Future<void> setVoiceReverbType(int type) async {
    if (!_isEngineSafe) return;
    await _realEngine.setVoiceReverbType(type);
  }

  @override
  bool get uploadAacBytes {
    if (!_isEngineSafe) return false;
    return _realEngine.uploadAacBytes;
  }

  @override
  set uploadAacBytes(bool value) {
    if (!_isEngineSafe) return;
    _realEngine.uploadAacBytes = value;
  }

  @override
  Future<void> playerRecvSEICallback(PlayerRecvSEICallback callback) async {
    if (!_isEngineSafe) return;
    await _realEngine.playerRecvSEICallback(callback);
  }

  @override
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType}) async {
    if (!_isEngineSafe) return;
    await _realEngine.sendSEI(data, dataLength, channelType: channelType);
  }

  @override
  Future<int> getNetworkTime() async {
    if (!_isEngineSafe) return -1;
    return await _realEngine.getNetworkTime();
  }

  @override
  Future<AudioOutputRouting> getAudioRouteType() async {
    if (!_isEngineSafe) return AudioOutputRouting.UnKnown;
    return await _realEngine.getAudioRouteType();
  }

  @override
  Future<void> setRoomMode(RTCRoomMode mode) async {
    /// 不需要初始化，静态调用
    return await _realEngine.setRoomMode(mode);
  }

  @override
  Future<String> getAgoraLyric(String songCode) async {
    if (!_isEngineSafe) return '';

    return await _realEngine.getAgoraLyric(songCode);
  }

  @override
  Future<bool> isAgoraMusicPreloaded(int songCode) async {
    if (!_isEngineSafe) return false;
    return await _realEngine.isAgoraMusicPreloaded(songCode);
  }

  @override
  Future<void> preloadAgoraMusic(int songCode) async {
    if (!_isEngineSafe) return;
    await _realEngine.preloadAgoraMusic(songCode);
  }

  @override
  Future<void> initMusicContentCenter(String appId, String rtmToken, int uid) async {
    if (!_isEngineSafe) return;
    await _realEngine.initMusicContentCenter(appId, rtmToken, uid);
  }

  @override
  Future<void> setAgoraMusicLyricCallback(AgoraMusicLyricCallback callback) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAgoraMusicLyricCallback(callback);
  }

  @override
  Future<void> setAgoraMusicPreloadCallback(AgoraMusicPreloadCallback callback) async {
    if (!_isEngineSafe) return;
    await _realEngine.setAgoraMusicPreloadCallback(callback);
  }

  @override
  Future<void> enableVirtualStereo(bool enable, int angle) async {
    if (!_isEngineSafe) return;
    return _realEngine.enableVirtualStereo(enable, angle);
  }

  @override
  Future<void> setElectronicEffects(bool enable, ElectronicEffectsMode mode, int tonal) async {
    if (!_isEngineSafe) return;
    return _realEngine.setElectronicEffects(enable, mode, tonal);
  }

  @override
  Future<void> setReverbAdvancedParam(ReverbAdvancedParam param) async {
    if (!_isEngineSafe) return;
    return _realEngine.setReverbAdvancedParam(param);
  }

  @override
  Future<void> setReverbEchoParam(ReverbEchoParam param) async {
    if (!_isEngineSafe) return;
    return _realEngine.setReverbEchoParam(param);
  }

  @override
  networkQualityCallback(NetworkQualityCallback callback) {
    if (!_isEngineSafe) return;
    _realEngine.networkQualityCallback(callback);
  }

  @override
  Future<void> setMixStreamConfig(MixStreamConfig config) async {
    if (!_isEngineSafe) return;
    return _realEngine.setMixStreamConfig(config);
  }

  @override
  Future<void> setSubscribeAudioBlacklist({required List<int> uidList, required int uidNumber}) async {
    if (!_isEngineSafe) return;
    return _realEngine.setSubscribeAudioBlacklist(uidList: uidList, uidNumber: uidNumber);
  }

  @override
  Future<ZegoMusicResource?> requestResource(String songID, {int resourceType = 1, bool useCache = true}) async {
    if (!_isEngineSafe) return null;
    return _realEngine.requestResource(songID, resourceType: resourceType, useCache: useCache);
  }

  @override
  Future<void> setMusicDownloadCallback(ZegoMusicDownloadProgress? callback) async {
    if (!_isEngineSafe) return;
    _realEngine.setMusicDownloadCallback(callback);
  }

  @override
  Future<String> getLyric(String songCode) async {
    if (!_isEngineSafe) return '';
    return _realEngine.getLyric(songCode);
  }

  @override
  Future<bool> isMusicPreloaded(String songCode) async {
    if (!_isEngineSafe) return false;
    return _realEngine.isMusicPreloaded(songCode);
  }

  @override
  Future<void> preloadMusic(String songCode, String resourceId) async {
    if (!_isEngineSafe) return;
    return _realEngine.preloadMusic(songCode, resourceId);
  }

  @override
  void registerEventHandler(RtcEngineEventHandler eventHandler) {
    if (!_isEngineSafe) return;
    return _realEngine.registerEventHandler(eventHandler);
  }

  @override
  void unregisterEventHandler(RtcEngineEventHandler eventHandler) {
    if (!_isEngineSafe) return;
    return _realEngine.unregisterEventHandler(eventHandler);
  }
}
