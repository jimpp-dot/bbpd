import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

enum RtcEngineEnum {
  Agora,
  Zego,
  bbrtc, /// 自研
  Tencent,
  undefined,
}

extension RtcEngineEnumExt on RtcEngineEnum {
  String name() {
    return describeEnum(this);
  }
}

RtcEngineEnum parseEngine(String? name) {
  if (name == null || name.trim().isEmpty) return RtcEngineEnum.undefined;
  return RtcEngineEnum.values.firstWhere((element) => element.name().toLowerCase() == name.toLowerCase(),
      orElse: () => RtcEngineEnum.undefined);
}

/// The area of connection.
enum AreaCode {
  /// Mainland China
  @JsonValue(0x00000001)
  CN,

  /// North America
  @JsonValue(0x00000002)
  NA,

  /// Europe
  @JsonValue(0x00000004)
  EU,

  /// Asia, excluding Mainland China
  @JsonValue(0x00000008)
  AS,

  /// Japan
  @JsonValue(0x00000010)
  JP,

  /// India
  @JsonValue(0x00000020)
  IN,

  /// (Default) Global
  @JsonValue(-1)
  GLOB,
}

/// The error code of the audio mixing file.
enum AudioMixingReason {
  /// The SDK cannot open the audio mixing file.
  @JsonValue(701)
  CanNotOpen,

  /// The SDK opens the audio mixing file too frequently.
  @JsonValue(702)
  TooFrequentCall,

  /// The opening of the audio mixing file is interrupted.
  @JsonValue(703)
  InterruptedEOF,

  /// 720: The audio mixing is started by user
  @JsonValue(720)
  StartedByUser,

  /// 721: The audio mixing file is played once
  @JsonValue(721)
  OneLoopCompleted,

  /// 722: The audio mixing file is playing in a new loop
  @JsonValue(722)
  StartNewLoop,

  /// 723: The audio mixing file is all played out
  @JsonValue(723)
  AllLoopsCompleted,

  /// 724: Playing of audio file is stopped by user
  @JsonValue(724)
  StoppedByUser,

  /// 725: Playing of audio file is paused by user
  @JsonValue(725)
  PausedByUser,

  /// 726: Playing of audio file is resumed by user
  @JsonValue(726)
  ResumedByUser,

  /// No error.
  @JsonValue(0)
  OK,

  /// 未知
  @JsonValue(-1)
  UnKnown,
}

enum AudioPendingState {
  // inited, //释放初始化过，设置过播放url.
  playing, // 正在播放
  paused, // 暂停播放
  completed, // 播放完成
  Failed, // 播放出错
  release, // 释放播放器
}

/// The state of the audio mixing file.
enum AudioMixingStateCode {
  @JsonValue(-1)
  UnKnown,

  /// The audio mixing file is playing.
  /// for Agora.
  /// The music file is playing. This state comes with one of the following associated reasons:
  /// - `StartedByuser(720)`
  /// - `LoopCompleted(721)`
  /// - `NewLoop(722)`
  /// - `ResumedByUser(726)`
  @JsonValue(710)
  Playing,

  /// The audio mixing file pauses playing.
  @JsonValue(711)
  Paused,

  /// The music file stops playing. This state comes with one of the following associated reasons:
  /// for Agora
  /// - `AllLoopsCompleted(723)`
  /// - `StoppedByUser(724)`
  @JsonValue(-2)
  Stopped,

  @JsonValue(713)
  PlayEnded,

  /// An exception occurs when playing the audio mixing file.
  /// for Agora
  /// An exception occurs during the playback of the music file. This state comes with one of the following associated reasons:
  /// - `CanNotOpen(701)`
  /// - `TooFrequentCall(702)`
  /// - `InterruptedEOF(703)`
  @JsonValue(714)
  Failed,
}

/// Audio output routing.
enum AudioOutputRouting {
  @JsonValue(-2)
  UnKnown,

  /// Default.
  @JsonValue(-1)
  Default,

  /// Headset.
  @JsonValue(0)
  Headset,

  /// Earpiece.
  @JsonValue(1)
  Earpiece,

  /// Headset with no microphone.
  @JsonValue(2)
  HeadsetNoMic,

  /// Speakerphone.
  @JsonValue(3)
  Speakerphone,

  /// Loudspeaker.
  @JsonValue(4)
  Loudspeaker,

  /// Bluetooth headset.
  @JsonValue(5)
  HeadsetBluetooth,

  /// 隔空投放
  @JsonValue(-3)
  AirPlay,

  /// USB 音频外接设备
  @JsonValue(-4)
  ExternalUSB,
}

/// Audio profile.
enum AudioProfile {
  /// Default audio profile.
  /// - In the [ChannelProfile.Communication] profile: A sample rate of 32 KHz, audio encoding, mono, and a bitrate of up to 18 Kbps.
  /// - In the [ChannelProfile.LiveBroadcasting] profile: A sample rate of 48 KHz, music encoding, mono, and a bitrate of up to 64 Kbps.
  @JsonValue(0)
  Default,

  /// A sample rate of 32 KHz, audio encoding, mono, and a bitrate of up to 18 Kbps.
  @JsonValue(1)
  SpeechStandard,

  /// A sample rate of 48 KHz, music encoding, mono, and a bitrate of up to 64 Kbps.
  @JsonValue(2)
  MusicStandard,

