// dart枚举不完善，不能指定初始值，用class static const int替代
import 'dart:convert';

import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_util.dart';

class CMDType {
  static const int CMD_TYPE_UNIVERSAL = 0;
  static const int LOGIN = 1; //登入
  static const int LOGOUT = 2; //登出
  static const int KICK_OUT = 3; //被服务器踢下线踢人
  static const int SEND_CHAT = 4; //发送聊天消息
  static const int GET_MSG = 5; //获取聊天消息
  static const int SET_NOTIFY_STATUS = 9; // 设置群组通知状态
  static const int GET_NOTIFY_STATUS = 10; // 获取群组通知状态
  static const int ACK = 11; //回执消息

  static const int LOGIN_RES = 1001; //登录响应
  static const int LOGOUT_RES = 1002; //退出登录的响应
  static const int KICK_OUT_RES = 1003; //当前用户在其他设备上登录，此设备被踢下线
  static const int SEND_MSG_RES = 1004; //发送消息的相应，只有在错误的时候相应，成功的话，会通过 NEW_MSG_NOTIFY => GET_MSG_RES 响应
  static const int GET_MSG_RES = 1005; //获取聊天消息响应
  static const int SET_NOTIFY_STATUS_RES = 1009; //设置群组通知状态响应
  static const int GET_NOTIFY_STATUS_RES = 1010; //获取群组通知状态响应

  static const int NEW_MSG_NOTIFY = 1111; //新消息通知
  static const int OFFSET_ACK = 1112; //聊天消息确认
  static const int STATUS_MSG_NOTIFY = 1113; //阅后即焚消息，如键盘输入

  static const int KICK_OUT_REASON_LOGIN_DUPLICATE = 31011; // 重复登录被踢
}

class BMsg {
  int? ctype; //会话类型
  int fromUserId = 0; //发送者id
  int targetId = 0; //接收者，私聊为user_id，群聊为group_id，派对为room_id
  int clientMessageId = 0; //发送者本地自增msgId
  String? msgUid; //消息uid，服务器生成，用于服务器排重
  String content = ''; //消息内容，以 JSON 方式进行数据序列化
  int msgId = 0; //服务器返回的消息ID
  int msgType = 0; //消息类型

  BMsg();

  BMsg.fromMap(Map data)
      : ctype = data['ctype'],
        fromUserId = IMUtil.parseInt(data['fromUserId']),
        targetId = IMUtil.parseInt(data['targetId']),
        clientMessageId = IMUtil.parseInt(data['clientMessageId']),
        msgUid = data['msgUid'],
        content = data['content'] ?? '',
        msgId = IMUtil.parseInt(data['msgId']),
        msgType = IMUtil.parseInt(data['msgType']);

  Map toMap() {
    Map map = {};
    map['ctype'] = ctype;
    map['fromUserId'] = fromUserId;
    map['targetId'] = targetId;
    map['clientMessageId'] = clientMessageId;
    map['msgUid'] = msgUid;
    map['content'] = content;
    map['msgId'] = msgId;
    map['msgType'] = msgType;
    return map;
  }

  String toJson() {
    Map map = {};
    map['ctype'] = ctype;
    map['fromUserId'] = fromUserId;
    map['targetId'] = targetId;
    map['clientMessageId'] = clientMessageId;
    map['msgUid'] = msgUid;
    map['content'] = content;
    map['msgId'] = msgId;
    map['msgType'] = msgType;
    return json.encode(map);
  }
}

class BError {
  final int code;
  final String msg;

  BError(this.code, this.msg);

  static BError fromMap(Map map) {
    return BError(IMUtil.parseInt(map["code"]), map["msg"] ?? '');
  }
}

class IncludeSenderType {
  static const int INCLUDE_SENDER = 1;
  static const int NOT_INCLUDE_SENDER = 0;
}

class OfflinePersistedType {
  static const NO_PERSISTED = 0;
  static const PERSISTED = 1;
}

class VerifyBlackType {
  static const NO_VERIFY = 0;
  static const VERIFY = 1;
}

// 登入
class ReqLogin {
  int userId;
  int clientType; // 1: android 2: IOS
  String token; // 用户token
  String suid; // 设备标识，先不用填写
  String deviceID; // 第三方push服务设备RegId
  String deviceVendor; //手机设备厂商
  String package; // app包名

  ReqLogin(this.userId, this.clientType, this.token, this.suid, this.deviceID, this.deviceVendor, this.package);

