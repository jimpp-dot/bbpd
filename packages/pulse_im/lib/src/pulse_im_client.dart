import 'dart:async';
import 'dart:io';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:flutter/services.dart';

import 'package:pulse_im/src/db/db_helper.dart';
import 'package:pulse_im/src/db/db_manager.dart';
import 'package:pulse_im/src/socket/message_sender.dart';

import '../pulse_im.dart';
import 'socket/message_receiver.dart';

class PulseIMClient {
  static const MethodChannel _channel = MethodChannel('ly.plugins.pulse_im');
  static const EventChannel _eventChannel = EventChannel('ly.plugins.pulse_im.message');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static DatabaseHelper? _db;

  /// 空安全中默认所有静态变量都是late懒加载的，调用时才加载。
  static final MessageSender _messageSender = MessageSender();
  static final SocketConnection _socketConnection = SocketConnection(MessageReceiver(_messageSender), _messageSender);

  static const LOG_TAG = "PulseIMClient";

  /// 调用发送消息接口 [sendMessage] 结果的回调（消息已本地存储，且已发送给服务端）
  /// @param messageId            本地自增消息id
  /// @param status               消息发送状态，参见枚举 [MessageStatus]
  /// @param code                 具体的错误码，0 代表成功
  /// @param sentTrigger          消息发送是由谁触发的，默认是用户行为
  static late Function(int messageId, String status, int code, {String? errorMsg, int? sentTrigger}) onMessageSend;

  /// 收到消息的回调函数（消息已本地存储）
  /// @param msgContent           消息内容
  /// @param left                 剩余未接收的消息个数 left>=0，建议在 left == 0 时刷新会话列表
  /// @param lastMsgId            参考ResGetMsg类的lastMsgId字段定义
  ///
  static late Function(MessageContent msgContent, int left, {Map<String, dynamic>? userInfo, int? lastMsgId})
      onMessageReceived;

  /// 过滤处理新消息
  /// - 如果返回true，表示拦截消息处理，IM中不在处理
  /// - 如果返回false，表示不拦截消息处理，IM中继续处理
  static Future<bool> Function(MessageContent msgContent, int fromUserId, int userId, int msgType)? onHandleNewMsg;

  /// 在处理收到的消息时判断是否存入数据库
  /// - 如果返回true，表示存入数据库
  /// - 如果返回false，表示不存入数据库
  static bool Function(MessageContent msgContent)? predictSaveDbNewMsg;

  /// IM接收消息回调
  static OnSocketConnection? connectionCallback;

  /// 接收消息合法性检查
  /// - 如果返回为空，表示忽略，以默认为准
  /// - 不为空，表示为该方法为准
  static bool? Function(MessageContent msgContent)? messageReceiverCheck;

  /// 收到已读消息回执的回调函数
  /// @param conversationType         会话类型
  /// @param targetId                 userId（目前已读回执仅针对私聊）
  /// @param timestamp                该会话已阅读的最后一条消息的发送时间戳
  ///
  static late Function(String conversationType, String targetId, int timestamp) onReceiveReadReceipt;

  static Function(MessageContent msgContent)? onRecallMessageReceived;

  /// 收到cmd 消息
  static bool Function(MessageContent msgContent)? onCmdMessageReceived;

  /// 收到delete 消息；多终端同步时，更新未读数
  /// 此方法已废弃，已经由onNotifyUnreadCount代替
  @deprecated
  static Function()? onMessageDelete;

  /// 多终端同步时，更新未读数；
  /// 配合 base_core中im.dart 未读数通知分发整理
  /// unreadCount < 0 重新加载未读数
  static Function({String? conversationType, String? targetId, int unreadCount})? onNotifyUnreadCount;

  ///输入状态的监听
  static Function(String conversationType, String targetId)? onTypingStatusChanged;

  ///在线通知栏
  static late Function(String payload) onNotification;

  /// 一些在线消息例如vip升级等
  static late Function(String payload) onOnlineMsg;

  /// 被踢下线
  /// @param reason    被踢原因
  static Function(int reason)? onKickOut;