  /// A sample rate of 48 KHz, music encoding, stereo, and a bitrate of up to 80 Kbps.
  @JsonValue(3)
  MusicStandardStereo,

  /// A sample rate of 48 KHz, music encoding, mono, and a bitrate of up to 96 Kbps.
  @JsonValue(4)
  MusicHighQuality,

  /// A sample rate of 48 KHz, music encoding, stereo, and a bitrate of up to 128 Kbps.
  @JsonValue(5)
  MusicHighQualityStereo,
}

/// Audio scenario.
enum AudioScenario {
  /// Default audio application scenario.
  @JsonValue(0)
  Default,

  /// Entertainment scenario supporting voice during gameplay.
  @JsonValue(1)
  ChatRoomEntertainment,

  /// Education scenario prioritizing smoothness and stability.
  @JsonValue(2)
  Education,

  /// Live gaming scenario, enabling the gaming audio effects in the speaker mode in a live broadcast scenario. Choose this scenario for high-fidelity music playback.
  @JsonValue(3)
  GameStreaming,

  /// Showroom scenario, optimizing the audio quality with external professional equipment.
  @JsonValue(4)
  ShowRoom,

  /// Gaming scenario.
  @JsonValue(5)
  ChatRoomGaming,

  /// IoT (Internet of Things) scenario where users use IoT devices with low power consumption.
  @JsonValue(6)
  IOT,

  /// Meeting scenario that mainly contains the human voice.
  ///
  /// Since v3.2.0
  @JsonValue(8)
  MEETING,
}

/// Channel profile.
enum ChannelProfile {
  /// (Default) The Communication profile.
  ///
  /// Use this profile in one-on-one calls or group calls, where all users can talk freely.
  @JsonValue(0)
  Communication,

  /// The LiveBroadcasting profile.
  ///
  /// Users in a live-broadcast channel have a role as either broadcaster or audience. A broadcaster can both send and receive streams; an audience can only receive streams.
  @JsonValue(1)
  LiveBroadcasting,

  /// The Gaming profile.
  ///
  /// This profile uses a codec with a lower bitrate and consumes less power. Applies to the gaming scenario, where all game players can talk freely.
  @JsonValue(2)
  Game,

  /// Only Zego has.
  @JsonValue(-1)
  General,
}

/// Client role in a live broadcast.
enum ClientRole {
  /// A broadcaster can both send and receive streams.
  @JsonValue(1)
  Broadcaster,

  /// The default role. An audience can only receive streams.
  @JsonValue(2)
  Audience,
}

/// zego KTV合唱方案中，角色
enum KtvClientRole {
  /// 非KTV合唱模式.
  @JsonValue(0)
  None,

  /// 合唱模式下：观众
  @JsonValue(1)
  Audience,

  /// 合唱模式下：合唱
  @JsonValue(2)
  Chorus,

  /// 合唱模式下：主唱
  @JsonValue(3)
  LeadSinger,
}

enum RTCRoomMode {
  /// ShowRoom
  @JsonValue(0)
  Default,

  /// Common voice chat room
  @JsonValue(1)
  ChatRoom,

  /// chat room with singing
  @JsonValue(2)
  ChatRoom_KTV_Single,

  /// chat room with chorus ktv
  @JsonValue(3)
  ChatRoom_KTV_Chorus
}

/// Reasons for the connection state change.
enum ConnectionChangedReason {
  /// 未知原因
  @JsonValue(-1)
  UnKnown,

  /// The SDK is connecting to BB’s edge server.
  @JsonValue(0)
  Connecting,

  /// The SDK has joined the channel successfully.
  @JsonValue(1)
  JoinSuccess,

  /// The connection between the SDK and BB’s edge server is interrupted.
  @JsonValue(2)
  Interrupted,

  /// The connection between the SDK and BB’s edge server is banned by BB’s edge server.
  @JsonValue(3)
  BannedByServer,

  /// The SDK fails to join the channel for more than 20 minutes and stops reconnecting to the channel.
  @JsonValue(4)
  JoinFailed,

  /// The SDK has left the channel.
  @JsonValue(5)
  LeaveChannel,

  /// The specified App ID is invalid. Try to rejoin the channel with a valid App ID.
  @JsonValue(6)
  InvalidAppId,

  /// The specified channel name is invalid. Try to rejoin the channel with a valid channel name.
  @JsonValue(7)
  InvalidChannelName,

  /// The generated token is invalid probably due to the following reasons:
  /// - The App Certificate for the project is enabled in Console, but you do not use Token when joining the channel. If you enable the App Certificate, you must use a token to join the channel.
  /// - The uid that you specify in the [RtcEngine.joinRoom] method is different from the uid that you pass for generating the token.
  @JsonValue(8)
  InvalidToken,

  /// The token has expired. Generate a new token from your server.
  @JsonValue(9)
  TokenExpired,

  /// The user is banned by the server.
  @JsonValue(10)
  RejectedByServer,

  /// The SDK tries to reconnect after setting a proxy server.
  @JsonValue(11)
  SettingProxyServer,

  /// The token renews.
  @JsonValue(12)
  RenewToken,

  /// The client IP address has changed, probably due to a change of the network type, IP address, or network port.
  @JsonValue(13)
  ClientIpAddressChanged,

