import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flt_push/flt_push.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandler;
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/model/im_token.dart';
import 'package:shared/model/notification_payload.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';

import '../k.dart';

final Map<int, String> ErrorMap = {
  405: R.array('msg_send_failed_type')[0],
  20604: R.array('msg_send_failed_type')[1],
  21406: R.array('msg_send_failed_type')[2],
  22406: R.array('msg_send_failed_type')[3],
  22408: R.array('msg_send_failed_type')[4],
  24012: R.array('msg_send_failed_type')[5],
  30001: R.array('msg_send_failed_type')[6],
  30002: R.array('msg_send_failed_type')[7],
  30003: R.array('msg_send_failed_type')[8],
  30016: R.array('msg_send_failed_type')[9],
  30017: R.array('msg_send_failed_type')[10],
  31004: R.array('msg_send_failed_type')[11],
  31009: R.array('msg_send_failed_type')[12],
  31010: R.array('msg_send_failed_type')[13],
  31011: R.array('msg_send_failed_type')[14],
};

class Im {
  ///调用connect方法连接成功，意味着key切换成功
  static const String EventConnSuccess = 'im.conn.success';

  static const String EventConnChanged = 'im.conn.changed';
  static const String EventLogin = 'im.event.login';
  static const String EventUnreadChanged = 'im.unread.changed'; // 未读数（总数）变化 以及 单个会话列表未读数变化
  static const String EventMessageContentChanged = 'im.message.content.changed'; // 收到新消息后，会话列表重组数据源（带有参数控制 是否更新UI）
  static const String EventClearAtStatus = 'im.at.status.clear';
  static const String EventMessageReceived = 'im.message.received';
  static const String EventMessageReceivedBoxShow = 'im.message.received.boxshow';
  static const String EventMessageReceivedBoxShowBySmallAccount = 'im.message.received.boxshow.small.account';
  static const String EventMessageSent = 'im.message.sent';
  static const String EventMessageSendFail = 'im.message.send.fail';
  static const String EventMessageSentComplete = 'im.message.sent.complete';
  static const String EventMessageRecall = 'im.message.recall';
  static const String EventCmd = 'im.cmd';

  static const String EventSendImageAdded = 'im.message.send.image.added';
  static const String EventSendImageProgress = 'im.message.send.image.progress';
  static const String EventSendImageSuccess = 'im.message.send.image.success';
  static const String EventRecordDurationChanged = 'im.message.record.duration.changed';
  static const String EventReadReceiptReceived = 'im.message.read.receipt.received';
  static const String EventRemoveConversation = 'im.message.remove.conversation';

  static bool needParseCache = true;
  static final List<Map> _cachedMessages = [];
  static bool needParseCacheBox = true;
  static final List<Map> _cachedMessagesBoxShow = [];
  static const int _maxCachedMessageCount = 1000;

  static String refer = ''; // 跳转到私聊界面的上一个界面名称

  static bool firstSend = false; // 是否是我给对方发送的第一条消息，默认false

  static Map orderSayHiUids = {};

  static bool isNewGroup = false;

  ///app是否在前台
  static bool _isResumed = true;

  static const int SDK_VERSION = ImSupportSDKVersions.CURRENT_SDK_VERSION;

  static bool _isInit = false;

  static int _lastReportImConnectTime = 0;
  static int _lastReportImConnectErrorTime = 0;
  static const String _tag = "PulseIM";

  static const String IM_APP_ID = '02a508ce025fdfe0b87eb394ef2b589f';

  static _init() async {
    _cachedMessages.clear();
    _cachedMessagesBoxShow.clear();
    await PulseIMClient.initLocalData(
        Session.uid.toString(), Session.name, Session.icon, Constant.documentsDirectory.path, Constant.packageName, SDK_VERSION);
    await login();

    /// 小号 列表
    onCommonSmallAccountUpdate(EventConstant.EventSmallAccountUpdate, null);

    /// 小号消息助手设置
    _onLoadSmallAccount();
  }

  static onCommonSmallAccountUpdate(String type, dynamic data) async {
    Log.d("small.account.update onCommonSmallAccountUpdate");
    if (BaseConfig.instance.smallAccount) {
      await getSmallAccountList();
    }
  }

  static _onCommonLogin(String type, dynamic data) async {
    Log.d("Event.Login _onCommonLogin");

    //切换小号时没有logout回调，所以在此处先调IM的logout以确保不会收到之前UID的push消息
    await PulseIMWrapper.logout();

    _init();
  }

  static _onCommonLogout(String type, dynamic data) {
    Log.d("Event.Logout _onCommonLogout");
    PulseIMWrapper.logout();
  }