  static late Function(int code, String msg) onLoginError;

  /// 尝试重连socket
  static Function(Map<String, dynamic> params)? onTryConnect;

  /// 真正链接socket
  static Function(String socketUrl, bool isNetworkConnected)? onRealConnect;

  /// socket链接失败
  static Function(dynamic error, bool isNetworkConnected, StackTrace? stackTrace)? onConnectError;

  /// socket链接成功
  static Function()? onConnectSucc;

  /// socket链接onDone
  static Function()? onConnectOnDone;

  /// 防诈 消息
  static MessageContent? Function(String conversationType, String targetId,
      {String? userId, String? name, String? icon})? onSwindleTipsMsg;

  static Future initLocalData(
      String uid, String name, String portraitUri, String baseFileDir, String pkg, int version) async {
    IMLog.d(LOG_TAG,
        'InitLocalData uid=$uid, name=$name, portraitUri=$portraitUri, baseFileDir=$baseFileDir, pkg=$pkg version=$version');
    LocalUserData.setUp(uid, name, portraitUri, baseFileDir, pkg, version);

    await _databaseManager_init();
  }

  static initRemoteConfig(String senderToken, int heart, String socketAddress, String imDomain, {String? customAppId}) {
    LocalUserData.setUpRemoteConfig(senderToken, heart, socketAddress, imDomain, customAppId: customAppId);
  }

  /// 设置多语言翻译
  static initLocaleLang(String Function(String payload) function) {
    MessageUtil.initLocaleLang(function);
  }

  static Future _databaseManager_init() async {
    await DatabaseManager().init();
    _db = DatabaseManager().getDatabaseHelp();
  }

  static Future databaseManager_update(List<String> userIds) async {
    await DatabaseManager().update(userIds);
  }

  static void databaseManager_updateInfo(List<Map<String, dynamic>> userInfos) {
    DatabaseManager().updateInfo(userInfos);
  }

  static void connect(String pushToken, String pushVendor, {HttpClient? customClient}) {
    IMLog.d(LOG_TAG, 'PushToken=$pushToken, PushVendor=$pushVendor');
    _socketConnection.init(pushToken, pushVendor, customClient: customClient);
  }

  static void reconnectIfNeed() {
    IMLog.i(LOG_TAG, 'reconnectIfNeed');
    _socketConnection.reconnectIfNeed();
  }

  static Future logout() async {
    IMLog.d(LOG_TAG, 'logout');
    _socketConnection.disconnectByLogout();
    await DatabaseManager().closeByLogout();
  }

  static int getConnectionStatus() {
    IMLog.i(LOG_TAG, 'getConnectionStatus');
    return _socketConnection.isConnected() ? 0 : -1;
  }

  /// 获取全量会话列表
  ///
  static Future<List<Conversation>> getConversationList() async {
    IMLog.i(LOG_TAG, 'getConversationList');
    if (_db == null) return [];
    return await _db!.getConversationList();
  }

  /// 分页获取会话列表
  /// @param count                分页数量
  /// @param startTime            会话时间戳（获取这个时间戳之前的会话列表，0表示从最新开始获取）
  ///
  static Future<List<Conversation>> getConversationListByPage([int count = 0, int startTime = 0]) async {
    IMLog.i(LOG_TAG, 'getConversationListByPage count=$count, startTime=$startTime');
    if (startTime < 0) {
      startTime = 0;
    }
    return (await _db?.getConversationListByPage(count, startTime)) ?? [];
  }

  /// 根据messageId获取会话
  /// messageId获取会话
  /// @param messageId            消息id
  ///
  static Future<Conversation?> getConversationByMessageId(int messageId) async {
    IMLog.i(LOG_TAG, 'getConversationByMessageId messageId=$messageId');
    return await _db?.getConversationByMessageId(messageId);
  }

  /// 获取指定会话
  /// @param type                 会话类型
  /// @param targetId             会话Id
  ///
  static Future<Conversation?> getConversation(String type, String targetId) async {
    IMLog.i(LOG_TAG, 'getConversation type=$type, targetId=$targetId');
    return await _db?.getConversation(type, targetId);
  }