  /// Timeout for the keep-alive of the connection between the SDK and BB’s edge server. The connection state changes to:
  /// - [ConnectionStateType.Reconnecting]
  @JsonValue(14)
  KeepAliveTimeout,

  /// In cloud proxy mode, the proxy server connection interrupted.
  @JsonValue(15)
  ProxyServerInterrupted,
}

/// Connection states.
enum ConnectionStateType {
  /// The SDK is disconnected from BB's edge server.
  /// - This is the initial state before [RtcEngine.joinRoom].
  /// - The SDK also enters this state when the app calls [RtcEngine.leaveChannel].
  @JsonValue(1)
  Disconnected,

  /// The SDK is connecting to BB's edge server.
  /// - When the app calls [RtcEngine.joinRoom], the SDK starts to establish a connection to the specified channel, triggers the [RtcEngineEventHandler.connectionStateChanged] callback, and switches to the [ConnectionStateType.Connecting] state.
  /// - When the SDK successfully joins the channel, the SDK triggers the [RtcEngineEventHandler.connectionStateChanged] callback and switches to the [ConnectionStateType.Connected] state.
  /// - After the SDK joins the channel and when it finishes initializing the media engine, the SDK triggers the [RtcEngineEventHandler.joinChannelSuccess] callback.
  @JsonValue(2)
  Connecting,

  /// The SDK is connected to BB's edge server and joins a channel. You can now publish or subscribe to a media stream in the channel.
  /// If the connection to the channel is lost because, for example, the network is down or switched, the SDK automatically tries to reconnect and triggers:
  /// - The [RtcEngineEventHandler.connectionStateChanged] callback, and switches to the [ConnectionStateType.Reconnecting] state.
  @JsonValue(3)
  Connected,

  /// The SDK keeps rejoining the channel after being disconnected from a joined channel because of network issues.
  /// - If the SDK cannot rejoin the channel within 10 seconds after being disconnected from BB’s edge server, the SDK triggers the [RtcEngineEventHandler.connectionLost] callback, stays in the [ConnectionStateType.Reconnecting] state, and keeps rejoining the channel.
  /// - If the SDK fails to rejoin the channel 20 minutes after being disconnected from BB’s edge server, the SDK triggers the [RtcEngineEventHandler.connectionStateChanged] callback, switches to the [ConnectionStateType.Failed] state, and stops rejoining the channel.
  @JsonValue(4)
  Reconnecting,

  /// The SDK fails to connect to BB's edge server or join the channel.
  /// You must call [RtcEngine.leaveChannel] to leave this state, and call [RtcEngine.joinRoom] again to rejoin the channel.
  ///
  /// If the SDK is banned from joining the channel by BB’s edge server (through the RESTful API), the SDK triggers the [RtcEngineEventHandler.connectionStateChanged] callbacks.
  @JsonValue(5)
  Failed,
}

/// Error codes occur when the SDK encounters an error that cannot be recovered automatically without any app intervention.
enum ErrorCode {
  @JsonValue(-1)
  UnKnown,

  /// No error occurs.
  @JsonValue(0)
  NoError,

  /// A general error occurs (no specified reason).
  @JsonValue(1)
  Failed,

  /// An invalid parameter is used. For example, the specific channel name includes illegal characters.
  @JsonValue(2)
  InvalidArgument,

  /// The SDK module is not ready.
  /// Possible solutions:
  /// - Check the audio device.
  /// - Check the completeness of the app.
  /// - Re-initialize the SDK.
  @JsonValue(3)
  NotReady,

  /// The current state of the SDK does not support this function.
  @JsonValue(4)
  NotSupported,

  /// The request is rejected. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(5)
  Refused,

  /// The buffer size is not big enough to store the returned data.
  @JsonValue(6)
  BufferTooSmall,

  /// The SDK is not initialized before calling this method.
  @JsonValue(7)
  NotInitialized,

  /// No permission exists. Check whether the user has granted access to the audio or video device.
  @JsonValue(9)
  NoPermission,

  /// An API method timeout occurs. Some API methods require the SDK to return the execution result, and this error occurs if the request takes too long (over 10 seconds) for the SDK to process.
  @JsonValue(10)
  TimedOut,

  /// The request is canceled. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(11)
  Canceled,

  /// The method is called too often. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(12)
  TooOften,

  /// The SDK fails to bind to the network socket. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(13)
  BindSocket,

  /// The network is unavailable. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(14)
  NetDown,

  /// No network buffers are available. This is for internal SDK use only, and is not returned to the app through any method or callback.
  @JsonValue(15)
  NoBufs,

  /// The request to join the channel is rejected.
  /// Possible reasons are:
  /// - The user is already in the channel, and still calls the API method to join the channel, for example, [RtcEngine.joinRoom].
  /// - The user tries joining the channel during the echo test. Please join the channel after the echo test ends.
  @JsonValue(17)
  JoinChannelRejected,

  /// The request to leave the channel is rejected.
  /// Possible reasons are:
  /// - The user left the channel and still calls the API method to leave the channel, for example, [RtcEngine.leaveChannel].
  /// - The user has not joined the channel and calls the API method to leave the channel.
  @JsonValue(18)
  LeaveChannelRejected,

  /// The resources are occupied and cannot be used.
  @JsonValue(19)
  AlreadyInUse,

  /// The SDK gave up the request due to too many requests.
  @JsonValue(20)
  Abort,

