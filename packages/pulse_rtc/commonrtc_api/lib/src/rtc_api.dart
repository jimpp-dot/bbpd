import 'dart:typed_data';

import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';

/// 当前用户是否在麦上
typedef RtcIsMicFunc = bool Function();

/// 是否记录用户说话时长
typedef RtcRecordSpeakerDurationFunc = bool Function();

/// 是否是可以说话的用户
typedef RtcCanSpeakFunc = bool Function(int uid);

/// 监听Speaker Ticker定时回调
/// [intervalMillisecond] 固定间隔的毫秒
typedef RtcSpeakerTickCallback = void Function(int intervalMillisecond);

/// 当前用户的uid标识
typedef RtcUidFuc = int Function();

/// volume 0~100.
typedef RtcSpeakerTalking = void Function(int uid, int volume, int now, int vad);

typedef RtcSpeakersChange = void Function();

typedef RtcGetPublishStream = String Function();

typedef RtcGetLeadSingerStream = String Function();

typedef RtcGetChorusStream = Set<String> Function();

typedef RtcRenewToken = Future<String?> Function();

class RtcUseDelegate {
  RtcIsMicFunc? micDelegate;
  RtcSpeakerTickCallback? speakerTickCallback;
  RtcUidFuc? uidFuc;
  RtcCanSpeakFunc? canSpeak;
  RtcSpeakerTalking? talking;
  RtcSpeakersChange? speakersChange;
  RtcGetPublishStream? getPublishStream;

  /// 即构KTV合唱，主唱的麦克风StreamID
  RtcGetLeadSingerStream? getLeadSingerStream;

  /// 即构KTV合唱，合唱流
  RtcGetChorusStream? getChorusStream;

  /// 声网KTV合唱，子频道token
  ValueGetter<String>? subChannelToken;

  RtcRenewToken? renewToken;

  RtcUseDelegate({
    this.micDelegate,
    this.speakerTickCallback,
    this.uidFuc,
    this.canSpeak,
    this.talking,
    this.speakersChange,
    this.getPublishStream,
    this.getLeadSingerStream,
    this.getChorusStream,
    this.subChannelToken,
    this.renewToken,
  });

  bool get isMic => micDelegate?.call() ?? false;

  String? get publishStream => getPublishStream?.call();

  String? get leadSingerStream => getLeadSingerStream?.call();

  Set<String?>? get chorusStream => getChorusStream?.call();

  void dispose() {
    micDelegate = null;
    speakerTickCallback = null;
    uidFuc = null;
    canSpeak = null;
    talking = null;
    speakersChange = null;
    getPublishStream = null;
    getLeadSingerStream = null;
    getChorusStream = null;
    subChannelToken = null;
    renewToken = null;
  }
}

/// Rtc整体对外暴露的接口
mixin RtcInterface
    implements BaseRtcEngineInterface, RtcExtraInterface, RtcSimulateChannelInterface, RtcEventAddHandlerInterface {}

/// 单个引擎的接口
mixin RtcEngineInterface implements BaseRtcEngineInterface, RtcEventSetHandlerInterface, RtcAudioMixingInterface {
  /// 供具体实现层访问主逻辑层
  late RtcBridge bridge;

  bool get isInitialize;

  /// 用于设置一些私有配置
  @override
  Future<void> setRoomMode(RTCRoomMode mode) async {}

  /// only for zego
  @override
  Future<void> setMixStreamConfig(MixStreamConfig config) async {}

  /// only for zego
  @override
  Future<int> audioTrackCount() async => 0;

  /// only for zego
  @override
  Future<void> setAudioTrackIndex(int index) async {}

  @override
  Future<void> setAudioTrackMode(int index) async {}

  /// only for zego
  @override
  Future<void> setKtvRole(KtvClientRole role) async {}

  /// 默认实现，只有tencentRTC需要覆盖
  @override
  Future<void> setAMELicense(String licenseUrl, String key) async {}

  @override
  Future<void> initAME() async {}

  @override
  Future<void> destroyAME() async {}

  @override
  Future<void> preloadAMEMusic(String musicId, String playToken) async {}

  @override
  Future<void> cancelPreloadAMEMusic(String musicId) async {}

  @override
  Future<void> clearAMEMusicCache() async {}

  @override
  Future<void> setAMEMusicCacheMaxCount(int maxCount) async {}

  @override
  Future<void> setAMEDownloadListener(AMEListener listener) async {}

  @override
  Future<bool> isAMEMusicPreloaded(String musicId) async => false;

  @override
  Future<String> genAMEMusicURI(String musicId, int musicType) async => '';

  @override
  Future<void> preloadEffect(int soundId, String filePath) async {}

  @override
  Future<void> unloadEffect(int soundId) async {}

  /// agora only
  @override
  Future<void> enableLocalVideo(bool enabled) async {}

  /// agora only
  @override
  Future<void> muteLocalVideoStream(bool muted) async {}

  /// agora only
  /// 是否开启自采集模板,使用美颜需要开启自采集
  @override
  Future<void> enableCustomCaptureRender(bool enabled, {VideoEncoderConfiguration? config}) async {}

  /// agora only
  /// 自采集开始采集摄像头数据
  @override
  Future<void> startCustomCapture() async {}

  /// agora only
  /// 自采集停止采集摄像头数据
  @override
  Future<void> stopCustomCapture() async {}

  /// agora only
  @override
  Future<bool> setBeauty(bool enableBeauty) async => false;

  /// agora only
  @override
  Future<void> enableDualStreamMode(bool enabled) async {}

  /// agora only
  @override
  Future<bool> isAgoraMusicPreloaded(int songCode) async => false;

  /// agora only
  @override
  Future<void> preloadAgoraMusic(int songCode) async {}

  @override
  Future<String> getAgoraLyric(String songCode) async => '';

  /// agora only
  @override
  Future<void> initMusicContentCenter(String appId, String rtmToken, int uid) async {}

  @override
  Future<void> setAgoraMusicLyricCallback(AgoraMusicLyricCallback callback) async {}

  @override
  Future<void> setAgoraMusicPreloadCallback(AgoraMusicPreloadCallback callback) async {}

  @override
  Future<void> setRemoteVideoStreamType(int uid, VideoStreamType streamType) async {}

  @override
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType) async {}

  @override
  Future<void> setVoiceReverbType(int type) async {}

  @override
  Future<void> setRemoteRobotListener(RemoteRobotListener listener) async {}

  @override
  Future<void> setRemoteRobotUserId(int remoteRobotUserId) async {}

  /// 是否上传aac数据到服务端
  set uploadAacBytes(bool value);

  bool get uploadAacBytes;

  /// zego only
  @override
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType}) async {}

  /// zego only
  @override
  playerRecvSEICallback(PlayerRecvSEICallback callback) {}

  /// zego only
  @override
  Future<int> getNetworkTime() async => -1;

  /// 目前只有Zego实现复写了
  @override
  Future<AudioOutputRouting> getAudioRouteType() async => AudioOutputRouting.UnKnown;

  /// only for zego
  @override
  Future<void> enableVirtualStereo(bool enable, int angle) async {}

  /// only for zego
  @override
  Future<void> setReverbAdvancedParam(ReverbAdvancedParam param) async {}

  /// only for zego
  @override
  Future<void> setReverbEchoParam(ReverbEchoParam param) async {}

  /// only for zego
  @override
  Future<void> setElectronicEffects(bool enable, ElectronicEffectsMode mode, int tonal) async {}

  /// only for zego
  @override
  networkQualityCallback(NetworkQualityCallback callback) {}

  /// only for agora
  @override
  Future<void> setSubscribeAudioBlacklist({required List<int> uidList, required int uidNumber}) async {}

  /// only for zego
  @override
  Future<ZegoMusicResource?> requestResource(String songID, {int resourceType = 1, bool useCache = true}) async => null;

  @override
  void setMusicDownloadCallback(ZegoMusicDownloadProgress? callback) async {}

  @override
  Future<void> preloadMusic(String songCode, String resourceId) async {}

  @override
  Future<bool> isMusicPreloaded(String songCode) async => false;

  @override
  Future<String> getLyric(String songCode) async => '';
}

