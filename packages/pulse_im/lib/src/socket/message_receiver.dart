// @ignore_hardcode
import 'dart:math';

import 'package:pulse_im/src/pulse_im_client.dart';
import 'package:pulse_im/src/db/db_helper.dart';
import 'package:pulse_im/src/db/db_manager.dart';
import 'package:pulse_im/src/model/message_content.dart';
import 'package:pulse_im/src/model/send_user.dart';
import 'package:pulse_im/src/protocol/common_define.dart';
import 'package:pulse_im/src/socket/connection.dart';
import 'package:pulse_im/src/socket/conversation_data_helper.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/socket/message_sender.dart';
import 'package:pulse_im/src/util/im_config.dart';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:pulse_im/src/protocol/protocol_define.dart';
import 'dart:convert';
import 'package:pulse_im/src/util/msg_util.dart';
import 'package:synchronized/synchronized.dart';

abstract class MessageReceiverMixin extends IMessageReceiver {
  MessageReceiverMixin(this.messageSender) {
    DatabaseManager().addUpdateListener(pullMsgBySmallAccount);
  }

  /// 伴伴1.6.5 新增 小号消息 需求；统一由 DatabaseManager 管理
  // int _lastReceiveMsgId = 0;
  // final DatabaseHelper _db = DatabaseManager().getDatabaseHelp();
  MessageSender messageSender;
  final int _maxGetMsgCountOnce = 50;
  static const int MAX_GET_COUNT_INIT = 300;

  static const LOG_TAG = "MessageReceiver";

  final _syncLock = Lock();

  void onReceiverMessage(String data) async {
    Map dataMap = {};
    try {
      dataMap = json.decode(data);
    } catch (e) {
      IMLog.e(LOG_TAG, '[onMessage] decode error:$e');
      IMLog.e(LOG_TAG, '[onMessage] decode error data:$data');
    }

    int cmd = IMUtil.parseInt(dataMap['cmd']);
    IMLog.d(LOG_TAG, '[onMessage] cmd: $cmd, data: $data');
    if (IMUtil.parseInt(dataMap['ack']) == 1) {
      messageSender.sendAck('${dataMap['msgUid']}');
    }

    switch (cmd) {
      case CMDType.LOGIN_RES:
        _handleLoginRes(dataMap["resLogin"] ?? {});
        break;
      case CMDType.LOGOUT_RES:
        break;
      case CMDType.KICK_OUT_RES:
        break;
      case CMDType.KICK_OUT:
        await _handleKickOut(dataMap["reqKickout"] ?? {});
        break;
      case CMDType.SEND_MSG_RES:
        _onSendMsgResponse(dataMap["resSendMsg"] ?? {});
        break;
      case CMDType.GET_MSG_RES:
        await _onGetMsgResponse(dataMap['resGetMsg'] ?? {});
        break;
      case CMDType.NEW_MSG_NOTIFY:
        _onNewMsgNotify(dataMap['reqNotifyClientNewMsg'] ?? {});
        break;
      case CMDType.OFFSET_ACK:
        break;
      case CMDType.STATUS_MSG_NOTIFY:
        _onStatusNotify(dataMap['notifyClientStatusMsg'] ?? {});
        break;
      case CMDType.SET_NOTIFY_STATUS_RES:
        _onSetNotifyStatusRes(dataMap['resDisturb'] ?? {});
        break;
      case CMDType.GET_NOTIFY_STATUS_RES:
        _onGetNotifyStatusRes(dataMap['resGetDisturb'] ?? {});
        break;
      default:
        break;
    }
  }

  void _handleLoginRes(Map data) {
    ResLogin resLogin = ResLogin.fromMap(data);
    if (resLogin.err != null && resLogin.err!.code > 0) {
      IMLog.e(LOG_TAG, "登录失败，code = ${resLogin.err!.code} and msg = ${resLogin.err!.msg}");
      PulseIMClient.onLoginError(resLogin.err!.code, resLogin.err!.msg);
    } else {
      _pullHistoryMessages();
    }
  }