  /// 删除指定会话
  /// @param type                 会话类型
  /// @param targetId             会话Id
  ///
  static Future<bool> removeConversation(String type, String targetId) async {
    IMLog.d(LOG_TAG, 'removeConversation type=$type, targetId=$targetId');

    /// 删除会话
    await _db?.removeConversation(type, targetId);

    /// 遍历 删除消息内容
    List<MessageContent> totalMsgList = [];
    int limit = 20;
    int lastMsgId = 0;
    await Future.doWhile(() async {
      IMLog.d(LOG_TAG, 'removeConversation getHistoryMessages lastMsgId:$lastMsgId');
      List<MessageContent> msgList = await getHistoryMessages(type, targetId, lastMsgId, limit);
      IMLog.d(LOG_TAG, 'removeConversation getHistoryMessages msgList.length:${msgList.length}');
      totalMsgList.addAll(msgList);
      if (msgList.length < limit) {
        /// 结束循环
        IMLog.d(LOG_TAG, 'removeConversation getHistoryMessages end');
        return false;
      } else {
        /// 继续查询下一页
        IMLog.d(LOG_TAG, 'removeConversation getHistoryMessages continue');
        lastMsgId = msgList.last.messageId;
        return true;
      }
    });
    IMLog.d(LOG_TAG, 'removeConversation totalMsgList.length: ${totalMsgList.length}');
    return await deleteMessageContents(totalMsgList, updateConversation: false);
  }

  /// 获取会话消息
  /// @param type              会话类型
  /// @param targetId          会话Id
  /// @param oldestMessageId   会话消息列表中最小的messageId，拉取该messageId之前的count个消息，0表示从最新开始往前拉取
  /// @param count             每页消息的数量
  ///
  static Future<List<MessageContent>> getHistoryMessages(String type, String targetId,
      [int oldestMessageId = 0,
      int count = 20,
      String? direction,
      String? sentStatus,
      bool excludeDelete = true]) async {
    IMLog.i(
        LOG_TAG, 'getHistoryMessages type=$type, targetId=$targetId, oldestMessageId=$oldestMessageId, count=$count');
    if (oldestMessageId < 0) {
      oldestMessageId = 0;
    }
    if (_db == null) return [];
    return await _db!.getHistoryMessages(type, targetId, oldestMessageId, count,
        excludeDelete: excludeDelete, direction: direction, sentStatus: sentStatus);
  }

  /// 清除会话未读数标记
  /// @param type              会话类型
  /// @param targetId          会话Id
  ///
  static Future<bool> clearMessagesUnreadStatus(String type, String targetId, {String? userId}) async {
    IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus type=$type, targetId=$targetId, userId=$userId');
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);

    /// 判断当前会话列表 未读数 是否已经清零
    int? unreadCount = await db?.getUnreadCount(type, targetId);
    IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus unreadCount=$unreadCount');
    if ((unreadCount ?? 0) == 0) {
      /// 当前会话 未读数已经是0了，返回false，表示不需要通知UI刷新
      return false;
    }

    /// 当前会话列表 未读数 清零
    await db?.clearMessagesUnreadStatus(type, targetId);

    /// 遍历 删除消息内容
    List<MessageContent> totalMsgList = [];
    int limit = 20;
    int lastMsgId = 0;
    await Future.doWhile(() async {
      IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus getHistoryMessages lastMsgId:$lastMsgId');
      List<MessageContent> msgList = await getHistoryMessages(type, targetId, lastMsgId, limit);
      IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus getHistoryMessages msgList.length:${msgList.length}');
      totalMsgList.addAll(msgList);
      if (msgList.length < limit) {
        /// 结束循环
        IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus getHistoryMessages end');
        return false;
      } else {
        /// 继续查询下一页
        IMLog.d(LOG_TAG, 'clearMessagesUnreadStatus getHistoryMessages continue');
        lastMsgId = msgList.last.messageId;
        return true;
      }
    });

