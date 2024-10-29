import 'dart:convert';

import 'package:pulse_im/src/pulse_im_client.dart';
import 'package:pulse_im/src/db/db_helper.dart';
import 'package:pulse_im/src/db/db_manager.dart';
import 'package:pulse_im/src/model/message_content.dart';
import 'package:pulse_im/src/network/api_service.dart';
import 'package:pulse_im/src/protocol/common_define.dart';
import 'package:pulse_im/src/protocol/protocol_define.dart';
import 'package:pulse_im/src/socket/connection.dart';
import 'package:pulse_im/src/socket/conversation_data_helper.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_config.dart';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:flutter/foundation.dart';

class MessageSender extends IMessageSender {
  /// 伴伴1.6.5 新增 小号消息 需求；统一由 DatabaseManager 管理
  // final DatabaseHelper _db = DatabaseManager().getDatabaseHelp();

  final Set<int> _reCallMsgIds = {};

  static const LOG_TAG = "MessageSender";

  @override
  Future<bool> login(String pushToken, String pushVendor) async {
    IMLog.d(LOG_TAG,
        '[login] userInfo uid:${LocalUserData.senderUserId}, name:${LocalUserData.senderName}, pushToken = $pushToken, pushVendor = $pushVendor');

    ReqLogin req = ReqLogin(
      IMUtil.parseInt(LocalUserData.senderUserId),
      IMUtil.getPlatform(),
      LocalUserData.senderToken,
      '',
      pushToken,
      pushVendor,
      LocalUserData.package,
    );
    Map map = {};
    map['cmd'] = CMDType.LOGIN;
    map['reqLogin'] = req.toMap();
    String packet = json.encode(map);

    IMLog.d(LOG_TAG, ' [login] $packet');
    return socketConnection?.sendPacket(packet) ?? false;
  }

  /// 发送消息，return null表示失败
  Future<MessageContent?> sendMessage(String type, String targetId, MessageContent content,
      [String pushContent = "", String pushData = "", String pushTitle = "", bool saveToDb = true]) async {
    content.conversationType = type;
    content.targetId = targetId;
    content.senderId = LocalUserData.senderUserId;
    content.messageUId = '0';
    content.messageDirection = MessageDirection.Send;
    content.objectName = MessageType.toObjectName(content.type);
    content.sentTime = DateTime.now().millisecondsSinceEpoch;
    content.sentStatus = MessageStatus.Sending;

    DatabaseHelper? db = DatabaseManager().getDatabaseHelp();

    if (saveToDb) {
      /// 如果是重发，更新发送时间和发送状态
      final bool saveDbStatus;
      if (content.messageId > 0) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['sentTime'] = content.sentTime;
        map['sentStatus'] = content.sentStatus;
        saveDbStatus = (await db?.updateMessageContent("messageId=?", [content.messageId], map)) == true;
      } else {
        //插入sqflite，并且更新content.cMessageId
        saveDbStatus = ((await db?.insertMessageContent(content))?.messageId ?? 0) > 0;
      }
      if (!saveDbStatus) {
        return null;
      }
      //更新Conversation表
      await ConversationDataHelper.updateOrInsertConversation(content, LocalUserData.senderUserId);
    }

    if (content.type == MessageType.Text) {
      /// Text消息存到数据后发回调
      PulseIMClient.onMessageSend(content.messageId, content.sentStatus, 0);
    } else if (content.type == MessageType.Image &&
        !IMUtil.isStringEmpty(content.imageUrl) &&
        !IMUtil.isHttpUrl(content.imageUrl)) {
      MessageContent? imgMsgContent = await _handleImgMsg(content);
      if (imgMsgContent == null) {
        return null;
      }
    } else if (content.type == MessageType.Voice &&
        !IMUtil.isStringEmpty(content.audioData) &&
        !IMUtil.isHttpUrl(content.audioData)) {
      MessageContent? voiceMsgContent = await _handleVoiceMsg(content);
      if (voiceMsgContent == null) {
        return null;
      }
    }

    BMsg msg = BMsg();
    msg.ctype = ConversationType.toIntType(type);
    msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
    msg.targetId = IMUtil.parseInt(targetId);
    msg.clientMessageId = content.messageId;
    msg.msgUid = '';
    msg.content = content.toJson();
    msg.msgId = -1;
    msg.msgType = MessageType.toIntType(content.type);

    ReqSendMsg req = ReqSendMsg();
    req.msg = msg;
    req.pushData = pushData;
    req.pushContent = pushContent;
    req.pushTitle = pushTitle;
    if (msg.msgType == MessageTypeInt.BMSG_TYPE_MENTIONED) {
      req.mi = Mention.fromJson(Map.from(content.getExtraMap()));
    }

