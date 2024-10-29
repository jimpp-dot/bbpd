class ImSupportSDKVersions {
  /// 当前IM SDK 版本号 : 适用于某些需要升级到最新版本的才可正常查看的消息，用于提示用户升级到最新版本
  /// 6 : 房主邀请成员加入歌友会
  /// 8 : 发送心动问答
  static const int CURRENT_SDK_VERSION = 8;

  /// 群聊@消息，支持的最低IM SDK版本号: 2
  static const AT_MESSAGE_SUPPORT_VERSION = 2;

  /// 发送语音改为OSS上传, 支持最低IM SDK版本号: 3
  static const OSS_VOICE_SUPPORT_VERSION = 3;

  /// 发送动态，支持最低IM SDK版本号: 4
  static const MOMENT_MESSAGE_SUPPORT_VERSION = 4;

  /// 发送默契问答，支持最低IM SDK版本号: 5
  static const TACIT_MESSAGE_SUPPORT_VERSION = 5;
}
