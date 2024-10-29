
import 'enums.dart';

class EngineConfig {
  late String appId;
  String? appSign;
  // zego 单AppID依据该字段可区分测试环境和线上环境
  bool? isTestEnv;
  ChannelProfile? profile;
  bool? enablePlatformView;
  /// 自研使用
  String? rtcServerAddress;

  /// 目前腾讯用到
  int? tencentScene;

  /// 目前即构使用，多房间支持
  bool enableMultiRoom;

  EngineConfig({
    required this.appId,
    this.appSign,
    this.isTestEnv,
    this.profile,
    this.enablePlatformView,
    this.rtcServerAddress,
    this.tencentScene,
    this.enableMultiRoom = true,
  });

  EngineConfig copyWith({
    required String appId,
    String? appSign,
    bool? isTestEnv,
    ChannelProfile? profile,
    bool? enablePlatformView,
    String? rtcServerAddress,
    int? tencentScene,
    bool? enableMultiRoom = true,
  }) {
    return EngineConfig(
      appId: appId,
      appSign: appSign ?? this.appSign,
      isTestEnv: isTestEnv ?? this.isTestEnv,
      profile: profile ?? this.profile,
      enablePlatformView: enablePlatformView ?? this.enablePlatformView,
      rtcServerAddress: rtcServerAddress ?? this.rtcServerAddress,
      tencentScene: tencentScene ?? this.tencentScene,
      enableMultiRoom: enableMultiRoom ?? this.enableMultiRoom,
    );
  }

  @override
  String toString() {
    return 'EngineConfig{appId: $appId, appSign: $appSign, isTestEnv: $isTestEnv, profile: $profile, enablePlatformView: $enablePlatformView, rtcServerAddress: $rtcServerAddress, tencentScene: $tencentScene, enableMultiRoom:$enableMultiRoom}';
  }
} 

/// The ChannelMediaInfo class.
class ChannelMediaInfo {
  /// The channel name.
  String channelName;

  String? streamID;

  /// The token that enables the user to join the channel.
  String? token;

  /// The user ID.
  final int uid;

  /// Constructs a [ChannelMediaInfo]
  ChannelMediaInfo(this.uid, {required this.channelName, this.token, this.streamID});

  @override
  String toString() {
    return 'ChannelMediaInfo{channelName: $channelName, streamID: $streamID, token: $token, uid: $uid}';
  }
}

/// The ChannelMediaRelayConfiguration class.
class ChannelMediaRelayConfiguration {
  /// The information of the source channel: [ChannelMediaInfo]. It contains the following members:
  /// - `channelName`: The name of the source channel. The default value is NULL, which means the SDK applies the name of the current channel.
  /// - `uid`: ID of the broadcaster whose media stream you want to relay. The default value is 0, which means the SDK generates a random UID. You must set it as 0.
  /// - `token`: The token for joining the source channel. It is generated with the `channelName` and `uid` you set in `srcInfo`.
  ///   - If you have not enabled the App Certificate, set this parameter as the default value NULL, which means the SDK applies the App ID.
  ///   - If you have enabled the App Certificate, you must use the token generated with the `channelName` and `uid`.
  final ChannelMediaInfo srcInfo;

  /// The information of the destination channel: [ChannelMediaInfo]. It contains the following members:
  ///- `channelName`: The name of the destination channel.
  ///- `uid`: ID of the broadcaster in the destination channel. The value ranges from 0 to (2<sup>32</sup>-1). To avoid UID conflicts,
  /// this uid must be different from any other UIDs in the destination channel. The default value is 0, which means the SDK generates a random UID.
  ///  - `token`: The token for joining the destination channel. It is generated with the `channelName` and `uid` you set in `destInfo`.
  ///    - If you have not enabled the App Certificate, set this parameter as the default value NULL, which means the SDK applies the App ID.
  ///    - If you have enabled the App Certificate, you must use the token generated with the `channelName` and `uid`.
  final List<ChannelMediaInfo> destInfos;

  /// Constructs a [ChannelMediaRelayConfiguration]
  ChannelMediaRelayConfiguration(this.srcInfo, this.destInfos);

  @override
  String toString() {
    return 'ChannelMediaRelayConfiguration{srcInfo: $srcInfo, destInfos: $destInfos}';
  }
}

/// Properties of the audio volume information.
/// Contains the user ID and volume information for each speaker.
class AudioVolumeInfo {
  /// The user ID of the speaker. The uid of the local user is 0.
  late int uid;

