import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:chat/k.dart';
import 'package:chat/src/bottom/chatInput.dart';
import 'package:chat/src/chat_screen_interface.dart';
import 'package:chat/src/model/chat_group_msg.dart';
import 'package:chat/src/model/chat_screen_config.dart';
import 'package:chat/src/model/pbModel/generated/chat_egg.pb.dart';
import 'package:chat/src/model/pbModel/generated/chat_hi.pb.dart';
import 'package:chat/src/msg/messageItem.dart';
import 'package:chat/src/page/chatSettingScreen.dart';
import 'package:chat/src/widget/chat_card.dart';
import 'package:chat/src/widget/displayGift.dart';
import 'package:chat/src/widget/hi_match_chat_card.dart';
import 'package:chat/src/widget/profile_integrity_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart' hide SkillItem;
import 'package:shared/widget/bubble/bubble_widget.dart';

import '../assets.dart';
import 'repo/chat_repo.dart';
import 'widget/emojiPlayer.dart';
import 'widget/recruit_gs.dart';

const String kCompetitionRuleShow = 'competition.rule.show';

/// 聊天界面
// ignore: must_be_immutable
class UserChatScreen extends StatefulWidget implements ChatScreenInterface {
  static const String routeName = '/userChat';
  @override
  final int targetId;
  @override
  final String type;
  @override
  final String? title;
  @override
  final SkillInfo? skillInfo;
  @override
  final String? refer;
  @override
  final bool isFromHiList;
  @override
  int official;
  @override
  final String? extType; //拓展字段
  @override
  final bool fromRoomPanel;
  @override
  final int hiMatchScore;
  @override
  final VoidCallback? onPageLoad;

  static Future openUserChatScreen(
    BuildContext context, {
    required String type,
    required int targetId,
    String? title,
    SkillInfo? skillInfo,
    String? refer,
    String? extType,
    bool isFromHiList = false,
    int official = 0,
    bool fromRoomPanel = false,
    int hiMatchScore = 0,
    VoidCallback? onPageLoad,
  }) {
    if (refer == null) {
      if (ModalRoute.of(context) != null) {
        refer = ModalRoute.of(context)?.settings.name ?? '';
      } else {
        refer = '';
      }
    }

    UserChatScreen screen = UserChatScreen(
        type: type,
        targetId: targetId,
        title: title,
        skillInfo: skillInfo,
        refer: refer,
        isFromHiList: isFromHiList,
        official: official,
        extType: extType,
        fromRoomPanel: fromRoomPanel,
        hiMatchScore: hiMatchScore,
        onPageLoad: onPageLoad);

    /// 从房间消息列表面板点进来的
    if (fromRoomPanel) {
      return displayModalBottomSheet(
          context: context,
          isBarrierDismissible: true,
          maxHeightRatio: 1.0,
          settings: RouteSettings(name: '/userChat', arguments: {'type': type, 'targetId': targetId, 'title': title}),
          builder: (BuildContext context) {
            return screen;
          });
    } else {
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: '/userChat', arguments: {'type': type, 'targetId': targetId, 'title': title}),
        ),
      );
    }
  }

  UserChatScreen({
    super.key,
    required this.type,
    required this.targetId,
    this.title,
    this.skillInfo,
    this.refer,
    this.extType,
    this.isFromHiList = false,
    this.official = 0,
    this.fromRoomPanel = false,
    this.hiMatchScore = 0,
    this.onPageLoad,
  });

  @override
  UserChatScreenState createState() => UserChatScreenState();
}

class UserChatScreenState<T extends ChatScreenInterface> extends State<T> with SingleTickerProviderStateMixin {
  List<MessageContent> _data = [];
  final List<GiftConfig> _gifts = [];
  final List<GiftConfig> _queue = [];
  final Map<int, GlobalKey> _keys = {};
  final Map<int, String> _times = {};
  final Map<int, bool> _selected = {};

  //用户头像缓存，避免更新头像后，消息项头像不一致；
  final Map<String, String> _latestUserIcons = {};

  final GlobalKey _listViewKey = GlobalKey();

  late ScrollController controller;
  bool isLoadPersonalData = false;

  bool _hasMore = false; //向历史数据请求是否有
  bool _loading = false;
  bool _reverse = true; //实际使用时列表方向
  bool _initReverse = true; //初始列表方向
  bool _modify = false;
  bool _isAutoService = false; //是否有自动客服服务
  int _minMessageId = -1;
  int _unread = 0;

  // int _level = 0;
  int _titleNew = 0;
  int _intimacy = 0; //亲密度
  bool _showDaka = false; //显示大咖
  bool _showJiaren = false; //显示佳人

  final GlobalKey _inputKey = GlobalKey();

  bool _purviewLoading = true;
  final bool _networkEnabled = true;
  bool _groupEnabled = true;
  bool _selfEnabled = true;

  String _reason = '';
  int _roomId = 0;
  int _sex = 0;

  String _name = '';

  /// 对方名字
  int _friend = 0; //是不是好友
  int _fans = 0; //他是不是我的粉丝
  int _familiar = 0; // 1 我给他发过消息
  int familiarR = 0; // 对方是否给我发送过消息，1：发送过
  int _giftId = 0; // 送礼物id, 默认棒棒糖5
  int _defend = 0;
  bool _targetDeleted = false; //对方是否被封禁
  String _userIcon = '';

  String _title = '';

  bool _isSuper = false; //是否是巡管

  late ILoginManager loginManager;
  late IRoomManager _roomManager;
  late IGroupManager _groupManager;

  ProfileSkill? _currSkill;
  List<ProfileSkill>? _skillList;

  final int _targetAbilityNum = 0;

  double _actionWidth = 0;

  bool _hideInput = false;
  int _lastLoadUserTime = 0; // 上次刷新用户的时间(做亲密度用的)
  String? _userTag; // eg: 小程序
  bool _quickReplyPanelShow = false;

  bool isShowInviteRoom = false;

  ChatCard? chatCard;
  final GlobalKey _chatCardKey = GlobalKey();

  bool _follow = false;

  bool _isOnline = false;

  late AnimationController _animationController;

  static const LOG_TAG = "UserChatScreenState";

  CloudProfileData? _resData;

  CloudProfileData? _chatGroupConfig;

  ResChatEggTips? _chatEggTips;
  TaskBar? _taskBar;

  HomeProfileData? _homeProfileData;

  // 是否有客服功能设置数据，默认没有
  bool _hasServiceSettingData = false;

  // 是否是危险用户
  int _meDanger = 0;