  Map toMap() {
    Map map = {};
    map['userId'] = userId;
    map['clientType'] = clientType;
    map['token'] = (token != null) ? token : '';
    map['suid'] = (suid != null) ? suid : '';
    map['deviceID'] = (deviceID != null) ? deviceID : '';
    map['deviceVendor'] = (deviceVendor != null) ? deviceVendor : '';
    map['package'] = package;
    map['v'] = LocalUserData.version;
    map['uuid'] = LocalUserData.uuid;
    return map;
  }
}

//登入响应
class ResLogin {
  BError? err;
  int heartbeat = 0;

  static ResLogin fromMap(Map data) {
    ResLogin resLogin = ResLogin();
    resLogin.err = data["err"] != null ? BError.fromMap(data["err"]) : null;
    resLogin.heartbeat = IMUtil.parseInt(data["heartbeat"]);
    return resLogin;
  }
}

// 登出
class ReqLogout {}

// 登出响应
class ResLogout {
  BError? err;
}

//发送消息请求
class ReqSendMsg {
  BMsg? msg;
  String? pushContent; //定义显示的 Push 内容，如果为"",则任务不需要推送
  String? pushData;
  String? pushTitle; // push通知栏标题，如果为null默认为发送者name
  int isIncludeSender = IncludeSenderType.INCLUDE_SENDER; //发送方是否接收消息，0 表示为不接收，1 表示为接收，默认为 1 接收
  int isOfflinePersisted = OfflinePersistedType.PERSISTED; //是否离线存储, 1表示存储，0表示不存储，多用于状态类消息
  int verifyBlacklist = VerifyBlackType.VERIFY; //是否前置过滤，0 表示为不过滤、 1 表示为过滤
  Mention? mi;

  ReqSendMsg();

  Map toMap() {
    Map map = <String, dynamic>{};
    map['msg'] = (msg != null) ? msg!.toMap() : {};
    map['pushContent'] = (pushContent != null) ? pushContent : '';
    map['pushData'] = (pushData != null) ? pushData : '';
    map['pushTitle'] = pushTitle ?? '';
    map['isIncludeSender'] = isIncludeSender;
    map['isOfflinePersisted'] = isOfflinePersisted;
    map['verifyBlacklist'] = verifyBlacklist;
    if (mi != null) {
      map['mi'] = mi!.toMap();
    }
    return map;
  }

  /// 暂时没用的方法。
  String toJson() {
    Map map = {};
    map['msg'] = (msg != null) ? msg!.toJson() : '';
    map['pushContent'] = (pushContent != null) ? pushContent : '';
    map['pushData'] = (pushData != null) ? pushData : '';
    map['pushTitle'] = pushTitle ?? '';
    map['isIncludeSender'] = isIncludeSender;
    map['isOfflinePersisted'] = isOfflinePersisted;
    map['verifyBlacklist'] = verifyBlacklist;
    map['mi'] = (mi != null) ? mi!.toJson() : '';
    return json.encode(map);
  }
}

class Mention {
  final int mtype;
  final List<int> userList;

  Mention(this.mtype, this.userList);

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
        IMUtil.parseInt(json['mtype']),
        (json['userList'] as List).map((e) => IMUtil.parseInt(e)).toList(),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'mtype': mtype,
        'userList': userList,
      };

  String toJson() => json.encode(toMap());
}

///发送消息的相应，只有在错误的时候相应，成功的话，会通过 NEW_MSG_NOTIFY => GET_MSG_RES 响应
class ResSendMsg {
  final BError err;
  final int clientMessageId;

  ResSendMsg(this.err, this.clientMessageId);

  static ResSendMsg fromMap(Map data) {
    ResSendMsg resSendMsg = ResSendMsg(BError.fromMap(data["err"]), IMUtil.parseInt(data["clientMessageId"]));
    return resSendMsg;
  }
}

/// 通知客户端有新消息，
class NotifyClientNewMsg {
  final int userId;

  NotifyClientNewMsg(this.userId);

  static NotifyClientNewMsg fromMap(Map data) {
    NotifyClientNewMsg msg = NotifyClientNewMsg(IMUtil.parseInt(data['userId']));
    return msg;
  }
}

// 发送状态消息成功，通知客户端阅后即焚消息，如键盘输入
class NotifyClientStatusMsg {
  final BMsg msg;

  NotifyClientStatusMsg(this.msg);

  static NotifyClientStatusMsg fromMap(Map data) {
    NotifyClientStatusMsg statusMsg = NotifyClientStatusMsg(BMsg.fromMap(data['msg']));
    return statusMsg;
  }
}

///获取消息的请求
class ReqGetMsg {
  int? lastMsgId;
  int? count;
  int? reqID;
  String? extra;
  int? direction;
  int? userId;

