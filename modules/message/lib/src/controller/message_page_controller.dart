import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:shared/src/pbModel/generated/api_relation.pbenum.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:message/message.dart';
import 'package:message/src/controller/classified_conversation_mixin.dart';
import 'package:message/src/controller/conversation_extra_info.dart';
import 'package:message/src/controller/conversation_user_info_mixin.dart';
import 'package:message/src/controller/familiar_data_mixin.dart';
import 'package:message/src/hilist/private_chat_hi_list.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pulse_log/pulse_log.dart';

const MAX_SORT_PRIORITY = 10000000;

class MessagePageController extends GetxController
    with
        WidgetsBindingObserver,
        ConversationExtraInfo,
        ClassifiedConversationMixin,
        FamiliarDataMixin,
        ConversationUserInfoMixin {
  final Set<_UnreadEvent> _cachedUnreadEvents = {};
  StreamSubscription<_UnreadEvent>? _unreadEventSubs;

  int _startTime = 0; //获取会话列表的初始时间,每次获取该时间之前的会话列表,0表示从最新的开始拉取
  final int _limit = 200; //每批次拉取的最大会话数量

  int _loadAllConvsSeqId = 0; //每次全量重新拉取的时候加1，用于终止上一批的拉取

  ///当前最新的消息时间点，断网中断后可以从最新的开始拉取，到此处结束
  bool isCurrentPage = false;

  bool _loading = true;

  int firstIndex = 0, lastIndex = 30;
  bool isCurrentBootTab = false;
  bool scrollIdle = true;

  StreamSubscription? _connSubs;

  bool _isClosed = false;

  Map userTagMap = {};

  @override
  void onInit() {
    super.onInit();
    _isClosed = false;
    initExtra();
  }

  @override
  void onReady() {
    super.onReady();
    isCurrentBootTab = true;
    load().whenComplete(() {
      _loadExtraInfo(focus: true);
    });

    WidgetsBinding.instance.addObserver(this);

    eventCenter.addListeners([
      Im.EventUnreadChanged,
      Im.EventMessageContentChanged,
      Im.EventMessageSent,
      Im.EventClearAtStatus,
      Im.EventMessageSentComplete,
      Im.EventConnSuccess,
      Im.EventRemoveConversation,
      EventConstant.EventLogin,
      EventConstant.EventLogout,
      'user_chat_screen.popped'
    ], _onImEvent);

    _initConnectionChangeListener();
  }

  @override
  void onClose() {
    clearData();
    disposeExtra();
    WidgetsBinding.instance.removeObserver(this);
    _connSubs?.cancel();
    _unreadEventSubs?.cancel();
    delayTimer?.cancel();
    eventCenter.removeListeners([
      Im.EventUnreadChanged,
      Im.EventMessageContentChanged,
      Im.EventMessageSent,
      Im.EventClearAtStatus,
      Im.EventMessageSentComplete,
      Im.EventConnSuccess,
      Im.EventRemoveConversation,
      EventConstant.EventLogin,
      EventConstant.EventLogout,
      'user_chat_screen.popped'
    ], _onImEvent);
    _isClosed = true;
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _handleCachedUnReadEvents();
    } else {
      _unreadEventSubs?.cancel();
    }
  }

  void _initConnectionChangeListener() {
    _connSubs = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      Log.d("MessagePageScreen onConnectivityChanged $connectivityResult");
      if (connectivityResult != ConnectivityResult.none) {
        load(clear: false);
      }
    });
  }

  Future<void> load(
      {bool clear = true,
      bool loadAll = false,
      bool refreshExtra = false}) async {
    Log.d(
        'In MessagePageController.load, clear: $clear, loadAll: $loadAll, refreshExtra: $refreshExtra, loading: $_loading');

    PulseLog.instance.console('MessagePageController load', tag: 'msgLoading');
    if (clear) {
      _loading = true;
      clearData();
    }
    await familiarReady;
    PulseLog.instance.console('MessagePageController load, familiarReady',
        tag: 'msgLoading');
    await _getAllConversations(loadAll: loadAll);
    PulseLog.instance.console(
        'MessagePageController load, _getAllConversations end',
        tag: 'msgLoading');
    if (refreshExtra) {
      reloadFamiliar();
    }
  }

  Future<void> _getAllConversations({bool loadAll = false}) async {
    _loadAllConvsSeqId += 1;
    int currentSeqId = _loadAllConvsSeqId;

    if (loadAll) _startTime = 0;
    while (true && !_isClosed) {
      Log.d("_getAllConversations limit=$_limit, startTime=$_startTime");
      PulseLog.instance.console(
          'MessagePageController _getAllConversations, startTime: $_startTime',
          tag: 'msgLoading');
      List<Conversation>? convs =
          await Im.getConversationListByPage(_limit, _startTime);
      Log.d("convs=$convs");
      if (currentSeqId != _loadAllConvsSeqId) {
        break;
      }

      await _batchRefreshConversations(convs);

      Log.d(
          "_getAllConversations limit=$_limit, startTime=$_startTime, length: ${convs.length}");
      PulseLog.instance.console(
          'MessagePageController _getAllConversations, startTime: $_startTime, length: ${convs.length}',
          tag: 'msgLoading');

      /// (convs == null || convs.length < _limit)  => 长度不够200说明全部拉完，跳出循环
      /// startTime==0 => 说明剩下的会话消息sentTime都是0，故而加入此判断以解决老版本死循环问题。ps: 此前BBIM删除消息(修改sentTime=0)所致，
      if (convs.length < _limit || _startTime == 0) {
        break;
      }
    }

    _notifyMessageListChanged();
  }

  Future<void> _batchRefreshConversations(List<Conversation> convs,
      {bool refresh = true}) async {
    await addAndClassifyConversations(convs);

    /// 取到第一页会话数据就展示出来
    _loading = false;
    if (refresh) refreshUI();
  }

  /// 获取对应数据的用户或者群组的状态信息
  Future<void> _loadExtraInfo(
      {bool useCache = true, Set<int>? targetIds, bool focus = false}) async {
    bool canLoad = !(firstIndex == -1 ||
        lastIndex == -1 ||
        !_onTop() ||
        !isCurrentPage ||
        (normalData.isEmpty ?? true));
    if (focus) {
      canLoad = true;
    }
    if (!canLoad) return;

    firstIndex = max(0, firstIndex);
    lastIndex = min(normalData.length - 1, lastIndex);

    bool targetIdsVisible = false;
    Set<int> uids = {};
    Set<int> gids = {};
    for (int i = firstIndex; i <= lastIndex; i++) {
      Conversation conv = normalData[normalData.keys.elementAt(i)]!;
      if (conv.type == ConversationType.Private) {
        uids.add(Util.parseInt(conv.targetId));
      } else if (conv.type == ConversationType.Group) {
        gids.add(Util.parseInt(conv.targetId));
      }
      if (targetIds?.contains(Util.parseInt(conv.targetId)) ?? false) {
        targetIdsVisible = true;
      }
    }

    // familiar刷新导致的loadExtraInfo，如果对应的会话不可见，则不加载online数据
    if ((targetIds?.isNotEmpty ?? false) && !targetIdsVisible) {
      return;
    }
    await scheduleLoadUserInfo(uids, gids, useCache: useCache);
  }

  clearData() {
    _startTime = 0;
    clearFamiliar();
    clearUserData();
    clearClassifyData();
    userTagMap.clear();

    if (!_isClosed) {
      refreshUI();
    }
  }

  void refreshUI() {
    update(null, Session.isLogined);
  }

  void _notifyMessageListChanged() => eventCenter.emit('MessageList.Changed');

  bool _onTop() {
    if (!Util.isAppActive) {
      //应用在后台时
      return false;
    }
    ModalRoute? modalRoute = ModalRoute.of(System.context);
    if (modalRoute != null &&
        !modalRoute.isCurrent &&
        appNavigatorObserver.getLast() != HiList.routeName &&
        appNavigatorObserver.getLast() != PrivateChatHiList.routeName) {
      //页面不在最前时,或者当前不是打招呼列表页时（打招呼页部分操作会刷新Conversation）
      return false;
    }
    if (!isCurrentBootTab) {
      //首页tab选中的不是当前页面时
      return false;
    }
    return true;
  }

  void _onImEvent(String eventType, Object? data) async {
    Log.d(tag: "IMMessage", '_onImEvent type=$eventType, data=$data');
    if (!Util.isAppActive) {
      //应用在后台时
      _cachedUnreadEvents.add(_UnreadEvent(eventType, data));
      return;
    }

    if (eventType == Im.EventMessageContentChanged) {
      Map? res = data as Map?;
      if (res?.containsKey('message') == true) {
        //消息体
        String type = res!['message']['conversationType'];
        String targetId = res['message']['targetId'];
        bool last = res['last'];
        await onConversationOperate(
            ConversationOperateType.ContentChange, type, targetId,
            refresh: last);
      }
    } else if (eventType == Im.EventMessageSent) {
      load(clear: false, loadAll: true);
    } else if (eventType == Im.EventUnreadChanged) {
      Map res = data as Map;
      if (!Util.isStringEmpty(res['type']) &&
          !Util.isStringEmpty(res['targetId'])) {
        String type = res['type'];
        String targetId = res['targetId'];
        int unreadCount = res['unreadCount'];

        if (unreadCount < 0) {
          /// 重新加载当前会话信息
          await onConversationOperate(
              ConversationOperateType.ContentChange, type, targetId,
              refresh: true);
        } else {
          onConversationOperate(
              ConversationOperateType.ClearAllUnreadStatus, type, targetId);
        }
      }
    } else if (eventType == Im.EventClearAtStatus) {
      Map res = data as Map;
      String type = res['type'];
      String targetId = res['targetId'];

      onConversationOperate(
          ConversationOperateType.ClearAtStatus, type, targetId);
    } else if (eventType == Im.EventConnSuccess) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        load(clear: false, loadAll: true);
      });
    } else if (eventType == EventConstant.EventLogin) {
      Future.delayed(const Duration(milliseconds: 300), () {
        load().whenComplete(() {
          _loadExtraInfo(focus: true);
        });
      });
    } else if (eventType == 'user_chat_screen.popped' ||
        eventType == Im.EventMessageSentComplete) {
      Map res = data as Map;
      String type = Util.notNullStr(res['type']);
      String targetId = Util.notNullStr(res['targetId']);
      Conversation? conv = await Im.getConversation(type, targetId);
      if (conv != null) {
        await _batchRefreshConversations([conv]);
      }

      /// 判断当前会话是否为新插入
      bool insert = Util.parseBool(res['insert']);
      if (insert) {
        /// 新插入的会话，则刷新一次 cloud/imAll
        delayTimer?.cancel();
        delayTimer = Timer(const Duration(seconds: 1), () {
          _loadExtraInfo(focus: true);
        });
      }
    } else if (eventType == Im.EventRemoveConversation) {
      Map res = data as Map;
      String type = res['type'] ?? '';
      String targetId = res['targetId'] ?? '';
      onConversationOperate(ConversationOperateType.Delete, type, targetId);
    }
  }

  /// 刷新 cloud/imAll 的计时器
  Timer? delayTimer;

  /// 1.list的item触发(删除/置顶/取消置顶)过来的列表数据刷新，即会话的操作导致会话变更;  2.会话的消息变更(未读/内容变更)
  onConversationOperate(
      ConversationOperateType opType, String type, String targetId,
      {bool refresh = true}) async {
    String key = getKey(type, targetId);
    if (opType == ConversationOperateType.ContentChange) {
      //内容变更导致的刷新最频繁
      Conversation? conv = await Im.getConversation(type, targetId);
      if (conv != null) {
        await _batchRefreshConversations([conv], refresh: refresh);
      }
    } else if (opType == ConversationOperateType.Delete) {
      _removeConversationDataByKey(key);
      refreshUI();
    } else if (opType == ConversationOperateType.Top) {
      _onTopOperate(key, true);
      refreshUI();
    } else if (opType == ConversationOperateType.UnTop) {
      _onTopOperate(key, false);
      refreshUI();
    } else if (opType == ConversationOperateType.ClearAllUnreadStatus) {
      _onOperateClearAllUnread(key);
      refreshUI();
    } else if (opType == ConversationOperateType.ClearAtStatus) {
      _onOperateClearAllUnread(key, isAt: true);
      refreshUI();
    } else if (opType == ConversationOperateType.Mute) {
      _onMuteOperate(key);
      refreshUI();
    } else {}
    _notifyMessageListChanged();
  }

  void _onMuteOperate(String key) {
    if (normalData.containsKey(key)) {
      var conv = normalData[key];
      if (conv?.notify == 2) {
        conv?.notify = 1;
      } else {
        conv?.notify = 2;
      }
    }
  }

  void _onTopOperate(String key, bool top) {
    if (normalData.containsKey(key)) {
      var conv = normalData[key];
      conv?.isTop = top;
      normalData = sortBySentTime(normalData);
    } else if (hiData.containsKey(key)) {
      var conv = hiData[key];
      conv?.isTop = top;
      hiData = sortBySentTime(hiData);
    } else if (accostData.containsKey(key)) {
      var conv = accostData[key];
      conv?.isTop = top;
      accostData = sortBySentTime(accostData);
    } else if (fateData.containsKey(key)) {
      var conv = fateData[key];
      conv?.isTop = top;
      fateData = sortBySentTime(fateData);
    } else if (tempGroupData.containsKey(key)) {
      var conv = tempGroupData[key];
      conv?.isTop = top;
      tempGroupData = sortBySentTime(tempGroupData);
    }
  }

  void _onOperateClearAllUnread(String key, {bool isAt = false}) async {
    ConversationsChangeState state = ConversationsChangeState();
    Conversation? conv;
    if (normalData.containsKey(key)) {
      conv = normalData[key];
      state.dataState = ConversationsChangeState.update;
    } else if (hiData.containsKey(key)) {
      conv = hiData[key];
      state.hiState = ConversationsChangeState.update;
    } else if (accostData.containsKey(key)) {
      conv = accostData[key];
      state.accostState = ConversationsChangeState.update;
    } else if (fateData.containsKey(key)) {
      conv = fateData[key];
      state.fateState = ConversationsChangeState.update;
    } else if (tempGroupData.containsKey(key)) {
      conv = tempGroupData[key];
      state.tempState = ConversationsChangeState.update;
    }
    if (isAt == true) {
      conv?.atCount = 0;
    } else {
      conv?.unreadCount = 0;
    }
    updateSpecialConversations(state: state);
  }

  void _removeConversationDataByKey(String key) {
    Log.d("_removeConversationDataByKey $key");
    ConversationsChangeState state = ConversationsChangeState();
    state.dataState = normalData.remove(key) != null
        ? ConversationsChangeState.addAndUpdate
        : ConversationsChangeState.unChange;
    state.hiState = hiData.remove(key) != null
        ? ConversationsChangeState.addAndUpdate
        : ConversationsChangeState.unChange;
    state.accostState = accostData.remove(key) != null
        ? ConversationsChangeState.addAndUpdate
        : ConversationsChangeState.unChange;
    state.fateState = fateData.remove(key) != null
        ? ConversationsChangeState.addAndUpdate
        : ConversationsChangeState.unChange;
    state.tempState = tempGroupData.remove(key) != null
        ? ConversationsChangeState.addAndUpdate
        : ConversationsChangeState.unChange;
    updateSpecialConversations(state: state);
  }

  onMarkTempGroupListAllRead(String type) {
    tempGroupData.forEach((key, conv) {
      _onOperateClearAllUnread(key);
    });

    updateSpecialConversations(
        state: ConversationsChangeState()
          ..tempState = ConversationsChangeState.update);
    refreshUI();
    _notifyMessageListChanged();
  }

  onMarkHiListAllRead(String type) {
    hiData.forEach((key, conv) {
      _onOperateClearAllUnread(key);
    });

    updateSpecialConversations(
        state: ConversationsChangeState()
          ..hiState = ConversationsChangeState.update);
    refreshUI();
    _notifyMessageListChanged();
  }

  onMarkAccostListAllRead(String type) {
    accostData.forEach((key, conv) {
      _onOperateClearAllUnread(key);
    });

    updateSpecialConversations(
        state: ConversationsChangeState()
          ..accostState = ConversationsChangeState.update);
    refreshUI();
    _notifyMessageListChanged();
  }

  onMarkFateListAllRead(String type) {
    fateData.forEach((key, conv) {
      _onOperateClearAllUnread(key);
    });

    updateSpecialConversations(
        state: ConversationsChangeState()
          ..fateState = ConversationsChangeState.update);
    refreshUI();
    _notifyMessageListChanged();
  }

  Future<void> onRemoveHiList(String type) async {
    LinkedHashMap<String, Conversation>? data;
    if (type == ConversationType.Hi) {
      data = hiData;
    } else if (type == ConversationType.TempGroup) {
      data = tempGroupData;
    } else if (type == ConversationType.Accost) {
      data = accostData;
    } else if (type == ConversationTypeExt.Fate) {
      data = fateData;
    }
    if (data == null) return;
    data.forEach((key, value) {
      String type = value.type;
      String targetId = value.targetId;
      Im.removeConversation(type, targetId);
    });
    data.clear();
    _removeConversationDataByKey(getKey(type, '0'));
    refreshUI();
    _notifyMessageListChanged();
    return;
  }

  bool get loading => _loading;

  set loading(bool load) => _loading = load;

  void setScrollIdle(bool v) {
    scrollIdle = v;
    if (scrollIdle) _loadExtraInfo();
  }

  @override
  int get startTime => _startTime;

  @override
  set startTime(int value) {
    _startTime = value;
  }

  @override
  int get limit => _limit;

  @override
  String getKey(String type, String tId) {
    return '$type.$tId';
  }

  @override
  bool isOutConversation(Conversation conv) {
    int targetId = Util.parseInt(conv.targetId);
    return isOutId(targetId);
  }

  @override
  bool isInnerByGsConversation(Conversation conv) {
    int targetId = Util.parseInt(conv.targetId);
    return isInnerByGsId(targetId);
  }

  @override
  bool isInnerByFateConversation(Conversation conv) {
    int targetId = Util.parseInt(conv.targetId);
    return isInnerByFateId(targetId);
  }

  @override
  Future<bool> isNormalConversation(Conversation conv) async {
    int targetId = Util.parseInt(conv.targetId);
    return await isFamiliar(targetId) || ChatUtil.isSystemUser(targetId);
  }

  @override
  Future<bool> isTempGroupConversation(Conversation conv) {
    int targetId = Util.parseInt(conv.targetId);
    return isTempGroup(targetId);
  }

  @override
  void onFamiliarUpdate(FamiliarType type, Set<int> targetIds) async {
    await reclassifyConversations(
        type == FamiliarType.group
            ? ConversationType.Group
            : ConversationType.Private,
        targetIds);
    refreshUI();
    // 更新完familiar，拉取一次对应的用户信息
    _loadExtraInfo(targetIds: targetIds);
  }

  @override
  void onUserInfoUpdate(ImCloudAllData? cloudAllData) => refreshUI();

  @override
  LinkedHashMap<String, Conversation> sortBySentTime(
      LinkedHashMap<String, Conversation> map) {
    List<MapEntry<String, Conversation>> entries = map.entries.toList();
    entries.sort((a, b) {
      if (a.value.isTop == b.value.isTop) {
        return b.value.sentTime - a.value.sentTime;
      }
      return a.value.isTop ? -1 : 1;
    });

    /// 快乐星球APP、未建联的用户、客服（vip）、有未读信息 => 置顶显示
    if (Session.getKaStatus == 1) {
      /// 0-已建联；1-未建联
      MapEntry<String, Conversation>? target = entries.firstWhereOrNull(
          (e) => ChatUtil.isChatVipService(Util.parseInt(e.value.targetId)));
      if (target != null && target.value.unreadCount > 0) {
        entries.remove(target);
        entries.insert(0, target);
      }
    }
    return LinkedHashMap.fromEntries(entries);
  }

  void _handleCachedUnReadEvents() async {
    _unreadEventSubs = _yieldUnReadEvent().listen((event) {
      _onImEvent(event.type, event.data);
    });
  }

  Stream<_UnreadEvent> _yieldUnReadEvent() async* {
    while (_cachedUnreadEvents.isNotEmpty) {
      if (!Util.isAppActive) {
        break;
      }
      await Future.delayed(const Duration(milliseconds: 40));
      _UnreadEvent event = _cachedUnreadEvents.first;
      _cachedUnreadEvents.remove(event);
      yield event;
    }
  }
}

class _UnreadEvent {
  String type;
  Object? data;

  _UnreadEvent(this.type, this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _UnreadEvent &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          data == other.data;

  @override
  int get hashCode => type.hashCode ^ data.hashCode;
}