/// RTC 子频道接口
mixin RtcMultiChannel {
  Future<void> joinChannel(String token, String optionalInfo, int optionalUid, ChannelMediaOptions options);

  Future<void> setClientRole(ClientRole role);

  Future<void> muteAllRemoteAudioStreams(bool muted);

  /// 屏蔽远程用户
  Future<void> muteRemoteAudioStream(int uid, bool muted);

  Future<void> leaveChannel();

  Future<void> destroy();

  /// 调节本地播放的所有远端用户信号音量。
  Future<void> adjustPlaybackSignalVolume(int volume);

  int getPlaybackSignalVolume();
}

/// 聚合各个细分功能的 mixin
mixin BaseRtcEngineInterface
    implements
        RtcAudioInterface,
        RtcVideoInterface,
        RtcDualStreamInterface,
        RtcMediaRelayInterface,
        RtcAudioRouteInterface,
        RtcVoiceChangerInterface,
        RtcEarMonitoringInterface,
        RtcCameraInterface,
        RtcRecordingInterface,
        AMEMusicInterface,
        MediaExtraInterface,
        AgoraMusicInterface,
        ZegoMusicInterface {
  String getTag();

  RtcEngineEnum getEnum();

  Future<void> setRoomMode(RTCRoomMode mode);

  ///初始化引擎
  Future<void> initEngine(EngineConfig config);

  /// 设置混流方式下，多路流的配置
  Future<void> setMixStreamConfig(MixStreamConfig config);

  /// 创建子频道
  Future<RtcMultiChannel?> createRtcChannel(String channel);

  Future<void> destroyRtcChannel();

  /// Destroys the [RtcEngine] instance and releases all resources used by the BB SDK.
  ///
  /// This method is useful for apps that occasionally make voice or video calls, to free up resources for other operations when not making calls.
  ///
  /// **Note**
  /// - Call this method in the subthread.
  /// - Once the app calls [RtcEngine.destroy] to destroy the created [RtcEngine] instance, you cannot use any method or callback in the SDK.
  Future<void> destroy();

  /// Sets the channel profile of the BB RtcEngine.
  ///
  /// The BB RtcEngine differentiates channel profiles and applies different optimization algorithms accordingly. For example, it prioritizes smoothness and low latency for a video call, and prioritizes video quality for a video broadcast.
  ///
  /// **Parameter** [profile] The channel profile of the BB RtcEngine. See [ChannelProfile].
  Future<void> setChannelProfile(ChannelProfile profile);

  /// Sets the role of a user in a live interactive streaming.
  ///
  /// You can call this method either before or after joining the channel to set the user role as audience or host. If you call this method to switch the user role after joining the channel, the SDK triggers the following callbacks:
  /// - The local client: [RtcEngineEventHandler.clientRoleChanged].
  /// - The remote client: [RtcEngineEventHandler.userJoined] or [RtcEngineEventHandler.userOffline] ([UserOfflineReason.BecomeAudience]).
  ///
  /// **Note**
  /// - This method applies to the `LiveBroadcasting` profile only (when the `profile` parameter in `setChannelProfile` is set as `LiveBroadcasting`).
  /// - Since v3.2.0, this method can set the user level in addition to the user role.
  ///    - The user role determines the permissions that the SDK grants to a user, such as permission to send local streams, receive remote streams, and push streams to a CDN address.
  ///    - The user level determines the level of services that a user can enjoy within the permissions of the user's role. For example, an audience can choose to receive remote streams with low latency or ultra low latency. Levels affect prices.
  ///
  /// **Parameter** [role] Sets the role of a user. See [ClientRoleStream].
  ///
  Future<void> setClientRole(ClientRole role);

  /// Zego KTV合唱角色变化设置
  Future<void> setKtvRole(KtvClientRole role);

  /// Allows a user to join a channel.
  ///
  /// Users in the same channel can talk to each other, and multiple users in the same channel can start a group chat. Users with different App IDs cannot call each other.
  /// You must call the [RtcEngine.leaveChannel] method to exit the current call before joining another channel.
  /// A successful joinChannel method call triggers the following callbacks:
  /// - The local client: [RtcEngineEventHandler.joinChannelSuccess].
  /// - The remote client: [RtcEngineEventHandler.userJoined], if the user joining the channel is in the [ChannelProfile.Communication] profile, or is a [ClientRole.Broadcaster] in the [ChannelProfile.LiveBroadcasting] profile.
  ///
  /// When the connection between the client and BB's server is interrupted due to poor network conditions, the SDK tries reconnecting to the server. When the local client successfully rejoins the channel, the SDK triggers the [RtcEngineEventHandler.rejoinChannelSuccess] callback on the local client.
  ///
  /// Once the user joins the channel (switches to another channel), the user subscribes to the audio and video streams of all the other users in the channel by default, giving rise to usage and billing calculation. If you do not want to subscribe to a specified stream or all remote streams, call the mute methods accordingly.
  ///
  /// **Note**
  /// - A channel does not accept duplicate uids, such as two users with the same uid. If you set uid as 0, the system automatically assigns a uid.
  ///
  /// **Warning**
  /// - Ensure that the App ID used for creating the token is the same App ID used in the create method for creating an [RtcEngine] object. Otherwise, CDN live streaming may fail.
  ///
  /// **Parameter** [token] The token for authentication:
  /// - In situations not requiring high security: You can use the temporary token generated at Console. For details, see [Get a temporary token](https://docs.BB.io/en/BB%20Platform/token?platform=All%20Platforms#temptoken).
  /// - In situations requiring high security: Set it as the token generated at your server. For details, see [Get a token](https://docs.BB.io/en/BB%20Platform/token?platform=All%20Platforms#generatetoken).
  ///
  /// **Parameter** [channelName] The unique channel name for the AgoraRTC session in the string format. The string length must be less than 64 bytes. Supported character scopes are:
  /// - All lowercase English letters: a to z.
  /// - All uppercase English letters: A to Z.
  /// - All numeric characters: 0 to 9.
  /// - The space character.
  /// - Punctuation characters and other symbols, including: "!", "#", "$", "%", "&", "(", ")", "+", "-", ":", ";", "<", "=", ".", ">", "?", "@", "[", "]", "^", "_", " {", "}", "|", "~", ",".
  ///
  /// **Parameter** [optionalInfo] Additional information about the channel. This parameter can be set as null or contain channel related information. Other users in the channel do not receive this message.
  ///
  /// **Parameter** [optionalUid] (Optional) User ID. `optionalUid` must be unique. If `optionalUid` is not assigned (or set to 0), the SDK assigns and returns uid in the [RtcEngineEventHandler.joinChannelSuccess] callback. Your app must record and maintain the returned uid since the SDK does not do so.
  Future<void> joinRoom(String token, String channelName, int optionalUid, {String? optionalInfo});

  /// Allows a user to leave a channel.
  ///
  /// After joining a channel, the user must call this method to end the call before joining another channel. This method returns 0 if the user leaves the channel and releases all resources related to the call. This method call is asynchronous, and the user has not exited the channel when the method call returns. Once the user leaves the channel, the SDK triggers the [RtcEngineEventHandler.leaveChannel] callback.
  /// A successful method call triggers the following callbacks:
  /// - The local client: [RtcEngineEventHandler.leaveChannel].
  /// - The remote client: [RtcEngineEventHandler.userOffline], if the user leaving the channel is in the [ChannelProfile.Communication] profile, or is a [ClientRole.Broadcaster] in the [ChannelProfile.LiveBroadcasting] profile.
  ///
  /// **Note**
  /// - If you call the [RtcEngine.destroy] method immediately after calling this method, the `leaveChannel` process interrupts, and the SDK does not trigger the [RtcEngineEventHandler.leaveChannel] callback.
  /// - If you call this method during CDN live streaming, the SDK triggers the [RtcEngine.removePublishStreamUrl] method.
  Future<void> leaveChannel();

  /// Enables interoperability with the BB Web SDK (LiveBroadcasting only).
  ///
  /// The SDK automatically enables interoperability with the Web SDK, so you no longer need to call this method.
  /// If the channel has Web SDK users, ensure that you call this method, or the video of the Native user will be a black screen for the Web user.
  /// Use this method when the channel profile is [ChannelProfile.LiveBroadcasting]. Interoperability with the BB Web SDK is enabled by default when the channel profile is [ChannelProfile.Communication].
  ///
  /// **Parameter** [enabled] Sets whether to enable/disable interoperability with the BB Web SDK:
  /// - `true`: Enable.
  /// - `false`: (Default) Disable.
  @deprecated
  Future<void> enableWebSdkInteroperability(bool enabled);

  /// 通过 JSON 配置 SDK 提供技术预览或特别定制功能。
  /// JSON 选项默认不公开。声网工程师正在努力寻求以标准化方式公开 JSON 选项。
  Future<void> setParameters(String param);

  Future<int> getNetworkTime();

  /// 刷新token
  Future<void> renewToken(String token);

  void registerEventHandler(RtcEngineEventHandler eventHandler);

  void unregisterEventHandler(RtcEngineEventHandler eventHandler);
}

