import 'dart:async';
import 'dart:ui';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pulse_im/src/model/conversation.dart';
import 'package:pulse_im/src/model/message_content.dart';
import 'package:pulse_im/src/protocol/common_define.dart';
import 'package:pulse_im/src/db/db_init.dart';

class DatabaseHelper {
  static const LOG_TAG = "DatabaseHelper";

  /// 伴伴1.6.5 新增 小号消息 需求；不再使用单例模式，统一由 DatabaseManager 管理
  // static final DatabaseHelper _instance = DatabaseHelper._internal();
  //
  // DatabaseHelper._internal();
  //
  // factory DatabaseHelper() => _instance;

  late DatabaseInit databaseInit;

  DatabaseHelper(String userId) {
    databaseInit = DatabaseInit(userId);
  }

  Future<Database> get db async {
    return await databaseInit.db;
  }

  Future<int> getLastReceiveMsgId() async {
    var dbClient = await db;
    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT `messageUId` FROM `MessageContent` ORDER BY `messageUId` DESC LIMIT 1");
    int? maxId = Sqflite.firstIntValue(records);
    maxId ??= 0;
    return maxId;
  }

  Future<List<Conversation>> getConversationList() async {
    List<Conversation> res = [];
    var dbClient = await db;
    List<Map<String, dynamic>> records = await dbClient.rawQuery("SELECT * FROM `Conversation`");

    for (var element in records) {
      Conversation conversation = Conversation.fromMap(element);
      //IMLog.d(LOG_TAG, "conversation = ${element.toString()}");
      res.add(conversation);
    }
    return res;
  }

  Future<List<Conversation>> getConversationListByPage(int count, int startTime) async {
    List<Conversation> res = [];
    var dbClient = await db;

    if (!dbClient.isOpen) return [];

    String whereStr = "";
    if (startTime > 0) {
      whereStr = "WHERE `sentTime` < $startTime ";
    }
    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT * FROM `Conversation` ${whereStr}ORDER BY `sentTime` DESC LIMIT $count");

    for (var element in records) {
      Conversation conversation = Conversation.fromMap(element);
      //IMLog.d(LOG_TAG, "conversation = ${element.toString()}");

      res.add(conversation);
    }
    return res;
  }

  Future<Conversation?> getConversation(String type, String targetId) async {
    var dbClient = await db;
    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT * FROM `Conversation` WHERE `targetId`='$targetId' AND `type`='$type'");
    IMLog.d(
        LOG_TAG, "getConversation and type = $type, and targetId = $targetId and records length = ${records.length}");
    if (records.isNotEmpty) {
      return Conversation.fromMap(records.first);
    }
    return null;
  }

  /// 更新Coversation状态
  Future<bool> updateConversation(String type, String targetId, Map<String, dynamic> values) async {
    var dbClient = await db;
    int changedRows = await dbClient
        .update("Conversation", values, where: "`targetId` = ? AND `type`= ?", whereArgs: [targetId, type]);
    return changedRows == 1;
  }

  Future<bool> insertConversation(Conversation conversation) async {
    var dbClient = await db;
    int id = await dbClient.insert("Conversation", conversation.toMap());
    return true;
  }

  Future<bool> removeConversation(String type, String targetId) async {
    var dbClient = await db;
    int changedRows =
        await dbClient.delete("Conversation", where: "targetId = ? AND type = ?", whereArgs: [targetId, type]);
    return (changedRows >= 1) ? true : false;
  }

  Future<List<MessageContent>> getHistoryMessages(String type, String targetId, int oldestMessageId, int count,
      {bool excludeDelete = true, String? direction, String? sentStatus}) async {
    List<MessageContent> res = [];
    var dbClient = await db;

    String whereStr = "WHERE `targetId`='$targetId' AND `conversationType`='$type' ";
    if (oldestMessageId > 0) {
      whereStr = "WHERE `targetId`='$targetId' AND `conversationType`='$type' AND `messageId` < $oldestMessageId ";
    }

    if (excludeDelete) {
      whereStr += "AND `sentStatus` <> '${MessageStatus.Delete}' ";
    }

    if (direction == MessageDirection.Send || direction == MessageDirection.Receive) {
      whereStr += "AND `messageDirection`='$direction' ";
    }

    if (sentStatus != null) {
      whereStr += "AND `sentStatus`='$sentStatus' ";
    }

    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT * FROM `MessageContent` ${whereStr}ORDER BY `messageId` DESC LIMIT $count");

    for (var element in records) {
      MessageContent message = MessageContent.fromMap(element);
      res.add(message);
    }

    return res;
  }