  ///启动时先拉取远端消息同步到本地数据库
  Future<void> _pullHistoryMessages({String? userId}) async {
    String uid = userId ?? LocalUserData.senderUserId;
    // 校验 小号uid 是否合法
    if (!DatabaseManager().checkValidByUid(uid)) {
      IMLog.d(LOG_TAG, '[pullHistoryMessages] uid is not valid');
      return;
    }

    final DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: uid);
    if (db == null) return;
    int lastReceiveMsgIdByDB = await db.getLastReceiveMsgId();
    int lastReceiveMsgIdByCache = DatabaseManager().getLastReceiveMsgId(userId: uid);

    /// 本地数据库中 和 内存中 取最大值
    int lastReceiveMsgId = max(lastReceiveMsgIdByDB, lastReceiveMsgIdByCache);
    DatabaseManager().setLastReceiveMsgId(lastReceiveMsgId, userId: uid);
    IMLog.d(LOG_TAG, "pullHistoryMessages [_lastReceiveMsgId] $lastReceiveMsgId, [uid] $uid");
    messageSender.doGetMsgRequest(lastReceiveMsgId, _maxGetMsgCountOnce, uid);
  }

  void _onSendMsgResponse(Map data) async {
    ResSendMsg resSendMsg = ResSendMsg.fromMap(data);
    if (resSendMsg.err.code > 0 && resSendMsg.clientMessageId > 0) {
      DatabaseHelper? db = DatabaseManager().getDatabaseHelp();
      bool? success = await db?.updateMessageSentStatus(resSendMsg.clientMessageId, MessageStatus.Failed);
      if (success == true) {
        PulseIMClient.onMessageSend(resSendMsg.clientMessageId, MessageStatus.Failed, resSendMsg.err.code,
            errorMsg: resSendMsg.err.msg);
      }
    }
  }

  ///同步远端消息响应(收到新的message)
  _onGetMsgResponse(Map data) async {
    ResGetMsg resGetMsg = ResGetMsg.formMap(data);
    if (resGetMsg.err != null) {
      IMLog.w(LOG_TAG, '[_onGetMsgResponse] error. code: ${resGetMsg.err!.code}, msg: ${resGetMsg.err!.msg}');
      return;
    }

    String uid = (resGetMsg.userId > 0) ? resGetMsg.userId.toString() : LocalUserData.senderUserId;
    // 校验 小号uid 是否合法
    if (!DatabaseManager().checkValidByUid(uid)) {
      IMLog.d(LOG_TAG, '[onGetMsgResponse] uid is not valid');
      return;
    }

    /// 收到 服务端发送的 onGetMsgResponse 后取消计时器
    DatabaseManager().receiveGetMsgResponse(userId: uid);

    List<BMsg> msgList = resGetMsg.msgList;
    if (IMUtil.isCollectionEmpty(msgList)) {
      /// 消息列表null => 重置 新消息通知数 0
      DatabaseManager().resetNewMsgNotifyCount(userId: uid);

      IMLog.w(LOG_TAG, "_onGetMsgResponse and msgList is empty");
      if (uid == LocalUserData.senderUserId) {
        // 自己的消息拉取完毕后
        pullMsgBySmallAccount();
      }
      return;
    }

    int totalMessages = msgList.length;
    IMLog.d(LOG_TAG,
        '[_onGetMsgResponse] startMsgId: ${msgList.first.msgId}, lastMsgId: ${msgList.last.msgId}, totalMessages: $totalMessages, [uid] $uid');

    /// 使用 Future.forEach 保证消息顺序，以免漏消息
    await Future.forEach<BMsg>(msgList, (bMsg) async {
      try {
        await _handleMsg(bMsg, 0, uid, resGetMsg.lastMsgId);
      } catch (e) {
        print(e);
      }
    });
    // for (int i = 0; i < msgList.length; i++) {
    //   BMsg bMsg = msgList[i];
    //   int left = totalMessages - i - 1;
    //   ///left如果不等于0， UI层会因为时序问题，不刷新界面。
    //   try {
    //     await _handleMsg(bMsg, 0, uid);
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    /// 处理完 新消息通知数 -1
    DatabaseManager().reduceNewMsgNotifyCount(userId: uid);

    /// 获取新消息通知数
    int newMsgNotifyCount = DatabaseManager().getNewMsgNotifyCount(userId: uid);
    if (totalMessages == _maxGetMsgCountOnce || newMsgNotifyCount > 0) {
      _pullHistoryMessages(userId: uid);
    } else {
      if (uid == LocalUserData.senderUserId) {
        // 自己的消息拉取完毕后
        pullMsgBySmallAccount();
      }
    }
  }

  void pullMsgBySmallAccount() async {
    List<String> result = DatabaseManager().getSmallAccountListByNeedPull();
    if (result.isNotEmpty) {
      await Future.forEach<String>(result, (uid) async {
        await _pullHistoryMessages(userId: uid);

        ///停100ms再拉取下一个小号
        await Future.delayed(const Duration(milliseconds: 100));
      });
    }
  }

  Future<void> _handleMsg(BMsg bMsg, int left, String userId, int lastMsgId) async {
    //消息过滤：两次pull消息，可能第二次pull到的消息第一次已经拿到，需要过滤掉;
    int lastReceiveMsgId = DatabaseManager().getLastReceiveMsgId(userId: userId);
    if (bMsg.msgId <= lastReceiveMsgId) {
      return;
    }
    IMLog.d(LOG_TAG, '[_handleMsg] curMsgId: ${bMsg.msgId}');
    DatabaseManager().setLastReceiveMsgId(bMsg.msgId, userId: userId);

    if (bMsg.msgType == MessageTypeInt.BMSG_TYPE_DELETE) {
      await _handleDelete(bMsg, userId);
    } else if (bMsg.msgType == MessageTypeInt.BMSG_TYPE_READRECEIPT) {
      await _handleReadReceipt(bMsg, userId);
    } else if (bMsg.msgType == MessageTypeInt.BMSG_TYPE_RECALL) {
      await _handleReCall(bMsg, userId);
    } else if (bMsg.msgType == MessageTypeInt.BMSG_TYPE_CMD) {
      await _handleCmdMsg(bMsg, left, userId, lastMsgId);
    } else {
      try {
        await _handleNewMsg(bMsg, left, userId, lastMsgId);
      } catch (e) {
        IMLog.e(LOG_TAG, "HandleNewMsg_Error__Exception ========== $e");
      }
    }
  }

  /// 服务端下发的删除标记，多终端同步
  Future _handleDelete(BMsg bMsg, String userId) async {
    DeleteMsg deleteMsg = DeleteMsg.fromJson(bMsg.content);
    IMLog.d(LOG_TAG, "_handleDelete => deleteMsg: $deleteMsg");
    if (!IMUtil.isCollectionEmpty(deleteMsg.msgIds)) {
      DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
      List<Map<String, String>> deleteConvs = []; // 记录删除的消息 所在的会话信息
      await Future.forEach(deleteMsg.msgIds, (element) async {
        await _syncLock.synchronized(() async {
          MessageContent? messageContent =
              await db?.getMessageContent("messageUId=? AND `sentStatus` <> '${MessageStatus.Delete}' ", [element]);
          IMLog.d(LOG_TAG, "_handleDelete => messageContent: $messageContent");
          if (messageContent != null) {
            bool read = true;
            // 判断要删除的消息是否已读
            if (messageContent.messageDirection == MessageDirection.Receive &&
                messageContent.sentStatus == MessageStatus.Received) {
              read = false;
            }

            ///本地有对应的消息没有删除，则标记删除
            Map<String, dynamic> values = {"sentStatus": MessageStatus.Delete};
            bool success = await db?.updateMessageContent("messageUId=?", [element], values) ?? false;
            IMLog.d(LOG_TAG, "_handleDelete => delete $success");

            /// 更新Conversation
            await ConversationDataHelper.updateConversation(messageContent.conversationType, messageContent.targetId,
                userId: userId, read: read);

            /// 记录删除的消息对应的会话列表信息
            _recordConvByDelete(
                deleteConvs, {'type': messageContent.conversationType, 'targetId': messageContent.targetId});
          } else {
            IMLog.d(LOG_TAG, "_handleDelete => msg not exists");
          }
        });
      });
      IMLog.d(LOG_TAG, "_handleDelete => database execute end");

      /// 当前账号 才 发送 删除消息通知
      /// 客户端删除消息会收服务端一次删除消息（包含最多200条删除msgIds），客户端发送一次通知上层UI刷新
      if (userId == LocalUserData.senderUserId) {
        _notifyConvByDelete(deleteConvs);

        /// 此回调已废弃，以由onNotifyUnreadCount代替
        PulseIMClient.onMessageDelete?.call();
      }
    }
  }

  /// 记录 删除的消息对应的会话列表信息
  void _recordConvByDelete(List<Map<String, String>> list, Map<String, String> item) {
    if (list.isEmpty || list.indexWhere((e) => e['type'] == item['type'] && e['targetId'] == item['targetId']) < 0) {
      list.add(item);
    }
  }

  /// 通知上层 删除消息所对应的会话列表刷新（未读数和会话列表Item）
  void _notifyConvByDelete(List<Map<String, String>> list) {
    for (Map<String, String> convs in list) {
      PulseIMClient.onNotifyUnreadCount
          ?.call(conversationType: convs['type'], targetId: convs['targetId'], unreadCount: -1);
    }
  }

  Future _handleNewMsg(BMsg bMsg, int left, String userId, int lastMsgId, {MessageContent? messageContent}) async {
    final MessageContent? msgContent = messageContent ?? MessageContent.fromJsonStr(bMsg.content);
    IMLog.d(LOG_TAG, "handle_msg and content = ${msgContent?.toMap().toString()}");
    bool result = MessageUtil.checkMessage(msgContent);
    if (msgContent == null || !result) {
      IMLog.e(LOG_TAG, "收到一条不合法的消息，丢弃掉，不处理...");
      return;
    }
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);

    if (db == null) return;

    msgContent.messageUId = bMsg.msgId.toString(); //更新messageUId

    final isHandel =
        await PulseIMClient.onHandleNewMsg?.call(msgContent, bMsg.fromUserId, IMUtil.parseInt(userId), bMsg.msgType) ??
            false;
    if (isHandel) {
      IMLog.d(LOG_TAG, '_handleNewMsg is isHandel by ${PulseIMClient.onHandleNewMsg}');
      return;
    }
    final saveToDb = PulseIMClient.predictSaveDbNewMsg?.call(msgContent) ?? true;

    //更新MessageContent表（update status or insert new）;
    if (bMsg.fromUserId == IMUtil.parseInt(userId)) {
      //自己发送消息的回包，update status
      String whereStr = "messageId = ? AND sentStatus = ?";
      List whereArgs = [];
      whereArgs.add(msgContent.messageId);
      whereArgs.add(MessageStatus.Sending);
      Map<String, dynamic> values = {};
      values['messageUId'] = bMsg.msgId;
      values['sentStatus'] = MessageStatus.Sent;
      if (msgContent.sentTime > 0) {
        values['sentTime'] = msgContent.sentTime;
      }
      bool success = true;
      if (saveToDb) {
        success = await db.updateMessageContent(whereStr, whereArgs, values);

        /// 某些场景消息不是从客户端发起的，比如送礼物消息，是由服务端发送的，所以本地数据库没有相应记录
        if (!success) {
          msgContent.sentStatus = MessageStatus.Sent;
          await db.insertMessageContent(msgContent);
          await ConversationDataHelper.updateOrInsertConversation(msgContent, userId);
        }
      }
      //调用app提供的消息发送成功回调函数
      if (userId == LocalUserData.senderUserId) {
        PulseIMClient.onMessageSend(msgContent.messageId, MessageStatus.Sent, 0,
            sentTrigger: success ? SentTrigger.USER : SentTrigger.SERVER);
      }
    } else {
      //别人发给自己的消息，insert new
      //私聊targetId需要转换下；群聊targetId始终为群Id，不需要转换。
      if (msgContent.conversationType == ConversationType.Private) {
        msgContent.targetId = msgContent.user!.id!;
      }
      msgContent.messageDirection = MessageDirection.Receive;
      msgContent.sentStatus = MessageStatus.Received;

      /// 防诈 提示  先插入到数据库，在UI判断显示条件
      Map<String, dynamic> userInfo = DatabaseManager().getUserInfo(userId);
      IMLog.d(LOG_TAG, "userInfo: $userInfo");
      if (PulseIMClient.onSwindleTipsMsg != null) {
        MessageContent? swindleTipsMsg = PulseIMClient.onSwindleTipsMsg!(
            msgContent.conversationType, msgContent.targetId,
            userId: userInfo['uid'], name: userInfo['name'], icon: userInfo['icon']);
        if (swindleTipsMsg != null) {
          List<MessageContent>? historyList = await db.getHistoryMessages(
              msgContent.conversationType, msgContent.targetId, 0, 1,
              direction: MessageDirection.Receive);
          if (IMUtil.isCollectionEmpty(historyList)) {
            MessageContent? messageLocal =
                await db.insertMessage(msgContent.conversationType, msgContent.targetId, swindleTipsMsg);
            PulseIMClient.onMessageReceived(messageLocal, 0, userInfo: userInfo, lastMsgId: lastMsgId);
          }
        }
      }

      //插入sqflite，并且更新msgContent.cMessageId
      if (saveToDb) {
        await db.insertMessageContent(msgContent);
        IMLog.d(LOG_TAG, "insert sqlite success");
        //更新Conversation表
        await ConversationDataHelper.updateOrInsertConversation(msgContent, userId);
        IMLog.d(LOG_TAG, "update conversation success");
      }
      //调用app提供的收到新消息回调函数
      PulseIMClient.onMessageReceived(msgContent, left, userInfo: userInfo, lastMsgId: lastMsgId);
    }
  }

  /// 撤回，对于私聊，是不会有问题的，因为一个人在1ms内，同时发送两条及以上的消息可能性几乎为零
  /// 但是群聊，潜在问题是多人在1ms内发送了多条消息是有可能的。
  /// 支持服务端发起的撤回消息
  Future _handleReCall(BMsg bMsg, String userId) async {
    IMLog.d(LOG_TAG, '[收到撤回消息]');
    MessageContent? msgContent = MessageContent.fromJsonStr(bMsg.content);
    if (msgContent == null) return;
    Map contentMap = json.decode(msgContent.content);
    if (contentMap['reCallMsgSentTime'] != null) {
      DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
      if (db == null) return;

      String targetId = bMsg.targetId.toString();
      if (msgContent.conversationType == ConversationType.Private) {
        if (bMsg.fromUserId != IMUtil.parseInt(userId)) {
          targetId = bMsg.fromUserId.toString();
        }
      }
      //更新撤回消息的msgType为RcCall
      String whereStr = "sentTime = ? AND targetId = ? AND type <> ?"; //senderUserId=xxx AND sentTime=xxx
      List<dynamic> whereArgs = [contentMap['reCallMsgSentTime'], targetId, MessageType.RcCall];

      /// 判断需要撤回的消息是否已读
      MessageContent? oldMsg = await db.getMessageContent(whereStr, whereArgs);
      if (oldMsg == null) {
        return;
      }
      bool read = true; // 是否已读了此消息
      if (oldMsg.messageDirection == MessageDirection.Receive && oldMsg.sentStatus == MessageStatus.Received) {
        read = false; // 还未读，会话列表未读数更新需-1
      }

      /// 将此消息 更新为撤回
      Map<String, dynamic> values = {'type': MessageType.RcCall};
      bool change = await db.updateMessageContent(whereStr, whereArgs, values);
      IMLog.d(LOG_TAG, "RecallMsg change = $change");
      if (!change) {
        return;
      }
      //更新Conversation表
      await ConversationDataHelper.updateConversation(msgContent.conversationType, targetId,
          userId: userId, read: read);

      if (userId == LocalUserData.senderUserId) {
        /// 当前账号 才 发送 撤回消息通知
        PulseIMClient.onRecallMessageReceived?.call(oldMsg);

        /// 撤回消息也要通知未读数更新
        PulseIMClient.onNotifyUnreadCount
            ?.call(conversationType: msgContent.conversationType, targetId: targetId, unreadCount: -1);
      }
    }
  }

  Future _handleReadReceipt(BMsg bMsg, String userId) async {
    IMLog.d(LOG_TAG, '[收到已读回执消息]');
    if (bMsg.ctype == ConversationTypeInt.PRIVATE_CHAT) {
      if (bMsg.targetId == IMUtil.parseInt(userId)) {
        /// 别人阅读了自己发送消息。别人每打开一次与自己的会话详情就会触发一次，故需要做筛选
        DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
        if (db == null) return;
        IMLog.d(LOG_TAG, '_handleReadReceipt1 targetId: ${bMsg.targetId}, userId: $userId)');
        ReadReceiptMsg msg = ReadReceiptMsg.fromJson(bMsg.content);
        bool flag = await db.updateMessageReadStatus(msg.conversationType, msg.targetId, msg.timestamp);

        /// 当前账号 才发送 已读 通知
        /// 当前会话详情已经没有已读修改，此时不需要通知，节省性能
        if (userId == LocalUserData.senderUserId && flag) {
          PulseIMClient.onReceiveReadReceipt.call(msg.conversationType, msg.targetId, msg.timestamp);
        }
      } else if (bMsg.targetId != IMUtil.parseInt(userId)) {
        /// 自己阅读了别人发送消息。自己每打开一次与别人的会话详情就会触发一次，故需要做筛选
        IMLog.d(LOG_TAG, '_handleReadReceipt2 targetId: ${bMsg.targetId}, userId: $userId)');
        bool flag = await PulseIMClient.clearMessagesUnreadStatus(
            ConversationTypeInt.toStringType(bMsg.ctype!), bMsg.targetId.toString(),
            userId: userId);

        /// 当前会话 未读数已经是0了，flag = false，此时不需要通知
        if (userId == LocalUserData.senderUserId && flag) {
          PulseIMClient.onNotifyUnreadCount?.call(
              conversationType: ConversationTypeInt.toStringType(bMsg.ctype!),
              targetId: bMsg.targetId.toString(),
              unreadCount: 0);
        }
      }
    }
  }

  Future _handleCmdMsg(BMsg bMsg, int left, String userId, int lastMsgId) async {
    IMLog.d(LOG_TAG, "_handleCmdMsg");
    MessageContent? msgContent = MessageContent.fromJsonStr(bMsg.content);
    if (msgContent == null) {
      IMLog.d(LOG_TAG, "_handleCmdMsg msgContent == null");
      return;
    }

    if (PulseIMClient.onCmdMessageReceived != null && PulseIMClient.onCmdMessageReceived!(msgContent)) {
      msgContent.messageUId = bMsg.msgId.toString();
      IMLog.d(LOG_TAG, 'received a cmd msg, and handled by app....messageUId = ${msgContent.messageUId}');
      DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
      await db?.insertMessageContent(msgContent);
      return;
    }

    String? name = msgContent.name;
    Map data = MessageUtil.parseExtra(msgContent.data);
    if (MessageName.MSG_NAMES.contains(name) && data.isNotEmpty) {
      String messageType = MessageType.Text;
      String displayContent = StringConfig.SEND_GIFT;
      String conversationType = ConversationType.Private;
      String targetId = msgContent.targetId;

      /// 这个转换，是否是服务端来做?后续需要再对下协议。
      if (targetId == userId) {
        targetId = bMsg.fromUserId.toString();
        bMsg.fromUserId = bMsg.targetId;
        bMsg.targetId = IMUtil.parseInt(targetId);
      }

      if (name == MessageName.CHAT_PKG || name == MessageName.GROUP_PKG) {
        displayContent = StringConfig.SEND_PKG;
      }
      if (name == MessageName.GROUP_PKG || name == MessageName.GROUP_PKG_NOTIFY) {
        conversationType = ConversationType.Group;
        targetId = data['groupId'].toString();
      }
      if (name == MessageName.GROUP_PKG_NOTIFY) {
        messageType = MessageType.Info;
        displayContent = data['message'];
      }

      String sentStatus;
      String messageDirection;
      SendUser sender;

      /// 歌友会的特殊消息取系统的头像和昵称作为发送方
      if (name == MessageName.GROUP_WELL_COME || name == MessageName.GROUP_MASTER_ANSWER) {
        sentStatus = MessageStatus.Received;
        messageDirection = MessageDirection.Receive;
        conversationType = ConversationType.Group;
        sender = SendUser("10000", data["name"], data["logo"]);
        displayContent = data['message'];
        targetId = data['groupId'].toString();

        /// 其他特殊消息
      } else {
        sentStatus = MessageStatus.Sent;
        messageDirection = MessageDirection.Send;
        Map<String, dynamic> userInfo = DatabaseManager().getUserInfo(userId);
        sender = SendUser(userInfo['uid'], userInfo['name'], userInfo['icon']);
      }

      MessageContent content = MessageContent(messageType, sender);
      content.content = displayContent;
      content.extra = json.encode(data);
      content.sentStatus = sentStatus;
      content.conversationType = conversationType;
      content.sentTime = DateTime.now().millisecondsSinceEpoch;
      content.senderId = userId;
      content.messageDirection = messageDirection;
      content.objectName = MessageType.toObjectName(content.type);
      content.targetId = targetId;

      String? conversationTargetId = (content.user?.id == content.senderId) ? content.targetId : content.user?.id;
      IMLog.d(LOG_TAG,
          "targetId = $targetId and senderId = ${content.senderId} conversationTargetId = $conversationTargetId msgContent.user.id = ${content.user?.id}");
      await _handleNewMsg(bMsg, left, userId, lastMsgId, messageContent: content);
    }
  }

  //收到新消息通知
  _onNewMsgNotify(Map data) {
    NotifyClientNewMsg newMsg = NotifyClientNewMsg.fromMap(data);
    String uid = (newMsg.userId > 0) ? newMsg.userId.toString() : LocalUserData.senderUserId;
    // 校验 小号uid 是否合法
    if (!DatabaseManager().checkValidByUid(uid)) {
      IMLog.d(LOG_TAG, '[onNewMsgNotify] uid is not valid');
      return;
    }

    /// 获取新消息通知数
    int newMsgNotifyCount = DatabaseManager().getNewMsgNotifyCount(userId: uid);
    if (newMsgNotifyCount == 0) {
      /// 新消息通知数 +1
      DatabaseManager().increaseNewMsgNotifyCount(userId: uid);
      _pullHistoryMessages(userId: uid);
    } else {
      /// 新消息通知数 +1
      DatabaseManager().increaseNewMsgNotifyCount(userId: uid);
    }
  }

  //收到状态通知消息，如键盘输入
  _onStatusNotify(Map data) {
    NotifyClientStatusMsg statusMsg = NotifyClientStatusMsg.fromMap(data);
    IMLog.d(LOG_TAG, '[onStatusNotify] ${json.encode(data)}');

    switch (statusMsg.msg.msgType) {
      case MessageTypeInt.BMSG_TYPE_NOTIFICATION:
        PulseIMClient.onNotification(statusMsg.msg.content);
        break;

      case MessageTypeInt.BMSG_TYPE_CMD:
        PulseIMClient.onOnlineMsg(statusMsg.msg.content);
        break;

      default:
        break;
    }
  }

  Future _handleKickOut(Map data) async {
    int reason = IMUtil.parseInt(data["reason"]);
    if (reason == CMDType.KICK_OUT_REASON_LOGIN_DUPLICATE) {
      IMLog.e(LOG_TAG, "用户重复登录，被踢下线");
      return;
    }

    IMLog.e(LOG_TAG, "当前用户被踢下线，reason = $reason");

    if (PulseIMClient.onKickOut != null) {
      PulseIMClient.onKickOut!(reason);
    }
    socketConnection?.disconnectByKickOut();
    await DatabaseManager().closeByLogout();
  }

  _onSetNotifyStatusRes(Map data) {
    ResNotifyStatus notifyStatus = ResNotifyStatus.fromMap(data);
    if (notifyStatus.err != null && notifyStatus.err!.code > 0) {
      IMLog.e(
          LOG_TAG, "设置是否发送消息通知失败，msg = ${!IMUtil.isStringEmpty(notifyStatus.err!.msg) ? notifyStatus.err!.msg : ""}");
      return;
    }

    IMLog.d(LOG_TAG, "设置是否发送消息通知成功.");
  }

  Future<void> _onGetNotifyStatusRes(Map data) async {
    ResNotifyStatus resNotifyStatus = ResNotifyStatus.fromMap(data);
    if (resNotifyStatus.err != null && resNotifyStatus.err!.code > 0) {
      IMLog.e(LOG_TAG,
          "获取是否发送消息通知失败，msg = ${!IMUtil.isStringEmpty(resNotifyStatus.err!.msg) ? resNotifyStatus.err!.msg : ""}");
      return;
    }

    if (resNotifyStatus.notifyStatus == null) {
      IMLog.e(LOG_TAG, "获取是否发送消息通知失败，resNotifyStatus.notifyStatus == null");
      return;
    }

    NotifyStatus? st = resNotifyStatus.notifyStatus;

    if (st == null) return;

    DatabaseHelper? db = DatabaseManager().getDatabaseHelp();
    await db?.updateConversation(
        ConversationTypeInt.toStringType(st.conversationType), st.targetId, {'notify': st.notificationStatus});
  }
}

/// 单例模式
class MessageReceiver extends MessageReceiverMixin {
  //static final MessageReceiver _instance = MessageReceiver._internal();
  OnSocketConnection? get connectionCallback => PulseIMClient.connectionCallback;

  MessageReceiver(MessageSender messageSender) : super(messageSender);

  // MessageReceiver._internal() {
  //   messageSender = MessageSender();
  //   _conversationType = ConversationType.Private;
  // }
  //
  // factory MessageReceiver() => _instance;

  @override
  void onData(String data) {
    onReceiverMessage(data);
    connectionCallback?.onData(data);
  }

  @override
  void onByteData(data) {
    connectionCallback?.onByteData(data);
  }

  @override
  void onError(Object error) {
    connectionCallback?.onError(error);
  }

  @override
  void onDone() {
    connectionCallback?.onDone();
  }

  @override
  void onConnectError(String sockAddress, Object error) {
    connectionCallback?.onConnectError(sockAddress, error);
  }

  @override
  void onConnected(String sockAddress) {
    connectionCallback?.onConnected(sockAddress);
  }

  @override
  void onDisconnect(StackTrace stacktrace) {
    connectionCallback?.onDisconnect(stacktrace);
  }
}
