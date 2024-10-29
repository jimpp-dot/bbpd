import 'package:pulse_im/src/socket/local_user_data.dart';

/// IM基础配置信息
class IMConfig {
  /// 暂时不用，改为后台下发了
  static const WEB_SOCKET_ADDRESS_DEV = "ws://47.114.166.11:6080/imgate/ws/connect";

  /// 暂时不用，改为后台下发了
  static const WEB_SOCKET_ADDRESS_PRODUCT = "wss://im.yinjietd.com:6511/ws/connect";

  static const APP_ID = "02a508ce025fdfe0b87eb394ef2b589f";

  static const DEFAULT_HEARTBEAT = 15;

  /// 是否为IM插件,如果为true,将不会挤掉原IM的登录态
  static bool isChatPlugin = false;

  static String? getSocketAddress() {
    return LocalUserData.socketAddress;
  }
}

class SendMsgErrorCode {
  ///拉黑后无法聊天
  static const IN_BLACK_LIST = 405;

  ///一秒钟最多能发送5条消息
  static const MOST_FIVE_MSG_PER_SECOND = 20604;

  ///你已不在当前讨论组中
  static const YOU_OUT_OF_THIS_TEAM = 21406;

  ///你已不在当前群组中
  static const YOU_OUT_OF_THIS_GROUP = 22406;

  /// 你在当前群组中已被禁言
  static const YOU_ARE_MUTED_IN_THIS_GROUP = 22408;

  /// 通话鉴权失败,请稍后
  static const CALLING_AUTHENTICATION_FAILED = 24012;

  ///"当前连接不可用(30001),请稍后",
  static const CONNECTED_FAILED_30001 = 30001;

  ///"图片上传失败(30002),请稍后",30002
  static const CONNECTED_FAILED_30002 = 30002;

  ///"消息响应超时",30003
  static const MSG_RESPONSE_TIME_OUT = 30003;

  /// "消息大小超过限制",30016
  static const MSG_TOO_LARGE = 30016;

  /// "请求内存分配失败，请重试",30017
  static const REQ_MEMORY_FAILED = 30017;

  /// "Token失效，请重试",31004
  static const TOKEN_INVALID = 31004;

  ///  "你已被封禁，请联系APP管理员",31009
  static const YOU_ARE_BANNED = 31009;

  /// "你在其它设备已经登录，此设备已下线"31010
  static const DEVICE_LOGIN_ON_OTHER_DEVICE = 31010;

  ///"发送语音失败"
  static const MSG_SEND_VOICE_ERROR = 31011;
}

class StringConfig {
  static const String SEND_GIFT = "发送礼物";
  static const String SEND_PKG = "发送红包";
}
