import 'dart:math';

import 'package:pulse_im/src/db/db_helper.dart';
import 'package:pulse_im/src/db/db_manager.dart';
import 'package:pulse_im/src/model/message_content.dart';
import 'package:pulse_im/src/protocol/common_define.dart';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/msg_util.dart';
import 'package:pulse_im/src/model/send_user.dart';
import 'package:pulse_im/src/model/conversation.dart';
import 'dart:convert';
import 'package:synchronized/synchronized.dart';

import '../util/im_util.dart';

class ConversationDataHelper {
  static const LOG_TAG = "ConversationDataHelper";

  static final _syncLock = Lock();

  /// 收到新消息 时 更新会话列表
  static Future<void> updateOrInsertConversation(MessageContent msgContent, String senderUserId,
      {String? sentStatusActually}) async {
    final DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: senderUserId);
    if (db == null) return;

    SendUser sendUser = SendUser(msgContent.user?.id, msgContent.user?.name, msgContent.user?.portraitUri);
    String sentStatus = msgContent.sentStatus;
    ConversationLastMessage lastMessage = ConversationLastMessage(
      msgContent.messageId,
      msgContent.type,
      MessageUtil.parseContent(msgContent.content, null, msgContent.type),
      sendUser,
      msgContent.extraMap,
      sentStatus,
    );

    ///会话targetId（userId or groupId）需要转换下，不能是自己
    String? conversationTargetId;
    if (msgContent.conversationType == ConversationType.Private) {
      ///自己发送的消息conversationTargetId 就是消息接收方的id， 收到别人的消息，conversationTargetId 就是发送方的id
      conversationTargetId = (msgContent.user?.id == senderUserId) ? msgContent.targetId : msgContent.user?.id;
    } else if (msgContent.conversationType == ConversationType.Group) {
      ///群聊会话targetId始终为群Id;
      conversationTargetId = msgContent.targetId;
    }
    if (conversationTargetId == null) {
      IMLog.d(LOG_TAG, '[_updateOrInsertConversation] error! conversationTargetId is null: ${msgContent.toJson()}');
      return;
    }

    /// 保证下面 两段异步操作同步执行
    await _syncLock.synchronized(() async {
      int profit = IMUtil.parseInt(lastMessage.extra['profit']);

      ///判断`Conversation`表中是否已有对应会话记录，没有则insert，有则update (unreadCount+1，lastMessage，lastSentTime)
      Conversation? conversation = await db.getConversation(msgContent.conversationType, conversationTargetId!);
      if (conversation == null) {
        conversation = Conversation(msgContent.conversationType, conversationTargetId);
        conversation.sentTime = msgContent.sentTime;
        if (msgContent.user?.id == senderUserId) {
          conversation.unreadCount = 0;
          conversation.totalEarn = 0;
        } else {
          conversation.unreadCount = 1;
          conversation.atCount = MessageUtil.checkMsgHasAtYou(msgContent, userId: senderUserId) ? 1 : 0;
          conversation.totalEarn = profit;
        }
        conversation.isTop = false;
        conversation.lastMessage = lastMessage;
        IMLog.d(LOG_TAG, "insertConversation data = ${conversation.toMap()}");
        await db.insertConversation(conversation);
      } else {
        Map<String, dynamic> values = <String, dynamic>{};
        if (msgContent.user?.id != senderUserId) {
          values['unreadCount'] = conversation.unreadCount + 1;
          bool hasAtYou = MessageUtil.checkMsgHasAtYou(msgContent, userId: senderUserId);
          values['atCount'] = (conversation.atCount) + (hasAtYou ? 1 : 0);
        } else {
          if ((sentStatusActually ?? msgContent.sentStatus) == MessageStatus.Sent) {
            //发送成功，以前的收益清零
            values['totalEarn'] = 0;
          }
        }
        values['sentTime'] = msgContent.sentTime;
        values['lastMessage'] = lastMessage.toJson();
        values['LastModifyTime'] = conversation.lastModifyTime;
        values['draft'] = conversation.draft;
        IMLog.d(LOG_TAG, 'values = $values');
        await db.updateConversation(msgContent.conversationType, conversationTargetId, values);
      }
    });
  }

  /// 撤回消息/删除消息 时 更新会话列表
  static Future<bool> updateConversation(String type, String targetId, {String? userId, bool read = true}) async {
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
    if (db == null) {
      return false;
    }

    /// 保证下面 两段异步操作同步执行
    return await _syncLock.synchronized<bool>(() async {
      Conversation? conversation = await db.getConversation(type, targetId);
      IMLog.d(LOG_TAG, "updateConversationByDelete，conversation:$conversation, read:$read");
      if (conversation == null) return false;

      /// 会话列表的最后一条消息需要更新
      List<MessageContent> msgList = await db.getHistoryMessages(conversation.type, conversation.targetId, 0, 1);
      if (!IMUtil.isCollectionEmpty(msgList)) {
        MessageContent msg = msgList[0];
        if (_isSwindleTipsMsg(msg)) {
          //是防诈骗 消息 且 用户不需要显示
          Map<String, dynamic> values = <String, dynamic>{};
          values['lastMessage'] = json.encode({});
          // values['sentTime'] = 0; // 将会话列表中的消息全部删除后不再修改sentTime=0（同步微信）。注：在极端情况下会出现会导致话列表页死循环
          values['unreadCount'] = 0;
          values['atCount'] = 0;
          IMLog.d(LOG_TAG, "updateConversationByDelete1 values: $values");
          return await db.updateConversation(conversation.type, conversation.targetId, values);
        } else {
          SendUser sendUser = SendUser(msg.user?.id, msg.user?.name, msg.user?.portraitUri);
          Map extra = msg.extraMap;
          String sentStatus = msg.sentStatus;
          ConversationLastMessage lastMessage = ConversationLastMessage(
            msg.messageId,
            msg.type,
            MessageUtil.parseContent(msg.content, null, msg.type),
            sendUser,
            extra,
            sentStatus,
          );

          Map<String, dynamic> values = <String, dynamic>{};
          if (msg.user?.id != userId) {
            bool hasAtYou = MessageUtil.checkMsgHasAtYou(msg, userId: userId);
            values['atCount'] = (conversation.atCount) + (hasAtYou ? 1 : 0);
          }
          if (!read) {
            values['unreadCount'] = max((conversation.unreadCount - 1), 0);
          }
          values['sentTime'] = msg.sentTime;
          values['lastMessage'] = lastMessage.toJson();
          IMLog.d(LOG_TAG, 'updateConversationByDelete2 values = $values');
          return await db.updateConversation(conversation.type, conversation.targetId, values);
        }
      } else {
        Map<String, dynamic> values = <String, dynamic>{};
        values['lastMessage'] = json.encode({});
        // values['sentTime'] = 0; // 将会话列表中的消息全部删除后不再修改sentTime=0（同步微信）。注：在极端情况下会出现会导致话列表页死循环
        values['unreadCount'] = 0;
        values['atCount'] = 0;
        IMLog.d(LOG_TAG, "updateConversationByDelete1 values: $values");
        return await db.updateConversation(conversation.type, conversation.targetId, values);
      }
    });
  }

  static bool _isSwindleTipsMsg(MessageContent msg) {
    Map extra = (msg.extra?.isNotEmpty == true) ? json.decode(msg.extra!) : {};
    if (extra['type'] == 'swindle_tips') {
      return true;
    }
    return false;
  }
}