  Future<bool> clearMessagesUnreadStatus(String type, String targetId, {VoidCallback? hook}) async {
    if (hook != null) hook(); //主要用于windows
    var dbClient = await db;
    Map<String, dynamic> values = {};
    values['unreadCount'] = 0;
    int changedRows =
        await dbClient.update("Conversation", values, where: "targetId = ? AND type = ?", whereArgs: [targetId, type]);
    return true;
  }

  Future<bool> clearMessagesAtStatus(String type, String targetId) async {
    var dbClient = await db;
    Map<String, dynamic> values = {};
    values['atCount'] = 0;
    int changedRows =
        await dbClient.update("Conversation", values, where: "targetId = ? AND type = ?", whereArgs: [targetId, type]);
    return true;
  }

  Future<int> getTotalUnreadCount() async {
    var dbClient = await db;
    List<Map<String, dynamic>> records = await dbClient.rawQuery("SELECT unreadCount FROM `Conversation`");

    int totalCount = 0;
    for (var element in records) {
      totalCount += IMUtil.parseInt(element['unreadCount']);
    }
    return totalCount;
  }

  Future<List<Conversation>> getMsgIconListBySmallAccount(String userId, {int limit = 3}) async {
    List<Conversation> res = [];

    var dbClient = await db;

    String whereStr = "WHERE `unreadCount` > 0";
    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT * FROM `Conversation` $whereStr ORDER BY `sentTime` DESC LIMIT $limit");

    IMLog.d(LOG_TAG, "records:$records");
    for (var element in records) {
      IMLog.d(LOG_TAG, "element:$element");
      Conversation conversation = Conversation.fromMap(element);
      res.add(conversation);
    }
    return res;
  }

  Future<int> getUnreadCount(String type, String targetId) async {
    var dbClient = await db;
    List<Map<String, dynamic>> records = await dbClient
        .rawQuery("SELECT unreadCount FROM `Conversation` WHERE `targetId`='$targetId' AND `type`='$type'");

    int? unreadCount = Sqflite.firstIntValue(records);
    unreadCount ??= 0;
    return unreadCount;
  }

  /// @param conversationType                conversationType
  Future<MessageContent> insertMessage(String conversationType, String targetId, MessageContent message) async {
    message.conversationType = conversationType;
    message.targetId = targetId;

    MessageContent ret = await insertMessageContent(message);
    return ret;
  }

  Future<MessageContent?> getMessageContent(String whereStr, List whereArgs) async {
    var dbClient = await db;
    List<Map<String, dynamic>> records = await dbClient.query("MessageContent", where: whereStr, whereArgs: whereArgs);
    if (records.isNotEmpty) {
      return MessageContent.fromMap(records.first);
    }
    return null;
  }

  /// 查询Messages
  Future<List<MessageContent>> queryMessageContent(
    String whereStr,
    List<Object> whereArgs, {
    String? orderBy,
    int? limit,
  }) async {
    var dbClient = await db;
    List<Map<String, dynamic>> records = await dbClient.query(
      "MessageContent",
      where: whereStr,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
    );
    return records.map((e) => MessageContent.fromMap(e)).toList();
  }

  /// 更新message
  Future<bool> updateMessageContent(String whereStr, List whereArgs, Map<String, Object?> values) async {
    var dbClient = await db;

    int changedRows = await dbClient.update(
      "MessageContent",
      values,
      where: whereStr,
      whereArgs: whereArgs,
    );
    return changedRows > 0;
  }

  /// 更新Message通过messageId
  Future<bool> updateMessageContentById(int messageId, Map<String, Object?> values) async {
    return updateMessageContent('messageId = ?', [messageId], values);
  }

  Future<MessageContent> insertMessageContent(MessageContent msgContent) async {
    var dbClient = await db;
    try {
      msgContent.messageId = await dbClient.insert("MessageContent", msgContent.toMap());
    } catch (e) {
      print(e);
    }
    return msgContent;
  }

  Future<bool> deleteMessageContent(String whereStr, List whereArgs) async {
    var dbClient = await db;
    int changedRows = await dbClient.delete("MessageContent", where: whereStr, whereArgs: whereArgs);
    return (changedRows == 1) ? true : false;
  }

  Future<bool> updateMessageReadStatus(String conversationType, String targetId, int timestamp) async {
    var dbClient = await db;
    Map<String, dynamic> values = {};
    values['sentStatus'] = MessageStatus.Read;
    int changedRows = await dbClient.update("MessageContent", values,
        where: "targetId = ? AND conversationType = ? AND sentTime <= ? AND sentStatus = ?",
        whereArgs: [targetId, conversationType, timestamp, MessageStatus.Sent]);
    IMLog.d(LOG_TAG, '[updateMessageReadStatus] changedRows: $changedRows');
    return changedRows > 0;
  }

  Future<bool> updateMessageSentStatus(int messageId, String status) async {
    var dbClient = await db;
    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(messageId);
    Map<String, dynamic> values = {};
    values['sentStatus'] = status;
    int changedRows = await dbClient.update("MessageContent", values, where: whereStr, whereArgs: whereArgs);
    return changedRows > 0;
  }