  /// The sum of the voice volume and audio-mixing volume of the speaker. The value ranges between 0 (lowest volume) and 100 (highest volume).
  late int volume;

  /// Voice activity status of the local user.
  /// - 0: The local user is not speaking.
  /// - 1: The local user is speaking.
  ///
  ///
  /// **Note**
  /// - The `vad` parameter cannot report the voice activity status of the remote users. In the remote users' callback, `vad` = 0.
  /// - Ensure that you set `report_vad`(true) in the [RtcEngine.enableAudioVolumeIndication] method to enable the voice activity
  /// detection of the local user.
  late int vad;

  /// The channel ID, which indicates which channel the speaker is in.
  // String channelId;

  /// Constructs a [AudioVolumeInfo]
  AudioVolumeInfo(
    this.uid,
    this.volume,
    this.vad,
  );
}

class UserStream {
  static const micOpen = 1;
  static const micClose = 2;

  int uid;
  int rid;
  String? streamID;
  /// 麦克风状态，1：开麦：2关麦.
  int mic;

  /// room连房策略,stream,单拉流形式
  String? zegoLinkType;

  UserStream(this.uid, this.rid, {
    this.streamID,
    this.mic = 1,
    this.zegoLinkType,
  });

  @override
  String toString() {
    return 'UserStream{uid: $uid, streamID: $streamID, rid: $rid, mic: $mic, zegoLinkType: $zegoLinkType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStream &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          streamID == other.streamID;

  @override
  int get hashCode => uid.hashCode ^ streamID.hashCode;
}

/// 子频道
class SubChannel {
  /// true:公有子频道，一般是麦上用户
  /// false:私有子频道，一般是粉丝团、车队
  bool pub;

  /// 是否收听公有频道
  bool listenPub;

  /// 当前频道的用户id.
  List<int> uids;

  SubChannel.pub(this.uids)
      : pub = true,
        listenPub = true;

  SubChannel.private(this.uids, this.listenPub) : pub = false;

  @override
  String toString() {
    return 'SubChannel{pub: $pub, listenPub: $listenPub, uids: $uids}';
  }
}

/// Definition of VideoEncoderConfiguration.
class VideoEncoderConfiguration {
  /// The video frame dimensions (px), which is used to specify the video quality and measured by the total number of pixels along a frame's width and height. The default value is 640 × 360.
  /// You can customize the dimension, or select from the following list:
  /// - 120x120
  /// - 160x120
  /// - 180x180
  /// - 240x180
  /// - 320x180
  /// - 240x240
  /// - 320x240
  /// - 424x240
  /// - 360x360
  /// - 480x360
  /// - 640x360
  /// - 480x480
  /// - 640x480
  /// - 840x480
  /// - 960x720
  /// - 1280x720
  ///
  /// **Note**
  /// - The value of the dimension does not indicate the orientation mode of the output ratio. For how to set the video orientation, see [VideoOutputOrientationMode].</li>
  /// - Whether 720p+ can be supported depends on the device. If the device cannot support 720p, the frame rate will be lower than the one listed in the table.</li>
  VideoDimensions? dimensions;

  /// The video frame rate (fps). The default value is 15. You can either set the frame rate manually or choose from [VideoFrameRate]. We do not recommend setting this to a value greater than 30.
  VideoFrameRate? frameRate;

  /// The minimum video encoder frame rate (fps). The default value is [VideoFrameRate.Min] (the SDK uses the lowest encoder frame rate).
  VideoFrameRate? minFrameRate;