  /// In Windows, specific firewall settings cause the SDK to fail to initialize and crash.
  @JsonValue(21)
  InitNetEngine,

  /// The app uses too much of the system resources and the SDK fails to allocate the resources.
  @JsonValue(22)
  ResourceLimited,

  /// The specified App ID is invalid. Please try to rejoin the channel with a valid App ID.
  @JsonValue(101)
  InvalidAppId,

  /// The specified channel name is invalid. Please try to rejoin the channel with a valid channel name.
  @JsonValue(102)
  InvalidChannelId,

  /// 103: Fails to get server resources in the specified region. Please try to specify another region.
  ///
  ///
  @JsonValue(103)
  NoServerResources,

  /// The token expired. BB recommends that you use [ConnectionChangedReason.TokenExpired] in the reason parameter of [RtcEngineEventHandler.connectionStateChanged] instead.
  ///
  /// Possible reasons are:
  /// - Authorized Timestamp expired: The timestamp is represented by the number of seconds elapsed since 1/1/1970. The user can use the token to access the BB service within five minutes after the token is generated. If the user does not access the BB service after five minutes, this token is no longer valid.
  /// - Call Expiration Timestamp expired: The timestamp is the exact time when a user can no longer use the BB service (for example, when a user is forced to leave an ongoing call). When a value is set for the Call Expiration Timestamp, it does not mean that the token will expire, but that the user will be banned from the channel.
  @deprecated
  @JsonValue(109)
  TokenExpired,

  /// The token is invalid. BB recommends that you use [ConnectionChangedReason.InvalidToken] in the reason parameter of [RtcEngineEventHandler.connectionStateChanged] instead.
  ///
  /// Possible reasons are:
  /// - The App Certificate for the project is enabled in Console, but the user is using the App ID. Once the App Certificate is enabled, the user must use a token.
  /// - The uid is mandatory, and users must set the same uid as the one set in the [RtcEngine.joinRoom] method.
  @deprecated
  @JsonValue(110)
  InvalidToken,

  /// The Internet connection is interrupted. This applies to the BB Web SDK only.
  @JsonValue(111)
  ConnectionInterrupted,

  /// The Internet connection is lost. This applies to the BB Web SDK only.
  @JsonValue(112)
  ConnectionLost,

  /// The user is not in the channel when calling the [RtcEngine.sendStreamMessage] or [RtcEngine.getUserInfoByUserAccount] method.
  @JsonValue(113)
  NotInChannel,

  /// The size of the sent data is over 1024 bytes when the user calls the [RtcEngine.sendStreamMessage] method.
  @JsonValue(114)
  SizeTooLarge,

  /// The bitrate of the sent data exceeds the limit of 6 Kbps when the user calls the [RtcEngine.sendStreamMessage] method.
  @JsonValue(115)
  BitrateLimit,

  /// Too many data streams (over five streams) are created when the user calls the [RtcEngine.createDataStream] method.
  @JsonValue(116)
  TooManyDataStreams,

  /// Decryption fails. The user may have used a different encryption password to join the channel. Check your settings or try rejoining the channel.
  @JsonValue(120)
  DecryptionFailed,

  /// The client is banned by the server.
  @JsonValue(123)
  ClientIsBannedByServer,

  /// Incorrect watermark file parameter.
  @JsonValue(124)
  WatermarkParam,

  /// Incorrect watermark file path.
  @JsonValue(125)
  WatermarkPath,

  /// Incorrect watermark file format.
  @JsonValue(126)
  WatermarkPng,

  /// Incorrect watermark file information.
  @JsonValue(127)
  WatermarkInfo,

  /// Incorrect watermark file data format.
  @JsonValue(128)
  WatermarkAGRB,

  /// An error occurs in reading the watermark file.
  @JsonValue(129)
  WatermarkRead,

  /// The encrypted stream is not allowed to publish.
  @JsonValue(130)
  EncryptedStreamNotAllowedPublish,

  /// The user account is invalid.
  @JsonValue(134)
  InvalidUserAccount,

  /// CDN related errors. Remove the original URL address and add a new one by calling the [RtcEngine.removePublishStreamUrl] and [RtcEngine.addPublishStreamUrl] methods.
  @JsonValue(151)
  PublishStreamCDNError,

  /// The host publishes more than 10 URLs. Delete the unnecessary URLs before adding new ones.
  @JsonValue(152)
  PublishStreamNumReachLimit,

  /// The host manipulates other hosts' URLs. Check your app logic.
  @JsonValue(153)
  PublishStreamNotAuthorized,

  /// An error occurs in BB’s streaming server. Call the `addPublishStreamUrl` method to publish the stream again.
  ///
  /// See [RtcEngine.addPublishStreamUrl]
  @JsonValue(154)
  PublishStreamInternalServerError,

  /// The server fails to find the stream.
  @JsonValue(155)
  PublishStreamNotFound,

  /// The format of the RTMP stream URL is not supported. Check whether the URL format is correct.
  @JsonValue(156)
  PublishStreamFormatNotSuppported,

  /// Fails to load the media engine.
  @JsonValue(1001)
  LoadMediaEngine,

  /// Fails to start the call after enabling the media engine.
  @JsonValue(1002)
  StartCall,

