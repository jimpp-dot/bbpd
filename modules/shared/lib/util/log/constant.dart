/*
[Verbose] - Only when I would be "tracing" the code and trying to find one part of a function specifically.
[Debug] - Information that is diagnostically helpful to people more than just developers (IT, sysadmins, etc.).
[Info] - Generally useful information to log (service start/stop, configuration assumptions, etc). Info I want to always have available but usually don't care about under normal circumstances. This is my out-of-the-box config level.
[Warn] - Anything that can potentially cause application oddities, but for which I am automatically recovering. (Such as switching from a primary to backup server, retrying an operation, missing secondary data, etc.)
[Error] - Any error which is fatal to the operation, but not the service or application (can't open a required file, missing data, etc.). These errors will force user (administrator, or direct user) intervention. These are usually reserved (in my apps) for incorrect connection strings, missing services, etc.
*/

import 'package:shared/util/log/http_req_log_item.dart';

enum LogLevel { none, verbose, debug, info, warning, error }

class LogConstant {
  /// 需要写到日志文件中的接口
  static List<HttpReqLogItem> reportUrls = [
    HttpReqLogItem('room/config'),
    HttpReqLogItem('go/RoomBase/PostRoomLike', logRespBody: true)
  ];

  /// IM 尝试重连socket
  static const imTryConnect = 'imTryConnect';

  /// IM 真正链接socket
  static const imRealConnect = 'imRealConnect';

  /// IM socket链接失败
  static const imConnectError = 'imConnectError';

  /// IM socket链接数据错误
  static const imConnectDataError = 'imConnectDataError';

  /// IM socket链接断开
  static const imConnectDone = 'imConnectDone';

  /// 房间socket链接
  static const roomConnection = 'roomConnection';

  /// 忽略的Exception(太多了)
  static const List<String> ignoreExceptions = ['unresized image'];

  /// 网络请求
  static const String httpRequest = 'httpRequest';

  /// 房间 rtc engine
  static const String rtcEngineError = 'rtcEngineError';
}