  /// Bitrate of the video (Kbps). Refer to the table below and set your bitrate. If you set a bitrate beyond the proper range, the SDK automatically adjusts it to a value within the range.
  ///
  /// You can also choose from the following options:
  /// - [BitRate.Standard]: (Recommended) The standard bitrate mode. In this mode, the bitrates differ between the LiveBroadcasting and Communication profiles:
  ///   - In the Communication profile, the video bitrate is the same as the base bitrate.
  ///   - In the LiveBroadcasting profile, the video bitrate is twice the base bitrate.
  /// - [BitRate.Compatible]: The compatible bitrate mode. In this mode, the bitrate stays the same regardless of the profile. If you choose this mode for the Live Broadcast profile, the video frame rate may be lower than the set value.
  ///
  /// Agora uses different video codecs for different profiles to optimize the user experience. For example, the Communication profile prioritizes the smoothness while the Live Broadcast profile prioritizes the video quality (a higher bitrate). Therefore, We recommend setting this parameter as `0`.
  ///
  /// **Video Bitrate Table**
  ///
  /// | Resolution             | Frame Rate (fps) | Base Bitrate (Kbps)                    | Live Bitrate (Kbps)                    |
  /// |------------------------|------------------|----------------------------------------|----------------------------------------|
  /// | 160 * 120              | 15               | 65                                     | 130                                    |
  /// | 120 * 120              | 15               | 50                                     | 100                                    |
  /// | 320 * 180              | 15               | 140                                    | 280                                    |
  /// | 180 * 180              | 15               | 100                                    | 200                                    |
  /// | 240 * 180              | 15               | 120                                    | 240                                    |
  /// | 320 * 240              | 15               | 200                                    | 400                                    |
  /// | 240 * 240              | 15               | 140                                    | 280                                    |
  /// | 424 * 240              | 15               | 220                                    | 440                                    |
  /// | 640 * 360              | 15               | 400                                    | 800                                    |
  /// | 360 * 360              | 15               | 260                                    | 520                                    |
  /// | 640 * 360              | 30               | 600                                    | 1200                                   |
  /// | 360 * 360              | 30               | 400                                    | 800                                    |
  /// | 480 * 360              | 15               | 320                                    | 640                                    |
  /// | 480 * 360              | 30               | 490                                    | 980                                    |
  /// | 640 * 480              | 15               | 500                                    | 1000                                   |
  /// | 480 * 480              | 15               | 400                                    | 800                                    |
  /// | 640 * 480              | 30               | 750                                    | 1500                                   |
  /// | 480 * 480              | 30               | 600                                    | 1200                                   |
  /// | 848 * 480              | 15               | 610                                    | 1220                                   |
  /// | 848 * 480              | 30               | 930                                    | 1860                                   |
  /// | 640 * 480              | 10               | 400                                    | 800                                    |
  /// | 1280 * 720             | 15               | 1130                                   | 2260                                   |
  /// | 1280 * 720             | 30               | 1710                                   | 3420                                   |
  /// | 960 * 720              | 15               | 910                                    | 1820                                   |
  /// | 960 * 720              | 30               | 1380                                   | 2760                                   |
  ///
  ///  **Note**
  /// - The base bitrate in this table applies to the Communication profile.
  /// - The LiveBroadcasting profile generally requires a higher bitrate for better video quality. We recommend setting the bitrate mode as `0`. You can also set the bitrate as the base bitrate value x 2.
  int? bitrate;

  /// The minimum encoding bitrate (Kbps). The Agora SDK automatically adjusts the encoding bitrate to adapt to the network conditions. Using a value greater than the default value forces the video encoder to output high-quality images but may cause more packet loss and hence sacrifice the smoothness of the video transmission. That said, unless you have special requirements for image quality, Agora does not recommend changing this value.
  int? minBitrate;

  /// The orientation mode.
  /// See [VideoOutputOrientationMode].
  VideoOutputOrientationMode? orientationMode;

  /// The video encoding degradation preference under limited bandwidth:
  /// See [DegradationPreference].
  DegradationPreference? degradationPrefer;

  /// Sets the mirror mode of the published local video stream.
  /// This member only affects the video that the remote user sees.
  /// See [VideoMirrorMode].
  VideoMirrorMode? mirrorMode;

  /// Constructs a [VideoEncoderConfiguration]
  VideoEncoderConfiguration(
      {this.dimensions,
      this.frameRate,
      this.minFrameRate,
      this.bitrate,
      this.minBitrate,
      this.orientationMode,
      this.degradationPrefer,
      this.mirrorMode});
}

/// The video resolution.
class VideoDimensions {
  /// The video resolution on the horizontal axis.
  final int width;

  /// The video resolution on the vertical axis.
  final int height;

  /// Constructs a [VideoDimensions]
  const VideoDimensions._(this.width, this.height);

  static const VD_320x240 = VideoDimensions._(320, 240);
  static const VD_352x288 = VideoDimensions._(352, 288);
  static const VD_640x480 = VideoDimensions._(640, 480);
  static const VD_1280x720 = VideoDimensions._(1280, 720);
  static const VD_1920x1080 = VideoDimensions._(1920, 1080);
}

/// Video stream type.
enum VideoStreamType {
  /// High-bitrate, high-resolution video stream.
  High,

  /// Low-bitrate, low-resolution video stream.
  Low,
}

/// 目前声网的录制会生成wav.（会忽略你传路径的后缀）
/// 即构的录制会生成aac.
class RecordConfig {
  late String filePath;

  // 完成后会赋值最终路径
  String? resultPath;