  /// Fails to start the camera. BB recommends that you use [LocalVideoStreamError.CaptureFailure] in the error parameter of [RtcEngineEventHandler.localVideoStateChanged] instead.
  @deprecated
  @JsonValue(1003)
  StartCamera,

  /// Fails to start the video rendering module.
  @JsonValue(1004)
  StartVideoRender,

  /// Audio Device Module: A general error occurs in the Audio Device Module (the reason is not classified specifically). Check if the audio device is used by another app, or try rejoining the channel.
  @JsonValue(1005)
  AdmGeneralError,

  /// Audio Device Module: An error occurs in using the Java resources.
  @JsonValue(1006)
  AdmJavaResource,

  /// Audio Device Module: An error occurs in setting the sampling frequency.
  @JsonValue(1007)
  AdmSampleRate,

  /// Audio Device Module: An error occurs in initializing the playback device.
  @JsonValue(1008)
  AdmInitPlayout,

  /// Audio Device Module: An error occurs in starting the playback device.
  @JsonValue(1009)
  AdmStartPlayout,

  /// Audio Device Module: An error occurs in stopping the playback device.
  @JsonValue(1010)
  AdmStopPlayout,

  /// Audio Device Module: An error occurs in initializing the recording device.
  @JsonValue(1011)
  AdmInitRecording,

  /// Audio Device Module: An error occurs in starting the recording device.
  @JsonValue(1012)
  AdmStartRecording,

  /// Audio Device Module: An error occurs in stopping the recording device.
  @JsonValue(1013)
  AdmStopRecording,

  /// Audio Device Module: A playback error occurs. Check your playback device, or try rejoining the channel.
  @JsonValue(1015)
  AdmRuntimePlayoutError,

  /// Audio Device Module: A recording error occurs.
  @JsonValue(1017)
  AdmRuntimeRecordingError,

  /// Audio Device Module: Fails to record.
  @JsonValue(1018)
  AdmRecordAudioFailed,

  /// Audio Device Module: Abnormal audio playback frequency.
  @JsonValue(1020)
  AdmPlayAbnormalFrequency,

  /// Audio Device Module: Abnormal audio recording frequency.
  @JsonValue(1021)
  AdmRecordAbnormalFrequency,

  /// Audio Device Module: An error occurs in initializing the loopback device.
  @JsonValue(1022)
  AdmInitLoopback,

  /// Audio Device Module: An error occurs in starting the loopback device.
  @JsonValue(1023)
  AdmStartLoopback,

  /// Audio Device Module: An error occurs in no recording Permission.
  @JsonValue(1027)
  AdmNoPermission,

  /// Audio Routing: Fails to route the audio to the connected Bluetooth device. The default route is used.
  @JsonValue(1030)
  AudioBtScoFailed,

  /// Audio Device Module: No recording device exists.
  @JsonValue(1359)
  AdmNoRecordingDevice,

  /// No playback device exists.
  @JsonValue(1360)
  AdmNoPlayoutDevice,

  /// Video Device Module: The camera is unauthorized.
  @JsonValue(1501)
  VdmCameraNotAuthorized,

  /// Video Device Module: An unknown error occurs.
  @JsonValue(1600)
  VcmUnknownError,

  /// Video Device Module: An error occurs in initializing the video encoder.
  @JsonValue(1601)
  VcmEncoderInitError,

  /// Video Device Module: An error occurs in video encoding.
  @JsonValue(1602)
  VcmEncoderEncodeError,

  /// Video Device Module: An error occurs in setting the video encoder.
  @deprecated
  @JsonValue(1603)
  VcmEncoderSetError,
}

/// State of importing an external video stream in a live broadcast.
enum InjectStreamStatus {
  /// The external video stream imported successfully.
  @JsonValue(0)
  StartSuccess,

  /// The external video stream already exists.
  @JsonValue(1)
  StartAlreadyExists,

  /// The external video stream import is unauthorized.
  @JsonValue(2)
  StartUnauthorized,

  /// Import external video stream timeout.
  @JsonValue(3)
  StartTimedout,

  /// The external video stream failed to import.
  @JsonValue(4)
  StartFailed,

  /// The external video stream imports successfully.
  @JsonValue(5)
  StopSuccess,

  /// No external video stream is found.
  @JsonValue(6)
  StopNotFound,

  /// The external video stream is stopped from being unauthorized.
  @JsonValue(7)
  StopUnauthorized,

  /// Importing the external video stream timeout.
  @JsonValue(8)
  StopTimedout,

  /// Importing the external video stream failed.
  @JsonValue(9)
  StopFailed,

  /// The external video stream import is interrupted.
  @JsonValue(10)
  Broken,
}

/// Reason for the user being offline.
enum UserOfflineReason {
  @JsonValue(-1)
  UnKnown,

  /// The user left the current channel.
  @JsonValue(0)
  Quit,

  /// The SDK timed out and the user dropped offline because no data packet is received within a certain period of time. If a user quits the call and the message is not passed to the SDK (due to an unreliable channel), the SDK assumes the user dropped offline.
  @JsonValue(1)
  Dropped,

  /// (LiveBroadcasting only) The client role switched from the host to the audience.
  @JsonValue(2)
  BecomeAudience,

  @JsonValue(3)
  // only tencent
  Kicked,
}