/// 音频相关控制
mixin RtcAudioInterface {
  /// Enables the audio module.
  ///
  /// The audio module is enabled by default.
  ///
  /// **Note**
  /// - This method affects the audio module and can be called after calling the [RtcEngine.leaveChannel] method. You can call this method either before or after joining a channel.
  /// - This method enables the audio module and takes some time to take effect. BB recommends using the following API methods to control the audio engine modules separately:
  ///   - [RtcEngine.enableLocalAudio]: Whether to enable the microphone to create the local audio stream.
  ///   - [RtcEngine.muteLocalAudioStream]: Whether to publish the local audio stream.
  ///   - [RtcEngine.muteRemoteAudioStream]: Whether to subscribe to and play the remote audio stream.
  ///   - [RtcEngine.muteAllRemoteAudioStreams]: Whether to subscribe to and play all remote audio streams.
  Future<void> enableAudio();

  /// Disables the audio module.
  ///
  /// **Note**
  /// - This method affects the audio module and can be called after calling the [RtcEngine.leaveChannel] method. You can call this method either before or after joining a channel.
  /// - This method disables the audio module and takes some time to take effect. BB recommends using the following API methods to control the audio engine module separately:
  ///   - [RtcEngine.enableLocalAudio]: Whether to enable the microphone to create the local audio stream.
  ///   - [RtcEngine.muteLocalAudioStream]: Whether to publish the local audio stream.
  ///   - [RtcEngine.muteRemoteAudioStream]: Whether to subscribe to and play the remote audio stream.
  ///   - [RtcEngine.muteAllRemoteAudioStreams]: Whether to subscribe to and play all remote audio streams.
  Future<void> disableAudio();

  /// Sets the audio parameters and application scenarios.
  ///
  /// **Note**
  /// - You must call this method before calling the joinChannel method.
  /// See [RtcEngine.joinRoom]
  /// - In the Communication and [ChannelProfile.LiveBroadcasting] profiles, the bitrates may be different from your settings due to network self-adaptation.
  /// - In scenarios requiring high-quality audio, we recommend setting profile as [AudioScenario.ShowRoom] and scenario as [AudioScenario.GameStreaming]. For example, for music education scenarios.
  ///
  /// **Parameter** [profile] Sets the sample rate, bitrate, encoding mode, and the number of channels. See [AudioProfile].
  ///
  /// **Parameter** [scenario] Sets the audio application scenarios. Under different audio scenarios, the device uses different volume tracks, i.e. either the in-call volume or the media volume. See [AudioScenario].
  Future<void> setAudioProfile(AudioProfile profile, AudioScenario scenario);

  /// Adjusts the recording volume.
  ///
  /// **Note**
  /// - To avoid echoes and improve call quality, BB recommends setting the value of volume between 0 and 100. If you need to set the value higher than 100, contact support@BB.io first.
  ///
  /// **Parameter** [volume] Recording volume. The value ranges between 0 and 400:
  /// - 0: Mute.
  /// - 100: Original volume.
  /// - 400: (Maximum) Four times the original volume with signal-clipping protection.
  Future<void> adjustRecordingSignalVolume(int volume);

  /// Adjusts the playback volume of a specified remote user.
  ///
  /// You can call this method as many times as necessary to adjust the playback volume of different remote users, or to repeatedly adjust the playback volume of the same remote user.
  ///
  /// **Note**
  /// - Call this method after joining a channel.
  /// - The playback volume here refers to the mixed volume of a specified remote user.
  /// - This method can only adjust the playback volume of one specified remote user at a time. To adjust the playback volume of different remote users, call the method as many times, once for each remote user.
  ///
  /// **Parameter** [uid] ID of the remote user.
  ///
  /// **Parameter** [volume] The playback volume of the specified remote user. The value ranges from 0 to 100:
  /// - 0: Mute.
  /// - 100: The original volume.
  // Future<void> adjustUserPlaybackSignalVolume(int uid, int volume);

  /// Enables/Disables the local audio capture.
  ///
  /// The audio function is enabled by default. This method disables/re-enables the local audio function, that is, to stop or restart local audio capture and processing.
  ///
  /// This method does not affect receiving or playing the remote audio streams, and `enableLocalAudio(false)` is applicable to scenarios where the user wants to receive remote audio streams without sending any audio stream to other users in the channel.
  ///
  /// The SDK triggers the [RtcEngineEventHandler.microphoneEnabled] callback once the local audio function is disabled or re-enabled.
  ///
  /// **Note**
  /// - This method is different from the [RtcEngine.muteLocalAudioStream] method:
  ///   - [RtcEngine.enableLocalAudio]: Disables/Re-enables the local audio capture and processing. If you disable or re-enable local audio recording using the [RtcEngine.enableLocalAudio] method, the local user may hear a pause in the remote audio playback.
  ///   - [RtcEngine.muteLocalAudioStream]: Stops/Continues sending the local audio streams.
  ///
  /// **Parameter** [enabled] Sets whether to disable/re-enable the local audio function:
  /// - `true`: (Default) Re-enable the local audio function, that is, to start local audio capture and processing.
  /// - `false`: Disable the local audio function, that is, to stop local audio capture and processing.
  Future<void> enableLocalAudio(bool enabled);

  /// Stops/Resumes sending the local audio stream.
  ///
  /// A successful [RtcEngine.muteLocalAudioStream] method call triggers the [RtcEngineEventHandler.userMuteAudio] callback on the remote client.
  ///
  /// **Note**
  /// - When muted is set as true, this method does not disable the microphone and thus does not affect any ongoing recording.
  /// - If you call [RtcEngine.setChannelProfile] after this method, the SDK resets whether or not to mute the local audio according to the channel profile and user role. Therefore, we recommend calling this method after the [RtcEngine.setChannelProfile] method.
  ///
  /// **Parameter** [muted] Sets whether to send/stop sending the local audio stream:
  /// - `true`: Stop sending the local audio stream.
  /// - `false`: (Default) Send the local audio stream.
  Future<void> muteLocalAudioStream(bool muted);

  /// 是否静音（关闭麦克风）
  /// 此函数用于控制是否使用采集到的音频数据，静音（关闭）麦克风即采集到数据后就丢弃，此时仍然会
  /// 占用麦克风。 这个只是关闭麦克风采集，不会影响媒体播放器的声音混到推流中。
  Future<void> muteMicrophone(bool mute);

  /// Whether to play locally silently.
  ///
  /// If [enableAux] switch is turned on, there is still sound in the publishing stream. The default is false.
  ///
  /// - [mute] Mute local audio flag, The default is false.
  Future<void> muteLocalMediaPlayer(bool mute);

  Future<void> muteRoom(bool mute);

  /// Stops/Resumes receiving a specified audio stream.
  ///
  /// **Note**
  /// - If you called the [RtcEngine.muteAllRemoteAudioStreams] method and set muted as true to stop receiving all remote video streams, ensure that the [RtcEngine.muteAllRemoteAudioStreams] method is called and set muted as false before calling this method. The [RtcEngine.muteAllRemoteAudioStreams] method sets all remote audio streams, while the [RtcEngine.muteRemoteAudioStream] method sets a specified remote user's audio stream.
  ///
  /// **Parameter** [uid] ID of the specified remote user.
  ///
  /// **Parameter** [muted] Sets whether to receive/stop receiving the specified remote user's audio stream:
  /// - `true`: Stop receiving the specified remote user’s audio stream.
  /// - `false`: (Default) Receive the specified remote user’s audio stream.
  ///
  /// **return**
  /// - 0: 方法调用成功。
  /// - <0: 方法调用失败。
  Future<int> muteRemoteAudioStream(int uid, bool muted);

  /// Stops/Resumes receiving all remote audio streams.
  ///
  /// **Parameter** [muted] Sets whether to receive/stop receiving all remote audio streams:
  /// - `true`: Stop receiving all remote audio streams.
  /// - `false`: (Default) Receive all remote audio streams.
  Future<void> muteAllRemoteAudioStreams(bool muted);

  /// Sets whether to receive all remote audio streams by default.
  ///
  /// You can call this method either before or after joining a channel. If you call [RtcEngine.setDefaultMuteAllRemoteAudioStreams] (true) after joining a channel, you will not receive the audio streams of any subsequent user.
  ///
  /// **Note**
  /// - If you want to resume receiving audio streams, call [RtcEngine.muteRemoteAudioStream] (false), and specify the ID of the remote user that you want to subscribe to. To resume audio streams of multiple users, call [RtcEngine.muteRemoteAudioStream] as many times. Calling [RtcEngine.setDefaultMuteAllRemoteAudioStreams] (false) resumes receiving audio streams of the subsequent users only.
  ///
  /// **Parameter** [muted] Sets whether or not to receive/stop receiving the remote audio streams by default:
  /// - `true`: Stop receiving any audio stream by default.
  /// - `false`: (Default) Receive all remote audio streams by default.
  // Future<void> setDefaultMuteAllRemoteAudioStreams(bool muted);

  /// Enables the [RtcEngineEventHandler.audioVolumeIndication] callback at a set time interval to report on which users are speaking and the speakers' volume.
  ///
  /// Once this method is enabled, the SDK returns the volume indication in the [RtcEngineEventHandler.audioVolumeIndication] callback at the set time interval, regardless of whether any user is speaking in the channel.
  ///
  /// **Parameter** [interval] Sets the time interval between two consecutive volume indications:
  /// - ≤ 0: Disables the volume indication.
  /// - > 0: Time interval (ms) between two consecutive volume indications. We recommend setting interval ≥ 200 ms.
  ///
  /// **Parameter** [smooth] The smoothing factor sets the sensitivity of the audio volume indicator. The value ranges between 0 and 10. The greater the value, the more sensitive the indicator. The recommended value is 3.
  ///
  /// **Parameter** [reportVad]
  /// - `true`: Enable the voice activity detection of the local user. Once it is enabled, the vad parameter of the [RtcEngineEventHandler.audioVolumeIndication] callback reports the voice activity status of the local user.
  /// - `false`: (Default) Disable the voice activity detection of the local user. Once it is disabled, the vad parameter of the [RtcEngineEventHandler.audioVolumeIndication] callback does not report the voice activity status of the local user, except for scenarios where the engine automatically detects the voice activity of the local user.
  Future<void> enableAudioVolumeIndication(int interval, int smooth, bool reportVad);

  /// only for zego
  /// 开启或关闭推流时的虚拟立体声效果
  /// [enable] true 代表开启虚拟立体声，false 代表关闭虚拟立体声
  /// [angle] 虚拟立体声中声源的角度，范围为 -1 ~ 360，90 为正前方，0 / 180 / 270 分别对应最右边 / 最左边 / 正后方；特别的，设置 -1 时为全方位虚拟立体声效果
  Future<void> enableVirtualStereo(bool enable, int angle);

  /// Sets the blacklist of subscribe remote stream audio.
  ///
  /// [uidList] The id list of users who do not subscribe to audio.
  /// If uid is in uidList, the remote user's audio will not be subscribed,
  /// even if muteRemoteAudioStream(uid, false) and muteAllRemoteAudioStreams(false) are operated
  /// return 0: Success, < 0: Failure
  Future<void> setSubscribeAudioBlacklist({required List<int> uidList, required int uidNumber});
}