  @override
  String toString() {
    return 'RecordConfig{filePath: $filePath, resultPath: $resultPath}';
  }
}

enum RecordState {
  NoRecord, // 失败，或者没有录制
  Recording, // 开始录制，或者录制中
  Success, // 录制成功
}

class ChannelMediaOptions {
  /// Determines whether to subscribe to audio streams when the user joins the channel.
  /// - `true`: (Default) Subscribe.
  /// - `false`: Do not subscribe.
  ///
  /// This member serves a similar function to the [RtcEngine.muteAllRemoteAudioStreams] method.
  /// After joining the channel, you can call `muteAllRemoteAudioStreams` to set whether to subscribe to audio streams in the channel.
  final bool autoSubscribeAudio;

  /// Determines whether to subscribe to video streams when the user joins the channel.
  /// - `true`: (Default) Subscribe.
  /// - `false`: Do not subscribe.
  ///
  /// This member serves a similar function to the [RtcEngine.muteAllRemoteVideoStreams] method.
  /// After joining the channel, you can call `muteAllRemoteVideoStreams` to set whether to subscribe to video streams in the channel.
  final bool autoSubscribeVideo;

  /// Determines whether to publish the local audio stream when the user joins a channel
  /// - `true`: Publish.
  /// - `false`: Do not publish.
  ///
  /// This member serves a similar function to the [RtcEngine.muteLocalAudioStream] method. After the user joins the channel, you can call the [RtcEngine.muteLocalAudioStream] method to set whether to publish the local audio stream in the channel.
  bool publishLocalAudio;

  /// Determines whether to publish the local video stream when the user joins a channel:
  /// - `true`: Publish.
  /// - `false`: Do not publish.
  ///
  /// This member serves a similar function to the [RtcEngine.muteLocalVideoStream] method. After the user joins the channel, you can call the [RtcEngine.muteLocalVideoStream] method to set whether to publish the local video stream in the channel.
  bool publishLocalVideo;

  /// Constructs a [ChannelMediaOptions]
  ChannelMediaOptions({
    this.autoSubscribeAudio = false,
    this.autoSubscribeVideo = false,
    this.publishLocalAudio = false,
    this.publishLocalVideo = false,
  });
}

/// Audio reverberation advanced parameters.
///
/// Developers can use the SDK's built-in presets to change the parameters of the reverb.
class ReverbAdvancedParam {
  /// Room size(%), in the range [0.0, 1.0], to control the size of the "room" in which the reverb is generated, the larger the room, the stronger the reverb.
  double roomSize;

  /// Echo(%), in the range [0.0, 100.0], to control the trailing length of the reverb.
  double reverberance;

  /// Reverb Damping(%), range [0.0, 100.0], controls the attenuation of the reverb, the higher the damping, the higher the attenuation.
  double damping;

  /// only wet
  bool wetOnly;

  /// wet gain(dB), range [-20.0, 10.0]
  double wetGain;

  /// dry gain(dB), range [-20.0, 10.0]
  double dryGain;

  /// Tone Low. 100% by default
  double toneLow;

  /// Tone High. 100% by default
  double toneHigh;

  /// PreDelay(ms), range [0.0, 200.0]
  double preDelay;

  /// Stereo Width(%). 0% by default
  double stereoWidth;

  ReverbAdvancedParam({
      this.roomSize=0,
      this.reverberance=0,
      this.damping=0,
      this.wetOnly=false,
      this.wetGain=0,
      this.dryGain=0,
      this.toneLow=0,
      this.toneHigh=0,
      this.preDelay=0,
      this.stereoWidth=0});
}

/// Audio reverberation echo parameters.
class ReverbEchoParam {
  /// Gain of input audio signal, in the range [0.0, 1.0]
  double inGain;

  /// Gain of output audio signal, in the range [0.0, 1.0]
  double outGain;

  /// Number of echos, in the range [0, 7]
  int numDelays;

  /// Respective delay of echo signal, in milliseconds, in the range [0, 5000] ms
  List<int> delay;

  /// Respective decay coefficient of echo signal, in the range [0.0, 1.0]
  List<double> decay;

  ReverbEchoParam({
      this.inGain=0, this.outGain=0, this.numDelays=0, this.delay=const [], this.decay=const []});
}

class MixStreamConfig {
  int mainInputVolume;
  int auxInputVolume;

  /// 网络环境好的情况下(国内)可以修改为30
  int syncProcessDelay;

  MixStreamConfig({
    this.mainInputVolume = 100,
    this.auxInputVolume = 140,
    this.syncProcessDelay = 30,
  });
}