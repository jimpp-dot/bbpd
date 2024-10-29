import 'dart:async';
import 'dart:typed_data';
import 'package:commonrtc_api/commonrtc_api.dart';

import 'rtc_base_engine.dart';
import 'plugin/rtc_speaker.dart';
import 'plugin/rtc_vad.dart';
import 'rtc_audio_mixing.dart';
import 'rtc_callback.dart';
import 'rtc_engine_proxy.dart';
import 'package:flutter/cupertino.dart';

import 'plugin/rtc_audio_effect_mixin.dart';
import 'plugin/rtc_simulate_sub_channel.dart';
import 'package:synchronized/synchronized.dart';

class RtcEngine extends RtcBaseEngine with RtcAudioMixingAdapterMixin, RtcCallbackMixin, RtcAudioEffectMixin {
  static const String TAG = 'rtc-engine';
  static bool debug = false;

  @override
  RtcEngineInterface engineInterface;

  @override
  bool openBackgroundMode = false;

  late RtcVad _rtcVad;

  late RtcSpeaker _rtcSpeaker;

  RtcSpeaker get rtcSpeaker => _rtcSpeaker;

  late RtcSimulateSubChannel _rtcSubChannel;

  final _setMuteLock = Lock();

  /// 记录上次的RTC类型，每一次初始化不同的引擎，需要先销毁之前的引擎
  static RtcEngineInterface? _currentEngine;

  @override
  set enableVad(bool enable) {
    // now only Agora enable vad.
    if (engineInterface.getEnum() == RtcEngineEnum.Agora) {
      _rtcVad.vadEnabled = enable;
    }
    rtcLog('${getTag()} set vad enable=$enable,result=${_rtcVad.vadEnabled}');
  }

  @override
  bool get enableVad => _rtcVad.vadEnabled;

  static const int defaultVolumeVoice = 100;

  int _recordingSignalVolume = defaultVolumeVoice;

  bool _mute = true;

  /// 业务层的角色
  ClientRole? _clientRole;

  /// 由于Vad变化的角色
  ClientRole? _vadClientRole;

  ChannelProfile? _channelProfile;

  bool get mute {
    return _mute;
  }

  @override
  RtcUseDelegate? useDelegate;

  factory RtcEngine.get(RtcEngineEnum name) {
    RtcEngineInterface? engine = RtcManager.inst.getRtcEngine(name);
    if (engine == null) {
      throw ArgumentError(
        'RtcManager not find $name, registeredEngine->${RtcManager.inst.registeredEngine()},you should registerRtcEngine first',
      );
    }
    var rtcEngine = RtcEngine._(RtcEngineProxy(engine));
    engine.bridge = RtcBridge(rtcEngine);
    return rtcEngine;
  }

  RtcEngine._(this.engineInterface);

  @override
  Future<void> destroy() async {
    rtcLog('${getTag()} destroy');
    await destroyRtcChannel();
    var retVal = await engineInterface.destroy();
    rtcSpeaker.release();
    enableVad = false;
    useDelegate?.dispose();
    useDelegate = null;
    _rtcVad.stopVad();
    clearAllCallback();
    return retVal;
  }

  @override
  Future<void> setRoomMode(RTCRoomMode mode) async {
    return await engineInterface.setRoomMode(mode);
  }

  @override
  Future<void> initEngine(EngineConfig config) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    rtcLog('${getTag()} initEngine start engineConfig->$config');
    if (_currentEngine != null && _currentEngine!.getEnum() != getEnum() && _currentEngine!.isInitialize) {
      rtcLog('${getTag()} find pre rtc engine ${_currentEngine!.getEnum()}');
      await _currentEngine!.destroy();
      rtcLog('${getTag()} pre rtc engine destroy done,will delayed 100ms.');
      await Future.delayed(const Duration(milliseconds: 100));
      _currentEngine = null;
    }