/// 杂七杂八
mixin RtcExtraInterface {
  /// 是否开启允许Vad（语音活动检测）切换ClientRole，主播角色成本较高，通过此方法节省成本
  late bool enableVad;

  /// 设置Vad检测间隔
  setVadCheckInterval(int second);

  /// 切换到背景音乐模式，该模式下，闭麦操作，不会关闭本地流的传输，
  /// 只是麦克风将不会被采集，可以播放本机音乐
  late bool openBackgroundMode;

  /// 设置当前是否静音
  Future<void> setMute(bool mute);

  RtcUseDelegate? useDelegate;
}

/// 模拟子频道
mixin RtcSimulateChannelInterface {
  /// 通过单频道模拟实现多频道效果,包含公有频道和私有频道.
  /// 私有频道可以决定是否收听公有频道，公有频道不会收听私有频道.
  /// [pubChannel] 公有频道.
  Future<void> setSubPubChannel(SubChannel pubChannel);

  /// 通过单频道模拟实现多频道效果,包含公有频道和私有频道.
  /// 私有频道可以决定是否收听公有频道，公有频道不会收听私有频道.
  /// [subChannels] 私有频道.
  Future<void> setSubPrivateChannel(List<SubChannel>? subChannels);

  /// 同步当前频道内部子频道音频收听状态
  Future<void> syncSubChannelStreamState();
}

