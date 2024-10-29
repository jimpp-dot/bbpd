import 'package:commonrtc_api/commonrtc_api.dart';

import '../zego_express_engine.dart';

extension ZegoStreamExt on ZegoStream {
  String get print {
    return 'uid=${user.userID},streamID=$streamID';
  }
}

/// 错误码，详细请参考错误码文档 https://doc-zh.zego.im/article/5641。
String getErrorInfo(int errorCode) {
  switch (errorCode) {
    case 1002005:
      return "userId 为空";
    case 1002008:
      return "username 为空";
    case 1017000:
      return "输入的 command 参数为空";
    case 1017001:
      return "输入的 params 参数为空";
    case 1017002:
      return "输入的 song_id 参数为空";
    case 1017003:
      return "输入的 song_token 参数为空";
    case 1017004:
      return "输入的 resource_id 参数为空";
    case 1017005:
      return "输入的 start_position 参数无效";
    case 1017006:
      return "输入的 position 参数无效";
    case 1017007:
      return "输入的 Volume 参数无效";
    case 1017008:
      return "输入的 krcToken 参数无效";
    case 1017010:
      return "请求版权服务失败（服务响应body解析失败）";
    case 1017011:
      return "本地磁盘空间不足";
    case 1017012:
      return "正在下载中";
    case 1017013:
      return "资源文件丢失";
    case 1017014:
      return "过期的资源文件";
    case 1017015:
      return "无效的资源文件";
    case 1017016:
      return "当前资源不支持切换音轨";
    case 1017017:
      return "媒体未开始播放";
    case 1017018:
      return "资源ID 未授权";
    case 1017020:
      return "媒体播放器错误";
    case 1017030:
      return "音乐无版权";
    case 1017031:
      return "音乐无词曲权限";
    case 1017032:
      return "非包月会员";
    case 1017033:
      return "没有对应的伴奏";
    case 1017034:
      return "找不到资源";
    case 1017040:
      return "参数非法";
    case 1017041:
      return "appid 不可用";
    case 1017042:
      return "不支持的付费类型";
    case 1017043:
      return "会员按次访问";
    case 1017044:
      return "分享 Token 过期";
    case 1017045:
      return "分享 Token 非法";
    case 1017046:
      return "krcToken 非法";
    case 1017047:
      return "krcToken 过期";
    case 1017048:
      return "获取歌词失败";
    case 1017049:
      return "获取标准音高线失败";
    case 1017096:
      return "版权音乐模块未初始化";
    case 1017097:
      return "系统繁忙";
    case 1017098:
      return "网络错误";
    case 1017099:
      return "可能原因：内部未知错误";
  }
  rtcLog(' getErrorInfo errorCode $errorCode');
  return "";
}