/// Warning codes occur when the SDK encounters an error that may be recovered automatically. These are only notifications, and can generally be ignored. For example, when the SDK loses connection to the server, the SDK reports the `OpenChannelTimeout`(106) warning and tries to reconnect automatically.
/// See [WarningCode.OpenChannelTimeout].
enum WarningCode {

  @JsonValue(-1)
  UnKnown,

  @JsonValue(0)
  None,

  /// The specified view is invalid. Specify a view when using the video call function.
  @JsonValue(8)
  InvalidView,

  /// Failed to initialize the video function, possibly caused by a lack of resources. The users cannot see the video while the voice communication is not affected.
  @JsonValue(16)
  InitVideo,

  /// The request is pending, usually due to some module not being ready, and the SDK postpones processing the request.
  @JsonValue(20)
  Pending,

  /// No channel resources are available. Maybe because the server cannot allocate any channel resource.
  @JsonValue(103)
  NoAvailableChannel,

  /// A timeout occurs when looking up the channel. When joining a channel, the SDK looks up the specified channel. The warning usually occurs when the network condition is too poor for the SDK to connect to the server.
  @JsonValue(104)
  LookupChannelTimeout,

  /// The server rejects the request to look up the channel. The server cannot process this request or the request is illegal. BB recommends that you use [ConnectionChangedReason.RejectedByServer] in the reason parameter of [RtcEngineEventHandler.connectionStateChanged] instead.
  @deprecated
  @JsonValue(105)
  LookupChannelRejected,

  /// The server rejects the request to look up the channel. The server cannot process this request or the request is illegal.
  @JsonValue(106)
  OpenChannelTimeout,

  /// The server rejects the request to open the channel. The server cannot process this request or the request is illegal.
  @JsonValue(107)
  OpenChannelRejected,

  /// A timeout occurs when switching to the live video.
  @JsonValue(111)
  SwitchLiveVideoTimeout,

  /// A timeout occurs when setting the client role in the LiveBroadcasting profile.
  @JsonValue(118)
  SetClientRoleTimeout,

  /// The client role is unauthorized.
  @JsonValue(119)
  SetClientRoleNotAuthorized,

  /// The ticket to open the channel is invalid.
  @JsonValue(121)
  OpenChannelInvalidTicket,

  /// Try connecting to another server.
  @JsonValue(122)
  OpenChannelTryNextVos,

  /// An error occurs in opening the audio mixing file.
  @JsonValue(701)
  AudioMixingOpenError,

  /// Audio Device Module: a warning occurs in the playback device.
  @JsonValue(1014)
  AdmRuntimePlayoutWarning,

  /// Audio Device Module: a warning occurs in the recording device.
  @JsonValue(1016)
  AdmRuntimeRecordingWarning,

  /// Audio Device Module: no valid audio data is collected.
  @JsonValue(1019)
  AdmRecordAudioSilence,

  /// Audio Device Module: a playback device fails.
  @JsonValue(1020)
  AdmPlaybackMalfunction,

  /// Audio Device Module: a recording device fails.
  @JsonValue(1021)
  AdmRecordMalfunction,

  /// Audio Device Module: call is interrupted by system events such as phone call or siri etc.
  @JsonValue(1025)
  AdmInterruption,

  /// During a call, `AudioSessionCategory` should be set to `AVAudioSessionCategoryPlayAndRecord`, and the SDK monitors this value. If the `AudioSessionCategory` is set to other values, this warning code is triggered and the SDK will forcefully set it back to `AVAudioSessionCategoryPlayAndRecord`.
  ///
  ///
  @JsonValue(1029)
  AdmCategoryNotPlayAndRecord,

  /// Audio Device Module: the recorded audio is too low.
  @JsonValue(1031)
  AdmRecordAudioLowlevel,

  /// Audio Device Module: the playback audio is too low.
  @JsonValue(1032)
  AdmPlayoutAudioLowlevel,

  /// Audio Device Module: The recording device is busy.
  @JsonValue(1033)
  AdmRecordIsOccupied,

  /// Audio device module: An error occurs in the audio driver. Solutions:
  /// - Restart your audio device.
  /// - Restart your device where the app runs.
  /// - Upgrade the sound card drive.
  ///
  ///
  @JsonValue(1040)
  AdmNoDataReadyCallback,

  /// Audio device module: The audio recording device is different from the audio playback device, which may cause echoes problem. BB recommends using the same audio device to record and playback audio.
  ///
  ///
  @JsonValue(1042)
  AdmInconsistentDevices,

  /// Audio Device Module: howling is detected.
  @JsonValue(1051)
  ApmHowling,

  /// Audio Device Module: the device is in the glitch state.
  @JsonValue(1052)
  AdmGlitchState,

  /// Audio processing module: A residual echo is detected, which may be caused by the belated scheduling of system threads or the signal overflow.
  @JsonValue(1053)
  ApmResidualEcho,

  /// Super-resolution warning: the original video dimensions of the remote user exceed 640*480.
  @JsonValue(1610)
  SuperResolutionStreamOverLimitation,

  /// Super-resolution warning: another user is using super resolution.
  @JsonValue(1611)
  SuperResolutionUserCountOverLimitation,

  /// Super-resolution warning: The device is not supported.
  @JsonValue(1612)
  SuperResolutionDeviceNotSupported,

  /// 推流失败
  @JsonValue(-2)
  PublisherError,

  /// token 快要过期通知，code自定义的
  @JsonValue(-1001)
  TokenWillExpire,
}