/// 视频控制相关
mixin RtcVideoInterface {
  /// Enables the video module.
  ///
  /// You can call this method either before joining a channel or during a call. If you call this method before joining a channel, the service starts in the video mode. If you call this method during an audio call, the audio mode switches to the video mode.
  ///
  /// A successful enableVideo method call triggers the [RtcEngineEventHandler.userEnableVideo] (true) callback on the remote client.
  ///
  /// To disable the video, call the [RtcEngine.disableVideo] method.
  ///
  /// **Note**
  /// - This method affects the internal engine and can be called after calling the [RtcEngine.leaveChannel] method. You can call this method either before or after joining a channel.
  /// - This method resets the internal engine and takes some time to take effect. We recommend using the following API methods to control the video engine modules separately:
  ///   - [RtcEngine.enableLocalVideo]: Whether to enable the camera to create the local video stream.
  ///   - [RtcEngine.muteLocalVideoStream]: Whether to publish the local video stream.
  ///   - [RtcEngine.muteRemoteVideoStream]: Whether to subscribe to and play the remote video stream.
  ///   - [RtcEngine.muteAllRemoteVideoStreams]: Whether to subscribe to and play all remote video streams.
  Future<void> enableVideo();

  /// Disables the video module.
  ///
  /// You can call this method before joining a channel or during a call. If you call this method before joining a channel, the service starts in audio mode. If you call this method during a video call, the video mode switches to the audio mode.
  /// - A successful disableVideo method call triggers the [RtcEngineEventHandler.userEnableVideo] (false) callback on the remote client.
  /// - To enable the video mode, call the [RtcEngine.enableVideo] method.
  ///
  /// **Note**
  /// - This method affects the internal engine and can be called after calling the [RtcEngine.leaveChannel] method. You can call this method either before or after joining a channel.
  /// - This method resets the internal engine and takes some time to take effect. We recommend using the following API methods to control the video engine modules separately:
  ///   - [RtcEngine.enableLocalVideo]: Whether to enable the camera to create the local video stream.
  ///   - [RtcEngine.muteLocalVideoStream]: Whether to publish the local video stream.
  ///   - [RtcEngine.muteRemoteVideoStream]: Whether to subscribe to and play the remote video stream.
  ///   - [RtcEngine.muteAllRemoteVideoStreams]: Whether to subscribe to and play all remote video streams.
  Future<void> disableVideo();

  /// Starts the local video preview before joining a channel.
  ///
  /// Before calling this method, you must:
  /// - Create the RtcLocalView.
  ///   - (Android only) See [TextureView] and [SurfaceView].
  ///   - (iOS only) See [UIView](https://developer.apple.com/documentation/uikit/uiview).
  /// - Call the [RtcEngine.enableVideo] method to enable the video.
  ///
  /// **Note**
  /// - By default, the local preview enables the mirror mode.
  /// - Once you call this method to start the local video preview, if you leave the channel by calling the [RtcEngine.leaveChannel] method, the local video preview remains until you call the [RtcEngine.stopPreview] method to disable it.
  Future<void> startPreview();

  /// Stops the local video preview and the video.
  Future<void> stopPreview();

  /// 开启/关闭本地视频采集。
  ///
  /// 该方法禁用或重新启用本地视频采集。不影响接收远端视频。
  ///
  /// 调用 RtcEngine.enableVideo 后，本地视频即默认开启。 你可以调用 RtcEngine.enableVideo (false) 关闭本地视频采集。关闭后如果想重新开启，则可调用 RtcEngine.enableVideo (true)。
  ///
  /// 成功禁用或启用本地视频采集后，远端会触发 RtcEngineEventHandler.userEnableLocalVideo 回调。
  ///
  /// Note
  ///
  /// 该方法设置的是内部引擎为启用或禁用状态，在 RtcEngine.leaveChannel 后仍然有效。
  ///
  /// Parameter enabled 是否启用本地视频：
  ///
  /// true：开启本地视频采集和渲染（默认）。
  /// false: 关闭使用本地摄像头设备。关闭后， 远端用户会接收不到本地用户的视频流；但本地用户依然可以接收远端用户的视频流。设置为 false 时，该方法不需要本地有摄像头。
  Future<void> enableLocalVideo(bool enabled);

  /// Stops/Resumes receiving all remote video streams.
  ///
  /// **Parameter** [muted] Sets whether to receive/stop receiving all remote video streams:
  /// - `true`: Stop receiving all remote video streams.
  /// - `false`: (Default) Receive all remote video streams.
  Future<void> muteAllRemoteVideoStreams(bool muted);

  ///设置视频编码属性。
  //
  // 该方法设置视频编码属性。每个属性对应一套视频参数，如分辨率、帧率、码率、视频方向等。 所有设置的参数均为理想情况下的最大值。当视频引擎因网络环境等原因无法达到设置的分辨率、帧率或码率的最大值时，会取最接近最大值的那个值。
  //
  // 如果用户加入频道后不需要重新设置视频编码属性，则 Agora 建议在 enableVideo 前调用该方法，可以加快首帧出图的时间。
  //
  // Parameters
  // config: VideoEncoderConfiguration
  // 视频编码属性
  //
  // Returns number
  // 0：方法调用成功
  // < 0：方法调用失败
  Future<void> setVideoEncoderConfiguration(VideoEncoderConfiguration config);

  Widget createVideoRenderWidget(int uid,
      {bool local = false, int facing = 0, Map<String, dynamic> args = const <String, dynamic>{}});

  Future<void> muteLocalVideoStream(bool muted);

  /// 是否开启自采集模板，使用美颜需要开启自采集
  /// [params]，自采集相关参数设置，key及默认值：
  /// {"capture_width", 1280， "capture_height", 720， "capture_frame_rate", 24}
  Future<void> enableCustomCaptureRender(bool enabled, {VideoEncoderConfiguration? config});

  /// 自采集开始采集摄像头数据
  Future<void> startCustomCapture();

  /// 自采集停止采集摄像头数据
  Future<void> stopCustomCapture();

  /// 是否开启美颜Source设置
  Future<bool> setBeauty(bool enableBeauty);
}

/// 视频双流模式控制
mixin RtcDualStreamInterface {
  /// Enables/Disables the dual video stream mode.
  ///
  /// If dual-stream mode is enabled, the receiver can choose to receive the high stream (high-resolution high-bitrate video stream) or low stream (low-resolution low-bitrate video stream) video.
  ///
  /// **Parameter** [enabled] Sets the stream mode:
  /// - `true`: Dual-stream mode.
  /// - `false`: (Default) Single-stream mode.
  Future<void> enableDualStreamMode(bool enabled);

  /// Sets the stream type of the remote video.
  ///
  /// Under limited network conditions, if the publisher has not disabled the dual-stream mode using [RtcEngine.enableDualStreamMode] (false), the receiver can choose to receive either the high-video stream (the high resolution, and high bitrate video stream) or the low-video stream (the low resolution, and low bitrate video stream).
  ///
  /// By default, users receive the high-video stream. Call this method if you want to switch to the low-video stream. This method allows the app to adjust the corresponding video stream type based on the size of the video window to reduce the bandwidth and resources.
  ///
  /// The aspect ratio of the low-video stream is the same as the high-video stream. Once the resolution of the high-video stream is set, the system automatically sets the resolution, frame rate, and bitrate of the low-video stream.
  ///
  /// The SDK reports the result of calling this method in the [RtcEngineEventHandler.apiCallExecuted] callback.
  ///
  /// **Parameter** [uid] ID of the remote user sending the video stream.
  ///
  /// **Parameter** [streamType] Sets the video-stream type. See [VideoStreamType].
  Future<void> setRemoteVideoStreamType(int uid, VideoStreamType streamType);

  /// Sets the default video-stream type of the remotely subscribed video stream when the remote user sends dual streams.
  ///
  /// You can call this method either before or after joining a channel.
  /// If you call both [setRemoteVideoStreamType] and [setRemoteDefaultVideoStreamType], the SDK applies the settings in the [setRemoteVideoStreamType] method.
  ///
  /// **Parameter** [streamType] Sets the default video-stream type. See [VideoStreamType].
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType);
}