  Map toMap() {
    Map map = {};
    map['lastMsgId'] = lastMsgId;
    map['count'] = count;
    map['reqID'] = reqID;
    map['extra'] = (extra != null) ? extra : '';
    map['direction'] = direction;
    map['userId'] = userId;
    return map;
  }

  String toJson() {
    Map map = {};
    map['lastMsgId'] = lastMsgId;
    map['count'] = count;
    map['reqID'] = reqID;
    map['extra'] = (extra != null) ? extra : '';
    map['direction'] = direction;
    map['userId'] = userId;
    return json.encode(map);
  }

  /// 按照发送时间(sentTime)正排序
  static const DIRECTION_ASC = 0;
}

///获取消息响应
class ResGetMsg {
  BError? err;
  List<BMsg> msgList = [];
  int reqID = 0;
  String? extra;
  int userId = 0;
  int lastMsgId = 0; //获取消息的最新时间,单位微秒

  static ResGetMsg formMap(Map map) {
    ResGetMsg resGetMsg = ResGetMsg();
    resGetMsg.err = map["err"] != null ? BError.fromMap(map["err"]) : null;
    if (map['msgList'] != null) {
      List<dynamic> msgList = map['msgList'];
      if (msgList.isNotEmpty) {
        List<BMsg> rList = [];
        for (var element in msgList) {
          rList.add(BMsg.fromMap(element));
        }
        resGetMsg.msgList = rList;
      }
    }
    resGetMsg.reqID = IMUtil.parseInt(map["reqID"]);
    resGetMsg.extra = map["extra"];
    resGetMsg.userId = IMUtil.parseInt(map["userId"]);
    resGetMsg.lastMsgId = IMUtil.parseInt(map["lastMsgId"]);
    return resGetMsg;
  }
}

class ReadReceiptMsg {
  String conversationType = '';
  String targetId = '';
  int timestamp = 0;

  String toJson() {
    Map map = {};
    map['conversationType'] = conversationType;
    map['targetId'] = targetId;
    map['timestamp'] = timestamp;
    return json.encode(map);
  }

  static ReadReceiptMsg fromJson(String data) {
    Map map = json.decode(data);
    var msg = ReadReceiptMsg();
    msg.conversationType = map['conversationType'];
    msg.targetId = map['targetId'];
    msg.timestamp = map['timestamp'];
    return msg;
  }
}

class DeleteMsg {
  List<int> msgIds = [];

  String toJson() {
    Map map = {};
    map['msgId'] = msgIds;
    return json.encode(map);
  }

  static DeleteMsg fromJson(String data) {
    Map map = json.decode(data);
    var msg = DeleteMsg();
    if (map['msgId'] != null) {
      List<dynamic> msgIdList = map['msgId'];
      if (msgIdList.isNotEmpty) {
        List<int> rList = [];
        for (var element in msgIdList) {
          rList.add(IMUtil.parseInt(element));
        }
        msg.msgIds = rList;
      }
    }
    return msg;
  }

  @override
  String toString() {
    return 'DeleteMsg{msgIds: $msgIds}';
  }
}

class NotifyStatus {
  int conversationType = 0;
  String targetId = '';
  int? notificationStatus; // 1：接收群通知，2：不接受群通知

  Map toMap(bool includeStatus) {
    Map map = {};
    map["conversationType"] = conversationType;
    map["targetId"] = targetId;
    if (includeStatus) {
      map["notificationStatus"] = notificationStatus;
    }
    return map;
  }

  static NotifyStatus? fromMap(Map map) {
    if (map.isEmpty) {
      return null;
    }
    NotifyStatus notifyStatus = NotifyStatus();
    notifyStatus.conversationType = map["conversationType"];
    notifyStatus.targetId = map["targetId"];
    notifyStatus.notificationStatus = IMUtil.parseInt(map["notificationStatus"]);
    return notifyStatus;
  }
}

class ResNotifyStatus {
  BError? err;
  NotifyStatus? notifyStatus;

  static ResNotifyStatus fromMap(Map map) {
    ResNotifyStatus notifyStatus = ResNotifyStatus();
    notifyStatus.err = map["err"] != null ? BError.fromMap(map["err"]) : null;
    notifyStatus.notifyStatus = NotifyStatus.fromMap(map);
    return notifyStatus;
  }
}

class ReqAck {
  int fromUserId;
  String msgUid;

  ReqAck(this.fromUserId, this.msgUid);

  Map toMap() {
    Map map = <String, dynamic>{};
    map['fromUserId'] = fromUserId;
    map['msgUid'] = msgUid;
    return map;
  }
}