    /// 收到对方的消息 标记已读
    return await readReceivedMessageContents(
        totalMsgList.where((e) => e.messageDirection == MessageDirection.Receive).toList(),
        userId: userId);
  }

  /// 收到对方的消息 标记已读
  static Future<bool> readReceivedMessageContents(List<MessageContent> messageContents, {String? userId}) async {
    if (IMUtil.isCollectionEmpty(messageContents)) {
      return true;
    }
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);

    /// 标记删除
    await Future.forEach<MessageContent>(messageContents, (element) async {
      Map<String, dynamic> values = {"sentStatus": MessageStatus.ReceivedRead};
      await db?.updateMessageContent("messageId=?", [element.messageId], values);
    });

    return true;
  }

  /// 清除会话未读数标记
  /// @param type              会话类型
  /// @param targetId          会话Id
  ///
  static Future<bool> clearMessagesAtStatus(String type, String targetId) async {
    IMLog.i(LOG_TAG, 'clearMessagesAtStatus type=$type, targetId=$targetId');
    if (_db == null) return false;
    return await _db!.clearMessagesAtStatus(type, targetId);
  }

  /// 更新为已读
  /// @param type              会话类型
  /// @param targetId          会话Id
  /// @param timestamp         时间戳
  static Future<bool> updateMessageReadStatus(String conversationType, String targetId, int timestamp) async {
    IMLog.d(LOG_TAG, 'updateMessageReadStatus type=$conversationType, targetId=$targetId, timestamp=$timestamp');
    if (_db == null) return false;
    return await _db!.updateMessageReadStatus(conversationType, targetId, timestamp);
  }

  /// @param type              会话类型
  static Future<MessageContent> insertMessage(String conversationType, String targetId, MessageContent content) async {
    IMLog.i(LOG_TAG, 'insertMessage type=$conversationType, targetId=$targetId, content=$content');
    if (_db == null) return content;
    return await _db!.insertMessage(conversationType, targetId, content);
  }

  /// 发送文本消息
  /// @param type              会话类型
  /// @param targetId          会话Id
  /// @param content           消息内容
  /// @param pushContent       离线推送内容，用于通知内容显示
  /// @param pushData          离线推送内容，用于携带不显示的数据（采用pull模型，只填充pushContent，pushData不需要填充）
  /// return null 表示发送失败
  static Future<MessageContent?> sendMessage(String conversationType, String targetId, MessageContent content,
      [String pushContent = "", String pushData = "", String pushTitle = "", bool saveToDb = true]) async {
    IMLog.i(LOG_TAG,
        'sendMessage conversationType=$conversationType, targetId=$targetId, content=$content, pushContent=$pushContent, pushData=$pushData, pushTitle=$pushTitle');
    if (pushContent == "") {
      pushContent = MessageUtil.parseContent(content.content, null, content.type);
    }
    return await _messageSender.sendMessage(
        conversationType, targetId, content, pushContent, pushData, pushTitle, saveToDb);
  }

  /// 重新发送消息
  /// return null 表示发送失败
  static Future<MessageContent?> resendMessage(MessageContent content,
      [String pushContent = "", String pushData = "", String pushTitle = ""]) async {
    IMLog.i(LOG_TAG,
        'resendMessage conversationType=${content.conversationType}, targetId=${content.targetId}, content=$content, pushContent=$pushContent, pushData=$pushData, pushTitle=$pushTitle');
    if (pushContent == "") {
      pushContent = MessageUtil.parseContent(content.content, null, content.type);
    }
    return await _messageSender.sendMessage(
        content.conversationType, content.targetId, content, pushContent, pushData, pushTitle);
  }

  /// return null 表示发送失败
  static Future<MessageContent?> sendVoiceMessage(
      String type, String targetId, MessageContent content, String audioData, int duration, String uri,
      [String pushContent = "", String pushData = "", String pushTitle = '']) async {
    IMLog.i(LOG_TAG,
        'sendVoiceMessage type=$type, targetId=$targetId, content=$content, audioData=$audioData, duration=$duration, uri=$uri, pushContent=$pushContent, pushData=$pushData, pushTitle=$pushTitle');
    if (duration <= 0) {
      print('[sendVoiceMessage] param null');
      return null;
    }
    if (Platform.isIOS && !IMUtil.isHttpUrl(audioData)) {
      audioData = await VoiceUtil.convertWavToAmr(audioData);
    }
    content.content = '[语音]';
    content.audioData = audioData;
    content.duration = duration;
    content.uri = uri;

    if (pushContent == "") {
      pushContent = MessageUtil.parseContent(content.content, null, content.type);
    }
    return await _messageSender.sendMessage(type, targetId, content, pushContent, pushData, pushTitle);
  }

  //todo: 伴伴代码中imageUrl、thumb字段含义不一样，另外app端没找到localPath字段，需要app端或sdk端统一一下
  /// return null 表示发送失败
  static Future<MessageContent?> sendImageMessage(String type, String targetId, MessageContent content, File? image,
      [String pushContent = "", String pushData = "", String pushTitle = '']) async {
    IMLog.i(LOG_TAG,
        'sendImageMessage type=$type, targetId=$targetId, content=$content, image=$image, pushContent=$pushContent, pushData=$pushData, pushTitle=$pushTitle');
    if (image != null) {
      var imagePath = image.path;
      var fileName = imagePath.substring(imagePath.lastIndexOf("/") + 1, imagePath.length);

      content.imageUrl = imagePath;
      content.thumb = imagePath;
    }
    content.content = '[图片]';
    if (pushContent == "") {
      pushContent = MessageUtil.parseContent(content.content, null, content.type);
    }
    return await _messageSender.sendMessage(type, targetId, content, pushContent, pushData, pushTitle);
  }

  /// 已读回执，类似ACK 读到最新哪一条（仅针对单聊）
  /// @param conversationType         会话类型
  /// @param targetId                 会话 id
  /// @param timestamp                该会话已阅读的最后一条消息的发送时间戳
  ///
  static Future<int> sendReadReceiptMessage(String conversationType, String targetId, [int timestamp = 0]) async {
    IMLog.i(
        LOG_TAG, 'sendReadReceiptMessage conversationType=$conversationType, targetId=$targetId, timestamp=$timestamp');
    timestamp = (timestamp == 0) ? DateTime.now().millisecondsSinceEpoch : timestamp;
    return await _messageSender.sendReadReceiptMessage(conversationType, targetId, timestamp);
  }

  /// 删除消息 通知服务端
  static Future<int> sendDeleteMessage(String conversationType, String targetId, List<String> messageUIds) async {
    IMLog.i(
        LOG_TAG, 'sendDeleteMessage conversationType=$conversationType, targetId=$targetId, messageUIds=$messageUIds');
    return await _messageSender.sendDeleteMessage(conversationType, targetId, messageUIds);
  }

  static Future<MessageContent?> recallMessage(int messageId, {bool isPayFail = false}) async {
    IMLog.i(LOG_TAG, 'recallMessage messageId=$messageId');
    MessageContent? message = await _db?.getMessageContent("messageId=?", [messageId]);
    if (message == null) {
      return null;
    }
    return await _messageSender.recallMessage(message, isPayFail: isPayFail);
  }

  static void sendTypingStatus(String conversationType, String targetId) async {
    IMLog.i(LOG_TAG, 'sendTypingStatus conversationType=$conversationType, targetId=$targetId');
    return await _messageSender.sendTypingStatus(conversationType, targetId);
  }

  static Future<int> getTotalUnreadCountBySmallAccount(String userId) async {
    IMLog.i(LOG_TAG, 'getTotalUnreadCountBySmallAccount: $userId');
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
    if (db == null) return 0;
    return await db.getTotalUnreadCount();
  }

  static Future<List<Conversation>> getMsgIconListBySmallAccount(String userId, {int limit = 3}) async {
    IMLog.i(LOG_TAG, 'getMsgIconListBySmallAccount: $userId');
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
    if (db == null) return [];
    return await db.getMsgIconListBySmallAccount(userId, limit: limit);
  }

  static Future<int> getTotalUnreadCount() async {
    IMLog.i(LOG_TAG, 'getTotalUnreadCount');
    if (_db == null) return 0;
    return await _db!.getTotalUnreadCount();
  }

  static Future<int> getUnreadCount(String type, String targetId) async {
    IMLog.i(LOG_TAG, 'getUnreadCount type=$type, targetId=$targetId');
    if (_db == null) return 0;
    return await _db!.getUnreadCount(type, targetId);
  }

  static Future<MessageContent?> getMessage(int messageId, {String? userId}) async {
    IMLog.i(LOG_TAG, 'getMessage messageId=$messageId');
    DatabaseHelper? db = DatabaseManager().getDatabaseHelp(userId: userId);
    return await db?.getMessageContent("messageId=?", [messageId]);
  }

  /// 聊天页面多选删除消息
  static Future<bool> deleteMessages(List<int> messageIds) async {
    IMLog.d(LOG_TAG, 'deleteMessages messageIds=$messageIds');
    if (IMUtil.isCollectionEmpty(messageIds)) {
      return true;
    }
    List<MessageContent> messageContents = [];
    await Future.forEach<int>(messageIds, (element) async {
      final message = await getMessage(element);
      if (message != null) {
        messageContents.add(message);
      }
    });
    IMLog.d(LOG_TAG, 'deleteMessages messageContents.length=${messageContents.length}');
    return await deleteMessageContents(messageContents);
  }

  static Future<bool> deleteMessageContents(List<MessageContent> messageContents,
      {bool updateConversation = true}) async {
    if (IMUtil.isCollectionEmpty(messageContents)) {
      return true;
    }

    /// 标记删除
    await Future.forEach<MessageContent>(messageContents, (element) async {
      Map<String, dynamic> values = {"sentStatus": MessageStatus.Delete};
      await _db?.updateMessageContent("messageId=?", [element.messageId], values);
    });

    /// 删除消息，只能删除同一个会话列表中的消息
    String conversationType = messageContents[0].conversationType;
    String targetId = messageContents[0].targetId;
    IMLog.d(LOG_TAG, 'deleteMessageContents conversationType:$conversationType, targetId:$targetId');
    if (updateConversation) {
      /// 更新会话列表
      await ConversationDataHelper.updateConversation(conversationType, targetId);
    }

    /// 通知服务端 删除消息
    await sendDeleteMessage(conversationType, targetId, messageContents.map((e) => e.messageUId ?? "").toList());
    return true;
  }

  static Future<bool> updateConversation(String type, String targetId) async {
    return await ConversationDataHelper.updateConversation(type, targetId);
  }

  static Future<bool> setConversationToTop(String type, String targetId, bool isTop, [int? modiftyTime]) async {
    IMLog.i(LOG_TAG, 'setConversationToTop type=$type, targetId=$targetId, isTop=$isTop');
    if (_db == null) return false;
    return await _db!.updateConversation(
        type, targetId, {'isTop': (isTop ? 1 : 0), if (modiftyTime != null) 'LastModifyTime': modiftyTime});
  }

  static Future<bool> setConversationNotificationStatus(String type, String targetId, bool isBlock) async {
    IMLog.d(LOG_TAG, 'setConversationNotificationStatus type=$type, targetId=$targetId, isBlock=$isBlock');
    if (type != ConversationType.Group) {
      return false;
    }
    if (_db == null) return false;
    _messageSender.sendSetNotifyStatus(type, targetId, !isBlock);

    bool success = await _db!.updateConversation(type, targetId, {'notify': (isBlock ? 2 : 1)});
    return success;
  }

  /// 针对群消息，是否通知：1:通知 2:不通知
  static Future<String> getConversationNotificationStatus(String type, String targetId,
      {bool syncFromServer = false}) async {
    IMLog.d(LOG_TAG, 'getConversationNotificationStatus type=$type, targetId=$targetId');
    if (type != ConversationType.Group) {
      return '1';
    }
    if (syncFromServer) {
      _messageSender.sendGetNotifyStatus(type, targetId);
    }
    Conversation? conversation = await _db?.getConversation(type, targetId);
    if (conversation != null && conversation.notify != null) {
      return conversation.notify.toString();
    }
    return '1';
  }

  ///请注意，这里是设置的MessageContent.inlineExtra字段
  static Future<bool> setMessageExtra(int messageId, String extra) async {
    IMLog.i(LOG_TAG, 'setMessageExtra messageId=$messageId, extra=$extra');
    MessageContent? message = await _db?.getMessageContent("messageId=?", [messageId]);
    if (message == null) {
      return false;
    }
    print("extra = $extra");
    Map<String, dynamic> map = <String, dynamic>{};
    map['inlineExtra'] = extra;
    return (await _db?.updateMessageContent("messageId=?", [messageId], map)) ?? false;
  }

  /// 设置的MessageContent.extra字段
  static Future<bool> setMessageExtraNew(int messageId, String extra) async {
    IMLog.i(LOG_TAG, 'setMessageExtra messageId=$messageId, extra=$extra');
    MessageContent? message = await _db?.getMessageContent("messageId=?", [messageId]);
    if (message == null) {
      return false;
    }
    print("extra = $extra");
    Map<String, dynamic> map = <String, dynamic>{};
    map['extra'] = extra;
    return (await _db?.updateMessageContent("messageId=?", [messageId], map)) ?? false;
  }

  static Future<Map> startRecordVoice() async {
    IMLog.i(LOG_TAG, 'startRecordVoice');
    final Map res = await _channel.invokeMethod('startRecordVoice');
    return res;
  }

  static Future<bool> finishRecordVoice() async {
    IMLog.i(LOG_TAG, 'finishRecordVoice');
    final bool res = await _channel.invokeMethod('finishRecordVoice');
    return res;
  }

  static Future<bool> cancelRecordVoice() async {
    IMLog.i(LOG_TAG, 'cancelRecordVoice');
    final bool res = await _channel.invokeMethod('cancelRecordVoice');
    return res;
  }

  static Future<bool> canRecordVoice() async {
    IMLog.d(LOG_TAG, 'canRecordVoice');
    final bool res = await _channel.invokeMethod('canRecordVoice');
    return res;
  }

  static Future<String> startPlayVoice(String audioData, int messageId) async {
    if (Platform.isIOS) {
      String rData = await VoiceUtil.convertAmrToWav(audioData);
      IMLog.d(LOG_TAG, "IOS PLAY VOICE = $rData");
      return await _channel.invokeMethod("startPlayVoice", rData);
    } else {
      String path = await VoiceUtil.getVoiceFilePath(audioData, messageId);
      return await _channel.invokeMethod("startPlayVoice", {"url": Uri.file(path).toString()});
    }
  }

  static Future<bool> stopPlayVoice() async {
    IMLog.i(LOG_TAG, 'stopPlayVoice');
    final bool res = await _channel.invokeMethod('stopPlayVoice');
    return res;
  }

  static Future<String> convertAmrToWav(String amrStr) async {
    IMLog.i(LOG_TAG, 'convertAmrToWav');
    try {
      final String wavStr = await _channel.invokeMethod('ConverterAmrToWav', amrStr);
      return wavStr;
    } catch (error) {
      return '';
    }
  }

  //wav格式base64字符串 转amr格式base64字符串
  static Future<String> convertWavToAmr(String wavStr) async {
    IMLog.i(LOG_TAG, 'convertWavToAmr');
    try {
      final String amrStr = await _channel.invokeMethod('ConverterWavToAmr', wavStr);
      return amrStr;
    } catch (error) {
      return '';
    }
  }

  static Stream<dynamic>? _onEventReceived;

  static Stream<dynamic> get onEventReceived {
    _onEventReceived ??= _eventChannel.receiveBroadcastStream();
    return _onEventReceived!;
  }

  static bool enableCliStatistics = false;

  /// 未读的会话
  static Future<List<Conversation>> getUnReadConversation() async {
    IMLog.i(LOG_TAG, 'getUnReadConversation');
    return await _db?.getUnReadConversation() ?? [];
  }

  /// 更新MessageContent
  static Future<bool> updateMessageContentById(int messageId, Map<String, Object?> values) async {
    return await _db?.updateMessageContentById(messageId, values) ?? false;
  }

  ///获取最新一条消息
  ///endTime表示最新的截止时间
  ///visible 表示可见的消息
  static Future<Map<String, dynamic>?> getLastMessage(
    String targetId, {
    int? endTime,
    bool visible = false,
    String? moreWhere,
    List<Object>? moreArgs,
  }) async {
    return await _db?.getLastMessage(targetId,
        endTime: endTime, visible: visible, moreWhere: moreWhere, moreArgs: moreArgs);
  }

  /// 更新Coversation状态
  static Future<bool> updateConversationValues(String type, String targetId, Map<String, dynamic> values) async {
    return await _db?.updateConversation(type, targetId, values) ?? false;
  }

  /// 插入一条数据
  static Future<bool> insertConversation(Conversation conversation) async {
    return await _db?.insertConversation(conversation) ?? false;
  }

  ///彻底删除消息，包括服务端
  ///messages 至少包含：{"messageId": 1, "messageUId": 16}
  ///messageId用于删本地数据，messageUId，向服务端请求删除
  static Future<bool> deleteMessagesAbsolutely(int targetId, {List<MessageContent>? messages}) async {
    if (messages == null) {
      //messages为null，分批查询全部targetId对应的message列表
      bool res = true;
      while (true) {
        //List<Map<String, dynamic>> list = await _db?.getMessages(targetId: targetId, limit: 30);
        final list = await _db?.queryMessageContent('targetId = ?', [targetId], orderBy: 'messageId DESC', limit: 30);
        if (list != null && list.isNotEmpty) {
          res = res && await deleteMessagesAbsolutely(targetId, messages: list);
        } else {
          break;
        }
      }
      return res;
    }
    if (IMUtil.isCollectionEmpty(messages)) {
      return true;
    }

    List<int> messageIds = messages.map((e) => e.messageId).toList();
    List<int> messageUIds =
        messages.map((e) => e.messageUId).map((e) => IMUtil.parseInt(e)).where((e) => e > 0).toList();

    //删服务端的消息
    bool res = await _messageSender.deleteMessages(targetId, messageUIds);

    //删客户端的消息
    if (res) {
      String whereStr = 'messageId in(${messageIds.map((e) => '?').join(',')})';
      res = await _db?.deleteMessageContent(whereStr, messageIds) ?? false;
    }

    if (res) {
      updateLastMessage(ConversationType.Private, targetId);
    }

    return res;
  }

  static Future<bool> updateLastMessage(String conversationType, int targetId) async {
    String targetIdStr = targetId.toString();
    List<MessageContent> msgList = await _db?.getHistoryMessages(conversationType, targetIdStr, 0, 1) ?? [];
    ConversationLastMessage lastMessage;
    if (!IMUtil.isCollectionEmpty(msgList)) {
      MessageContent msg = msgList[0];
      SendUser? sendUser = msg.user?.copyWith();
      Map extra = msg.extraMap;
      String sentStatus = msg.sentStatus;
      lastMessage = ConversationLastMessage(
          msg.messageId, msg.type, MessageUtil.parseContent(msg.content, null, msg.type), sendUser, extra, sentStatus);
      return await _db?.updateConversation(conversationType, targetIdStr, {"lastMessage": lastMessage.toJson()}) ??
          false;
    } else {
      return await _db?.updateConversation(conversationType, targetIdStr, {"lastMessage": ''}) ?? false;
    }
  }

  static Future<bool> failSendingMessages() async {
    return await _db?.failSendingMessages() ?? false;
  }

  /// 查询MessageContent
  static Future<List<MessageContent>> queryMessageContent(
    String whereStr,
    List<Object> whereArgs, {
    String? orderBy,
    int? limit,
  }) {
    return _db?.queryMessageContent(whereStr, whereArgs, orderBy: orderBy, limit: limit) ?? Future.value([]);
  }
}

enum ConnectStatus {
  None, //初始状态
  Connected, // 已连接
  Failed, // 失败
  Closed, // 连接关闭
}