/// 混流控制，即播放音乐 相关
mixin RtcAudioMixingInterface {
  /// 开始播放音乐文件及混音。
  ///
  /// 该方法指定本地或在线音频文件来和麦克风采集的音频流进行混音或替换。替换是指用音频文件替换麦克风采集的音频流。 该方法可以选择是否让对方
  /// 听到本地播放的音频，并指定循环播放的次数。 成功调用该方法后，本地会触发 RtcEngineEventHandler.audioMixingStateChanged 回调且
  /// 状态码为 AudioMixingStateCode.Playing。 播放结束后，会收到 RtcEngineEventHandler.audioMixingStateChanged 回调且状态码为
  /// AudioMixingStateCode.Stopped。
  ///
  /// 该方法在 Android 和 iOS 均可调用。如需在 Android 平台调用该方法，请确保使用 Android 4.2 或以上设备，且 API Level ≥ 16。
  /// 请在频道内调用该方法，如果在频道外调用该方法可能会出现问题。
  /// 如果播放的是在线音乐文件，请确保重复调用该 API 的间隔超过 100 ms，否则 SDK 会返回 TooFrequentCall(702) 警告码， 表示音乐文件打开过于频繁。
  /// 如果播放的是在线音乐文件，Agora 建议不要使用重定向地址。重定向地址在某些机型上可能会出现无法打开的情况。
  /// 如果本地音乐文件不存在、文件格式不支持、无法访问在线音乐文件 URL 都会返回警告码 CanNotOpen(701)。
  /// 如果在模拟器上使用该 API，暂时只支持存放在 /sdcard/ 中的 mp3 文件。
  ///
  /// [path] 指定需要混音的本地或在线音频文件的绝对路径（包含文件名后缀），如 /sdcard/emulated/0/audio.mp4。
  /// 支持的音频格式包括：mp3、mp4、m4a、aac、3gp、mkv 及 wav。
  /// 如果用户提供的目录以 /assets/ 开头，则去 assets 里面查找该文件。
  /// 如果用户提供的目录不是以 /assets/ 开头，一律认为是在绝对路径里查找该文件。
  ///
  /// [noPublish]
  /// true：只有本地可以听到混音或替换后的音频流。
  /// false：本地和对方都可以听到混音或替换后的音频流。
  ///
  /// [noMixMic]
  /// true：只推动设置的本地音频文件或者线上音频文件，不传输麦克风收录的音频。
  /// false：音频文件内容将会和麦克风采集的音频流进行混音。
  ///
  /// [cycle] 音频文件循环播放的次数：
  /// 正整数：循环的次数。
  /// 1 : 播放一次
  /// -1：无限循环。
  ///
  /// Parameter startPos 音乐文件的播放位置，单位为毫秒。
  /// [resourceID] 版权音乐资源id
  ///
  Future<void> startAudioMixing(int id, String path, bool noPublish, bool noMixMic,
      {int cycle = 1, int startPos = 0, String? resourceID});

  /// Stops playing or mixing the music file.
  ///
  /// Call this method when you are in a channel.
  Future<void> stopAudioMixing(int id);

  /// Pauses playing and mixing the music file.
  ///
  /// Call this method when you are in a channel.
  Future<void> pauseAudioMixing(int id);

  /// Resumes playing and mixing the music file.
  ///
  /// Call this method when you are in a channel.
  Future<void> resumeAudioMixing(int id);

  /// Adjusts the volume of audio mixing.
  ///
  /// Call this method when you are in a channel.
  ///
  /// **Note**
  /// - Calling this method does not affect the volume of the audio effect file playback invoked by the [RtcEngine.playEffect] method.
  ///
  /// **Parameter** [volume] Audio mixing volume. The value ranges between 0 and 100 (default).
  Future<void> adjustAudioMixingVolume(int id, int volume);

  /// Gets the duration (ms) of the music file.
  ///
  /// Call this method when you are in a channel.
  ///
  /// **Returns**
  /// - The audio mixing duration, if this method call is successful.
  /// - < 0: Failure.
  Future<int> getAudioMixingDuration(String path);

  /// Gets the playback position (ms) of the music file.
  ///
  /// Call this method when you are in a channel.
  ///
  /// **Returns**
  /// - The current playback position of the audio mixing file, if this method call is successful.
  /// - < 0: Failure.
  Future<int> getAudioMixingCurrentPosition(int id);

  /// Sets the playback position (ms) of the music file to a different starting position (the default plays from the beginning).
  ///
  /// **Parameter** [pos] The playback starting position (ms) of the audio mixing file.
  Future<void> setAudioMixingPosition(int id, int pos);

  /// Sets the pitch of the local music file.
  ///
  /// When a local music file is mixed with a local human voice, call this method to set the pitch of the local music file only.
  ///
  /// **Note**
  /// - Call this method after calling [RtcEngine.startAudioMixing].
  /// - Call this method after calling [startAudioMixing] and receiving the `audioMixingStateChanged(Playing)` callback.
  ///
  /// **Parameter** [pitch] Sets the pitch of the local music file by chromatic scale. The default value is 0, which means keep the original pitch. The value ranges from -12 to 12, and the pitch value between consecutive values is a chromatic value. The greater the absolute value of this parameter, the higher or lower the pitch of the local music file.
  Future<void> setAudioMixingPitch(int pitch);

  /// 设置音轨的, only for zego
  Future<void> setAudioTrackIndex(int index);

  /// 获取音轨个数
  Future<int> audioTrackCount();

  Future<void> setAudioTrackMode(int index);
}

/// 连麦相关
mixin RtcMediaRelayInterface {
  /// Starts to relay media streams across channels.
  ///
  /// After a successful method call, the SDK triggers the [RtcEngineEventHandler.channelMediaRelayStateChanged] and [RtcEngineEventHandler.channelMediaRelayEvent] callbacks, and these callbacks return the state and events of the media stream relay.
  /// - If the [RtcEngineEventHandler.channelMediaRelayStateChanged] callback returns [ChannelMediaRelayState.Running] and [ChannelMediaRelayError.None], and the [RtcEngineEventHandler.channelMediaRelayEvent] callback returns [ChannelMediaRelayEvent.SentToDestinationChannel], the SDK starts relaying media streams between the original and the destination channel.
  /// - If the [RtcEngineEventHandler.channelMediaRelayStateChanged] callback returns [ChannelMediaRelayState.Failure], an exception occurs during the media stream relay.
  ///
  /// **Note**
  /// - Contact sales-us@BB.io before implementing this function.
  /// - We do not support string user accounts in this API.
  /// - Call this method after the [RtcEngine.joinRoom] method.
  /// - This method takes effect only when you are a [ClientRole.Broadcaster] in a [ChannelProfile.LiveBroadcasting] channel.
  /// - After a successful method call, if you want to call this method again, ensure that you call the [RtcEngine.stopChannelMediaRelay] method to quit the current relay.
  ///
  /// **Parameter** [channelMediaRelayConfiguration] The configuration of the media stream relay.
  Future<void> startChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration);

  /// Updates the channels for media relay.
  ///
  /// After the channel media relay starts, if you want to relay the media stream to more channels, or leave the current relay channel, you can call the `updateChannelMediaRelay` method.
  ///
  /// After a successful method call, the SDK triggers the [RtcEngineEventHandler.channelMediaRelayEvent] callback with the [ChannelMediaRelayEvent.UpdateDestinationChannel] state code.
  ///
  /// **Note**
  /// - Call this method after the [RtcEngine.startChannelMediaRelay] method to update the destination channel.
  /// - This method supports adding at most four destination channels in the relay. If there are already four destination channels in the relay.
  ///
  /// **Parameter** [channelMediaRelayConfiguration] The media stream relay configuration. See [ChannelMediaRelayConfiguration].
  Future<void> updateChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration);

  /// 获取当前Relay Config，目前只支持Agora单主播.
  ChannelMediaRelayConfiguration? getMediaRelayConfiguration();

  /// 判断当前是否连麦成功，目前只支持Agora单主播.
  bool isMediaReplaySuccess(String destRid);

  /// 同步拉取当前的外部流,一般用于跨房间的连麦操作
  Future<void> syncPullExtraStream(List<UserStream>? streamList);

  /// Stops the media stream relay.
  ///
  /// Once the relay stops, the broadcaster quits all the destination channels.
  ///
  /// After a successful method call, the SDK triggers the [RtcEngineEventHandler.channelMediaRelayStateChanged] callback. If the callback returns [ChannelMediaRelayState.Idle] and [ChannelMediaRelayError.None], the [ClientRole.Broadcaster] successfully stops the relay.
  ///
  /// **Note**
  /// - If the method call fails, the SDK triggers the [RtcEngineEventHandler.channelMediaRelayStateChanged] callback with the [ChannelMediaRelayError.ServerNoResponse] or [ChannelMediaRelayError.ServerConnectionLost] state code. You can leave the channel by calling the [RtcEngine.leaveChannel] method, and the media stream relay automatically stops.
  Future<void> stopChannelMediaRelay();
}

