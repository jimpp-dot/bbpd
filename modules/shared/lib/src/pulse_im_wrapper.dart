import 'dart:async';

import 'dart:io';
import 'package:shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

class PulseIMWrapper {
  static bool debug = true;
  static const LOG_TAG = "IM_MSG_LOG";

  static Future logout() async {
    await PulseIMClient.logout();
  }

  static Future<int> getCurrentConnectionStatus() async {
    return PulseIMClient.getConnectionStatus();
  }

  static Future<List<Conversation>> getConversationList() async {
    return await PulseIMClient.getConversationList();
  }

  /*
  * @param count                获取的数量
  * @param startTime            会话的时间戳（获取这个时间戳之前的会话列表，0表示从最新开始获取）
  */
  static Future<List<Conversation>> getConversationListByPage(
      [int count = 0, int startTime = 0]) async {
    return await PulseIMClient.getConversationListByPage(count, startTime);
  }

  /*
	 * @param type
	 * @param targetId
	 */
  static Future<Conversation?> getConversation(
      String type, String targetId) async {
    return await PulseIMClient.getConversation(type, targetId);
  }

  static Future<List<MessageContent>> getHistoryMessages(
      String type, String targetId,
      [int oldestMessageId = 0, int count = 20, String? direction]) async {
    return await PulseIMClient.getHistoryMessages(
        type, targetId, oldestMessageId, count, direction);
  }

  static Future<bool> clearMessagesUnreadStatus(
      String type, String targetId) async {
    return await PulseIMClient.clearMessagesUnreadStatus(type, targetId);
  }

  /// 只支持自研
  static Future<bool> clearMessagesAtStatus(
      String type, String targetId) async {
    return await PulseIMClient.clearMessagesAtStatus(type, targetId);
  }

  static Future<bool> removeConversation(String type, String targetId) async {
    return await PulseIMClient.removeConversation(type, targetId);
  }

  static Future<Map> insertMessage(
      String type, String targetId, MessageContent content) async {
    MessageContent msg =
        await PulseIMClient.insertMessage(type, targetId, content);
    return msg.toJsonMap();
  }

  static Future<Map> sendMessage(
      String type, String targetId, MessageContent content,
      [String pushContent = "", String pushData = ""]) async {
    MessageContent? msg = await PulseIMClient.sendMessage(
        type, targetId, content, pushContent, pushData);
    if (msg != null) {
      return msg.toJsonMap();
    } else {
      d("sendMessage and return msg null ");
      return {};
    }
  }

  static Future<Map> sendVoiceMessage(String type, String targetId,
      MessageContent content, String audioData, int duration, String uri,
      [String pushContent = "", String pushData = ""]) async {
    MessageContent? msg = await PulseIMClient.sendVoiceMessage(type, targetId,
        content, audioData, duration, uri, pushContent, pushData);
    if (msg != null) {
      return msg.toJsonMap();
    } else {
      d("sendVoiceMessage msg null...uri = $uri");
      return {};
    }
  }

  static Future<Map> sendImageMessage(
      String type, String targetId, MessageContent content, File? image,
      [String pushContent = "", String pushData = ""]) async {
    content.type = "image";
    MessageContent? msg = await PulseIMClient.sendImageMessage(
        type, targetId, content, image, pushContent, pushData);
    if (msg != null) {
      return msg.toJsonMap();
    } else {
      d("sendImageMessage return map null and image = $image");
      return {};
    }
  }

  static Future<bool> deleteMessages(List<int> messageIds) async {
    return await PulseIMClient.deleteMessages(messageIds);
  }

  static Future<Map> getMessage(int messageId, {String? userId}) async {
    MessageContent? msg =
        await PulseIMClient.getMessage(messageId, userId: userId);
    if (msg != null) {
      return msg.toJsonMap();
    } else {
      d("getMessage null and msgId = $messageId");
      return {};
    }
  }

  static Future<Map> recallMessage(int messageId) async {
    MessageContent? msg = await PulseIMClient.recallMessage(messageId);
    if (msg != null) {
      /// 为了强行兼容融云，又转换成map了。。。如果不是强行兼容融云的话，可以直接返回msg
      return msg.toJsonMap();
    } else {
      d("recallMessage null and msg = $messageId");
      return {};
    }
  }

  ///设置的MessageContent.inlineExtra字段
  static Future<bool> setMessageExtra(int messageId, String extra) async {
    return await PulseIMClient.setMessageExtra(messageId, extra);
  }

  ///设置的MessageContent.extra字段
  static Future<bool> setMessageExtraNew(int messageId, String extra) async {
    return await PulseIMClient.setMessageExtraNew(messageId, extra);
  }

  static Future<bool> clearMessages(String type, String targetId) async {
    d("not used...clearMessages");
    return false;
  }

  static Future<bool> setConversationToTop(
      String type, String targetId, bool isTop) async {
    return await PulseIMClient.setConversationToTop(type, targetId, isTop);
  }

  static Future<int> getTotalUnreadCountBySmallAccount(String userId) async {
    return await PulseIMClient.getTotalUnreadCountBySmallAccount(userId);
  }

  static Future<List<Conversation>> getMsgIconListBySmallAccount(String userId,
      {int limit = 3}) async {
    return await PulseIMClient.getMsgIconListBySmallAccount(userId,
        limit: limit);
  }

  static Future<int> getTotalUnreadCount() async {
    return PulseIMClient.getTotalUnreadCount();
  }

  static Future<int> getUnreadCount(String type, String targetId) async {
    return PulseIMClient.getUnreadCount(type, targetId);
  }

  static Future<bool> setConversationNotificationStatus(
      String type, String targetId, bool isBlock) async {
    return await PulseIMClient.setConversationNotificationStatus(
        type, targetId, isBlock);
  }

  static Future<String> getConversationNotificationStatus(
      String type, String targetId,
      {bool syncFromServer = false}) async {
    return await PulseIMClient.getConversationNotificationStatus(type, targetId,
        syncFromServer: syncFromServer);
  }

  static Future<int> sendReadReceiptMessage(String type, String targetId,
      [int timestamp = 0]) async {
    return PulseIMClient.sendReadReceiptMessage(type, targetId);
  }

  static Future<bool> canRecordVoice() async {
    return await PulseIMClient.canRecordVoice();
  }

  static Future<Map> startRecordVoice() async {
    // 权限申请走统一逻辑
    PermissionStatus permissionStatus;
    permissionStatus = await PermissionUtil.checkAndRequestPermissions(
        Constant.context, Permission.microphone);
    if (permissionStatus != PermissionStatus.granted) {
      return {'success': false};
    }

    return await PulseIMClient.startRecordVoice();
  }

  static Future<bool> finishRecordVoice() async {
    return await PulseIMClient.finishRecordVoice();
  }

  static Future<String> startPlayVoice(String base64, int messageId) async {
    return await PulseIMClient.startPlayVoice(base64, messageId);
  }

  static Future<bool> stopPlayVoice() async {
    return await PulseIMClient.stopPlayVoice();
  }

  static Future<bool> cancelRecordVoice() async {
    return await PulseIMClient.cancelRecordVoice();
  }

  static Future<Conversation?> getConversationByMessageId(int messageId) async {
    return await PulseIMClient.getConversationByMessageId(messageId);
  }

  static Stream<dynamic>? _onMessageReceived;

  static Stream<dynamic> get onMessageReceived {
    return _onMessageReceived ??= PulseIMClient.onEventReceived;
  }

  static d(String msg, [String tag = LOG_TAG]) {
    if (debug) Log.d('$tag: $msg');
  }
}