/// The options for SDK preset audio effects.
enum AudioEffectPreset {
  /// Turn off audio effects and use the original voice.
  @JsonValue(0x00000000)
  AudioEffectOff,

  /// An audio effect typical of a KTV venue.
  @JsonValue(0x02010100)
  RoomAcousticsKTV,

  /// An audio effect typical of a concert hall.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02010200)
  RoomAcousticsVocalConcert,

  /// An audio effect typical of a recording studio.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02010300)
  RoomAcousticsStudio,

  /// An audio effect typical of a vintage phonograph.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02010400)
  RoomAcousticsPhonograph,

  /// A virtual stereo effect that renders monophonic audio as stereo audio.
  ///
  /// **Note**
  ///
  /// Call `setAudioProfile` and set the profile parameter to `MusicStandardStereo(3)` or `MusicHighQualityStereo(5)` before setting this enumerator; otherwise, the enumerator setting does not take effect.
  @JsonValue(0x02010500)
  RoomAcousticsVirtualStereo,

  /// A more spatial audio effect.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02010600)
  RoomAcousticsSpacial,

  /// A more ethereal audio effect.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02010700)
  RoomAcousticsEthereal,

  /// A 3D voice effect that makes the voice appear to be moving around the user. The default cycle period of the 3D voice effect is 10 seconds. To change the cycle period, call [RtcEngine.setAudioEffectParameters] after this method.
  ///
  /// **Note**
  ///
  /// - Call setAudioProfile and set the profile parameter to `MusicStandardStereo(3)` or `MusicHighQualityStereo(5)` before setting this enumerator; otherwise, the enumerator setting does not take effect.
  /// - If the 3D voice effect is enabled, users need to use stereo audio playback devices to hear the anticipated voice effect.
  @JsonValue(0x02010800)
  RoomAcoustics3DVoice,

  /// The voice of a middle-aged man.
  ///
  /// **Note**
  ///
  /// - BB recommends using this enumerator to process a male-sounding voice; otherwise, you may not hear the anticipated voice effect.
  /// - To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020100)
  VoiceChangerEffectUncle,

  /// The voice of an old man.
  ///
  /// **Note**
  ///
  /// - BB recommends using this enumerator to process a male-sounding voice; otherwise, you may not hear the anticipated voice effect.
  /// - To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020200)
  VoiceChangerEffectOldMan,

  /// The voice of a boy.
  ///
  /// **Note**
  ///
  /// - BB recommends using this enumerator to process a male-sounding voice; otherwise, you may not hear the anticipated voice effect.
  /// - To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020300)
  VoiceChangerEffectBoy,

  /// The voice of a young woman.
  ///
  /// **Note**
  ///
  /// - BB recommends using this enumerator to process a female-sounding voice; otherwise, you may not hear the anticipated voice effect.
  /// - To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020400)
  VoiceChangerEffectSister,

  /// The voice of a girl.
  ///
  /// **Note**
  ///
  /// - BB recommends using this enumerator to process a male-sounding voice; otherwise, you may not hear the anticipated voice effect.
  /// - To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020500)
  VoiceChangerEffectGirl,

  /// The voice of Pig King, a character in Journey to the West who has a voice like a growling bear.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020600)
  VoiceChangerEffectPigKing,

  /// The voice of Hulk.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02020700)
  VoiceChangerEffectHulk,

  /// An audio effect typical of R&B music.
  ///
  /// **Note**
  ///
  /// Call [RtcEngine.setAudioProfile] and set the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator; otherwise, the enumerator setting does not take effect.
  @JsonValue(0x02030100)
  StyleTransformationRnB,

  /// An audio effect typical of popular music.
  ///
  /// **Note**
  ///
  /// Call [RtcEngine.setAudioProfile] and set the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator; otherwise, the enumerator setting does not take effect.
  @JsonValue(0x02030200)
  StyleTransformationPopular,

  /// A pitch correction effect that corrects the user’s pitch based on the pitch of the natural C major scale. To change the basic mode and tonic pitch, call [RtcEngine.setAudioEffectParameters] after this method.
  ///
  /// **Note**
  ///
  /// To achieve better audio effect quality, BB recommends calling [RtcEngine.setAudioProfile] and setting the profile parameter to `MusicHighQuality(4)` or `MusicHighQualityStereo(5)` before setting this enumerator.
  @JsonValue(0x02040100)
  PitchCorrection,

  /// 地下室
  @JsonValue(0x05040100)
  Basement,


  /// 演唱会
  @JsonValue(0x05040200)
  VocalConcert,

  /// 音乐厅
  @JsonValue(0x05040300)
  ConcertHall,
}

/// The options for SDK preset voice beautifier effects.
enum VoiceBeautifierPreset {
  /// Turn off voice beautifier effects and use the original voice.
  @JsonValue(0x00000000)
  VoiceBeautifierOff,

  /// A more magnetic voice.
  ///
  /// **Note**
  ///
  /// BB recommends using this enumerator to process a male-sounding voice; otherwise, you may experience vocal distortion.
  @JsonValue(0x01010100)
  ChatBeautifierMagnetic,

  /// A fresher voice.
  ///
  /// BB recommends using this enumerator to process a female-sounding voice; otherwise, you may experience vocal distortion.
  @JsonValue(0x01010200)
  ChatBeautifierFresh,