/// 音频输出相关
mixin RtcAudioRouteInterface {
  /// Sets the default audio playback route.
  ///
  /// This method sets whether the received audio is routed to the earpiece or speakerphone by default before joining a channel. If a user does not call this method, the audio is routed to the earpiece by default. If you need to change the default audio route after joining a channel, call the [RtcEngine.setEnableSpeakerphone] method.
  /// The default audio route for each scenario:
  /// - In the [ChannelProfile.Communication] profile:
  ///   - For a voice call, the default audio route is the earpiece.
  ///   - For a video call, the default audio route is the speaker. If the user disables the video using [RtcEngine.disableVideo], or [RtcEngine.muteLocalVideoStream] and [RtcEngine.muteAllRemoteVideoStreams], the default audio route automatically switches back to the earpiece.
  /// - In the [ChannelProfile.LiveBroadcasting] profile: The default audio route is the speaker.
  /// See [ChannelProfile.LiveBroadcasting]
  ///
  /// **Note**
  /// - This method applies to the [ChannelProfile.Communication] profile only.
  /// - Call this method before the user joins a channel.
  ///
  /// **Parameter** [defaultToSpeaker] Sets the default audio route:
  /// - `true`: Route the audio to the speaker. If the playback device connects to the earpiece or Bluetooth, the audio cannot be routed to the earpiece.
  /// - `false`: (Default) Route the audio to the earpiece. If a headset is plugged in, the audio is routed to the headset.
  Future<void> setDefaultAudioRouteToSpeakerPhone(bool defaultToSpeaker);

  /// Enables/Disables the audio playback route to the speakerphone.
  ///
  /// This method sets whether the audio is routed to the speakerphone or earpiece. After calling this method, the SDK returns the [RtcEngineEventHandler.audioRouteChanged] callback to indicate the changes.
  ///
  /// **Note**
  /// - Ensure that you have successfully called the [RtcEngine.joinRoom] method before calling this method.
  /// - This method is invalid for audience users in the [ChannelProfile.LiveBroadcasting] profile.
  ///
  /// **Parameter** [enabled] Sets whether to route the audio to the speakerphone or earpiece:
  /// - `true`: Route the audio to the speakerphone. If the playback device connects to the earpiece or Bluetooth, the audio cannot be routed to the speakerphone.
  /// - `false`: Route the audio to the earpiece. If the headset is plugged in, the audio is routed to the headset.
  Future<void> setEnableSpeakerphone(bool enabled);

  /// 获取当前音频输出设备
  Future<AudioOutputRouting> getAudioRouteType();
}

/// 耳返相关
mixin RtcEarMonitoringInterface {
  /// Enables in-ear monitoring.
  ///
  /// **Parameter** [enabled] Sets whether to enable/disable in-ear monitoring:
  /// - `true`: Enable.
  /// - `false`: (Default) Disable.
  Future<void> enableInEarMonitoring(bool enabled);

  /// Sets the volume of the in-ear monitor.
  ///
  /// **Parameter** [volume] Sets the volume of the in-ear monitor. The value ranges between 0 and 100 (default).
  Future<void> setInEarMonitoringVolume(int volume);
}

/// 摄像头切换
mixin RtcCameraInterface {
  /// Switches between front and rear cameras.
  Future<void> switchCamera();
}

/// 音效相关
mixin RtcVoiceChangerInterface {
  /// 设置变声
  /// [pitch] 语音频率。调用者更具当前的引擎自己设置不同的取值范围
  /// 声网：可以在[0.5, 2.0] 范围内设置。取值越小，则音调越低。默认值为 1.0，表示不需要修改音调。
  /// Zego：可以在[-8.0, 8.0] 范围内设置。取值越小，则音调越低。默认值为0，表示不需要修改音调。
  /// trtc:[-1.0,1.0],范围内设置。取值越小，则音调越低。默认值为0，表示不需要修改音调。
  /// [equalization]本地语音音效均衡 频谱子带索引，取值范围是 [0-9]，分别代表 10 个频带，对应的中心频率是 [31，62，125，250，500，1k，2k，4k，8k，16k] Hz
  /// 每个 band 的增益，单位是 dB，每一个值的范围是 [-15，15]，默认值为 0
  Future<void> setVoiceProfile({double? pitch, List<double>? equalization});

  /// 播放音效
  /// [soundId]	音效的 ID。每个音效均有唯一的 ID。如果你已通过 preloadEffect 将音效加载至内存，确保这里的 soundID 与 preloadEffect 设置的 soundId 相同。
  /// [filePath]	待播放的音效文件的绝对路径或URL地址。如 /sdcard/emulated/0/audio.mp4。建议填写文件后缀名。若无法确定文件后缀名，可不填。
  /// [loopCount]	音效循环播放的次数：
  /// * 0：播放音效一次
  /// * 1：播放音效两次
  /// * -1：无限循环播放音效，直至调用 stopEffect 或 stopAllEffects 后停止。
  /// [pitch]	音效的音调，取值范围为 [0.5, 2]。默认值为 1.0，表示不需要修改音调。取值越小，则音调越低。
  /// [pan]	音效的空间位置。取值范围为 [-1.0, 1.0]：
  /// * 0.0：音效出现在正前方
  /// * 1.0：音效出现在右边
  /// * -1.0：音效出现在左边
  /// [gain]	单个音效的音量。取值范围为 [0.0, 100.0]。默认值为 100.0。取值越小，则音效的音量越低
  /// [publish]	是否将音效传到远端：
  /// * true：音效在本地播放的同时，会发布到云上，因此远端用户也能听到该音效
  /// * false：音效不会发布到云上，因此只能在本地听到该音效
  Future<void> playEffect(
      {int soundId = 0,
      required String filePath,
      int loopCount = 0,
      double pitch = 1,
      double pan = 0,
      double gain = 100,
      int publish = 1});

  ///将音效文件预加载至内存。
  //
  // 支持音频格式为 mp3、mp4、m4a、aac、3gp、mkv 和 wav。
  //
  // Note
  //
  // 该方法不支持预加载在线音效文件。
  // 为保证通话流畅度，请注意控制音效文件的大小。Agora 推荐你在加入频道前调用该方法。
  // [soundId] 音效文件的 ID。
  //
  // [filePath] 音效文件的绝对路径。
  Future<void> preloadEffect(int soundId, String filePath);

  ///从内存释放指定的预加载音效文件。
  //
  // [soundId] 音效文件的 ID。每个音效均有唯一的 ID。
  Future<void> unloadEffect(int soundId);

  /// 停止指定的音效
  Future<void> stopEffect(int soundId);

  /// 停止所有音效
  Future<void> stopAllEffects();

  /// 设置 SDK 预设的人声音效。
  ///
  /// 自从
  /// v3.2.0
  /// 调用该方法可以为本地发流用户设置 SDK 预设的人声音效，且不会改变原声的性别特征。设置音效后，频道 内所有用户都能听到该效果。
  ///
  /// 根据不同的场景，你可以为用户设置不同的音效，各音效的适用场景可参考《设置人声效果》。
  ///
  /// 为获取更好的人声效果，Agora 推荐你在调用该方法前将 setAudioProfile 的 scenario 设为 AUDIO_SCENARIO_GAME_STREAMING(3)。
  ///
  /// 注解
  /// 该方法在加入频道前后都能调用。
  /// 请勿将 setAudioProfile 的 profile 参数设置为 AUDIO_PROFILE_SPEECH_STANDARD(1)，否则该方法不生效。
  /// 该方法对人声的处理效果最佳，Agora 不推荐调用该方法处理含音乐的音频数据。
  /// 如果调用该方法并设置除 ROOM_ACOUSTICS_3D_VOICE 或 PITCH_CORRECTION 外的枚举，请勿再调用 setAudioEffectParameters，否则该方法设置的效果会被覆盖。
  /// 调用该方法后，Agora 不推荐调用以下方法，否则该方法设置的效果会被覆盖：
  /// setVoiceBeautifierPreset
  /// setLocalVoiceReverbPreset
  /// setLocalVoiceChanger
  /// setLocalVoicePitch
  /// setLocalVoiceEqualization
  /// setLocalVoiceReverb
  /// setVoiceBeautifierParameters
  /// setVoiceConversionPreset
  ///
  /// **Parameter** [preset] The options for SDK preset audio effects. See [AudioEffectPreset].
  Future<void> setAudioEffectPreset(AudioEffectPreset preset);

  Future<void> setReverbAdvancedParam(ReverbAdvancedParam param);

  Future<void> setReverbEchoParam(ReverbEchoParam param);

  Future<void> setElectronicEffects(bool enable, ElectronicEffectsMode mode, int tonal);
}