    var retVal = await engineInterface.initEngine(config);
    int end = DateTime.now().millisecondsSinceEpoch;
    rtcLog('${getTag()} initEngine end engineConfig->$config,cost ${end - start}ms');
    _currentEngine = engineInterface;
    _init();
    return retVal;
  }

  void _init() {
    _rtcVad = RtcVad(this);
    _rtcSpeaker = RtcSpeaker(this);
    _rtcSubChannel = RtcSimulateSubChannel(this, _rtcSpeaker);
    registerCallback();
  }

  @override
  void registerEventHandler(RtcEngineEventHandler eventHandler) {
    engineInterface.registerEventHandler(eventHandler);
  }

  @override
  void unregisterEventHandler(RtcEngineEventHandler eventHandler) {
    engineInterface.unregisterEventHandler(eventHandler);
  }

  @override
  Future<void> adjustRecordingSignalVolume(int volume) async {
    rtcLog('${getTag()} adjustRecordingSignalVolume volume=$volume');
    _recordingSignalVolume = volume;
    return await engineInterface.adjustRecordingSignalVolume(volume);
  }

  @override
  Future<void> disableAudio() async {
    rtcLog('${getTag()} disableAudio');
    return await engineInterface.disableAudio();
  }

  @override
  Future<void> disableVideo() async {
    rtcLog('${getTag()} disableVideo');
    return await engineInterface.disableVideo();
  }

  @override
  Future<void> enableAudio() async {
    rtcLog('${getTag()} enableAudio');
    return await engineInterface.enableAudio();
  }

  @override
  Future<void> enableAudioVolumeIndication(int interval, int smooth, bool reportVad) async {
    rtcLog('${getTag()} enableAudioVolumeIndication interval=$interval,smooth=$smooth,report_vad=$reportVad');
    return await engineInterface.enableAudioVolumeIndication(interval, smooth, reportVad);
  }

  @override
  Future<void> enableInEarMonitoring(bool enabled) async {
    rtcLog('${getTag()} enableInEarMonitoring enabled=$enabled');
    return await engineInterface.enableInEarMonitoring(enabled);
  }

  @override
  Future<void> enableLocalAudio(bool enabled) async {
    rtcLog('${getTag()} enableLocalAudio enabled=$enabled');
    return await engineInterface.enableLocalAudio(enabled);
  }

  @override
  Future<void> enableVideo() async {
    rtcLog('${getTag()} enableVideo');
    return await engineInterface.enableVideo();
  }

  @override
  Future<void> enableLocalVideo(bool enabled) async {
    rtcLog('${getTag()} enableLocalVideo $enabled');
    return await engineInterface.enableLocalVideo(enabled);
  }

  @override
  Future<void> enableWebSdkInteroperability(bool enabled) async {
    rtcLog('${getTag()} enableWebSdkInteroperability enabled=$enabled');
    return await engineInterface.enableWebSdkInteroperability(enabled);
  }

  @override
  Future<void> joinRoom(String token, String channelName, int optionalUid, {String? optionalInfo}) async {
    rtcLog('${getTag()} joinChannel@begin uid=$optionalUid,channelName=$channelName,optionalInfo=$optionalInfo,token=$token');
    await engineInterface.joinRoom(token, channelName, optionalUid, optionalInfo: optionalInfo);
    rtcLog('${getTag()} joinChannel@end uid=$optionalUid,channelName=$channelName,optionalInfo=$optionalInfo,token=$token');
  }

  @override
  Future<void> leaveChannel() async {
    rtcLog('${getTag()} leaveChannel');
    await destroyRtcChannel();
    return await engineInterface.leaveChannel();
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    rtcLog('${getTag()} muteAllRemoteAudioStreams muted=$muted');
    return await engineInterface.muteAllRemoteAudioStreams(muted);
  }

  @override
  Future<void> muteAllRemoteVideoStreams(bool muted) async {
    rtcLog('${getTag()} muteAllRemoteVideoStreams muted=$muted');
    return await engineInterface.muteAllRemoteVideoStreams(muted);
  }

  @override
  Future<void> muteMicrophone(bool mute) async {
    rtcLog('${getTag()} muteMicrophone mute=$mute');
    return await engineInterface.muteMicrophone(mute);
  }

  @override
  Future<void> muteLocalMediaPlayer(bool mute) async {
    rtcLog('${getTag()} muteMicrophone mute=$mute');
    return await engineInterface.muteLocalMediaPlayer(mute);
  }

  @override
  Future<void> muteRoom(bool mute) async {
    rtcLog('${getTag()} muteRoom mute=$mute');
    return await engineInterface.muteRoom(mute);
  }

  @override
  Future<void> muteLocalAudioStream(bool muted) async {
    rtcLog('${getTag()} muteLocalAudioStream muted=$muted');
    return await engineInterface.muteLocalAudioStream(muted);
  }

  @override
  Future<int> muteRemoteAudioStream(int uid, bool muted) async {
    rtcLog('${getTag()} muteRemoteAudioStream uid=$uid,muted=$muted');
    int val = await engineInterface.muteRemoteAudioStream(uid, muted);
    return val;
  }

  @override
  Future<void> setAudioProfile(AudioProfile profile, AudioScenario scenario) async {
    rtcLog('${getTag()} setAudioProfile profile=$profile,scenario=$scenario');
    return await engineInterface.setAudioProfile(profile, scenario);
  }

  @override
  Future<void> setChannelProfile(ChannelProfile profile) async {
    rtcLog('${getTag()} setChannelProfile profile=$profile');
    _channelProfile = profile;
    return await engineInterface.setChannelProfile(profile);
  }

  @override
  setSubPubChannel(SubChannel pubChannel) async {
    rtcLog('${getTag()} setSubPubChannel pubChannel=$pubChannel');
    _rtcSubChannel.setSubPubChannel(pubChannel);
  }

  @override
  Future<void> setSubPrivateChannel(List<SubChannel>? subChannels) async {
    rtcLog('${getTag()} setSubPrivateChannel subChannels=$subChannels');
    return await _rtcSubChannel.setSubPrivateChannel(subChannels);
  }

  @override
  Future<void> syncSubChannelStreamState() async {
    rtcLog('${getTag()} syncSubChannelStreamState');
    return await _rtcSubChannel.syncSubChannelStreamState();
  }

  @override
  Future<void> setClientRole(ClientRole role) async {
    rtcLog('${getTag()} setClientRole role=$role');
    _clientRole = role;
    _vadClientRole = role;
    if (_channelProfile == ChannelProfile.LiveBroadcasting) {
      return await engineInterface.setClientRole(role);
    } else {
      rtcLog('${getTag()} setClientRole role=$role,warning!! ClientRole only work at LiveBroadcasting');
    }
  }

  /// vad方式切换引擎角色不改变_clientRole业务层角色.
  Future<void> changeVadClientRole(ClientRole role) async {
    rtcLog('${getTag()} changeRole by vad role=$role');
    if (_channelProfile == ChannelProfile.LiveBroadcasting) {
      _vadClientRole = role;
      return await engineInterface.setClientRole(role);
    } else {
      rtcLog('${getTag()} setClientRole role=$role,warning!! ClientRole only work at LiveBroadcasting');
    }
  }

  @override
  Future<void> setKtvRole(KtvClientRole role) async {
    rtcLog('${getTag()} setKtvRole role=$role');
    await engineInterface.setKtvRole(role);
  }

  @override
  Future<AudioOutputRouting> getAudioRouteType() async {
    AudioOutputRouting routeType = await engineInterface.getAudioRouteType();
    rtcLog('${getTag()} getAudioRouteType routeType = $routeType');
    return routeType;
  }

  @override
  Future<void> setDefaultAudioRouteToSpeakerPhone(bool defaultToSpeaker) async {
    rtcLog('${getTag()} setDefaultAudioRouteToSpeakerPhone defaultToSpeaker=$defaultToSpeaker');
    return await engineInterface.setDefaultAudioRouteToSpeakerPhone(defaultToSpeaker);
  }

  @override
  Future<void> setEnableSpeakerphone(bool enabled) async {
    rtcLog('${getTag()} setEnableSpeakerphone enabled=$enabled');
    return await engineInterface.setEnableSpeakerphone(enabled);
  }

  @override
  Future<void> setInEarMonitoringVolume(int volume) async {
    rtcLog('${getTag()} setInEarMonitoringVolume volume=$volume');
    return await engineInterface.setInEarMonitoringVolume(volume);
  }

  @override
  setVadCheckInterval(int second) {
    rtcLog('${getTag()} setVadCheckInterval second=$second');
    _rtcVad.vadInterval = second;
  }

  @override
  Future<void> startAudioMixing(String path, bool noPublish, bool noMixMic, {int cycle = 1, int startPos = 0, String? resourceID}) async {
    rtcLog('${getTag()} startAudioMixing noPublish=$noPublish,noMixMic=$noMixMic,cycle=$cycle,startPos=$startPos,path=$path,resourceID:$resourceID');
    await _applyBackgroundMode();
    await super.startAudioMixing(path, noPublish, noMixMic, cycle: cycle, startPos: startPos, resourceID: resourceID);
  }

  @override
  Future<void> startChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    rtcLog('${getTag()} startChannelMediaRelay channelMediaRelayConfiguration=$channelMediaRelayConfiguration');
    return await engineInterface.startChannelMediaRelay(channelMediaRelayConfiguration);
  }

  @override
  Future<void> updateChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    return await engineInterface.updateChannelMediaRelay(channelMediaRelayConfiguration);
  }

  @override
  ChannelMediaRelayConfiguration? getMediaRelayConfiguration() {
    return engineInterface.getMediaRelayConfiguration();
  }

  @override
  bool isMediaReplaySuccess(String destRid) {
    bool retVal = engineInterface.isMediaReplaySuccess(destRid);
    rtcLog('isMediaReplaySuccess retVal=$retVal,destRid=$destRid');
    return retVal;
  }

  @override
  Future<void> syncPullExtraStream(List<UserStream>? streamList) async {
    rtcLog('${getTag()} syncPullExtraStream streamList=$streamList');
    return await engineInterface.syncPullExtraStream(streamList);
  }

  @override
  Future<void> startPreview() async {
    rtcLog('${getTag()} startPreview');
    return await engineInterface.startPreview();
  }

  @override
  Future<void> stopChannelMediaRelay() async {
    rtcLog('${getTag()} stopChannelMediaRelay');
    return await engineInterface.stopChannelMediaRelay();
  }

  @override
  Future<void> stopPreview() async {
    rtcLog('${getTag()} stopPreview');
    return await engineInterface.stopPreview();
  }

  Future<void> _applyBackgroundMode() async {
    await _setMuteLock.synchronized(() async {
      if (_mute && openBackgroundMode) {
        rtcLog('apply backgroundMusic Mode.');
        await muteMicrophone(mute);
      }
    });
  }

  @override
  Future<void> setMute(bool mute) async {
    await _setMuteLock.synchronized(() async {
      rtcLog('${getTag()} setMute mute=$mute,backgroundMode=$openBackgroundMode,vadEnable=${_rtcVad.vadEnabled},role=$_clientRole');
      if (_clientRole != ClientRole.Broadcaster) {
        rtcLog('${getTag()} setMute mute=$mute,role not Broadcaster,ignore!!!!');
        return;
      }
      _mute = mute;
      if (openBackgroundMode) {
        if (mute == false) {
          await muteLocalAudioStream(false);
          if (_vadClientRole != ClientRole.Broadcaster) {
            await setClientRole(ClientRole.Broadcaster);
          }
        }
        await muteMicrophone(mute);
      } else {
        _rtcVad.stopVad();

        if (mute == true) {
          if (_rtcVad.vadEnabled) {
            await changeVadClientRole(ClientRole.Audience);
          } else {
            await muteLocalAudioStream(true);
          }
        } else {
          await muteMicrophone(false);
          await muteLocalAudioStream(false);
          if (_vadClientRole != ClientRole.Broadcaster) {
            await setClientRole(ClientRole.Broadcaster);
          }
          await adjustRecordingSignalVolume(_recordingSignalVolume);
        }
      }
    });
  }

  @override
  Future<void> switchCamera() async {
    rtcLog('${getTag()} switchCamera');
    return await engineInterface.switchCamera();
  }

  @override
  void onAudioMixingStateCallback(AudioMixingStateCode state, AudioMixingReason reason) {
    innerOnAudioMixingStateCallback(state, reason);
  }

  @override
  void onAudioVolumeCallback(List<AudioVolumeInfo> speakers, int totalVolume) {
    if (enableVad) {
      AudioVolumeInfo? selfSpeaker;
      try {
        selfSpeaker = speakers.firstWhere((speaker) => speaker.uid == 0);
      } catch (e) {}
      _rtcVad.handleAudioVolumeIndication(selfSpeaker);
    }

    _rtcSpeaker.handlerAudioVolumeCallback(speakers, totalVolume);
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
    rtcLog('${getTag()} playEffect soundId=$soundId,loopCount=$loopCount,publish=$publish,url=$filePath');
    return await engineInterface.playEffect(
        soundId: soundId, filePath: filePath, loopCount: loopCount, pitch: pitch, pan: pan, gain: gain, publish: publish);
  }

  @override
  Future<void> stopAllEffects() async {
    rtcLog('${getTag()} stopAllEffects');
    return await engineInterface.stopAllEffects();
  }

  @override
  Future<void> stopEffect(int soundId) async {
    rtcLog('${getTag()} stopEffect soundId=$soundId');
    return await engineInterface.stopEffect(soundId);
  }

  @override
  Future<void> setVoiceProfile({double? pitch, List<double>? equalization}) async {
    rtcLog('${getTag()} setVoiceProfile pitch=$pitch,equalization=$equalization');
    await engineInterface.setVoiceProfile(pitch: pitch, equalization: equalization);
  }

  @override
  Future<void> setParameters(String param) async {
    rtcLog('${getTag()} setParameters param=$param');
    await engineInterface.setParameters(param);
  }

  @override
  Future<void> setVideoEncoderConfiguration(VideoEncoderConfiguration config) async {
    await engineInterface.setVideoEncoderConfiguration(config);
  }

  @override
  Widget createVideoRenderWidget(int uid, {bool local = false, int facing = 0, Map<String, dynamic> args = const <String, dynamic>{}}) {
    return engineInterface.createVideoRenderWidget(uid, local: local, facing: facing, args: args);
  }

  @override
  Future<void> muteLocalVideoStream(bool muted) async {
    await engineInterface.muteAllRemoteVideoStreams(muted);
  }

  //是否开启美颜Source设置
  @override
  Future<bool> setBeauty(bool enableBeauty) async {
    rtcLog('${getTag()} setBeauty $enableBeauty');
    bool res = await engineInterface.setBeauty(enableBeauty);
    return res;
  }

  @override
  Future<void> setAudioEffectPreset(AudioEffectPreset preset) async {
    rtcLog('${getTag()} setAudioEffectPreset preset=$preset');
    return await engineInterface.setAudioEffectPreset(preset);
  }

  @override
  String getTag() {
    return engineInterface.getTag();
  }

  @override
  Future<void> startRecordingCapturedData(RecordConfig config) async {
    rtcLog('${getTag()} startRecordingCapturedData $config');
    return await engineInterface.startRecordingCapturedData(config);
  }

  @override
  Future<void> stopRecordingCapturedData() async {
    rtcLog('${getTag()} stopRecordingCapturedData');
    return await engineInterface.stopRecordingCapturedData();
  }

  @override
  Future<RtcMultiChannel?> createRtcChannel(String channel) async {
    rtcLog('${getTag()} createRtcChannel channel=$channel');
    return await engineInterface.createRtcChannel(channel);
  }

  @override
  Future<void> destroyRtcChannel() async {
    rtcLog('${getTag()} destroyRtcChannel');
    return await engineInterface.destroyRtcChannel();
  }

  @override
  setAudioDataHandler(CapturedAudioFrameCallback? callback) {
    rtcLog('${getTag()} setAudioDataHandler callback=$callback');
    engineInterface.setAudioDataHandler(callback);
  }

  @override
  Future<void> setRecordingAudioFrameParameters({int? sampleRate, int? channel, int? mode, int? samplesPerCall}) async {
    rtcLog(
        '${getTag()} setRecordingAudioFrameParameters sampleRate=$sampleRate,channel=$channel,mode=$mode,samplesPerCall=$samplesPerCall');
    return await engineInterface.setRecordingAudioFrameParameters(
        sampleRate: sampleRate, channel: channel, mode: mode, samplesPerCall: samplesPerCall);
  }

  @override
  Future<void> registerAudioFrameObserver({int? uid, int? rid}) async {
    rtcLog('${getTag()} registerAudioFrameObserver');
    return await engineInterface.registerAudioFrameObserver(uid: uid, rid: rid);
  }

  @override
  Future<void> unRegisterAudioFrameObserver() async {
    rtcLog('${getTag()} unRegisterAudioFrameObserver');
    return await engineInterface.unRegisterAudioFrameObserver();
  }

  @override
  RtcEngineEnum getEnum() {
    return engineInterface.getEnum();
  }

  @override
  Future<void> preloadEffect(int soundId, String filePath) async {
    rtcLog('${getTag()} preloadEffect soundId=$soundId,filePath=$filePath');
    return await engineInterface.preloadEffect(soundId, filePath);
  }

  @override
  Future<void> unloadEffect(int soundId) async {
    rtcLog('${getTag()} unloadEffect soundId=$soundId');
    return await engineInterface.unloadEffect(soundId);
  }

  @override
  Future<void> cancelPreloadAMEMusic(String musicId) async {
    await engineInterface.cancelPreloadAMEMusic(musicId);
  }

  @override
  Future<void> clearAMEMusicCache() async {
    await engineInterface.clearAMEMusicCache();
  }

  @override
  Future<void> destroyAME() async {
    await engineInterface.destroyAME();
  }

  @override
  Future<String> genAMEMusicURI(String musicId, int musicType) async {
    String uri = await engineInterface.genAMEMusicURI(musicId, musicType);
    return uri;
  }

  @override
  Future<void> initAME() async {
    await engineInterface.initAME();
  }

  @override
  Future<bool> isAMEMusicPreloaded(String musicId) async {
    bool isPreload = await engineInterface.isAMEMusicPreloaded(musicId);
    return isPreload;
  }

  @override
  Future<void> preloadAMEMusic(String musicId, String playToken) async {
    await engineInterface.preloadAMEMusic(musicId, playToken);
  }

  @override
  Future<void> setAMELicense(String licenseUrl, String key) async {
    await engineInterface.setAMELicense(licenseUrl, key);
  }

  @override
  Future<void> setAMEMusicCacheMaxCount(int maxCount) async {
    await engineInterface.setAMEMusicCacheMaxCount(maxCount);
  }

  @override
  Future<void> setAMEDownloadListener(AMEListener listener) async {
    await engineInterface.setAMEDownloadListener(listener);
  }

  @override
  Future<void> enableDualStreamMode(bool enabled) async {
    rtcLog('${getTag()} enableDualStreamMode $enabled');
    await engineInterface.enableDualStreamMode(enabled);
  }

  @override
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType) async {
    rtcLog('${getTag()} setRemoteDefaultVideoStreamType $streamType');
    await engineInterface.setRemoteDefaultVideoStreamType(streamType);
  }

  @override
  Future<void> setRemoteVideoStreamType(int uid, VideoStreamType streamType) async {
    rtcLog('${getTag()} setRemoteVideoStreamType uid=$uid,streamType=$streamType');
    await engineInterface.setRemoteVideoStreamType(uid, streamType);
  }

  @override
  Future<void> enableCustomCaptureRender(bool enabled, {VideoEncoderConfiguration? config}) async {
    rtcLog('${getTag()} enableCustomCaptureRender enabled=$enabled');
    await engineInterface.enableCustomCaptureRender(enabled, config: config);
  }

  @override
  Future<void> startCustomCapture() async {
    rtcLog('${getTag()} startCustomCapture');
    await engineInterface.startCustomCapture();
  }

  @override
  Future<void> stopCustomCapture() async {
    rtcLog('${getTag()} stopCustomCapture');
    await engineInterface.stopCustomCapture();
  }

  @override
  Future<void> setVoiceReverbType(int type) async {
    await engineInterface.setVoiceReverbType(type);
  }

  @override
  Future<void> setRemoteRobotListener(RemoteRobotListener listener) async {
    await engineInterface.setRemoteRobotListener(listener);
  }

  @override
  Future<void> setRemoteRobotUserId(int remoteRobotUserId) async {
    await engineInterface.setRemoteRobotUserId(remoteRobotUserId);
  }

  @override
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType}) async {
    await engineInterface.sendSEI(data, dataLength, channelType: channelType);
  }

  @override
  Future<int> getNetworkTime() async {
    return await engineInterface.getNetworkTime();
  }

  @override
  Future<String> getAgoraLyric(String songCode) async {
    return await engineInterface.getAgoraLyric(songCode);
  }

  @override
  Future<bool> isAgoraMusicPreloaded(int songCode) async {
    return await engineInterface.isAgoraMusicPreloaded(songCode);
  }

  @override
  Future<void> preloadAgoraMusic(int songCode) async {
    await engineInterface.preloadAgoraMusic(songCode);
  }

  @override
  Future<void> initMusicContentCenter(String appId, String rtmToken, int uid) async {
    await engineInterface.initMusicContentCenter(appId, rtmToken, uid);
  }

  @override
  Future<void> setAgoraMusicLyricCallback(AgoraMusicLyricCallback callback) async {
    await engineInterface.setAgoraMusicLyricCallback(callback);
  }

  @override
  Future<void> setAgoraMusicPreloadCallback(AgoraMusicPreloadCallback callback) async {
    await engineInterface.setAgoraMusicPreloadCallback(callback);
  }

  @override
  Future<void> enableVirtualStereo(bool enable, int angle) {
    return engineInterface.enableVirtualStereo(enable, angle);
  }

  @override
  Future<void> setElectronicEffects(bool enable, ElectronicEffectsMode mode, int tonal) {
    return engineInterface.setElectronicEffects(enable, mode, tonal);
  }

  @override
  Future<void> setReverbAdvancedParam(ReverbAdvancedParam param) {
    return engineInterface.setReverbAdvancedParam(param);
  }

  @override
  Future<void> setReverbEchoParam(ReverbEchoParam param) {
    return engineInterface.setReverbEchoParam(param);
  }

  @override
  Future<void> setMixStreamConfig(MixStreamConfig config) {
    return engineInterface.setMixStreamConfig(config);
  }

  @override
  Future<void> setSubscribeAudioBlacklist({required List<int> uidList, required int uidNumber}) {
    return engineInterface.setSubscribeAudioBlacklist(uidList: uidList, uidNumber: uidNumber);
  }

  @override
  Future<void> renewToken(String token) {
    return engineInterface.renewToken(token);
  }

  @override
  Future<ZegoMusicResource?> requestResource(String songID, {int resourceType = 1, bool useCache = true}) async {
    return engineInterface.requestResource(songID, resourceType: resourceType, useCache: useCache);
  }

  @override
  Future<void> setMusicDownloadCallback(ZegoMusicDownloadProgress? callback) async {
    engineInterface.setMusicDownloadCallback(callback);
  }

  @override
  Future<String> getLyric(String songCode) async {
    return engineInterface.getLyric(songCode);
  }

  @override
  Future<bool> isMusicPreloaded(String songCode) async {
    return engineInterface.isMusicPreloaded(songCode);
  }

  @override
  Future<void> preloadMusic(String songCode, String resourceId) async {
    return engineInterface.preloadMusic(songCode, resourceId);
  }
}