  List<int>? tails;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.view_chat_page, properties: {
      'target_uid': widget.targetId,
      'refer': widget.refer ?? '',
    });

    Im.refer = widget.refer ?? '';
    Im.isNewGroup = false;

    loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    _roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    _groupManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);

    var enabled = Session.getInt('deleted', 0) <= 1;
    if (ChatUtil.isCustomerService(widget.targetId)) {
      enabled = true;
    }

    _selfEnabled = enabled;
    if (_isGroup) {
      _groupEnabled = false;
    }

    if (widget.title != null) {
      _title = widget.title!;
    }

    controller = ScrollController();
    controller.addListener(onScroll);
    eventCenter.addListener(Im.EventMessageReceived, _onEvent);
    eventCenter.addListener(Im.EventMessageSent, _onEvent);
    eventCenter.addListener(Im.EventSendImageAdded, _onEvent);
    eventCenter.addListener(Im.EventMessageSendFail, _onEvent);
    eventCenter.addListener(Im.EventReadReceiptReceived, _onEvent);
    eventCenter.addListeners([Im.EventUnreadChanged], _onUnreadChanged);
    eventCenter.addListener("MsgExtraChanged", _onEvent);
    eventCenter.addListener("UserChat.PlayGift", _onEvent);
    eventCenter.addListener("Session.Changed", _onEvent);
    eventCenter.addListener(Im.EventMessageRecall, _onEvent);
    eventCenter.addListener(IGroupManager.EVENT_REFRESH_GROUP_INFO, _onEvent);
    eventCenter.addListener('user_chat_screen.close_keyboard', _onEvent);
    eventCenter.addListener('event.high.risk.user.voice.safe.verify.accomplish', _onEvent);

    eventCenter.emit('user_chat_screen.pushed', {'type': widget.type, 'targetId': widget.targetId.toString()});

    _firstLoad();
    _initUnread();
    _loadConfig();

    AppConfig.sync(type: [AppConfig.image_domain]);

    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showNotDisturbDialog();
    });
  }

  void _firstLoad() async {
    await load(fromInit: true);
    int sendCount = 0;
    int receiveCount = 0;
    for (var element in _data) {
      (element.senderId == Session.uid.toString()) ? sendCount++ : receiveCount++;
    }
    if (sendCount >= 5 && receiveCount >= 5 && widget.type == 'private') {
      isShowInviteRoom = true;
      if (_roomId > 0) {
        refresh();
      }
    }
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);

    AudioPlay.instance().stop();
    PulseIMWrapper.stopPlayVoice();
    Im.isNewGroup = false;

    eventCenter.removeListener(Im.EventMessageReceived, _onEvent);
    eventCenter.removeListener(Im.EventMessageSent, _onEvent);
    eventCenter.removeListener(Im.EventSendImageAdded, _onEvent);
    eventCenter.removeListener(Im.EventMessageSendFail, _onEvent);
    eventCenter.removeListener(Im.EventReadReceiptReceived, _onEvent);
    eventCenter.removeListeners([Im.EventUnreadChanged], _onUnreadChanged);
    eventCenter.removeListener("MsgExtraChanged", _onEvent);
    eventCenter.removeListener("UserChat.PlayGift", _onEvent);
    eventCenter.removeListener("Session.Changed", _onEvent);
    eventCenter.removeListener(Im.EventMessageRecall, _onEvent);
    eventCenter.removeListener(IGroupManager.EVENT_REFRESH_GROUP_INFO, _onEvent);
    eventCenter.removeListener('user_chat_screen.close_keyboard', _onEvent);
    eventCenter.removeListener('event.high.risk.user.voice.safe.verify.accomplish', _onEvent);

    eventCenter.emit('user_chat_screen.popped', {'type': widget.type, 'targetId': widget.targetId.toString()});
    _animationController.dispose();
    super.dispose();
  }

  bool get _isGroup => widget.type == ConversationType.Group;

  void _loadConfig() {
    if (widget.type == ConversationType.Group) {
      _loadConfigGroup();
    } else if (widget.type == ConversationType.Private) {
      _selfEnabled = false;
      _loadUser();
    }
  }

  void _loadPersonalData() async {
    if (chatCard != null || isLoadPersonalData) {
      return;
    }

    isLoadPersonalData = true;
    ResHomeProfile resHomeProfile = await BuffApi.getHomeProfileData(widget.targetId, _roomId);

    if (resHomeProfile.success) {
      HomeProfileData data = resHomeProfile.data;

      _follow = (data.base.followRelation == 1 || data.base.followRelation == 2);

      ResHomeSyncProfile resHomeSyncProfile = await BuffApi.getHomeProfileSyncData(widget.targetId, _roomId);
      if (resHomeSyncProfile.success && resHomeSyncProfile.hasData()) {
        data.syncProfileData(resHomeSyncProfile.data);
        _follow = (data.base.followRelation == 1 || data.base.followRelation == 2);
      }

      _homeProfileData = data;

      if (mounted) {
        setState(() {
          _isOnline = data.base.onlineStatus == 0;
          chatCard = ChatCard(_chatCardKey, widget.targetId, _name, data, _follow, _rebuildMessageWithHeight);
        });
      }
    }
  }

  _showTipsDialog(int needVerify, int needVerifyNew, bool showProfileTips, bool sent) async {
    if (!mounted) {
      return;
    }
    if (showProfileTips && !ChatUtil.isSystemUser(widget.targetId) && !sent) {
      bool? suc = await ProfileIntegrityDialog.openDialog(context);
      if (suc == false && mounted) {
        Navigator.of(context).pop();
      }

      if (suc == true && mounted) {
        _loadUser();
      }
      return;
    }

    //go接口桌游字段needVerifyNew问题,不需要该逻辑，现针对桌游注释，后续改成桌游go接口 todo
    _handleVerify(needVerify, needVerifyNew);
  }

  // 是否需要验证， 0是不需要 1是本机验证，2是身份认证
  _handleVerify(int needVerify, int needVerifyNew) async {
    if ((widget.type == ConversationType.Group || !ChatUtil.isSystemUser(widget.targetId)) &&
        (Utility.isNeedVerify(needVerify, needVerifyNew))) {
      bool? suc = await loginManager.openAuthDialog(context, type: needVerify, newType: needVerifyNew, refer: 'chat');

      if (suc == false && mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _loadUser() async {
    ResCloudProfile profile = await BaseRequestManager.cloudProfile(widget.targetId.toString(),
        relationShip: '1', skill: '1', profileIntegrity: '1', intimacy: '1', relationScore: '1');

    _purviewLoading = false;
    _lastLoadUserTime = DateTime.now().millisecondsSinceEpoch;
    bool showProfileTips = false;
    bool disabled = false;
    if (profile.success && profile.hasData()) {
      _resData = profile.data;
      _hasServiceSettingData = _resData != null && _resData!.hasServiceSetting();

      int needVerify = _resData!.needVerify;
      int needVerifyNew = _resData!.needVerifyNew;
      _meDanger = _resData!.meDanger;

      ///从在线匹配进入私聊的，发消息不受资料完整度限制
      showProfileTips = Util.parseBool(_resData!.profileIntegrity) && Util.parseInt(widget.hiMatchScore) <= 0;

      _showTipsDialog(needVerify, needVerifyNew, showProfileTips, Util.parseBool(_resData!.familiarR));
      String mark = _resData!.mark;
      _title = (mark.isNotEmpty) ? mark : _resData!.name;

      // _level = _resData!.title;
      _titleNew = _resData!.titleNew;

      /// TODO：快乐星球App审核屏蔽
      if (!Util.isSleeplessPlanetVerify) {
        _roomId = _resData!.rid;
      }
      _isSuper = _resData!.isSuper;
      _sex = _resData!.sex;
      _intimacy = _resData!.intimacy;
      _showDaka = (_resData!.daka == 1);
      _showJiaren = (_resData!.jiaren == 1);

      if (_resData!.skills.isNotEmpty) {
        _skillList = _resData!.skills;
        if (_resData!.hasCurrentSkill()) {
          _currSkill = _resData!.currentSkill;
        }
      }

      int strangerMsg = 0;
      int fans = 0;
      _friend = _resData!.friend;
      _defend = _resData!.defend;
      strangerMsg = _resData!.strangerMsg;
      fans = _resData!.fans;
      familiarR = _resData!.familiarR; // 对方是否给我发送过消息，1：发送过
      _familiar = _resData!.familiar;
      _fans = fans;
      Im.firstSend = _resData!.familiar == 0;
      _giftId = _resData!.gid > 0 ? _resData!.gid : 5; // 默认送棒棒糖

      disabled = !ChatUtil.isSystemUser(widget.targetId) && strangerMsg == 0 && fans == 0 && familiarR == 0;

      if (disabled == true) {
        _selfEnabled = false;
        _reason = K.chat_follow_reson;
      } else {
        _selfEnabled = true;
      }

      if (_resData!.hasService()) {
        _isAutoService = Util.parseInt(_resData!.service) > 0;
      } else {
        _isAutoService = false;
      }
      _targetDeleted = false;
      UserInfo userInfo = UserInfo.fromJson(_resData!.toProto3Json() as Map);
      widget.official = userInfo.official;
      _userIcon = userInfo.icon ?? '';
      _name = userInfo.name ?? '';
      CachedNames.instance().set(userInfo);

      tails = Util.parseList(_resData!.bubbleTail, (tail) {
        return tail.cid;
      });
    } else {
      _selfEnabled = false;
      _reason = profile.hasMsg() ? profile.msg : '';
      _targetDeleted = profile.type == 'deleted';
    }

    await _insertBirthdayTipsMsg();
    //  资料不完整度弹窗，不允许弹起礼物面板
    if (!showProfileTips || Util.parseBool(_resData!.familiarR)) {
      widget.onPageLoad?.call();
    }
    refresh();
  }

  void _loadConfigGroup() async {
    ResCloudProfile rsp = await ChatRepo.getGroupConfig(widget.targetId);
    _purviewLoading = false;
    if (rsp.success) {
      _groupEnabled = true;
      _chatGroupConfig = rsp.data;
      tails = Util.parseList(_chatGroupConfig!.bubbleTail, (e) => e.cid);
      _handleVerify(_chatGroupConfig!.needVerify, _chatGroupConfig!.needVerifyNew);
      _title = _chatGroupConfig!.name;
      UserInfo? userInfo = _convertFromGroupConfig();
      if (userInfo != null) CachedNames.instance().set(userInfo);
      Im.isNewGroup = _chatGroupConfig!.type == ChatGroupTypes.PARTY;
    } else {
      _groupEnabled = false;
      _reason = rsp.msg;
    }
    setState(() {});
  }

  /// 只刷新亲密度
  void _onlyLoadIntimacy() async {
    if (_lastLoadUserTime > 0 && (DateTime.now().millisecondsSinceEpoch - _lastLoadUserTime) > 5000) {
      _lastLoadUserTime = DateTime.now().millisecondsSinceEpoch;

      ResCloudProfile profile = await BaseRequestManager.cloudProfile(widget.targetId.toString(), intimacy: '1', relationScore: '1');
      if (profile.success && profile.hasData()) {
        int intimacy = profile.data.intimacy;

        if (intimacy > 0 && _intimacy != intimacy && mounted) {
          setState(() {
            _intimacy = intimacy;
          });
        }
      }
    }
  }

  /// 消息去重，防止server在重发消息后，客户端重复显示
  bool msgExisted(MessageContent message) {
    if (message.extra != null && _data.isNotEmpty) {
      try {
        Map extra = jsonDecode(message.extra!);
        if (extra.containsKey('uuid')) {
          String uuid = extra['uuid'];
          for (MessageContent item in _data) {
            Map itemExtra = jsonDecode(item.extra ?? '');
            if (itemExtra.containsKey('uuid')) {
              String itemUuid = itemExtra['uuid'];
              if (uuid == itemUuid) {
                return true;
              }
            }
          }
        }
      } catch (_) {}
    }
    return false;
  }

  void _onEvent(String type, dynamic data) async {
    switch (type) {
      case Im.EventMessageReceived:
      case Im.EventMessageSent:
        Map res = data as Map;
        Log.d("getMSG--: $type: $res");
        int messageId = res['messageId'];
        MessageContent? message = await Im.getMessage(messageId);
        if (message == null) return;
        Log.d("UserChatScreen EventMessageReceived $messageId and status = ${message.sentStatus}");

        if (msgExisted(message)) {
          break;
        }

        if (type == Im.EventMessageReceived) {
          _sendReadReceipt(message.sentTime);
        }

        if (widget.type == ConversationType.Private && !ChatUtil.isSystemUser(widget.targetId)) {
          _onlyLoadIntimacy();
        }

        bool isFirstSentMessage = false;
        if (type == Im.EventMessageSent &&
            _familiar != 1 &&
            widget.type == ConversationType.Private &&
            !ChatUtil.isCustomerService(widget.targetId) &&
            !ChatUtil.isVipCustomerService(widget.targetId) &&
            !ChatUtil.isSystemNotice(widget.targetId)) {
          // 我没有给他发过消息
          isFirstSentMessage = _isFirstSentMessage();
        }

        if (message.conversationType == widget.type && message.targetId == widget.targetId.toString()) {
          _appendMessage(message, res['left'] == 0);
          if (isFirstSentMessage) {
            await insertSendGiftTipsMsg(message.content);
          }
        }
        break;
      case Im.EventReadReceiptReceived:
        Map res = data as Map;
        String targetId = res['targetId'];
        if (targetId == widget.targetId.toString()) {
          // Update UI to sent
          for (var message in _data) {
            if (message.sentStatus == MessageStatus.Sent) {
              message.sentStatus = MessageStatus.Read;
            }
          }

          refresh();
        }
        break;

      case Im.EventSendImageAdded:
        MessageContent? message = await Im.getMessage(Util.parseInt(data));
        if (message != null && message.conversationType == widget.type && message.targetId == widget.targetId.toString()) {
          _appendMessage(message);
        }
        break;

      case Im.EventMessageSendFail:
        Map res = data as Map;
        int messageId = res['messageId'];
        int errCode = res['errCode'];
        String errMessage = res['errMessage'];
        if (errCode == 21501) {
          // 命中敏感词有单独的判断逻辑
          _onSensitiveMsg(errCode.toString(), errMessage);
        } else {
          MessageContent? message = await Im.getMessage(messageId);
          if (message != null && message.conversationType == widget.type && message.targetId == widget.targetId.toString()) {
            _appendMessage(message);
            MessageContent? msgContent = Im.createErrorMsg(errMessage);
            Log.d("UserChatScreen errMessage = $errMessage");
            MessageContent? messageLocal = await Im.insertMessage(widget.type, widget.targetId.toString(), msgContent);
            await PulseIMClient.updateConversation(widget.type, widget.targetId.toString());
            if (messageLocal != null) {
              _appendMessage(messageLocal);
            }
          }
        }
        break;

      case 'UserChat.PlayGift':
        MessageContent message = data as MessageContent;
        if (message.extra == null || message.extra!.isEmpty) return;
        try {
          Map? gift = json.decode(message.extra!);
          if (gift != null && gift.containsKey('type') && gift['type'] == 'gift' && mounted) {
            setState(() {
              if (_gifts.isEmpty) {
                _gifts.add(GiftConfig.fromJson(gift));
              } else {
                _queue.add(GiftConfig.fromJson(gift));
              }
            });
            Im.setMessageExtra(message.messageId, json.encode({'time': DateTime.now().millisecondsSinceEpoch}));
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
        break;
      case 'MsgExtraChanged':
        Map res = data as Map;
        int? messageId = res['messageId'];
        if (messageId is int && messageId > 0) {
          String extra = res['extra'];
          MessageContent? msg = _data.firstWhereOrNull((it) => it.messageId == messageId);
          if (msg != null && mounted) {
            msg.inlineExtra = extra;
            setState(() {});
          }
        }
        break;

      case 'Session.Changed':
        String? key = Util.parseStr(data);
        if (key == 'deleted' && mounted) {
          setState(() {});
        }
        break;

      case Im.EventMessageRecall:
        Map res = data as Map;
        int messageId = res['messageId'];
        String targetId = res['targetId'];
        if (targetId == widget.targetId.toString()) {
          MessageContent? msg = await Im.getMessage(messageId);
          if (msg != null && msg.targetId == widget.targetId.toString()) {
            // Update UI to sent
            int i = 0;
            int index = 0;
            bool hasItem = false;
            for (var message in _data) {
              if (message.messageId == msg.messageId) {
                index = i;
                hasItem = true;
              }
              i++;
            }
            if (hasItem) {
              _data.insert(index, msg);
              _data.removeAt(index + 1);
              refresh();
            }
          }
        }
        break;
      case IGroupManager.EVENT_REFRESH_GROUP_INFO:
        if ((_isPartyGroup) && mounted) {
          _loadConfigGroup();
        }
        break;
      case 'user_chat_screen.close_keyboard':
        if (mounted) {
          closeKeyboard();
        }
        break;
      case 'event.high.risk.user.voice.safe.verify.accomplish':
        _loadUser();
        break;
    }
  }

  /// 命中敏感词消息
  void _onSensitiveMsg(String imCode, String imMsg) async {
    ResForbidDirtMsg resp = await ChatRepo.reportHitSensitive(widget.targetId, imCode, imMsg);
    if (resp.success && resp.data.needForbidChat) {
      // 根据服务端返回控制是否禁言
      await HiveUtil.put<int>('${Session.uid}_ChatBanTime', resp.data.endTime);
      showBanDialog();
    }
  }

  /// 提示弹框并禁言5分钟
  void showBanDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: K.chat_black_list,
          content: K.chat_black_list_tip,
          positiveButton: PositiveButton(text: K.i_know),
        );
      },
    );
  }

  Future insertSendGiftTipsMsg(String content) async {
    MessageContent? msgContent = Im.createSendGiftTipsMsg(!Util.isStringEmpty(content) ? content : K.chat_msg_notice_str, _giftId);
    MessageContent? messageLocal = await Im.insertMessage(widget.type, widget.targetId.toString(), msgContent);
    if (messageLocal != null) {
      _appendMessage(messageLocal);
    }
  }

  /// 插入一条生日提醒
  Future _insertBirthdayTipsMsg() async {
    // 如果是查看的本人，则不做处理
    if (Session.uid == Util.parseInt(_resData?.uid)) return;

    // 如果好友今天没有过生日，则过滤下数据，进行删除过生日的数据
    if (Util.parseInt(_resData?.isBirthday) == 0) {
      List<int> messageIds = [];
      for (MessageContent message in _data) {
        String? extraJson = message.extra;
        Map? extra;
        try {
          if (extraJson != null && extraJson.isNotEmpty) {
            extra = json.decode(extraJson);
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
        if (extra != null && extra['type'] == 'birthday_tips') {
          messageIds.add(message.messageId);
        }
      }
      if (messageIds.isNotEmpty) {
        await _removeMessages(messageIds);
      }
    }

    // 如果好友今天过生日，则检查下数据，没有才添加过生日数据
    if (Util.parseInt(_resData?.isBirthday) == 1) {
      bool hasBirthday = false;
      for (MessageContent message in _data) {
        String? extraJson = message.extra;
        Map? extra;
        try {
          if (extraJson != null && extraJson.isNotEmpty) {
            extra = json.decode(extraJson);
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
        if (extra != null && extra['type'] == 'birthday_tips') {
          hasBirthday = true;
          break;
        }
      }
      if (!hasBirthday) {
        MessageContent msg = Im.localInfoMsg('info',
            senderUserId: '${_resData?.uid ?? 0}', senderUserName: _resData?.name ?? '', senderUserIcon: _resData?.icon ?? '');
        msg.extra = json.encode({'type': 'birthday_tips'});
        msg.messageDirection = MessageDirection.Receive;
        MessageContent? birthdayMsg = await Im.insertMessage(widget.type, widget.targetId.toString(), msg);
        if (birthdayMsg != null) {
          _appendMessage(birthdayMsg);
        }
      }
    }
  }

  String _getTimeWithMin(int time) {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(time);
    return "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
  }

  //是否是我发送的给对方的第一条消息
  bool _isFirstSentMessage() {
    if (Util.isCollectionEmpty(_data)) {
      return true;
    }

    if (_data.length >= defaultConfig.pageNum) {
      return false;
    }

    for (int i = 0; i < _data.length; i++) {
      MessageContent messageContent = _data[i];
      if (messageContent.senderId == Session.uid.toString()) {
        return false;
      }
    }
    return true;
  }

  _rebuildMessageWithHeight(double myHeight) {
    if (!_reverse) {
      if (mounted) controller.jumpTo(myHeight);
    }
  }

  _rebuildMessage({scrollToEnd = true, double height = 0.0}) {
    /// Log.d("=========== rebuild message");
    _loading = false;
    refresh();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (!mounted) return;
      double displayHeight = 0.0;
      double maxDisplayHeight = Util.height;
      if (_listViewKey.currentContext != null) {
        final RenderBox? box = _listViewKey.currentContext?.findRenderObject() as RenderBox?;
        if (box != null) {
          maxDisplayHeight = box.size.height - (_hideInput ? Util.iphoneXBottom : 0);
        }
      }
      _keys.forEach((int messageId, GlobalKey key) {
        if (key.currentContext != null) {
          final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
          if (box != null) {
            displayHeight += box.size.height;
          }
        }
      });

      /// Log.d('=========== keysize: ${_keys.length} ');
      if (height > 0.0) {
        displayHeight += height;
      } else {
        if (_chatCardKey.currentContext != null) {
          final RenderBox? box = _chatCardKey.currentContext?.findRenderObject() as RenderBox?;
          if (box != null) {
            displayHeight += box.size.height;
          }
        }
      }

      /// Log.d("=========== ${displayHeight} / ${maxDisplayHeight}");

      /// 当前展示的消息够不够满屏,不满消息需要临时从上到下
      /// 自定义数据源过滤该处理逻辑
      bool reverse = true;
      if (!defaultConfig.useCustomDataSource && displayHeight < maxDisplayHeight) {
        //全部被展现了
        reverse = false;
      }

      if (reverse != _reverse) {
        if (reverse == false && _initReverse) {
          _data.sort((MessageContent a, MessageContent b) {
            return a.messageId > b.messageId ? 1 : -1;
          });
        } else {
          _data.sort((MessageContent a, MessageContent b) {
            return a.messageId > b.messageId ? -1 : 1;
          });
        }

        setState(() {
          if (_initReverse) {
            _reverse = reverse;
          }
        });
        WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
          if (scrollToEnd && mounted) controller.jumpTo(0.0);
        });
      } else {
        if (scrollToEnd) controller.jumpTo(0.0);
      }

      Im.clearMessagesUnreadStatus(widget.type, widget.targetId.toString());
      if (widget.type == ConversationType.Group) {
        Im.clearMessagesAtStatus(widget.type, widget.targetId.toString());
      }
    });
  }

  _appendMessage(MessageContent message, [refresh = true]) {
    if (_keys.containsKey(message.messageId)) {
      int index = _data.indexWhere((element) => element.messageId == message.messageId);
      _data[index] = message;
      if (refresh == true) _rebuildMessage();
      return;
    }
    if (_minMessageId <= 0) {
      _minMessageId = message.messageId;
    } else if (message.messageId < _minMessageId) {
      _minMessageId = message.messageId;
    }
    if (_reverse) {
      _data.insert(0, message);
    } else {
      _data.add(message);
    }
    _updateLatestUserIcon(message);

    _keys[message.messageId] = GlobalKey();
    _times[message.messageId] = _getTimeWithMin(message.sentTime);
    if (refresh == true) _rebuildMessage();
  }

  _initUnread() async {
    int count = await Im.getTotalUnreadCount();
    if (mounted) {
      setState(() {
        _unread = count;
      });
    }
  }

  _onUnreadChanged(String type, dynamic value) {
    if (type == Im.EventUnreadChanged) {
      Map res = value;
      int left = res['left'];
      if (left == 0) _initUnread();
    }
  }

  Future<void> _reload() async {
    _minMessageId = -1;
    load();
    if (mounted) setState(() {});
  }

  Future<void> load({scrollToEnd = true, fromInit = false}) async {
    List<MessageContent> data;
    if (defaultConfig.useCustomDataSource) {
      data = await loadCustomHistoryMsg();
      _data.clear();
      _keys.clear();
      _times.clear();
    } else {
      data = await Im.getHistoryMessages(widget.type, widget.targetId.toString(), _minMessageId, defaultConfig.pageNum);
    }

    for (var message in data) {
      _cacheLatestUserIcon(message);

      //同一条messageId的消息去重,否则key不唯一会崩溃
      if (!_keys.containsKey(message.messageId) && !msgExisted(message) && !_isSwindleTipsMsg(message)) {
        if (_minMessageId <= 0) {
          _minMessageId = message.messageId;
        } else if (message.messageId < _minMessageId) {
          _minMessageId = message.messageId;
        }
        _data.add(message);
        _keys[message.messageId] = GlobalKey();

        _times[message.messageId] = _getTimeWithMin(message.sentTime);
      }
    }
    _hasMore = data.length >= defaultConfig.pageNum;
    if (fromInit == true) _sendReadReceipt(0);
    _rebuildMessage(scrollToEnd: scrollToEnd);
  }

  /// UI层控制是否显示 防诈提示
  bool _isSwindleTipsMsg(MessageContent msg) {
    Map extra = (msg.extra?.isNotEmpty == true) ? json.decode(msg.extra!) : {};
    if (extra['type'] == 'swindle_tips') {
      return !(Util.listenImFirstReceiveMsg() && (Session.joinBroker || Session.vipNew <= 5));
    }
    return false;
  }

  _cacheLatestUserIcon(MessageContent message) async {
    if (!_latestUserIcons.containsKey(message.user?.id)) {
      UserInfo? info = await CachedNames.instance().get(Util.parseInt(message.user!.id), ConversationType.Private);
      if (info == null || info.icon == null) {
        _latestUserIcons[message.user!.id!] = message.user!.portraitUri!;
      } else {
        _latestUserIcons[message.user!.id!] = info.icon!;
      }
    }
  }

  _updateLatestUserIcon(MessageContent message) {
    _latestUserIcons[message.user!.id!] = message.user!.portraitUri!;
  }

  bool _checked = false;

  Map? _parseJson(String? jsonValue) {
    if (jsonValue == null) return null;
    try {
      return json.decode(jsonValue);
    } catch (e) {
      return null;
    }
  }

  void onScroll() {
    bool canLoadPre = (controller.offset == controller.position.maxScrollExtent && _hasMore && _loading == false);
    if (canLoadPre) {
      _loadPrev();
    }
  }

  void _loadPrev() {
    Log.d("loadPrev");
    _loading = true;
    refresh();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (!mounted) return;
      controller.jumpTo(controller.position.maxScrollExtent);
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;
        load(scrollToEnd: false);
      });
    });
  }

  void _sendReadReceipt(int sentTime) async {
    if (widget.type == 'group') {
      //群组消息不发送阅读回执以减少消息发送量
      return;
    }

    if (_data.isEmpty) return;

    if (sentTime == 0) {
      // 适配正序/倒序，取最大的时间戳发送给对端做为已读时间戳
      MessageContent lastMessage = _data.last;
      MessageContent firstMessage = _data.first;
      sentTime = max(lastMessage.sentTime, firstMessage.sentTime);
    }

    await Im.sendReadReceiptMessage(widget.type, widget.targetId.toString(), sentTime);
  }

  /// loading header
  Widget _renderHeader(BuildContext context) {
    if (_loading) {
      return Container(
        height: 40.0,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    } else {
      return Container(
        height: 1,
      );
    }
  }

  void onChangeModifyMode(int messageId) async {
    if (!defaultConfig.canModify) {
      return;
    }

    MessageContent? message = await Im.getMessage(messageId);
    if (message == null) return;
    List<SheetItem> res = [];
    res.add(SheetItem(K.chat_item_menu_delete, "remove"));
    res.add(SheetItem(K.chat_item_menu_copy, "copy"));
    //抢单消息不需要撤回
    if (message.type != MessageType.RcCall &&
            DateTime.now().millisecondsSinceEpoch - message.sentTime <= 1000 * 60 * 3 &&
            message.senderId == Session.uid.toString() //本人发送消息，
        ) {
      //非撤回类型消息，3分钟，才可以撤回
      res.add(SheetItem(K.chat_item_menu_recall, "recall"));
    }
    res.add(SheetItem(K.chat_item_menu_multi, "multi"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.chat_item_menu_title, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'remove') {
      await _removeMessages([messageId]);
    } else if (result.value?.key == 'copy') {
      try {
        MessageContent? message = await Im.getMessage(messageId);
        if (message != null) {
          await Clipboard.setData(ClipboardData(text: message.content));
          Fluttertoast.showToast(msg: K.chat_item_copyed, gravity: ToastGravity.CENTER);
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    } else if (result.value?.key == 'multi') {
      if (mounted) {
        setState(() {
          _selected.clear();
          _selected[messageId] = true;
          _modify = true;
        });
      }
    } else if (result.value?.key == 'recall') {
      try {
        MessageContent? message = await Im.recallMessage(messageId);
        if (message == null) return;
        int index = _data.indexWhere((MessageContent current) {
          return current.messageId == messageId;
        });
        if (index > -1) {
          _data[index] = message;
        }
        refresh();
      } catch (e) {
        Log.d(e);
      }
    }
  }

  void _onSelectChanged(int messageId) async {
    closeKeyboard();
    if (_modify == true) {
      setState(() {
        bool ok = _selected[messageId] ?? false;
        _selected[messageId] = !ok;
      });
    }
  }

  void cancelModify() {
    setState(() {
      _modify = false;
    });
  }

  void _removeSelectedMessage() async {
    List<int> messageIds = [];
    _selected.forEach((int messageId, bool selected) {
      if (selected) {
        messageIds.add(messageId);
      }
    });
    _selected.clear();
    if (messageIds.isNotEmpty) {
      await _removeMessages(messageIds);
    } else {
      setState(() {
        _modify = false;
      });
    }
  }

  _removeMessages(List<int> messageIds) async {
    await Im.deleteMessages(messageIds);
    for (var messageId in messageIds) {
      if (_keys.containsKey(messageId)) _keys.remove(messageId);
      if (_times.containsKey(messageId)) _times.remove(messageId);
    }
    List<MessageContent> data = [];
    _minMessageId = 0;
    for (var message in _data) {
      if (messageIds.contains(message.messageId) == false) {
        data.add(message);
        if (_minMessageId == 0) {
          _minMessageId = message.messageId;
        } else if (message.messageId < _minMessageId) {
          _minMessageId = message.messageId;
        }
      }
    }
    _data = data;
    _modify = false;
    _rebuildMessage(scrollToEnd: false);
  }

  Widget renderInput(bool hiddenInput, double keyboard) {
    if (hiddenInput == true) {
      return Container(height: (keyboard <= 0.0 && Util.isIphoneX) ? 34.0 : 0.0);
    }

    bool enabled = true;
    String reason = '';
    // 被封禁
    bool forbidden = Session.getInt('deleted', 0) > 1;
    if (forbidden) {
      enabled = false;
      reason = K.chat_sendmessage_unable;
    } else {
      enabled = _selfEnabled && _groupEnabled && _networkEnabled;
      reason = _reason;
      if (!_networkEnabled) {
        reason = K.chat_sendmessage_unable_net_error;
      }

      if (_purviewLoading) {
        enabled = false;
        reason = K.chat_wait_for_loading;
      }

      if (_resData != null) {
        if (_resData!.privateMessageNoti == 1 || _resData!.oneKeyProtection == 1) {
          enabled = false;
          reason = K.chat_input_notice_private_protect;
        }
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: (keyboard <= 0.0 && Util.isIphoneX) ? 34.0 : 0.0),
      child: ChatInput(
        key: _inputKey,
        type: widget.type,
        isAutoService: _isAutoService,
        targetId: widget.targetId.toString(),
        enabled: enabled,
        reason: reason,
        onQuickReplayShow: _onQuickReplayShow,
        chatGroupConfig: _chatGroupConfig,
        chatCloudProfile: _resData,
        extType: widget.extType,
        tails: tails,
        meDanger: _meDanger,
        needSendTacitTips: widget.type == ConversationType.Private && familiarR == 1 && _familiar == 0,
        callbackBySend: _trackBySend,
      ),
    );
  }

  void _onQuickReplayShow(bool show) {
    if (widget.fromRoomPanel == true && _quickReplyPanelShow != show) {
      _quickReplyPanelShow = show;
      setState(() {});
    }
  }

  Widget _renderInviteRoomBubble() {
    if (_roomManager.getRid() == _roomId && _roomId > 0) {
      return Container();
    }
    double bubbleWidth = MediaQuery.of(context).size.width - 70;
    double bubbleHeight = 174;
    BubbleArrowDirection position;
    bool isTop = _roomId > 0;
    position = isTop ? BubbleArrowDirection.top : BubbleArrowDirection.bottom;
    if (GlobalData.showChatInviteRoomBubble && isShowInviteRoom && _roomId > 0 && _isOnline) {
      return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: (!isTop)
                    ? RelativeRect.fromSize(Rect.fromLTWH(0, 80, biggest.width, biggest.height), biggest)
                    : RelativeRect.fromSize(Rect.fromLTWH(0, 80, biggest.width, biggest.height), biggest),
                end: RelativeRect.fromSize(Rect.fromLTWH(0, 0, biggest.width, biggest.height), biggest),
              ).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.linear,
              )),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isShowInviteRoom = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                    ),
                  ),
                  PositionedDirectional(
                    bottom: (isTop) ? null : 80,
                    end: (isTop) ? 10 : 63,
                    start: (isTop) ? 60 : 7,
                    top: (isTop) ? 0.0 : null,
                    child: Stack(
                      children: [
                        Container(
                          width: bubbleWidth,
                          height: bubbleHeight,
                          decoration: BoxDecoration(
                            boxShadow: [getCardBoxShadow()],
                          ),
                          child: BubbleWidget(
                            bubbleWidth,
                            bubbleHeight,
                            R.colors.mainBgColor,
                            position,
                            arrStartPosition: (isTop) ? 260.0 : 0.0,
                            arrHeight: 10.0,
                            arrAngle: 90.0,
                            radius: 15.0,
                            innerPadding: 0.0,
                            style: PaintingStyle.fill,
                            child: Container(
                              padding: const EdgeInsetsDirectional.only(top: 16, bottom: 12, start: 16, end: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CommonAvatar(
                                        path: _userIcon,
                                        size: 70,
                                        shape: BoxShape.circle,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(maxWidth: bubbleWidth - 110),
                                            child: Text(
                                              _name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: R.colors.mainTextColor, fontSize: 17, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Container(
                                            constraints: BoxConstraints(maxWidth: bubbleWidth - 130),
                                            child: (isTop)
                                                ? Text(
                                                    K.chat_join_me,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: R.colors.secondTextColor, fontSize: 13),
                                                  )
                                                : Text(
                                                    K.chat_lets_chat,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: R.colors.secondTextColor, fontSize: 13),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () {
                                      if (isTop) {
                                        _roomManager.openChatRoomScreenShow(context, _roomId, matchRid: _roomId, refer: 'im_in_room');
                                      } else {
                                        _roomManager.createRoomAndInviteFriend(context, widget.targetId, refer: 'im_room_prompt');
                                      }

                                      setState(() {
                                        isShowInviteRoom = false;
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 48,
                                        alignment: AlignmentDirectional.center,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadiusDirectional.all(Radius.circular(16)),
                                            gradient: LinearGradient(colors: R.colors.mainBrandGradientColors)),
                                        child: Text(K.chat_join,
                                            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          top: (isTop) ? 7 : 0,
                          end: 2,
                          child: IconButton(
                            icon: R.img(
                              Assets.chat$chat_card_close_svg,
                              color: R.colors.secondTextColor,
                              package: ComponentManager.MANAGER_CHAT,
                              width: 15,
                              height: 15,
                            ),
                            color: R.colors.secondTextColor,
                            onPressed: () {
                              setState(() {
                                isShowInviteRoom = false;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
    } else {
      return Container();
    }
  }

  _onPlayGiftComplete(GiftConfig config) {
    if (_gifts.contains(config) || _queue.isNotEmpty) {
      if (mounted) {
        setState(() {
          _gifts.remove(config);
          if (_queue.isNotEmpty) {
            _gifts.add(_queue.removeAt(0));
          }
          Log.d("userChatScreen,_onPlayGiftComplete:${config.isCanAwake},${config.fromUid}");
          if (config.isCanAwake && Session.uid == config.fromUid && !Constant.awakenedGifts.contains(config.id.toString())) {
            /// 送礼方弹窗提醒跳转图鉴主页
            IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.showGiftWallDialog(context, Session.uid, config.id, config.name);
          }
        });
      }
    }
  }

  Widget _buildBody() {
    if (_targetDeleted) {
      return ErrorData(
        error: _reason,
        fontColor: R.colors.mainTextColor,
      );
    }

    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    bool hiddenInput = widget.type == ConversationType.Private &&
        ChatUtil.isSystemUser(widget.targetId) &&
        ChatUtil.isCustomerService(widget.targetId) == false &&
        ChatUtil.isVipCustomerService(widget.targetId) == false;
    hiddenInput |= widget.type == ConversationType.Private && _isSuper;

    // 如果go/yy/cloud/profile接口返回的closeSendMsg开关为true，则强制隐藏输入框视图
    if (_hasServiceSettingData && _resData?.serviceSetting.closeSendMsg != null && _resData?.serviceSetting.closeSendMsg == true) {
      hiddenInput = _resData!.serviceSetting.closeSendMsg;
    }
    _hideInput = hiddenInput;
    List<Widget> bodyStack = [
      Column(
        children: <Widget>[
          Offstage(
            offstage: !_reverse,
            child: _renderHeader(context),
          ),

          if (widget.type == ConversationType.Private && !ChatUtil.isSystemUser(widget.targetId) && !_isSuper && _roomId > 0)
            _buildRoomStatus(),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: _resData?.chatBgImage.isNotEmpty == true
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(Util.getRemoteImgUrl(_resData!.chatBgImage)),
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                ),
                _resData?.chatBgImage.isNotEmpty == true
                    ? Container(
                        color: darkMode ? const Color(0x4D000000) : const Color(0x4DFFFFFF),
                      )
                    : const SizedBox.shrink(),
                GestureDetector(
                  onTap: () {
                    closeKeyboard();
                  },
                  child: NotificationListener<ScrollNotification>(
                    onNotification: handleNotification,
                    child: ListView.builder(
                      key: _listViewKey,
                      padding: EdgeInsetsDirectional.only(bottom: hiddenInput ? Util.iphoneXBottom : 0.0),
                      physics: const AlwaysScrollableScrollPhysics(),
                      addAutomaticKeepAlives: false,
                      cacheExtent: 220.0,
                      shrinkWrap: false,
                      controller: controller,
                      itemCount: _data.length + 1,
                      reverse: _reverse,
                      itemBuilder: (BuildContext context, int index) {
                        if (_reverse) {
                          if (index == _data.length) {
                            return buildCardColumn();
                          }
                        } else {
                          if (index == 0) {
                            return buildCardColumn();
                          } else {
                            index--;
                          }
                        }
                        MessageContent message = _data.elementAt(index);
                        MessageContent? lastMsg;
                        if (_reverse) {
                          lastMsg = index < _data.length - 1 ? _data[index + 1] : null;
                        } else {
                          lastMsg = index > 0 ? _data[index - 1] : null;
                        }
                        if (lastMsg != null &&
                            _times[message.messageId] != null &&
                            _times[message.messageId] == _times[lastMsg.messageId]) {
                          message.displayTime = null;
                        } else {
                          message.displayTime = _times[message.messageId];
                        }
                        return MessageItem(
                          key: _keys[message.messageId],
                          message: message,
                          modify: _modify,
                          isSelected: (_modify && _selected.containsKey(message.messageId)) ? _selected[message.messageId]! : false,
                          onChangeModifyMode: onChangeModifyMode,
                          onSelectChanged: _onSelectChanged,
                          refer: const PageRefer('UserChatScreen'),
                          userIcon: _latestUserIcons[message.user!.id],
                          targetIcon: _userIcon,
                          targetName: _title,
                          targetUid: '${widget.targetId}',
                          isLastMsg: _reverse ? index == 0 : index == _data.length - 1,
                          isKAUser: _resData?.chatBgImage.isNotEmpty == true ? true : false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: _reverse,
            child: _renderHeader(context),
          ),
          RecruitGs(targetId: widget.targetId, onTap: closeKeyboard),
          // 如果go/yy/cloud/profile接口返回的closeShortcutMenu开关为false，则展示输入框上面的快捷文本视图
          if (showBottomQuickQABar)
            Container(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 10, bottom: 0),
              height: 40,
              width: Util.width,
              alignment: Alignment.center,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = bottomQuickQAMenuList![index];
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          onSelectQuickQAMenu(item, index);
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration:
                              BoxDecoration(color: R.colors.secondBgColor, borderRadius: const BorderRadius.all(Radius.circular(15))),
                          child: Text(
                            item.name,
                            style: TextStyle(fontSize: 12, color: R.colors.mainTextColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                },
                itemCount: bottomQuickQAMenuList!.length,
                scrollDirection: Axis.horizontal,
              ),
            ),

          renderInput(hiddenInput, keyboard)
        ],
      )
    ];

    bodyStack.addAll(_buildGift());

    bodyStack.add(const EmojiPlayer());
    bodyStack.add(_renderInviteRoomBubble());

    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: bodyStack,
          ),
        ),
      ],
    );
  }

  Widget _buildRoomStatus() {
    return Rext.themeCardContainer(
      height: 44,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      darkBgColors: const [
        Color(0x306CFFFF),
        Color(0x306CFFFF),
      ],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonAvatar(path: _resData?.roomCover, size: 30, shape: BoxShape.circle),
          const SizedBox(width: 4),
          R.img(
            BaseAssets.shared$in_room_status_webp,
            package: ComponentManager.MANAGER_BASE_CORE,
            color: R.colors.highlightColor,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${BaseK.K.playing}：', style: TextStyle(color: R.colors.highlightColor, fontSize: 14)),
                Flexible(
                  child: Text(
                    '${_resData?.roomName}',
                    style: TextStyle(color: R.colors.highlightColor, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(K.chat_room_name_suffix, style: TextStyle(color: R.colors.highlightColor, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              _roomManager.openChatRoomScreenShow(context, _roomId, refer: 'chat');
            },
            child: Container(
              width: 58,
              height: 29,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                ),
              ),
              child: Text(K.chat_room_goto, style: TextStyle(color: R.colors.brightTextColor, fontSize: 13, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  /// 选中了某个底部快捷回复菜单的事件，可能会被子类重新，以此达到自定义操作的目的
  void onSelectQuickQAMenu(ServiceShortcutMenu menu, int index) async {
    int id = Util.parseInt(menu.id);
    String subject = menu.name;
    if (id <= 0 || subject.isEmpty) return;

    // 模拟人为输入
    MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = subject;
    content.extra = json.encode({
      'type': 'auto-chat-category-reply',
      'id': id,
      'no_auto_chat': 1, // 不触发自动回复
    });
    await Im.sendMessage(widget.type, widget.targetId.toString(), content);
    _trackBySend(); // 发送消息后的上报

    // 防止后面回复比输入先出来
    await Future.delayed(const Duration(milliseconds: 300));

    Map<String, String> params = {
      'id': id.toString(),
      'service': widget.targetId.toString(),
    };

    try {
      // 多轮对话最后一轮走自动应答逻辑
      await Xhr.postJson('${System.domain}auto/multiReply', params, throwOnError: false);
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  Widget _buildPageTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: R.colors.mainTextColor, fontSize: 17, fontWeight: FontWeight.w600, fontFamily: Util.fontFamily),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = _targetDeleted ? [] : _buildActions();
    Color bgColor = darkMode ? R.colors.mainBgColor : R.colors.mainBgColor;
    Scaffold screen = Scaffold(
      backgroundColor: bgColor,
      appBar: defaultConfig.showAppBar
          ? BaseAppBar.custom(
              leading: buildLeading(),
              title: _buildTitle(),
              actions: actions,
              backgroundColor: bgColor,
              suppDark: true,
            )
          : null,
      body: _buildBody(),
    );

    if (widget.fromRoomPanel == true) {
      double keyboard = MediaQuery.of(context).viewInsets.bottom;
      return GestureDetector(
        onTap: () {
          closeKeyboard();
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints(maxHeight: (keyboard > 0 || _quickReplyPanelShow) ? Util.height * 0.80 : Util.height * 0.67),
          decoration: BoxDecoration(
            color: R.colors.mainBgColor,
            borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(14), topEnd: Radius.circular(14)),
          ),
          child: screen,
        ),
      );
    } else if (Util.parseInt(widget.hiMatchScore) > 0) {
      return WillPopScope(
          onWillPop: () async {
            if (Im.firstSend == true && _selfEnabled) {
              _showQuitDialog();
            } else {
              Navigator.of(context).pop();
            }
            return false;
          },
          child: screen);
    } else {
      return screen;
    }
  }

  void closeKeyboard() {
    if (_inputKey.currentState != null) {
      (_inputKey.currentState as ChatStateMixin?)?.close();
    }
  }

  List<Widget> _buildGift() {
    List<Widget> bodyStack = [];
    if (_gifts.isNotEmpty) {
      for (var config in _gifts) {
        bodyStack.add(DisplayGift(
          key: config.key,
          config: config,
          onComplete: _onPlayGiftComplete,
        ));
      }
    }

    return bodyStack;
  }

  Widget _buildTitle() {
    /// 编辑时可能存在自定义的 title
    var title = _title;
    if (_modify && !Util.isStringEmpty(defaultConfig.editingTitle)) {
      title = defaultConfig.editingTitle!;
    }

    List<Widget> titles = [];
    titles.add(SizedBox(width: _actionWidth / 2));
    titles.add(NobilityCornerMarker(titleNew: _titleNew, height: 32, padding: const EdgeInsetsDirectional.only(end: 3.0)));

    titles.add(
      Flexible(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            // if (!ChatUtil.isSystemUser(widget.targetId) && _intimacy > 0) {
            //   IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
            //   rankManager.showCompanionRankPage(context, widget.targetId, 'chat');
            // }
          },
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: _buildPageTitle(title, _titleNew),
                  ),
                  if (!Util.isStringEmpty(_resData?.holdHandIcon)) // 我的好哥哥
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: R.img(Util.getRemoteImgUrl(_resData?.holdHandIcon), height: 22),
                    ),
                  if (_showDaka || _showJiaren) // 大咖外显 ｜ 佳人外显
                    ...[
                    const SizedBox(width: 4),
                    _showDaka ? dakaWidget() : jiarenWidget(), // 优先显示大咖
                  ],
                  if (!Util.isStringEmpty(_userTag)) ...[
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                      height: 22,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(R.imagePath("chat_user_tag_bg.png", package: ComponentManager.MANAGER_CHAT)),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _userTag!,
                          style: const TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ),
                    )
                  ]
                ],
              ),
              // _buildTitleTips()
            ],
          ),
        ),
      ),
    );

    if (widget.official == 1) {
      titles.add(const SizedBox(width: 4));
      titles.add(
          R.img(BaseAssets.shared$ic_official_png, width: 26, height: 16, fit: BoxFit.fill, package: ComponentManager.MANAGER_BASE_CORE));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: titles,
    );
  }

  Widget _buildTitleTips() {
    if (!ChatUtil.isSystemUser(widget.targetId) && _intimacy > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          R.img("chat_intimacy_icon.webp", width: 8, height: 7, package: ComponentManager.MANAGER_CHAT),
          const SizedBox(width: 2),
          Text(
            K.chat_intimacy_num,
            style: const TextStyle(fontSize: 11, color: Color(0xFFFF7E96)),
          ),
          const SizedBox(width: 2),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text('$_intimacy',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_intimacy),
                style: const TextStyle(fontSize: 11, color: Color(0xFFFF7E96))),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget buildLeading() {
    return Stack(clipBehavior: Clip.none, children: <Widget>[
      Center(
        child: InkWell(
          onTap: () {
            if (Util.parseInt(widget.hiMatchScore) > 0) {
              if (Im.firstSend == true && _selfEnabled) {
                _showQuitDialog();
              } else {
                Navigator.of(context).pop();
              }
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            width: kToolbarHeight,
            height: kToolbarHeight,
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_titlebar_back.svg',
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: R.colors.mainTextColor,
            ),
          ),
        ),
      ),
      if (_unread > 0)
        PositionedDirectional(
            start: 36.0,
            top: 0.0,
            bottom: 0.0,
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  padding: _unread > 9
                      ? const EdgeInsetsDirectional.only(start: 6, end: 6, bottom: 1)
                      : const EdgeInsetsDirectional.only(bottom: 1),
                  width: _unread > 9 ? null : 24,
                  height: 16,
                  decoration: BoxDecoration(color: R.colors.thirdBrightColor, borderRadius: BorderRadius.circular(9)),
                  child: Text(
                    _unread <= 99 ? _unread.toString() : '99',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                  )),
            ))
    ]);
  }

  List<Widget> _buildActions() {
    _actionWidth = 0;
    List<Widget> actions = [];
    if (_modify) {
      actions.add(IconButton(
        icon: R.img('chat_icon_delete.svg', package: ComponentManager.MANAGER_CHAT, color: R.colors.mainTextColor, width: 24, height: 24),
        onPressed: _removeSelectedMessage,
      ));
      actions.add(IconButton(
          icon: R.img(
            'chat_close.svg',
            package: ComponentManager.MANAGER_CHAT,
            color: R.colors.mainTextColor,
            width: 24,
            height: 24,
          ),
          onPressed: () {
            cancelModify();
          }));
    } else if (widget.type == ConversationType.Group && widget.targetId > 0) {
      if (_roomId > 0 && _groupEnabled) {
        actions.add(
          IconButton(
            icon: R.img(
              "chat_in_room.webp",
              package: ComponentManager.MANAGER_CHAT,
              width: 60,
              height: 20,
            ),
            iconSize: 60,
            padding: const EdgeInsetsDirectional.only(end: 0),
            onPressed: () {
              PulseLog.instance.event('click_event', properties: {
                'click_tag': 'chat_page_title_room_$_roomId',
              });
              int rid = _roomId;
              _roomManager.openChatRoomScreenShow(context, rid, refer: 'chat');
            },
          ),
        );
        _actionWidth += 60;
      }

      if (_purviewLoading == false || (_chatGroupConfig?.applyNum ?? 0) > 0) {
        actions.add(Stack(
          children: [
            if (_purviewLoading == false)
              IconButton(
                  icon: R.img(
                    "chat_top_contact.svg",
                    package: ComponentManager.MANAGER_CHAT,
                    color: R.colors.mainTextColor,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () async {
                    PulseLog.instance.event('click_event', properties: {
                      'click_tag': 'chat_page_top_contact',
                    });
                    if (ChatUtil.isGroupId(widget.targetId)) {
                      if (_isPartyGroup) {
                        _groupManager.openGroupManagerScreen(context, widget.targetId);
                      } else {
                        _groupManager.openGroupInfoScreen(
                          context,
                          groupId: widget.targetId,
                          title: _title,
                        );
                      }
                    }
                  }),
            if ((_chatGroupConfig?.applyNum ?? 0) > 0)
              const PositionedDirectional(
                end: 10,
                top: 10,
                child: RedDot(width: 13, height: 13),
              ),
          ],
        ));
      }
    } else if (widget.type == ConversationType.Private && !ChatUtil.isSystemUser(widget.targetId) && !_isSuper) {
      // if (widget.type == ConversationType.Private &&
      //     !ChatUtil.isSystemUser(widget.targetId) &&
      //     !_isSuper &&
      //     Util.parseBool(_resData?.showSweetAlbum)) {
      //   actions.add(GestureDetector(
      //     onTap: () {
      //       _roomManager.openSweetAlbum(context, widget.targetId, refer: 'chat_in');
      //     },
      //     child: UnconstrainedBox(
      //       child: Padding(
      //         padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      //         child: R.img(
      //           Assets.chat$ic_sweet_album_webp,
      //           width: 36,
      //           height: 28,
      //         ),
      //       ),
      //     ),
      //   ));
      // }

      actions.add(GestureDetector(
          onTap: () async {
            await ChatSettingScreen.show(context, widget.targetId, widget.title, widget.type, icon: _userIcon, msgList: _data)
                .then((value) {
              if (value != null && value.isNotEmpty && value != _title) {
                _title = value;
              }
              // 这里直接请求接口吧，不然侧滑返回兼容
              _loadConfig();
            });
          },
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
              child: R.img(
                'ic_list_more.svg',
                package: ComponentManager.MANAGER_CHAT,
                width: 24,
                height: 24,
                color: R.colors.mainTextColor,
              ),
            ),
          )));
    }

    if (actions.isEmpty) {
      actions.add(
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
            color: Colors.transparent,
          ),
        ),
      );
    }
    return actions;
  }

  Widget buildCardColumn() {
    return Column(
      children: [
        (widget.hiMatchScore > 0)
            ? HiMatchChatCard(matchScore: widget.hiMatchScore, data: _homeProfileData, uid: widget.targetId)
            : chatCard ?? Container(),
      ],
    );
  }

  void _showQuitDialog() async {
    bool? confirm = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.chat_hi_quit_title,
            content: K.chat_hi_quit_title_desc([(Util.getSexDesc(_sex))]),
            positiveButton: PositiveButton(text: K.chat_say_hi),
            negativeButton: NegativeButton(text: K.chat_sure_quit),
          );
        });

    Tracker.instance.track(TrackEvent.mystery_match_touch_tips, properties: {'is_sayih': confirm});

    if (confirm == true) {
      ResMsgList resMsgList = await ChatRepo.getSayHiMsgList();
      if (resMsgList.success) {
        MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
        final random = Random();
        int length = resMsgList.list.length;
        content.content = resMsgList.list[random.nextInt(length)];
        await Im.sendMessage(widget.type, '${widget.targetId}', content);
      } else {
        Fluttertoast.showCenter(msg: resMsgList.msg);
      }
    } else {
      Navigator.of(context).pop();
    }
  }

  String getShowNum(int value) {
    if (value <= 0) {
      return '0';
    }
    if (value > 0 && value < 10) {
      return '0$value';
    }
    if (value < 100) {
      return value.toString();
    }
    return '99+';
  }

  void _goUserProfilePageForAbility() {
    IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.targetId, refer: const PageRefer('ability_chat_header'), initialTabName: 'rush_ability');
  }

  UserInfo? _convertFromGroupConfig() {
    if (_chatGroupConfig == null) {
      return null;
    }

    List<String> members = [];
    if (!Util.isCollectionEmpty(_chatGroupConfig!.memberList)) {
      for (var element in _chatGroupConfig!.memberList) {
        members.add(element.icon);
      }
    }

    UserInfo userInfo = UserInfo(_chatGroupConfig!.uid, _chatGroupConfig!.name, _chatGroupConfig!.icon, members, '', null, 0, 0, '',
        lvIcon: _chatGroupConfig!.lvIcon);
    userInfo.official = _chatGroupConfig!.official;

    return userInfo;
  }

  /// 是否派对群
  bool get _isPartyGroup => _chatGroupConfig?.type == ChatGroupTypes.PARTY;

  /// 显示配置，可能被子类调整属性值，以此达到 UI 异化显示的功能
  final ChatScreenConfig defaultConfig = ChatScreenConfig();

  /// 自定义方式拉取历史消息，可能被子类重新，以此达到切换数据源的功能
  Future<List<MessageContent>> loadCustomHistoryMsg() async {
    return [];
  }

  /// 是否显示底部输入框的快捷回复工具条, 可能被子类重新，以此达到切换数据源的功能
  bool get showBottomQuickQABar {
    return _hasServiceSettingData &&
        _resData?.serviceSetting.closeShortcutMenu != null &&
        _resData?.serviceSetting.closeShortcutMenu == false &&
        _resData?.serviceSetting.shortcutMenu != null &&
        _resData!.serviceSetting.shortcutMenu.isNotEmpty;
  }

  /// 底部输入框的快捷回复工具条数据源, 可能被子类重新，以此达到切换数据源的功能
  List<ServiceShortcutMenu>? get bottomQuickQAMenuList => _resData?.serviceSetting.shortcutMenu;

  /// 自定义通知处理方式，可能被子类重新，以此达到处理滑动事件的功能
  bool handleNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {}
    return false;
  }

  /// 是否处于编辑模式，子类需要访问该属性
  bool get isInModify => _modify;

  /// 是否处于翻转模式，子类需要访问该属性
  bool get isListViewReverse => _reverse;

  /// 动态推荐下发消息上报: 判断前10消息中是否存在系统推荐的动态消息
  bool get _needTrackByDynamic {
    MessageContent? item = _data.take(10).firstWhereOrNull((e) {
      Map extra = e.getExtraMap();
      return extra['type'] == 'share_moment' && extra['system_rcmd'] == 1;
    });
    return item != null;
  }

  /// 自动招呼建联下发消息上报
  bool get _needTrackBySmart => _resData?.smartGreet == 1;

  void _trackBySend() {
    Log.d("UserChatScreen track => smart_greet: $_needTrackBySmart");
    if (_needTrackBySmart) {
      Tracker.instance.track(TrackEvent.smart_reply, properties: {
        'target_uid': widget.targetId,
        'gs': Session.joinBroker,
        'reply_time': DateTime.now().millisecondsSinceEpoch,
      });
    }
    Log.d("UserChatScreen track => dynamic: $_needTrackByDynamic");
    if (_needTrackByDynamic) {
      Tracker.instance.track(TrackEvent.dynamic_reply, properties: {
        'target_uid': widget.targetId,
        'gs': Session.joinBroker,
        'reply_time': DateTime.now().millisecondsSinceEpoch,
      });
    }
  }

  /// 防打扰弹框
  void _showNotDisturbDialog() async {
    if (!Session.isNewer) return; // 非新用户不弹，新用户标准由服务端控制
    bool? needShow = await HiveUtil.get<bool>('${Session.uid}_NotDisturb', defaultValue: true); // 保证只弹一次
    if (needShow != true) return;
    await HiveUtil.put<bool>('${Session.uid}_NotDisturb', false);
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: K.chat_not_disturb,
          contentBuilder: (_) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  K.chat_not_disturb_tip,
                  style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  K.chat_not_disturb_sub_tip,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 10,
                  ),
                ),
              ],
            );
          },
          positiveButton: PositiveButton(
            text: K.chat_one_key_open,
            onPressed: () {
              Navigator.of(context).pop();
              ChatRepo.closeMsgReceiver();
            },
          ),
        );
      },
    );
  }
}