/// RTC 服务回调抽象
mixin RtcEventAddHandlerInterface {
  addConnectionStateChangeCallback(ConnectionStateCallback callback);

  removeConnectionStateChangeCallback(ConnectionStateCallback callback);

  addWarningCallback(WarningCallback callback);

  removeWarningCallback(WarningCallback callback);

  addErrorCallback(ErrorCallback callback);

  removeErrorCallback(ErrorCallback callback);

  addAudioVolumeIndicationCallback(AudioVolumeCallback callback);

  removeAudioVolumeIndicationCallback(AudioVolumeCallback callback);

  addMixingStateChangedCallback(AudioMixingStateCallback callback);

  removeMixingStateChangedCallback(AudioMixingStateCallback callback);

  addUserJoinedCallback(UidWithElapsedCallback callback);

  removeUserJoinedCallback(UidWithElapsedCallback callback);

  addUserOffline(UserOfflineCallback callback);

  removeUserOffline(UserOfflineCallback callback);

  addFirstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback);

  removeFirstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback);

  addAudioRouteCallback(AudioRouteCallback callback);

  removeAudioRouteCallback(AudioRouteCallback callback);

  addLocalAudioStateChangeCallback(LocalAudioStateChangeCallback callback);

  removeLocalAudioStateChangeCallback(LocalAudioStateChangeCallback callback);

  addCaptureDataRecordStateCallback(CapturedDataRecordStateUpdate callback);

  removeCaptureDataRecordStateCallback(CapturedDataRecordStateUpdate callback);

  addPlayerRecvSEICallback(PlayerRecvSEICallback callback);

  removePlayerRecvSEICallback(PlayerRecvSEICallback callback);

  addNetworkQualityCallback(NetworkQualityCallback callback);

  removeNetworkQualityCallback(NetworkQualityCallback callback);
}

/// RTC 服务回调抽象
mixin RtcEventSetHandlerInterface {
  connectionStateChangeCallback(ConnectionStateCallback callback);

  warningCallback(WarningCallback callback);

  errorCallback(ErrorCallback callback);

  audioVolumeIndicationCallback(AudioVolumeCallback callback);

  mixingStateChangedCallback(AudioMixingStateCallback callback);

  userJoinedCallback(UidWithElapsedCallback callback);

  userOffline(UserOfflineCallback callback);

  firstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback);

  audioRouteCallback(AudioRouteCallback callback);

  localAudioStateCallback(LocalAudioStateChangeCallback callback);

  captureDataRecordStateCallback(CapturedDataRecordStateUpdate callback);

  playerRecvSEICallback(PlayerRecvSEICallback callback);

  networkQualityCallback(NetworkQualityCallback callback);
}

/// 录音相关
mixin RtcRecordingInterface {
  /// 开始录制音频
  Future<void> startRecordingCapturedData(RecordConfig config);

  Future<void> stopRecordingCapturedData();

  /// 该方法设置 onRecordAudioFrame 回调的采集音频格式
  /// [sampleRate] 指定 onRecordAudioFrame 中返回数据的采样率，可设置为 8000、 16000、 32000、 44100 或 48000
  /// [channel] 指定 onRecordAudioFrame 中返回数据的通道数，可设置为 1: 单声道 2: 双声道
  /// [mode] onRecordAudioFrame 回调的使用模式: RAW_AUDIO_FRAME_OP_MODE_TYPE
  /// [samplesPerCall]	指定 onRecordAudioFrame 中返回数据的采样点数，如 RTMP/RTMPS 推流应用中通常为 1024
  Future<void> setRecordingAudioFrameParameters({int? sampleRate, int? channel, int? mode, int? samplesPerCall});

  /// 设置监听原始音频数据
  /// [callback] 设置为null取消监听
  setAudioDataHandler(CapturedAudioFrameCallback? callback);

  /// 注册原始音频回调
  Future<void> registerAudioFrameObserver({int? uid, int? rid});

  /// 取消注册原始音频回调
  Future<void> unRegisterAudioFrameObserver();
}

/// AME（腾讯音乐）接口
mixin AMEMusicInterface {
  Future<void> setAMELicense(String licenseUrl, String key);

  Future<void> initAME();

  Future<void> destroyAME();

  Future<void> preloadAMEMusic(String musicId, String playToken);

  Future<void> cancelPreloadAMEMusic(String musicId);

  Future<bool> isAMEMusicPreloaded(String musicId);

  Future<String> genAMEMusicURI(String musicId, int musicType);

  Future<void> clearAMEMusicCache();

  Future<void> setAMEMusicCacheMaxCount(int maxCount);

  Future<void> setAMEDownloadListener(AMEListener listener);

  Future<void> setVoiceReverbType(int type);

  Future<void> setRemoteRobotListener(RemoteRobotListener listener);

  Future<void> setRemoteRobotUserId(int remoteRobotUserId);

  /// 原唱
  static int musicTypeOrigin = 0;

  /// 伴奏
  static int musicTypeAccompany = 1;

  /// 歌词
  static int musicTypeLyric = 2;
}

/// 媒体增强接口 only for zego
mixin MediaExtraInterface {
  /// Zego 引入
  /// 发送媒体增强补充信息。
  /// 接口详情
  /// 详情描述: 在推流传输音视频流数据同时，发送流媒体增强补充信息来同步一些其他附加信息。
  /// 业务场景: 一般用于如同步音乐歌词或视频画面精准布局等场景，可选择使用发送 SEI。
  /// 调用时机: 在开始推流[startPublishingStream] 后。
  /// 相关接口: 当推流方发送 SEI 后，拉流方可通过监听 [onPlayerRecvSEI] 的回调获取 SEI 内容。
  /// 使用限制: 1 秒钟不要超过30次，SEI 数据长度限制为 4096 字节。
  /// 注意事项: 由于 SEI 信息跟随视频帧，由于网络问题有可能丢帧，因此 SEI 信息也有可能丢，为解决这种情况，应该在限制频率内多发几次。
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType});
}

/// 声网点歌接口
mixin AgoraMusicInterface {
  Future<bool> isAgoraMusicPreloaded(int songCode);

  Future<void> preloadAgoraMusic(int songCode);

  Future<String> getAgoraLyric(String songCode);

  Future<void> initMusicContentCenter(String appId, String rtmToken, int uid);

  Future<void> setAgoraMusicLyricCallback(AgoraMusicLyricCallback callback);

  Future<void> setAgoraMusicPreloadCallback(AgoraMusicPreloadCallback callback);
}

mixin ZegoMusicInterface {
  Future<void> preloadMusic(String songCode, String resourceId);

  Future<ZegoMusicResource?> requestResource(String songID, {int resourceType = 1, bool useCache = true});

  void setMusicDownloadCallback(ZegoMusicDownloadProgress? callback);

  Future<bool> isMusicPreloaded(String songCode);

  Future<String> getLyric(String songCode);
}
