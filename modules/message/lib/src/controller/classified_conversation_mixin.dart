import 'package:message/k.dart';
import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/message.dart';

/// 会话归类
mixin ClassifiedConversationMixin {
  LinkedHashMap<String, Conversation> normalData = LinkedHashMap(); //当前消息会话列表
  LinkedHashMap<String, Conversation> hiData = LinkedHashMap(); //打招呼里面的会话列表
  LinkedHashMap<String, Conversation> tempGroupData =
      LinkedHashMap(); //临时群里面的会话列表
  LinkedHashMap<String, Conversation> accostData = LinkedHashMap(); //自动搭讪的会话列表
  LinkedHashMap<String, Conversation> fateData = LinkedHashMap(); //今日缘分的会话列表

  Future<void> addAndClassifyConversations(List<Conversation>? convs) async {
    ConversationsChangeState changeState = ConversationsChangeState();
    changeState = (await _classifyAllConversations(convs, changeState))!;

    if (changeState.tempState > 0)
      tempGroupData = sortBySentTime(tempGroupData);
    if (changeState.accostState > 0) accostData = sortBySentTime(accostData);
    if (changeState.fateState > 0) fateData = sortBySentTime(fateData);
    if (changeState.hiState > 0) hiData = sortBySentTime(hiData);
    if (changeState.hiState > 1) _removeOldHiConversations();

    updateSpecialConversations(state: changeState);
  }

  Future reclassifyConversations(String type, Set<int>? changedIds) async {
    if (changedIds?.isEmpty ?? true) return;

    List<Conversation> convs = [];

    if (type == ConversationType.Group) {
      for (var _ in changedIds!) {
        String convKey = getKey(type, '$_');
        Conversation? tempConv = normalData[convKey];
        tempConv ??= tempGroupData[convKey];
        if (tempConv != null) convs.add(tempConv);
      }
    } else {
      for (var _ in changedIds!) {
        String convKey = getKey(type, '$_');
        Conversation? tempConv = normalData[convKey];
        tempConv ??= hiData[convKey];
        tempConv ??= accostData[convKey];
        tempConv ??= fateData[convKey];

        if (tempConv != null) convs.add(tempConv);
      }
    }
    await addAndClassifyConversations(convs);
  }

  void clearClassifyData() {
    hiData.clear();
    tempGroupData.clear();
    normalData.clear();
    accostData.clear();
    fateData.clear();
  }

  ///归类 Conversations
  Future<ConversationsChangeState?> _classifyAllConversations(
      List<Conversation>? convs, ConversationsChangeState? changeState) async {
    if (convs == null || convs.isEmpty || changeState == null)
      return changeState;
    for (Conversation? conv in convs) {
      if (conv == null) continue;

      /// 对会话信息的额外修改
      _checkConv(conv);

      //取所有会话列表中最早的时间
      if (startTime == 0) {
        startTime = conv.sentTime;
      } else if (conv.sentTime < startTime) {
        startTime = conv.sentTime;
      }
      if (conv.type == ConversationType.Private) {
        // 根据消息来源，优先处理
        if (await isNormalConversation(conv)) {
          _addNormalConv(conv, state: changeState);
        } else {
          _addHiConv(conv, state: changeState);
        }
      } else if (conv.type == ConversationType.Group) {
        if (await isTempGroupConversation(conv)) {
          _addTempGroupConv(conv, state: changeState);
        } else {
          _addNormalConv(conv, state: changeState);
        }
      }
    }
    return changeState;
  }

  /// 对会话信息的额外操作
  void _checkConv(Conversation conv) {
    /// 快乐星球 首次自动将高潜管家置顶
    if (AppConfig.isHighPotentialSteward(conv.targetId) &&
        !Config.getBool('HighPotentialSteward_First_${Session.uid}')) {
      conv.isTop = true;
      Config.setBool('HighPotentialSteward_First_${Session.uid}', true);

      /// 将置顶字段同步到数据库，此处不需要await。
      Im.setConversationToTop(conv.type, conv.targetId, true);
    }
  }

  /// 1-更新，2-新增，3-更新+新增
  ConversationsChangeState _addNormalConv(Conversation? conv,
      {ConversationsChangeState? state}) {
    state ??= ConversationsChangeState();
    if (conv == null) return state;
    _takeOutFromSpecialList(conv, state);
    state.dataState =
        _addConvAndGetState(normalData, conv, state: state.dataState);
    return state;
  }

  ConversationsChangeState _addTempGroupConv(Conversation conv,
      {ConversationsChangeState? state}) {
    state ??= ConversationsChangeState();
    _takeOutFromSpecialList(conv, state);
    state.tempState =
        _addConvAndGetState(tempGroupData, conv, state: state.tempState);
    return state;
  }

  ConversationsChangeState _addHiConv(Conversation conv,
      {ConversationsChangeState? state}) {
    state ??= ConversationsChangeState();
    bool showInNormal = isOutConversation(conv);
    if (showInNormal) {
      _addNormalConv(conv, state: state);
      return state;
    }
    _takeOutFromSpecialList(conv, state);
    bool showInAccost = isInnerByGsConversation(conv);
    bool showInFate = isInnerByFateConversation(conv);
    if (showInAccost) {
      state.accostState =
          _addConvAndGetState(accostData, conv, state: state.accostState);
    } else if (showInFate) {
      state.fateState =
          _addConvAndGetState(fateData, conv, state: state.fateState);
    } else {
      state.hiState = _addConvAndGetState(hiData, conv, state: state.hiState);
    }
    return state;
  }

  int _addConvAndGetState(
      LinkedHashMap<String, Conversation> listData, Conversation conv,
      {int state = ConversationsChangeState.unChange}) {
    String key = conv.key;
    listData.update(key, (value) {
      if (state >= ConversationsChangeState.add) {
        state = ConversationsChangeState.addAndUpdate;
      } else {
        state = ConversationsChangeState.update;
      }
      return conv;
    }, ifAbsent: () {
      if (state == ConversationsChangeState.add ||
          state == ConversationsChangeState.addAndUpdate) {
        state = ConversationsChangeState.addAndUpdate;
      } else {
        state = ConversationsChangeState.add;
      }
      return conv;
    });
    return state;
  }

  void updateSpecialConversations({ConversationsChangeState? state}) {
    state ??= ConversationsChangeState();

    if (state.hiState > 0) _updateHiConversation();
    if (state.accostState > 0) _updateAccostConversation();
    if (state.fateState > 0) _updateFateConversation();
    if (state.tempState > 0) _updateTempGroupConversation();
    if (state.isChanged) normalData = sortBySentTime(normalData);
  }

  void _updateHiConversation() {
    Log.d('hiConversation hiData len = ${hiData.length}');
    if (hiData.isNotEmpty) {
      int hideUnreadCount = 0;
      int maxSentTime = 0;
      bool isTop = false;
      hiData.forEach((key, conv) {
        hideUnreadCount += conv.unreadCount;
        if (conv.sentTime > maxSentTime) {
          maxSentTime = conv.sentTime;
        }
        if (conv.isTop) {
          isTop = true;
        }
      });

      Conversation hiConv = _buildSpecialConversation(
          '0',
          BaseK.K.say_hi,
          BaseK.K.few_people_say_hi(['${hiData.length}']),
          ConversationType.Hi,
          maxSentTime,
          hideUnreadCount,
          isTop);
      _addNormalConv(hiConv);
    } else {
      _removeSpecialConv(getKey(ConversationType.Hi, '0'));
    }
  }

  void _updateFateConversation() {
    if (fateData.isNotEmpty) {
      int hideUnreadCount = 0;
      int maxSentTime = 0;
      bool isTop = false;

      fateData.forEach((key, conv) {
        hideUnreadCount += conv.unreadCount;
        if (conv.sentTime > maxSentTime) {
          maxSentTime = conv.sentTime;
        }
        if (conv.isTop) {
          isTop = true;
        }
      });
      Conversation fateConv = _buildSpecialConversation(
          '0',
          K.msg_fate,
          K.msg_has_fate_person_num(['${fateData.length}']),
          ConversationTypeExt.Fate,
          maxSentTime,
          hideUnreadCount,
          isTop);
      _addNormalConv(fateConv);
    } else {
      _removeSpecialConv(getKey(ConversationTypeExt.Fate, '0'));
    }
  }

  void _updateAccostConversation() {
    if (accostData.isNotEmpty) {
      int hideUnreadCount = 0;
      int maxSentTime = 0;
      bool isTop = false;

      accostData.forEach((key, conv) {
        hideUnreadCount += conv.unreadCount;
        if (conv.sentTime > maxSentTime) {
          maxSentTime = conv.sentTime;
        }
        if (conv.isTop) {
          isTop = true;
        }
      });
      Conversation accostConv = _buildSpecialConversation(
          '0',
          K.msg_auto_accost,
          K.msg_has_accost_person_num(['${accostData.length}']),
          ConversationType.Accost,
          maxSentTime,
          hideUnreadCount,
          isTop);
      _addNormalConv(accostConv);
    } else {
      _removeSpecialConv(getKey(ConversationType.Accost, '0'));
    }
  }

  void _updateTempGroupConversation() {
    if (tempGroupData.isNotEmpty) {
      //未读消息的群聊数量
      int hasUnreadTempGroupCount = 0;
      //总未读消息数量
      int hasUnreadCount = 0;
      int latestSentTime = 0;
      String latestSentContent = '';

      tempGroupData.forEach((key, conv) {
        if (conv.unreadCount > 0) {
          hasUnreadTempGroupCount++;
          hasUnreadCount += conv.unreadCount;
        }
        if (conv.sentTime > latestSentTime) {
          latestSentTime = conv.sentTime;
          latestSentContent = conv.lastMessage?.content ?? '';
        }
      });

      Conversation tempGroupConv = _buildSpecialConversation(
          '0',
          BaseK.K.temp_group,
          hasUnreadTempGroupCount <= 0
              ? latestSentContent
              : BaseK.K.few_group_has_unread(['$hasUnreadTempGroupCount']),
          ConversationType.TempGroup,
          latestSentTime,
          hasUnreadCount,
          false);
      _addNormalConv(tempGroupConv);
    } else {
      _removeSpecialConv(getKey(ConversationType.TempGroup, '0'));
    }
  }

  Conversation _buildSpecialConversation(
      String targetId,
      String title,
      String content,
      String type,
      int maxSentTime,
      int hideUnreadCount,
      bool isTop) {
    Conversation accostConv = Conversation.fromJson({
      'sentTime': maxSentTime,
      'unreadCount': hideUnreadCount,
      'targetId': targetId,
      'title': title,
      'type': type,
      'isTop': isTop,
      'lastMessage': {'content': content, 'type': 'text'},
    });
    return accostConv;
  }

  /// 从特殊收起拿出来
  void _takeOutFromSpecialList(
      Conversation? conv, ConversationsChangeState state) {
    if (conv == null) return;
    if (normalData.isNotEmpty) {
      state.dataState = normalData.remove(conv.key) != null
          ? ConversationsChangeState.addAndUpdate
          : state.dataState;
    }

    if (hiData.isNotEmpty) {
      state.hiState = hiData.remove(conv.key) != null
          ? ConversationsChangeState.addAndUpdate
          : state.hiState;
    }

    if (accostData.isNotEmpty) {
      state.accostState = accostData.remove(conv.key) != null
          ? ConversationsChangeState.addAndUpdate
          : state.accostState;
    }

    if (fateData.isNotEmpty) {
      state.fateState = fateData.remove(conv.key) != null
          ? ConversationsChangeState.addAndUpdate
          : state.fateState;
    }

    if (tempGroupData.isNotEmpty) {
      state.tempState = tempGroupData.remove(conv.key) != null
          ? ConversationsChangeState.addAndUpdate
          : state.tempState;
    }
  }

  void _removeSpecialConv(String key) {
    normalData.remove(key);
  }

  void _removeOldHiConversations() {
    if (hiData.length >= limit) {
      int delLen = hiData.length - limit;
      for (int i = 0; i < delLen; i++) {
        Conversation toBeDeletedConv = hiData.remove(hiData.keys.last)!;
        _removeOneConversation(toBeDeletedConv);
      }
    }
  }

  _removeOneConversation(Conversation toBeDeletedConv) {
    String key = toBeDeletedConv.key;
    List<String> splits = key.split('.');
    String type = splits[0];
    String targetId = splits[1];
    Im.removeConversation(type, targetId);
    Log.d('Remove conversation with IM, type: $type, targetId:$targetId');
  }

  bool _hideUnionGuide() {
    return Session.getInt('union_id') > 0;
  }

  LinkedHashMap<String, Conversation> sortBySentTime(
      LinkedHashMap<String, Conversation> map);

  String getKey(String type, String tId);

  set startTime(int value);

  int get startTime;

  int get limit;

  bool isOutConversation(Conversation conv);

  bool isInnerByGsConversation(Conversation conv);

  bool isInnerByFateConversation(Conversation conv);

  Future<bool> isNormalConversation(Conversation conv);

  Future<bool> isTempGroupConversation(Conversation conv);

  List<Conversation>? get hiConvs => hiData.values.toList();

  List<Conversation>? get tempConvs => tempGroupData.values.toList();

  List<Conversation>? get accostConvs => accostData.values.toList();

  List<Conversation>? get fateConvs => fateData.values.toList();

  List<Conversation>? get data => normalData.values.toList();
}

class ConversationsChangeState {
  int dataState = unChange;
  int hiState = unChange;
  int tempState = unChange;
  int accostState = unChange;
  int fateState = unChange;

  bool get isChanged =>
      dataState > unChange ||
      hiState > unChange ||
      tempState > unChange ||
      accostState > unChange ||
      fateState > unChange;

  /// 无变化
  static const int unChange = 0;

  /// 更新
  static const int update = 1;

  /// 新增
  static const int add = 2;

  /// 更新&新增
  static const int addAndUpdate = 3;
}
