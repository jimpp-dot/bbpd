import 'dart:convert';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_util.dart';

import '../../pulse_im.dart';

class ConversationLastMessage {
  final int messageId;
  final String type; // MessageType
  final String content;
  final SendUser? user;
  final Map extra; // MessageContent中的extra字段
  String sentStatus; //发送状态

  ConversationLastMessage(this.messageId, this.type, this.content, this.user, this.extra, this.sentStatus);

  ConversationLastMessage.fromJson(Map data)
      : messageId = IMUtil.parseInt(data['messageId']),
        type = IMUtil.parseStr(data['type']),
        content = MessageUtil.parseContent(data['content'], data['message'], IMUtil.parseStr(data['type'])),
        user = (data.containsKey('user') && data['user'] != null) ? SendUser.fromJson(data['user']) : null,
        extra = MessageUtil.parseExtra(data['extra']),
        sentStatus = IMUtil.parseStr(data['sentStatus'], MessageStatus.Sent);

  String toJson() {
    Map<String, dynamic> map = {};
    map['messageId'] = messageId;
    map['type'] = type;
    map['content'] = content;
    map['user'] = (user != null) ? user!.toMap() : null;
    map['extra'] = extra;
    return json.encode(map);
  }

  int getVersion() {
    return IMUtil.parseInt(extra[MessageUtil.VERSION_KEY]);
  }

  bool isSupport() {
    int localVersion = LocalUserData.version;
    int supVersion = getVersion();
    return localVersion >= supVersion;
  }

  @override
  String toString() {
    return 'ConversationLastMessage{messageId: $messageId, type: $type, content: $content, user: $user, extra: $extra}';
  }
}

class Conversation {
  final String type;
  final String targetId;
  int sentTime = 0;
  int unreadCount = 0;
  bool isTop = false;
  ConversationLastMessage? lastMessage;
  String? title; //没用
  int? notify; //针对群消息，是否通知：1,通知 2：不通知
  int atCount = 0;

  int totalEarn = 0; //消息页提示的赚钱的总数
  int lastModifyTime = 0; //用户操作时间，操作包括：取消置顶等对会话的一些影响排序的操作
  int readTime = 0; //对方阅读完我发的最新消息的时间
  String? draft; //草稿

  bool isVipTop = false; //vip且有未读信息时置顶，不入数据库

  String get key {
    return '$type.$targetId';
  }

  Conversation(this.type, this.targetId);

  copyFrom(Conversation conv) {
    lastMessage = conv.lastMessage;
    sentTime = conv.sentTime;
    title = conv.title;
    unreadCount = conv.unreadCount;
    isTop = conv.isTop;
    notify = conv.notify;
    atCount = conv.atCount;
    lastModifyTime = conv.lastModifyTime;
    readTime = conv.readTime;
    draft = conv.draft;
  }

  // 兼容融云用的，后续删除融云后这个方法，可以删除
  Conversation.fromJson(Map? data)
      : type = '${data?['type'] ?? ''}',
        targetId = '${data?['targetId'] ?? ''}',
        sentTime = IMUtil.parseInt(data?['sentTime']),
        unreadCount = IMUtil.parseInt(data?['unreadCount']),
        isTop = data?['isTop'] ?? false,
        lastMessage = (data?['lastMessage'] != null && data?['lastMessage'] is Map)
            ? ConversationLastMessage.fromJson(data!['lastMessage'])
            : null,
        title = IMUtil.parseStr(data?['title']),
        notify = data?['notify'],
        atCount = IMUtil.parseInt(data?['atCount']),
        totalEarn = data?['totalEarn'] ?? 0;

  // sql map to Conversation
  Conversation.fromMap(Map? data)
      : type = '${data?['type'] ?? ''}',
        targetId = '${data?['targetId'] ?? ''}',
        sentTime = IMUtil.parseInt(data?['sentTime']),
        unreadCount = IMUtil.parseInt(data?['unreadCount']),
        isTop = (data?['isTop'] == 1) ? true : false,
        lastMessage = (data?['lastMessage'] != null && data!['lastMessage'] != '')
            ? ConversationLastMessage.fromJson(json.decode(data['lastMessage']))
            : null,
        title = data?['title']?.toString(),
        notify = data?['notify'],
        atCount = IMUtil.parseInt(data?['atCount']),
        totalEarn = data?['totalEarn'] ?? 0,
        lastModifyTime = IMUtil.parseInt(data?['LastModifyTime']),
        readTime = IMUtil.parseInt(data?['readTime']),
        draft = IMUtil.parseStr(data?['draft']);

  // Conversation to sql map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['type'] = type;
    map['targetId'] = targetId;
    map['sentTime'] = sentTime;
    map['unreadCount'] = unreadCount;
    map['isTop'] = isTop ? 1 : 0;
    map['lastMessage'] = (lastMessage != null) ? lastMessage!.toJson() : '';
    map['title'] = title ?? '';
    map['notify'] = notify;
    map['atCount'] = atCount;
    map['totalEarn'] = totalEarn;
    map['LastModifyTime'] = lastModifyTime;
    map['readTime'] = readTime;
    map['draft'] = draft ?? '';
    return map;
  }

  int get lastestTime {
    if (lastModifyTime == 0) {
      return sentTime;
    } else if (sentTime == 0) {
      return lastModifyTime;
    } else {
      return lastModifyTime > sentTime ? lastModifyTime : sentTime;
    }
  }

  bool get isMyLastMessageRead {
    //最后一条是自己的消息 && 已经被对方读了
    return (sentTime == 0 || readTime >= sentTime) && lastMessage?.user?.id == LocalUserData.senderUserId;
  }

  @override
  String toString() {
    return 'Conversation{type: $type, targetId: $targetId, sentTime: $sentTime, lastModifyTime: $lastModifyTime, unreadCount: $unreadCount, isTop: $isTop, lastMessage: $lastMessage, title: $title, notify: $notify, atCount: $atCount, totalEarn: $totalEarn, readTime: $readTime, draft: $draft}';
  }
}