  /// A more vital voice.
  ///
  /// BB recommends using this enumerator to process a female-sounding voice; otherwise, you may experience vocal distortion.
  @JsonValue(0x01010300)
  ChatBeautifierVitality,

  /// A more vigorous voice.
  @JsonValue(0x01030100)
  TimbreTransformationVigorous,

  /// A deeper voice.
  @JsonValue(0x01030200)
  TimbreTransformationDeep,

  /// A mellower voice.
  @JsonValue(0x01030300)
  TimbreTransformationMellow,

  /// A falsetto voice.
  @JsonValue(0x01030400)
  TimbreTransformationFalsetto,

  /// A fuller voice.
  @JsonValue(0x01030500)
  TimbreTransformationFull,

  /// A clearer voice.
  @JsonValue(0x01030600)
  TimbreTransformationClear,

  /// A more resounding voice.
  @JsonValue(0x01030700)
  TimbreTransformationResounding,

  /// A more ringing voice.
  @JsonValue(0x01030800)
  TimbreTransformationRinging,
}

/// The state of the local audio.
enum AudioLocalState {
  @JsonValue(-1)
  UnKnown,

  /// The local audio is in the initial state.
  /// 本地音频默认初始状态。
  @JsonValue(0)
  Stopped,

  /// The recording device starts successfully.
  /// 本地音频采集设备启动成功。
  @JsonValue(1)
  Recording,

  /// The first audio frame encodes successfully.
  /// 本地音频首帧编码成功。
  @JsonValue(2)
  Encoding,

  /// The local audio fails to start.
  /// 本地音频启动失败。
  @JsonValue(3)
  Failed,
}

/// The error information of the local audio.
enum AudioLocalError {
  @JsonValue(-1)
  UnKnown,

  /// The local audio is normal.
  @JsonValue(0)
  Ok,

  /// No specified reason for the local audio failure.
  @JsonValue(1)
  Failure,

  /// No permission to use the local audio device.
  @JsonValue(2)
  DeviceNoPermission,

  /// The microphone is in use.
  @JsonValue(3)
  DeviceBusy,

  /// The local audio recording fails. Check whether the recording device is working properly.
  @JsonValue(4)
  RecordFailure,

  /// The local audio encoding fails.
  @JsonValue(5)
  EncodeFailure,
}

enum VideoFrameRate {
  /// Min
  @JsonValue(-1)
  Min,

  /// 1 fps.
  @JsonValue(1)
  Fps1,

  /// 7 fps.
  @JsonValue(7)
  Fps7,

  /// 10 fps.
  @JsonValue(10)
  Fps10,

  /// 15 fps.
  @JsonValue(15)
  Fps15,

  /// 24 fps.
  @JsonValue(24)
  Fps24,

  /// 30 fps.
  @JsonValue(30)
  Fps30,

  /// 60 fps (macOS only).
  @JsonValue(60)
  Fps60,
}

/// Video output orientation mode.
enum VideoOutputOrientationMode {
  /// Adaptive mode (Default).
  /// The video encoder adapts to the orientation mode of the video input device. When you use a custom video source, the output video from the encoder inherits the orientation of the original video.
  /// - If the width of the captured video from the SDK is greater than the height, the encoder sends the video in landscape mode. The encoder also sends the rotational information of the video, and the receiver uses the rotational information to rotate the received video.
  /// - If the original video is in portrait mode, the output video from the encoder is also in portrait mode. The encoder also sends the rotational information of the video to the receiver.
  @JsonValue(0)
  Adaptative,

  /// Landscape mode.
  /// The video encoder always sends the video in landscape mode. The video encoder rotates the original video before sending it and the rotational information is 0. This mode applies to scenarios involving CDN live streaming.
  @JsonValue(1)
  FixedLandscape,

  /// Portrait mode.
  /// The video encoder always sends the video in portrait mode. The video encoder rotates the original video before sending it and the rotational information is 0. This mode applies to scenarios involving CDN live streaming.
  @JsonValue(2)
  FixedPortrait,
}

/// The video encoding degradation preference under limited bandwidth.
enum DegradationPreference {
  /// (Default) Degrades the frame rate to guarantee the video quality.
  MaintainQuality,

  /// Degrades the video quality to guarantee the frame rate.
  MaintainFramerate,

  /// Reserved for future use.
  Balanced
}

/// Video mirror mode.
enum VideoMirrorMode {
  /// (Default) The SDK determines the mirror mode.
  Auto,

  /// Enables mirror mode.
  Enabled,

  /// Disables mirror mode.
  Disabled,
}

enum PreloadStatusCode {
  /// @nodoc
  @JsonValue(0)
  kPreloadStatusCompleted,

  /// @nodoc
  @JsonValue(1)
  kPreloadStatusFailed,

  /// @nodoc
  @JsonValue(2)
  kPreloadStatusPreloading,
}

/// Mode of Electronic Effects.
enum ElectronicEffectsMode {
  /// Major
  Major,

  /// Minor
  Minor,

  /// Harmonic Minor
  HarmonicMinor
}

/// 网络流质量
enum StreamQualityLevel {
  /// 质量极好
  Excellent,

  /// 质量好
  Good,

  /// 质量正常
  Medium,

  /// 质量差
  Bad,

  /// 质量异常
  Die,

  /// 质量未知
  Unknown,
}