    Map map = {};
    map['cmd'] = CMDType.SEND_CHAT;
    map['reqSendMsg'] = req.toMap();
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendMessage] $packet');
    bool success = socketConnection?.sendPacket(packet) ?? false;
    if (!success) {
      await db?.updateMessageSentStatus(content.messageId, MessageStatus.Failed);
      PulseIMClient.onMessageSend(content.messageId, MessageStatus.Failed, SendMsgErrorCode.CONNECTED_FAILED_30001);
      return null;
    }
    return content;
  }

  Future<MessageContent?> _handleImgMsg(MessageContent content) async {
    PulseIMClient.onMessageSend(content.messageId, content.sentStatus, 0);
    String imagePath = content.imageUrl!;
    String md5 = await IMUtil.fmd5AndBase64(imagePath);
    String fileName = imagePath.substring(imagePath.lastIndexOf("/") + 1, imagePath.length);
    final getUrlRetMap = await APIService.getUploadUrl(LocalUserData.senderUserId, IMConfig.APP_ID, fileName, md5: md5);

    DatabaseHelper? db = DatabaseManager().getDatabaseHelp();

    /// 发送图片过程中，撤回的话，就不继续发送了
    if (_reCallMsgIds.contains(content.messageId)) {
      _reCallMsgIds.remove(content.messageId);
      return null;
    }

    if (!getUrlRetMap.containsKey("ossUrl") || !getUrlRetMap.containsKey("contentType")) {
      await db?.updateMessageSentStatus(content.messageId, MessageStatus.Failed);
      PulseIMClient.onMessageSend(content.messageId, MessageStatus.Failed, SendMsgErrorCode.CONNECTED_FAILED_30002);
      return null;
    }

    Map? uploadRetMap =
        await APIService.uploadFile(getUrlRetMap['ossUrl'], getUrlRetMap['contentType'], imagePath, md5);

    /// 发送图片过程中，撤回的话，就不继续发送了
    if (_reCallMsgIds.contains(content.messageId)) {
      _reCallMsgIds.remove(content.messageId);
      return null;
    }

    if (uploadRetMap == null || IMUtil.isStringEmpty(uploadRetMap['url'])) {
      await db?.updateMessageSentStatus(content.messageId, MessageStatus.Failed);
      PulseIMClient.onMessageSend(content.messageId, MessageStatus.Failed, SendMsgErrorCode.CONNECTED_FAILED_30002);
      return null;
    }

    content.imageUrl = uploadRetMap['url'];
    content.thumb = !IMUtil.isStringEmpty(uploadRetMap['thumbUrl']) ? uploadRetMap['thumbUrl'] : uploadRetMap['url'];

    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(content.messageId);
    Map<String, dynamic> values = {};
    values['thumb'] = content.thumb;
    values['imageUrl'] = content.imageUrl;

    await db?.updateMessageContent(whereStr, whereArgs, values);
    return content;
  }

  /// 发送语音处理
  /// @return 不为空表示发送失败
  Future<MessageContent?> _handleVoiceMsg(MessageContent content) async {
    PulseIMClient.onMessageSend(content.messageId, content.sentStatus, 0);
    String? voiceUrl = await APIService.uploadAudioData(content.audioData!);

    DatabaseHelper? db = DatabaseManager().getDatabaseHelp();

    /// 发送语音过程中，撤回的话，就不继续发送了
    if (_reCallMsgIds.contains(content.messageId)) {
      _reCallMsgIds.remove(content.messageId);
      return null;
    }

    if (!IMUtil.isHttpUrl(voiceUrl)) {
      await db?.updateMessageSentStatus(content.messageId, MessageStatus.Failed);
      PulseIMClient.onMessageSend(content.messageId, MessageStatus.Failed, SendMsgErrorCode.MSG_SEND_VOICE_ERROR);
      return null;
    }

    /// 发送语音过程中，撤回的话，就不继续发送了
    if (_reCallMsgIds.contains(content.messageId)) {
      _reCallMsgIds.remove(content.messageId);
      return null;
    }
    content.audioData = voiceUrl!;
    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(content.messageId);
    Map<String, dynamic> values = {};
    values['audioData'] = voiceUrl;
    await db?.updateMessageContent(whereStr, whereArgs, values);
    return content;
  }

  ///同步远端消息请求
  doGetMsgRequest(int startId, int count, String userId) {
    var req = ReqGetMsg();
    req.lastMsgId = startId;
    req.count = count;
    req.direction = 0;
    req.userId = IMUtil.parseInt(userId);
    Map map = {};
    map['cmd'] = CMDType.GET_MSG;
    map['reqGetMsg'] = req.toMap();
    String packet = json.encode(map);

    IMLog.d(LOG_TAG, '[_doGetMsgRequest] $packet');
    socketConnection?.sendPacket(packet);
  }

  Future<int> sendReadReceiptMessage(String conversationType, String targetId, int timestamp) async {
    ReadReceiptMsg readReceiptMsg = ReadReceiptMsg();
    readReceiptMsg.conversationType = conversationType;
    readReceiptMsg.targetId = LocalUserData.senderUserId;
    readReceiptMsg.timestamp = timestamp;

    ReqSendMsg req = ReqSendMsg();
    BMsg msg = BMsg();
    msg.ctype = ConversationType.toIntType(conversationType);
    msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
    msg.targetId = IMUtil.parseInt(targetId);
    msg.clientMessageId = -1;
    msg.msgUid = '';
    msg.content = readReceiptMsg.toJson();
    msg.msgId = -1;
    msg.msgType = MessageTypeInt.BMSG_TYPE_READRECEIPT;
    req.msg = msg;
    req.isIncludeSender = IncludeSenderType.INCLUDE_SENDER; // 打开别人的会话详情，自己也需收到已读回执，用于已读消息同步
    req.verifyBlacklist = VerifyBlackType.NO_VERIFY;

    Map map = {};
    map['cmd'] = CMDType.SEND_CHAT;
    map['reqSendMsg'] = req.toMap();
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendReadReceiptMessage] ${msg.content}');
    socketConnection?.sendPacket(packet);
    return 0;
  }

  Future<int> sendDeleteMessage(String conversationType, String targetId, List<String> messageUIds) async {
    if (IMUtil.isCollectionEmpty(messageUIds)) return 0;
    List<int> allMsgIds = messageUIds.map((e) => IMUtil.parseInt(e)).where((e) => (e > 0)).toList();
    if (IMUtil.isCollectionEmpty(allMsgIds)) return 0;
    IMLog.d(LOG_TAG, '[sendDeleteMessage] allMsgIds.length: ${allMsgIds.length}');

    int maxLength = 200; //IM服务端 支持的单次请求最大条数
    List<List<int>> partList = []; //分段 后的数据结构
    for (int i = 0; i < allMsgIds.length; i += maxLength) {
      partList.add(allMsgIds.skip(i).take(maxLength).toList());
    }
    IMLog.d(LOG_TAG, '[sendDeleteMessage] partList.length: ${partList.length}');

    await Future.forEach(partList, (List<int> msgIds) async {
      DeleteMsg deleteMsg = DeleteMsg();
      deleteMsg.msgIds = msgIds;

      ReqSendMsg req = ReqSendMsg();
      BMsg msg = BMsg();
      msg.ctype = ConversationType.toIntType(conversationType);
      msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
      msg.targetId = IMUtil.parseInt(targetId);
      msg.clientMessageId = -1;
      msg.msgUid = '';
      msg.content = deleteMsg.toJson();
      msg.msgId = -1;
      msg.msgType = MessageTypeInt.BMSG_TYPE_DELETE;
      req.msg = msg;
      req.isIncludeSender = IncludeSenderType.NOT_INCLUDE_SENDER;
      req.isOfflinePersisted = OfflinePersistedType.PERSISTED;
      req.verifyBlacklist = VerifyBlackType.NO_VERIFY;

      Map map = {};
      map['cmd'] = CMDType.SEND_CHAT;
      map['reqSendMsg'] = req.toMap();
      String packet = json.encode(map);
      IMLog.d(LOG_TAG, '[sendDeleteMessage] content: ${msg.content}');
      socketConnection?.sendPacket(packet);

      /// 间隔50ms
      await Future.delayed(const Duration(milliseconds: 50));
    });
    return 0;
  }

  /// 消息撤回
  Future<MessageContent> recallMessage(MessageContent message, {bool isPayFail = false}) async {
    if (message.type == MessageType.Image) {
      _reCallMsgIds.add(message.messageId);
    }
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp();

    //更改app内存中保存的message.messageType，用于显示
    message.type = MessageType.RcCall;
    final extra = message.extra ?? '{}';
    Map extmap = jsonDecode(extra.isEmpty ? '{}' : extra) ?? {};
    extmap['is_pay_fail'] = isPayFail;
    message.extra = json.encode(extmap);

    //更新撤回消息的msgType为RcCall
    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(message.messageId);
    Map<String, dynamic> values = {};
    values['type'] = MessageType.RcCall;
    values['extra'] = message.extra;
    await db?.updateMessageContent(whereStr, whereArgs, values);

    //更新Conversation表
    await ConversationDataHelper.updateOrInsertConversation(message, LocalUserData.senderUserId);

    Map reCallMap = {};
    reCallMap['reCallMsgSentTime'] = message.sentTime;
    message.content = json.encode(reCallMap);

    ReqSendMsg req = ReqSendMsg();
    BMsg msg = BMsg();
    msg.ctype = ConversationType.toIntType(message.conversationType);
    msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
    msg.targetId = IMUtil.parseInt(message.targetId);
    msg.clientMessageId = message.messageId;
    msg.msgUid = '';
    msg.content = message.toJson();
    msg.msgId = -1;
    msg.msgType = MessageTypeInt.BMSG_TYPE_RECALL;
    req.msg = msg;

    Map map = {};
    map['cmd'] = CMDType.SEND_CHAT;
    map['reqSendMsg'] = req.toMap();
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendRecallMessage] $packet');
    socketConnection?.sendPacket(packet);
    return message;
  }

  Future<void> sendTypingStatus(String conversationType, String targetId) async {
    ReqSendMsg req = ReqSendMsg();
    BMsg msg = BMsg();
    msg.ctype = ConversationType.toIntType(conversationType);
    msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
    msg.targetId = IMUtil.parseInt(targetId);
    msg.clientMessageId = -1;
    msg.msgUid = '';
    msg.content = 'text';
    msg.msgId = -1;
    msg.msgType = MessageTypeInt.BMSG_TYPE_TYPING;
    req.msg = msg;
    req.isIncludeSender = IncludeSenderType.NOT_INCLUDE_SENDER;
    req.isOfflinePersisted = OfflinePersistedType.NO_PERSISTED;
    req.verifyBlacklist = VerifyBlackType.NO_VERIFY;

    Map map = {};
    map['cmd'] = CMDType.SEND_CHAT;
    map['reqSendMsg'] = req.toMap();
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendTypingStatus] $packet');
    socketConnection?.sendPacket(packet);
  }

  Future<void> sendSetNotifyStatus(String type, String targetId, bool notify) async {
    NotifyStatus notifyStatus = NotifyStatus();
    notifyStatus.conversationType = ConversationType.toIntType(type);
    notifyStatus.targetId = targetId;
    notifyStatus.notificationStatus = notify ? 1 : 2;
    Map map = {};
    map['cmd'] = CMDType.SET_NOTIFY_STATUS;
    map['reqDisturb'] = notifyStatus.toMap(true);
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendSetNotifyStatus] $packet');
    socketConnection?.sendPacket(packet);
  }

  Future<void> sendGetNotifyStatus(String type, String targetId) async {
    NotifyStatus notifyStatus = NotifyStatus();
    notifyStatus.conversationType = ConversationType.toIntType(type);
    notifyStatus.targetId = targetId;
    Map map = {};
    map['cmd'] = CMDType.GET_NOTIFY_STATUS;
    map['reqGetDisturb'] = notifyStatus.toMap(false);
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendGetNotifyStatus] $packet');
    socketConnection?.sendPacket(packet);
  }

  Future<void> sendAck(String msgUid) async {
    ReqAck reqAck = ReqAck(IMUtil.parseInt(LocalUserData.senderUserId), msgUid);
    Map map = {};
    map['cmd'] = CMDType.ACK;
    map['reqAck'] = reqAck.toMap();
    String packet = json.encode(map);
    IMLog.d(LOG_TAG, '[sendAck] $packet');
    socketConnection?.sendPacket(packet);
  }

  Future<bool> deleteMessages(int targetId, List<int> messageIds,
      {String conversationType = ConversationType.Private}) {
    ReqSendMsg req = ReqSendMsg();
    BMsg msg = BMsg();
    Map contentMap = {'msgId': messageIds};
    msg.ctype = ConversationType.toIntType(conversationType);
    msg.fromUserId = IMUtil.parseInt(LocalUserData.senderUserId);
    msg.targetId = targetId;
    msg.clientMessageId = -1;
    msg.msgUid = '';
    msg.content = json.encode(contentMap);
    msg.msgId = -1;
    msg.msgType = MessageTypeInt.BMSG_TYPE_DELETE;
    req.msg = msg;

    Map map = {};
    map['cmd'] = CMDType.SEND_CHAT;
    map['reqSendMsg'] = req.toMap();
    String packet = json.encode(map);
    debugPrint('deleteMessages $packet');
    bool res = socketConnection?.sendPacket(packet) ?? false;
    return Future.value(res);
  }
}