  static _parseMessageSpecial(Map? message, int left) {
    if (message == null || !message.containsKey('content')) return;
    switch (message['objectName']) {
      case 'RC:CmdMsg':
        var item = message['content'];
        if (item is Map && item.containsKey('data')) {
          dynamic data;
          try {
            data = json.decode(item['data']);
          } catch (e, s) {
            Log.e(e, stackTrace: s);
            return;
          }
          eventCenter.emit(EventCmd, {
            'name': item['name'],
            'data': data,
            'left': left,
            'message': message,
          });
        }
        return;
    }

    eventCenter.emit(EventMessageReceived, {
      'messageId': message['messageId'],
      'left': left,
      'message': message,
    });
  }

  static init() {
    if (Util.isSleeplessPlanetVerify) return;
    if (_isInit) return;
    _isInit = true;
    if (Session.isLogined) {
      _init();
      appStateObserver.addListener(_onAppStateChanged);
    }
    eventCenter.addListener(EventConstant.EventLogin, _onCommonLogin);
    eventCenter.addListener(EventConstant.EventLogout, _onCommonLogout);
    eventCenter.addListener(EventConstant.EventSmallAccountUpdate, onCommonSmallAccountUpdate);
  }

  static void initForCommonIm(ImToken imToken) async {
    PulseIMClient.initRemoteConfig(imToken.token, imToken.heart, imToken.socketAddress, imToken.imDomain, customAppId: IM_APP_ID);
    _initConnectReport();
    PushTokenInfo? tokenInfo = await PushChannel.getToken();
    PulseIMClient.connect(tokenInfo?.token ?? "", tokenInfo?.vendor ?? "");
    PulseIMClient.onMessageReceived = (MessageContent msg, int left, {Map<String, dynamic>? userInfo, int? lastMsgId}) {
      Map message = {};
      message['message'] = msg.toJsonMap();
      message['message']['messageId'] = msg.messageId;
      message['left'] = left;

      Map data = {};
      data['type'] = 'RongIMClient.OnReceiveMessageListener.onReceived';
      data['userInfo'] = json.encode(userInfo);
      data['message'] = message;
      data['lastMsgId'] = lastMsgId;

      Log.d(tag: _tag, "onMessageReceived:${data.toString()}");
      SocketLog.instance?.add(RoomLogType.receive, SocketType.chat, data);

      /// 通知BoxShow 的通知独立出来，为了限制频率
      if (_cachedMessagesBoxShow.length == _maxCachedMessageCount) {
        _cachedMessagesBoxShow.removeAt(0);
      }
      _cachedMessagesBoxShow.add(data);
      if (needParseCacheBox) {
        _sendCachedMessagesBoxShow();
      }

      if (_cachedMessages.length == _maxCachedMessageCount) {
        _cachedMessages.removeAt(0);
      }
      _cachedMessages.add(data);
      if (needParseCache) {
        needParseCache = false;
        Future.delayed(const Duration(seconds: 1), () {
          _sendCachedMessages();
        });
      }
    };

    /// 过滤不需要的消息，不插入数据库
    /// 解决未读消息数显示bug
    PulseIMClient.onHandleNewMsg = (MessageContent msgContent, int fromUserId, int userId, int msgType) async {
      Log.d('onHandleNewMsg fromUserId==> $fromUserId, ===userId: $userId');
      return ChatUtil.isNotChatUid(fromUserId);
    };

    PulseIMClient.onMessageSend = (int messageId, String status, int code, {String? errorMsg, int? sentTrigger}) {
      if (code == 0) {
        //发送成功
        Log.d(tag: _tag, "onMessageSend succeed");
        eventCenter.emit(EventMessageSent, {
          'messageId': messageId,
          'left': 0,
          'status': status,
          'sentTrigger': sentTrigger ?? SentTrigger.USER,
        });
        SocketLog.instance?.add(RoomLogType.send, SocketType.chat,
            {'code': code, 'messageId': messageId, 'left': 0, 'status': status, 'sentTrigger': sentTrigger ?? SentTrigger.USER});
      } else {
        Log.w(tag: _tag, "onMessageSend failed:$code");
        eventCenter.emit(EventMessageSendFail, {
          'messageId': messageId,
          'errCode': code,
          'errMessage': ErrorMap.containsKey(code) ? ErrorMap[code] : (errorMsg ?? ""),
        });
        SocketLog.instance?.add(RoomLogType.send, SocketType.chat, {
          'messageId': messageId,
          'errCode': code,
          'errMessage': ErrorMap.containsKey(code) ? ErrorMap[code] : errorMsg ?? "",
        });
      }
    };

    PulseIMClient.onReceiveReadReceipt = (String conversationType, String targetId, int timestamp) {
      Log.d(tag: _tag, "onReceiveReadReceipt,conversationType:$conversationType,targetId:$targetId,timeStamp:$timestamp");
      eventCenter.emit(EventReadReceiptReceived, {
        'conversationType': conversationType,
        'targetId': targetId,
        'messageTime': timestamp,
      });
    };
    PulseIMClient.onRecallMessageReceived = (MessageContent msgContent) {
      Log.d(tag: _tag, "onRecallMessageReceived ,${msgContent.toJson()}");
      eventCenter.emit(EventMessageRecall, {
        'messageId': msgContent.messageId,
        'targetId': msgContent.targetId,
      });
    };
    PulseIMClient.onTypingStatusChanged = (String conversationType, String targetId) {
      Log.d(tag: _tag, "onTypingStatusChanged ,conversationType:$conversationType,targetId:$targetId");
    };

    PulseIMClient.onEventReceived.listen((dynamic object) async {
      Map data = object;
      if (!data.containsKey('type') || !data.containsKey('message')) return;
      Log.d(tag: _tag, "onEventReceived ,${data.toString()}");
      String type = Util.notNullStr(data['type']);
      switch (type) {
        case 'onRecordDurationChanged':
          eventCenter.emit(EventRecordDurationChanged, data['message']);
          break;
      }
    });

    PulseIMClient.onKickOut = (int reason) {
      //Session.logout();
      //eventCenter.emit(EventConstant.EventNeedLogin);
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.imKickOut, {'reason': '$reason'}));
    };
    PulseIMClient.onLoginError = (int code, String msg) {
      Log.e(tag: _tag, "onLoginError code = $code, msg = $msg");
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.imLoginError, {'code': '$code', 'msg': msg}));
      JsTimer.setTimeout(login, 5000);
    };

    PulseIMClient.onNotification = (String payload) {
      try {
        var json = jsonDecode(payload);
        if (json is Map<String, dynamic> && json.isNotEmpty) {
          NotificationPayload notificationPayload = NotificationPayload.fromJson(json);
          Log.d(tag: _tag, 'onNotification, action = ${notificationPayload.action}');
          PushUtils.presentLocationNotification(
              id: 0, title: notificationPayload.title, body: notificationPayload.body, payload: notificationPayload.action);
          Tracker.instance.track(TrackEvent.push_online, properties: {
            'push_channel': Platform.operatingSystem,
            'push_type': notificationPayload.pushType,
            'content_id': Util.parseInt(notificationPayload.contentId),
            'push_type_id': notificationPayload.pushTypeId,
          });
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    };

    // 客户端、服务端都不入库的消息，适用于触发实时事件
    PulseIMClient.onOnlineMsg = (String payload) {
      try {
        Map json = jsonDecode(payload);

        dynamic data;
        try {
          data = jsonDecode(json["data"]);
        } catch (e, s) {
          data = json["data"];

          Log.e(e, stackTrace: s);
        }
        eventCenter.emit(EventConstant.WebsocketEventMessage, {"name": json["name"], "data": data});
        SocketLog.instance?.add(RoomLogType.receive, SocketType.im, {"name": json["name"], "data": data});
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    };

    /// 注意：上层处理掉了，不需要底层处理就返回true。底层只会处理一些礼物，红包消息。
    PulseIMClient.onCmdMessageReceived = (MessageContent msg) {
      String? name = msg.name;
      if (!Util.isStringEmpty(name) && MessageName.MSG_NAMES.contains(name)) {
        return false;
      }

      dynamic data;
      try {
        data = json.decode(msg.data ?? '');
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }

      Log.d(tag: _tag, "onCmdMessageReceived, data = $data");

      eventCenter.emit(EventCmd, {
        'name': name,
        'data': data,
        'left': 0,
        'message': msg.toJsonMap(),
      });
      return true;
    };

    /// 多终端同步时，更新未读数
    PulseIMClient.onNotifyUnreadCount = ({String? conversationType, String? targetId, int unreadCount = 0}) {
      eventCenter.emit(EventUnreadChanged, {'type': conversationType, 'targetId': targetId, 'unreadCount': unreadCount, 'left': 0});
    };

    /// 防诈：GS或者VIP5级（及5级以下）用户，显示逻辑交给UI层控制
    /// Util.listenImFirstReceiveMsg() && (Session.joinBroker || Session.vipNew <= 5)
    PulseIMClient.onSwindleTipsMsg = (conversationType, targetId, {String? userId, String? name, icon}) {
      MessageContent? msgContent;
      if (ChatUtil.isPrivateNotSystemUser(conversationType, Util.parseInt(targetId))) {
        msgContent = createSwindleTipsMsg(K.notice, senderUserId: userId, senderUserName: name, senderUserIcon: icon);
      }
      return msgContent;
    };
  }

  static void _initConnectReport() {
    PulseIMClient.onTryConnect = (Map<String, dynamic> params) {
      /// 不会循环调用，所以不用做1分钟上报一次的限制
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.imTryConnect, params));
      // Log.d('ImCommonLogReport', 'params = $params');
    };

    PulseIMClient.onRealConnect = (String socketUrl, bool isNetworkConnected) {
      /// 没网情况下，1分钟报一次
      if (!_shouldImReport(isNetworkConnected, false)) {
        // Log.d('ImCommonLogReport', 'onRealConnect not report');
        return;
      }
      _lastReportImConnectTime = DateTime.now().millisecondsSinceEpoch;
      PulseLog.instance
          .log(SocketBody(SocketScene.im, SocketAction.imRealConnect, {'socketUrl': socketUrl, 'isNetworkConnected': isNetworkConnected}));
      // Log.d('ImCommonLogReport', 'socketUrl = $socketUrl, isNetworkConnected = $isNetworkConnected');
    };

    PulseIMClient.onConnectError = (dynamic error, bool isNetworkConnected, StackTrace? stackTrace) {
      /// 没网情况下，1分钟报一次
      if (!_shouldImReport(isNetworkConnected, true)) {
        // Log.d('ImCommonLogReport', 'onConnectError not report');
        return;
      }
      _lastReportImConnectErrorTime = DateTime.now().millisecondsSinceEpoch;
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.connectError, {
        'error': error.toString(),
        'isNetworkConnected': isNetworkConnected,
        'stackTrace': stackTrace != null ? stackTrace.toString() : ''
      }));
      // Log.d('ImCommonLogReport', 'error = $error, isNetworkConnected = $isNetworkConnected');
    };

    PulseIMClient.onConnectSucc = () {
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.connectSucc, {}));
    };

    PulseIMClient.onConnectOnDone = () {
      PulseLog.instance.log(SocketBody(SocketScene.im, SocketAction.onDone, {}));
    };
  }

  static bool _shouldImReport(bool isNetworkConnected, bool error) {
    if (isNetworkConnected == false) {
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now - (error ? _lastReportImConnectErrorTime : _lastReportImConnectTime) < 60 * 1000) {
        return false;
      }
    }
    return true;
  }

  //ios int
  //android string
  static Future<dynamic> getCurrentConnectionStatus() async {
    return await PulseIMWrapper.getCurrentConnectionStatus();
  }

  static Future<void> getSmallAccountList() async {
    if (!Session.isLogined) return;
    ResSmallAccountListUid res;
    String url = "${System.domain}go/yy/small/listUids";
    try {
      String dtoken = Session.getString('dtoken', '');
      XhrResponse response = await Xhr.postPb(url, {'dtoken': dtoken});
      res = ResSmallAccountListUid.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResSmallAccountListUid(success: false, msg: e.toString());
    }
    if (res.success) {
      await PulseIMClient.databaseManager_update(res.list.map((e) => e.uid.toString()).toList());
      PulseIMClient.databaseManager_updateInfo(res.list.map((e) => {'uid': e.uid.toString(), 'name': e.name, 'icon': e.icon}).toList());
    }
  }

  static void _onLoadSmallAccount() async {
    if (BaseConfig.instance.smallAccount) {
      String url = "${System.domain}go/yy/small/tipsSwitchState";
      try {
        XhrResponse response = await Xhr.postPb(url, {});
        ResTipsSwitchState res = ResTipsSwitchState.fromBuffer(response.bodyBytes);
        if (res.success) {
          Config.set('small_account_notify_switch_${Session.uid}', res.allowTips.toString());
        } else {
          Config.set('small_account_notify_switch_${Session.uid}', '1'); // 默认为 打开
        }
      } catch (e) {
        Config.set('small_account_notify_switch_${Session.uid}', '1'); // 默认为 打开
      }
    }
  }

  static Future<bool> login() async {
    if (!Session.isLogined) return false;
    ImToken? imToken = await ImTokenRepo.getImToken();
    if (imToken != null) {
      Log.d(tag: _tag, "login,imToken = ${imToken.toString()}");
      try {
        bool usePulseIm = imToken.pulseIM == ImToken.USE_PULSE_IM;
        if (usePulseIm) {
          await PushChannel.initOfflinePush();
          initForCommonIm(imToken);
          eventCenter.emit(Im.EventConnSuccess);
          return true;
        }
      } catch (e, s) {
        //过期
        //Config.delete(ImToken);
        Log.e(e, stackTrace: s);
      }
    }

    JsTimer.setTimeout(login, 1000);
    return false;
  }

  static Future<List<Conversation>> getConversationListByPage([int count = 0, int startTime = 0]) async {
    return await PulseIMWrapper.getConversationListByPage(count, startTime);
  }

  static Future<List<Conversation>> getConversationList() async {
    return await PulseIMWrapper.getConversationList();
  }

  static Future<Conversation?> getConversation(String type, String targetId) async {
    return await PulseIMWrapper.getConversation(type, targetId);
  }

  static Future<Conversation?> getConversationByMessageId(int messageId) async {
    return await PulseIMClient.getConversationByMessageId(messageId);
  }

  static Future<bool> getTargetIsTop(String type, String targetId) async {
    Conversation? cov = await getConversation(type, targetId);
    return cov?.isTop ?? false;
  }

  static Future<List<MessageContent>> getHistoryMessages(String type, String targetId,
      [int oldestMessageId = 0, int count = 20, String? direction]) async {
    return await PulseIMWrapper.getHistoryMessages(type, targetId, oldestMessageId, count, direction);
  }

  static Future<int> getTotalUnreadCount() {
    return PulseIMWrapper.getTotalUnreadCount();
  }

  static Future<int> getTotalUnreadCountBySmallAccount(String userId) async {
    return await PulseIMWrapper.getTotalUnreadCountBySmallAccount(userId);
  }

  static Future<List<UserItem>> getMsgIconListBySmallAccount(String userId, {int limit = 3}) async {
    List<Conversation> records = await PulseIMWrapper.getMsgIconListBySmallAccount(userId, limit: limit);
    return records
        .map((e) => UserItem(
              uid: Util.parseInt(e.lastMessage?.user?.id),
              name: e.lastMessage?.user?.name,
              icon: e.lastMessage?.user?.portraitUri,
            ))
        .toList();
  }

  static Future<bool> clearMessagesUnreadStatus(String type, String targetId) async {
    bool ok = await PulseIMWrapper.clearMessagesUnreadStatus(type, targetId);
    if (ok) {
      eventCenter.emit(EventUnreadChanged, {'type': type, 'targetId': targetId, 'unreadCount': 0, 'left': 0});
    }
    return ok;
  }

  static Future<bool> clearMessagesAtStatus(String type, String targetId) async {
    if (type != ConversationType.Group) {
      return false;
    }

    bool ok = await PulseIMWrapper.clearMessagesAtStatus(type, targetId);
    if (ok) {
      eventCenter.emit(
        EventClearAtStatus,
        {
          'type': type,
          'targetId': targetId,
          'left': 0,
        },
      );
    }
    return ok;
  }

  static Future<bool> removeConversation(String type, String targetId, {bool notify = false}) async {
    await clearMessagesUnreadStatus(type, targetId);
    bool re = await PulseIMWrapper.removeConversation(type, targetId);
    if (re == true && notify == true) {
      eventCenter.emit(Im.EventRemoveConversation, {
        'type': type,
        'targetId': targetId,
      });
    }
    return re;
  }

  /// type: 私聊：private，群聊: group
  /// supportVersion == 0 表示支持所有版本即最低的版本都支持
  static Future<int> sendMessage(String type, String targetId, MessageContent content,
      {String pushContent = "",
      // 普通消息，加离线PUSH跳转和上报参数
      String pushData = "page=home&tab=message&push_type_id=100001&content_id=1&push_type=message",
      bool isEmoji = false,
      int supportVersion = 0}) async {
    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': isEmoji ? 'sticker' : 'text',
      'refer': refer,
      'scene': getChatScene(Util.parseInt(targetId), type),
      if (toDate) 'to_date': true,
    });
    _tryExtraReport(targetId);
    appendExtraData(content, supportVersion: supportVersion);

    /// 判断是否为新插入的绘画
    Conversation? conv = await Im.getConversation(type, targetId);
    Map res = await PulseIMWrapper.sendMessage(type, targetId, content, pushContent, pushData);
    eventCenter.emit(Im.EventMessageSentComplete, {'type': type, 'targetId': targetId, 'insert': (conv == null)});
    return Util.parseInt(res['messageId']);
  }

  static Future<int> sendReadReceiptMessage(
    String type,
    String targetId,
    int timestamp,
  ) async {
    int res = await PulseIMWrapper.sendReadReceiptMessage(type, targetId, timestamp);
    return res;
  }

  static Future<MessageContent?> insertMessage(String type, String targetId, MessageContent content) async {
    try {
      Map res = await PulseIMWrapper.insertMessage(type, targetId, content);
      int messageId = Util.parseInt(res['messageId']);
      return await getMessage(messageId);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return null;
    }
  }

  static Future<int> sendVoiceMessage(String type, String targetId, MessageContent content, String audioData, int duration, String uri,
      // 普通消息，加离线PUSH跳转和上报参数
      [String pushContent = "",
      String pushData = "page=home&tab=message&push_type_id=100001&content_id=1&push_type=message"]) async {
    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }
    Log.d("sendVoiceMessage and audioData = $uri");

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': 'voice',
      'refer': refer,
      'scene': getChatScene(Util.parseInt(targetId), type),
      if (toDate) 'to_date': true,
    });
    _tryExtraReport(targetId);
    appendExtraData(content);
    Map res = await PulseIMWrapper.sendVoiceMessage(
      type,
      targetId,
      content,
      audioData,
      duration,
      uri,
      pushContent,
      pushData,
    );
    return Util.parseInt(res['messageId']);
  }

  static Future<int> sendImageMessage(String type, String targetId, MessageContent content, File? image,
      // 普通消息，加离线PUSH跳转和上报参数
      [bool isShinegif = false,
      String pushContent = "",
      String pushData = "page=home&tab=message&push_type_id=100001&content_id=1&push_type=message"]) async {
    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': isShinegif ? 'shinegif' : 'pic',
      'refer': refer,
      'scene': getChatScene(Util.parseInt(targetId), type),
      if (toDate) 'to_date': true,
    });
    _tryExtraReport(targetId);
    appendExtraData(content);
    Map res = await PulseIMWrapper.sendImageMessage(type, targetId, content, image, pushContent, pushData);
    int messageId = Util.parseInt(res['messageId']);
    eventCenter.emit(EventSendImageAdded, messageId);
    return messageId;
  }

  static Future<String?> sendTruewordMessage(String type, String targetId, String truewordType) async {
    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': 'true_word',
      'refer': refer,
      if (toDate) 'to_date': true,
    });
    String url = '${System.domain}question/get';
    XhrResponse response = await Xhr.postJson(url, {'targetId': targetId, 'conversationType': type, 'type': truewordType});
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        var data = res['data'];
        if (data is Map) {
          MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
          content.content = Util.notNullStr(data['content']);
          content.extra = json.encode(data);
          try {
            await Im.sendMessage(type, targetId, content, pushContent: K.base_truth_word);
          } catch (e, s) {
            Log.e(e, stackTrace: s);
            return e.toString();
          }

          return null;
        }
      } else {
        return Util.parseStr(res['msg']);
      }
    } else {
      return response.error.toString();
    }
    return K.adversary_hasnt_answer;
  }

  //开放式真心话
  static Future<String?> sendTruewordOpenMessage(String type, String targetId, String truewordType) async {
    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': 'true_word_open',
      'refer': refer,
      if (toDate) 'to_date': true,
    });
    String url = '${System.domain}question/openquestion';
    XhrResponse response = await Xhr.postJson(url, {});
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        var data = res['data'];
        if (data is Map) {
          MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
          content.content = Util.notNullStr(data['content']);
          Map m = {};
          m['type'] = truewordType;
          content.extra = json.encode(m);
          try {
            await Im.sendMessage(type, targetId, content, pushContent: K.base_truth_word);
          } catch (e, s) {
            Log.e(e, stackTrace: s);
            return e.toString();
          }

          return null;
        }
      } else {
        return Util.parseStr(res['msg']);
      }
    } else {
      return response.error.toString();
    }
    return K.adversary_hasnt_answer;
  }

  static Future<bool> sendGameMessage(String toUid, String gameId, [String rid = '']) async {
    if (toUid.isEmpty || gameId.isEmpty) return false;

    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(toUid)) {
      toDate = true;
      orderSayHiUids.remove(toUid);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(toUid),
      'message_type': 'game',
      'refer': refer,
      if (toDate) 'to_date': true,
    });

    try {
      XhrResponse response =
          await Xhr.postJson("${System.domain}game/invite", {'targetId': toUid, 'gameId': gameId, 'rid': rid}, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        var extra = res['extra'];
        if (extra != null) {
          MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
          String inviteText = K.invite_game_together;
          content.content = inviteText;
          content.extra = json.encode(extra);
          String pushContent = Session.name + inviteText;
          int messageId = await Im.sendMessage(ConversationType.Private, toUid, content, pushContent: pushContent);
          return messageId > 0;
        }
      }
    } catch (e) {
      Log.d("sendGameMessage...$e");
    }

    return false;
  }

  static Future<bool> _checkVerify() async {
    permissionHandler.PermissionStatus microphonePermission =
        await PermissionUtil.checkAndRequestPermissions(Constant.context, permissionHandler.Permission.microphone);

    if (microphonePermission != permissionHandler.PermissionStatus.granted) {
      return false;
    }

    bool verifyAuth = false;

    try {
      ResCloudProfile profile = await BaseRequestManager.cloudProfile(Session.uid.toString(), type: 'private');

      if (profile.success && profile.hasData()) {
        int needVerify = profile.data.needVerify;
        int needVerifyNew = profile.data.needVerifyNew;

        if (Utility.isNeedVerify(needVerify, needVerifyNew)) {
          ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
          bool suc = await loginManager.openAuthDialog(System.context, type: needVerify, newType: needVerifyNew, refer: 'PhoneScreen');

          verifyAuth = suc;
        } else {
          verifyAuth = true;
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }

    return verifyAuth;
  }

  static Future<dynamic> sendVideoMessage(
    String type,
    String targetId,
    bool isVideo,
  ) async {
    //检查发送者权限
    bool auth = await _checkVerify();

    if (!auth) {
      return false;
    }

    IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

    if (manager.chatRoomDataExists()) {
      Fluttertoast.showToast(msg: K.base_inroom_cannot_call, gravity: ToastGravity.CENTER);
      return false;
    }

    bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
    if (orderSayHiUids.containsKey(targetId)) {
      toDate = true;
      orderSayHiUids.remove(targetId);
    }

    Tracker.instance.track(TrackEvent.chat, properties: {
      'target_uid': Util.parseInt(targetId),
      'message_type': 'video',
      'refer': refer,
      if (toDate) 'to_date': true,
    });
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}agora/channel/?version=1", {'type': type, 'targetId': targetId, 'conn': isVideo ? 'video' : 'phone'},
          throwOnError: true);
      Map res = response.value();
      String text = isVideo ? K.base_video_call : K.base_audio_call;
      MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = text;
      content.extra = json.encode(res['extra']);

      String pushContent = "${res['name']}${K.asking_with_you}[$text]";
      int messageId = await Im.sendMessage(type, targetId, content, pushContent: pushContent);

      return {
        'token': res['data']['token'],
        'channelName': res['data']['channelName'],
        'messageId': messageId,
      };
    } catch (e) {
      return e.toString();
    }
  }

  static void _tryExtraReport(String targetId) {
    /// 嗨歌，聊天匹配
    if (Im.firstSend && Im.refer == FollowChannel.HI_CHAT_MATCH) {
      Tracker.instance.track(TrackEvent.mystery_match_hi, properties: {'to_uid': Util.parseInt(targetId)});
    }
  }

  static Future<MessageContent?> getMessage(int messageId, {String? userId}) async {
    Map res = await PulseIMWrapper.getMessage(messageId, userId: userId);
    return res is Map<String, dynamic> ? MessageContent.fromJson(res) : null;
  }

  static Future<MessageContent?> recallMessage(int messageId) async {
    Map res = await PulseIMWrapper.recallMessage(messageId);
    return res is Map<String, dynamic> ? MessageContent.fromJson(res) : null;
  }

  static Future<bool> deleteMessages(List<int> messageIds) {
    return PulseIMWrapper.deleteMessages(messageIds);
  }

  static Future<bool> setConversationToTop(String type, String targetId, bool isTop) async {
    return PulseIMWrapper.setConversationToTop(type, targetId, isTop);
  }

  static Future<bool> setConversationNotificationStatus(String type, String targetId, bool isBlock) async {
    return await PulseIMWrapper.setConversationNotificationStatus(type, targetId, isBlock);
  }

  static Future<bool> getConversationNotificationStatus(String type, String targetId, {bool syncFromServer = false}) async {
    final String r = await PulseIMWrapper.getConversationNotificationStatus(type, targetId, syncFromServer: syncFromServer);

    /// 针对群消息，是否通知：1:通知 2:不通知
    return r == '1';
  }

  ///设置的MessageContent.inlineExtra字段
  static Future<bool> setMessageExtra(int messageId, String extra) async {
    return await PulseIMWrapper.setMessageExtra(messageId, extra);
  }

  ///设置的MessageContent.extra字段
  static Future<bool> setMessageExtraNew(int messageId, String extra) async {
    return await PulseIMWrapper.setMessageExtraNew(messageId, extra);
  }

  static void appendExtraData(MessageContent content, {int supportVersion = 0}) {
    Map extra = {};
    if (!Util.isStringEmpty(content.extra)) {
      try {
        extra = json.decode(content.extra!);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }
    extra["channel"] = Im.refer;
    extra["first_sent"] = Im.firstSend;
    if (supportVersion > 0) {
      extra['supt_version'] = supportVersion;
    }
    Im.firstSend = false;
    content.extra = json.encode(extra);
  }

  static void _sendCachedMessages() async {
    /// 每次消费从消息缓存中拿所有；然后开始消费
    List<Map> cachedParseMessages = List.from(_cachedMessages);
    _cachedMessages.clear();

    Log.d('Im._sendMessage _cachedParseMessages.length = ${cachedParseMessages.length}');
    int startTime = DateTime.now().millisecondsSinceEpoch; // 开始解析的时间
    while (cachedParseMessages.isNotEmpty) {
      Map data = cachedParseMessages.removeAt(0);

      /// 本次消费的最后一条消息，带上刷新UI参数
      bool last = cachedParseMessages.isEmpty;
      data['message']['last'] = last;
      eventCenter.emit(EventMessageContentChanged, data['message']);
      if (last) {
        /// 本次消费的最后一条消息，同时更新一下未读数（总）
        eventCenter.emit(EventUnreadChanged, {'left': 0});
      }
      _parseMessageSpecial(data['message']['message'], data['message']['left']);
    }
    int interval = DateTime.now().millisecondsSinceEpoch - startTime; // 解析所用时间
    if (_cachedMessages.isNotEmpty) {
      int delayDuration = max(0, 1000 - interval); // 补齐1S时间，进行消费
      Future.delayed(Duration(milliseconds: delayDuration), () {
        _sendCachedMessages();
      });
    } else {
      needParseCache = true;
    }
  }

  /// 对 通知IM 进行 限制频率
  static void _sendCachedMessagesBoxShow() async {
    needParseCacheBox = false;

    /// 每1s 取一次消息，仅将最后一条消息 发出通知
    while (_cachedMessagesBoxShow.isNotEmpty) {
      Log.d('Im._sendMessage _cachedMessagesBoxShow.length = ${_cachedMessagesBoxShow.length}');
      Map data = _cachedMessagesBoxShow.removeLast();
      Map message = data['message']['message'];
      int left = data['message']['left'];
      String userInfo = Util.notNullStr(data['userInfo']);
      Map<String, dynamic> userInfoMap = json.decode(userInfo);
      int lastMsgId = Util.parseInt(data['lastMsgId']);
      int curMsgId = Util.parseInt(message['messageUId']);
      if (userInfoMap['uid'] == Session.uid.toString()) {
        ///只有当前消息的时间 大于 最新同步消息时间lastMsgId，才展示消息弹窗，否则认为已经在别的设备展示过了，不再弹窗
        ///lastMsgId即是消息id，也是时间戳
        if (curMsgId > lastMsgId) {
          eventCenter.emit(EventMessageReceivedBoxShow, {
            'messageId': message['messageId'],
            'left': left,
            'message': message,
          });
        }
      } else {
        int msgCount = await getTotalUnreadCountBySmallAccount(userInfoMap['uid']);
        eventCenter.emit(EventMessageReceivedBoxShowBySmallAccount, {
          'messageId': message['messageId'],
          'left': left,
          'message': message,
          'userInfo': userInfo,
          'msgCount': msgCount,
        });
      }
      _cachedMessagesBoxShow.clear();
      await Future.delayed(const Duration(milliseconds: 1000));
    }
    needParseCacheBox = true;
  }

  static void addOrderSayhi(String uid) {
    orderSayHiUids[uid] = uid;
  }

  static MessageContent createErrorMsg(String errorInfo) {
    SendUser user = SendUser(Session.uid.toString(), Session.name, Session.icon);
    MessageContent errorMsg = MessageContent(MessageType.Info, user);
    errorMsg.content = errorInfo;
    errorMsg.messageDirection = MessageDirection.Send;
    errorMsg.objectName = MessageType.toObjectName(MessageType.Text);
    errorMsg.sentTime = DateTime.now().millisecondsSinceEpoch;
    errorMsg.sentStatus = MessageStatus.Failed;
    return errorMsg;
  }

  static MessageContent createSendGiftTipsMsg(String content, int giftId) {
    MessageContent giftTipsMsg = localInfoMsg(content);
    giftTipsMsg.extra = json.encode({"type": "gift_tips", "gift_id": giftId});
    return giftTipsMsg;
  }

  /// 反诈骗提醒
  static MessageContent createSwindleTipsMsg(String content, {String? senderUserId, String? senderUserName, String? senderUserIcon}) {
    MessageContent msg = localInfoMsg(content, senderUserId: senderUserId, senderUserName: senderUserName, senderUserIcon: senderUserIcon);
    msg.extra = json.encode({"type": "swindle_tips"});
    msg.messageDirection = MessageDirection.Receive;
    return msg;
  }

  static MessageContent localInfoMsg(String content, {String? senderUserId, String? senderUserName, String? senderUserIcon}) {
    String uid = senderUserId ?? Session.uid.toString();
    String name = senderUserName ?? Session.name;
    String icon = senderUserIcon ?? Session.icon;
    SendUser user = SendUser(uid, name, icon);
    MessageContent localMsg = MessageContent(MessageType.Info, user);
    localMsg.content = content;
    localMsg.messageDirection = MessageDirection.Send;
    localMsg.objectName = MessageType.toObjectName(MessageType.Info);
    localMsg.sentTime = DateTime.now().millisecondsSinceEpoch;
    localMsg.sentStatus = MessageStatus.Read;
    return localMsg;
  }

  static void _onAppStateChanged() {
    if (!_isInit) return;
    AppLifecycleState state = appStateObserver.value;
    bool resumed = state == AppLifecycleState.resumed;

    if (_isResumed != resumed) {
      _isResumed = resumed;
      if (resumed) {
        PulseIMClient.reconnectIfNeed();
      }
    }
  }

  static String getChatScene(int targetId, String conversationType) {
    if (conversationType == ConversationType.Private) {
      return 'private'; // 私聊
    } else if (ChatUtil.isGroupId(targetId)) {
      if (isNewGroup) {
        return 'exclusive_group'; // 专属权，群主创建的
      } else {
        return 'temporary_group'; // 临时群
      }
    } else {
      return 'private'; // 私聊
    }
  }
}