  Future<MessageContent?> getMessageContentById(int messageId) async {
    var dbClient = await db;
    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(messageId);
    List<Map<String, dynamic>> records = await dbClient.query("MessageContent", where: whereStr, whereArgs: whereArgs);
    if (records.isNotEmpty) {
      return MessageContent.fromMap(records.first);
    }
    return null;
  }

  Future<Conversation?> getConversationByMessageId(int messageId) async {
    var dbClient = await db;
    String whereStr = "messageId = ?";
    List whereArgs = [];
    whereArgs.add(messageId);
    List<Map<String, dynamic>> msgRecords =
        await dbClient.query("MessageContent", where: whereStr, whereArgs: whereArgs);
    if (msgRecords.isNotEmpty) {
      MessageContent msgContent = MessageContent.fromMap(msgRecords.first);
      List<Map<String, dynamic>> records = await dbClient.rawQuery(
          "SELECT * FROM `Conversation` WHERE `targetId`='${msgContent.targetId}' AND `type`='${msgContent.conversationType}'");
      if (records.isNotEmpty) {
        return Conversation.fromMap(records.first);
      }
    }
    return null;
  }

  Future closeByLogout() async {
    return await databaseInit.closeByLogout();
  }

  ///获取最新一条消息
  ///endTime表示最新的截止时间
  ///visible 表示可见的消息
  Future<Map<String, dynamic>?> getLastMessage(
    String targetId, {
    int? endTime,
    bool visible = false,
    String? moreWhere,
    List<Object>? moreArgs,
  }) async {
    var dbClient = await db;
    String endTimeWhere = '';
    String visibleWhere = '';
    List<Object> args = [targetId];
    if (endTime != null) {
      endTimeWhere = ' AND `sentTime` <= ?';
      args.add(endTime);
    }
    if (visible) {
      //不是删除的消息 AND 不可见的撤回消息
      visibleWhere = ' AND `sentStatus` <> ? AND `type` <> ? AND `extra` NOT LIKE ?';
      args.addAll(['DELETE', MessageType.RcCall, '"is_pay_fail":true']);
    }
    if (moreArgs != null) {
      args.addAll(moreArgs);
    }

    String sql =
        "SELECT * FROM `MessageContent` WHERE `targetId` = ?$endTimeWhere$visibleWhere${moreWhere ?? ''} ORDER BY `sentTime` DESC LIMIT 1";
    List<Map<String, dynamic>> records = await dbClient.rawQuery(sql, args);
    return records.isNotEmpty ? records[0] : null;
  }

  ///未读的会话
  Future<List<Conversation>> getUnReadConversation() async {
    List<Conversation> res = [];
    var dbClient = await db;
    String whereStr = "";
    whereStr = "WHERE `unreadCount` > 0 ";
    List<Map<String, dynamic>> records =
        await dbClient.rawQuery("SELECT * FROM `Conversation` ${whereStr}ORDER BY `sentTime` DESC");
    for (var element in records) {
      Conversation conversation = Conversation.fromMap(element);
      res.add(conversation);
    }
    return res;
  }

  Future<bool> failSendingMessages() async {
    Database dbClient = await db;
    String whereStr = 'sentStatus = ?';
    List whereArgs = [MessageStatus.Sending];
    String sql = "SELECT * FROM `MessageContent` WHERE $whereStr";
    List<Map<String, dynamic>> records = await dbClient.rawQuery(sql, whereArgs);
    List messageIds = [];
    for (var element in records) {
      messageIds.add(element['messageId']);
    }
    Map<String, dynamic> values = {'sentStatus': MessageStatus.Failed};
    bool updated = await updateMessageContent(whereStr, whereArgs, values);
    String lastMsgIdPrefix = '"messageId":';
    String findConvSql = "SELECT * FROM `Conversation` WHERE `lastMessage` LIKE ?";
    messageIds.forEach((element) async {
      String lastMsgIdStr = '%$lastMsgIdPrefix$element%';
      List<Map<String, Object?>> convs = await dbClient.rawQuery(findConvSql, [lastMsgIdStr]);
      if (convs.isNotEmpty) {
        String sendingStatus = '"sentStatus":"${MessageStatus.Sending}"';
        String failedStatus = '"sentStatus":"${MessageStatus.Failed}"';
        Map convMap = convs[0];
        String lastMsg = convMap['lastMessage'];
        lastMsg = lastMsg.replaceAll(sendingStatus, failedStatus);
        Map<String, dynamic> values = {'lastMessage': lastMsg};
        await dbClient.update('Conversation', values, where: '`Id` = ?', whereArgs: [convMap['Id']]);
      }
    });
    return updated;
  }
}
