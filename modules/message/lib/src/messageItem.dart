import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/message.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';

typedef OnAwaitRemoveList = Function(String type);
typedef OnHiTap = void Function(String type);

/// 消息页item
class MessageItem extends StatefulWidget {
  static const double ITEM_EXTENT = 72.0;

  final Conversation conv;
  final UserConfig? config;
  final OnConversationOperate? onChanged;
  final OnAwaitRemoveList? onRemoveHiList;
  final OnDeleteByInner? onDeleteByInner;
  final OnHiTap? onHiTap;
  final bool isLast;
  final bool inHiList;
  final double? padding;
  final GestureTapCallback? onTap;
  final PageRefer? refer;
  final GestureLongPressCallback? onLongTap;
  final bool fromRoomPanel;
  final Map? userTagMap;
  final Map? extraInfo; // MessageItem 的一些额外信息，跳转会用到

  const MessageItem({
    super.key,
    required this.conv,
    this.config,
    this.isLast = false,
    this.onChanged,
    this.onRemoveHiList,
    this.onDeleteByInner,
    this.onHiTap,
    this.inHiList = false,
    this.padding,
    this.onTap,
    this.refer,
    this.onLongTap,
    this.fromRoomPanel = false,
    this.userTagMap,
    this.extraInfo,
  });

  @override
  MessageItemState createState() => MessageItemState();
}

class MessageItemState extends State<MessageItem> {
  final IChatManager _chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  String _name = '';
  String _icon = '';
  String _frame = '';
  int _titleNew = 0;
  int _uid = 0;
  List<String> _membersIcon = [];
  int official = 0;
  int degree = 0;
  String? orderStatus;
  int? _starVerifyTag; // 明星加V标签
  String? _levelIcon; // 星舰群组等级勋章URL

  bool _showDaka = false; //显示大咖
  bool _showJiaren = false; //显示佳人
  bool _showAccost = false; //快捷交友
  String _userMachine = ''; //设备登记标签

  String get name => _name;

  @override
  void initState() {
    super.initState();
    _init();
    CachedNames.instance().addEvent(_uid, _onChanged);
    eventCenter.addListener(BaseRequestManager.ChatEggTitleChangedEvent, _onChatEggTitleChanged);
  }

  @override
  void didUpdateWidget(MessageItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.conv.targetId != oldWidget.conv.targetId || widget.conv.type != oldWidget.conv.type) {
      _init();
    } else {
      _load();
    }
  }

  @override
  void dispose() {
    CachedNames.instance().removeEvent(_uid);
    eventCenter.removeListener(BaseRequestManager.ChatEggTitleChangedEvent, _onChatEggTitleChanged);
    super.dispose();
  }

  void _onChatEggTitleChanged(String type, dynamic data) {
    _onChanged();
  }

  void _onChanged() {
    if (mounted) {
      setState(() {
        _name = "";
        _init();
      });
    }
  }

  void _init() {
    _uid = Util.parseInt(widget.conv.targetId);
    IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    bool useDingDongAsHiConvName = messageManager.useDingDongAsHiConvName();

    // 打招呼
    if (widget.conv.type == ConversationType.Hi) {
      _name = useDingDongAsHiConvName ? K.msg_dingdong : BaseK.K.say_hi;
      return;
    }
    // 临时群
    else if (widget.conv.type == ConversationType.TempGroup) {
      _name = BaseK.K.temp_group;
      return;
    } else if (widget.conv.type == ConversationType.Accost) {
      _name = K.msg_auto_accost;
      return;
    } else if (widget.conv.type == ConversationTypeExt.Fate) {
      _name = K.msg_fate;
      return;
    }

    if (ChatUtil.isChatBirthdayNotify(_uid)) {
      _name = K.message_birthday_housekeeper;
      return;
    }

    if (widget.conv.lastMessage != null && widget.conv.type == ConversationType.Private) {
      if (widget.conv.lastMessage!.user != null && widget.conv.lastMessage!.user?.id == widget.conv.targetId) {
        SendUser? user = widget.conv.lastMessage!.user;
        _name = user?.name ?? '';
        _icon = user?.portraitUri ?? '';

        Map? extra = widget.conv.lastMessage?.extra;
        if (extra != null && extra['type'] == 'card_swipe_sayhi' && user?.id != null) {
          Im.addOrderSayhi(user!.id!);
        }
      }
    }

    _load();
  }

  bool get _isMute => widget.conv.notify == 2; //免打扰

  bool get _shouldShowLittleTipType {
    Map? extra = widget.conv.lastMessage?.extra;
    if (extra != null &&
        extra.containsKey('type') &&
        extra.containsKey('firstSend') &&
        extra['type'] == 'little_tip' &&
        Util.parseBool(extra['firstSend']) &&
        Config.getBool('little_tip_tag_not_showed_$_uid', true)) {
      return true;
    }
    return false;
  }

  /// app继承
  void onItemTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    }
    IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    bool useDingDongAsHiConvName = messageManager.useDingDongAsHiConvName();
    if (widget.conv.type == ConversationType.Hi && useDingDongAsHiConvName) {
      Tracker.instance.track(TrackEvent.dingdong, properties: {
        'with_type': _isPLayReserve(widget.conv) ? 'game' : 'greet',
      });
    }

    if (_shouldShowLittleTipType) {
      Config.setBool('little_tip_tag_not_showed_$_uid', false);
    }

    if (widget.conv.type == ConversationType.Hi ||
        widget.conv.type == ConversationType.Accost ||
        widget.conv.type == ConversationTypeExt.Fate ||
        widget.conv.type == ConversationType.TempGroup) {
      widget.onHiTap?.call(widget.conv.type);
      return;
    }

    if (widget.conv.type == ConversationType.Private) {
      int uid = Util.parseInt(widget.conv.targetId);
      if (ChatUtil.isSystemNotice(uid)) {
        Tracker.instance.track(TrackEvent.click_page, properties: {
          'page_name': 'msg',
          'click_button': 'sys',
        });
      }

      if (ChatUtil.isMomentMsgId(uid)) {
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        manager.openMomentImMsgListScreen(context);
        PulseLog.instance.event('click_event', properties: {
          'click_tag': 'message_item_${widget.refer}_MomentImMsgList',
        });
        return;
      }

      if (ChatUtil.isMatchFriendsId(uid)) {
        IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        manager.openMatchRequestListPage(context, 0);
        PulseLog.instance.event('click_event', properties: {
          'click_tag': 'message_item_${widget.refer}_MatchRequestLis',
        });
        return;
      }

      // 生日管家
      if (ChatUtil.isChatBirthdayNotify(uid)) {
        final IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openBirthdayListPage(context);
        Im.clearMessagesUnreadStatus(ConversationType.Private, widget.conv.targetId);
        Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'click_birthdaypage'});
        return;
      }

      /// 主播任务平台助手
      if (ChatUtil.isAnchorTaskNotice(uid)) {
        IProfileManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
        manager.openAnchorTaskScreen(context, isAide: true, isFullScreen: !widget.fromRoomPanel);
        Im.clearMessagesUnreadStatus(ConversationType.Private, widget.conv.targetId);
        Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'gsPlatformIMEntrance'});
        return;
      }

      /// 打赏消息（陌生人）
      if (ChatUtil.isRewardNotice(uid)) {
        IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        messageManager.openRewardStrangerScreen(context);
        Im.clearMessagesUnreadStatus(ConversationType.Private, widget.conv.targetId);
        Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'click_rewards_news'});
        return;
      }
    }

    _chatManager.openUserChatScreen(context,
        type: widget.conv.type,
        targetId: Util.parseInt(widget.conv.targetId),
        title: _name,
        isFromHiList: widget.inHiList,
        official: official,
        refer: '${widget.refer}',
        fromRoomPanel: widget.fromRoomPanel);

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'message_item_${widget.refer}_${widget.conv.targetId}',
    });
  }

  _load() async {
    try {
      UserInfo? info = await CachedNames.instance().get(_uid, widget.conv.type, onlyCache: false);
      // Log.d('------uid：$_uid，type：${widget.conv.type}，info：${info.toString()}');
      if (info != null && mounted) {
        setState(() {
          _name = info.markName;
          _icon = info.icon ?? '';
          _membersIcon = info.members ?? [];
          official = info.official;
          degree = info.degree;
          orderStatus = info.orderStatus;
          _starVerifyTag = info.starVerifyTag;
          _frame = info.frame ?? '';
          _titleNew = info.titleNew;
          _showDaka = (info.daka == 1);
          _showJiaren = (info.jiaren == 1);
          _showAccost = (info.accost == 1);
          _userMachine = info.userMachine;
          _levelIcon = info.lvIcon;
        });
//        Log.d("_load ok " + info.name + " -> " + info.mark);
      }
    } catch (e) {
      Log.d("_load error: ${e.toString()}");
    }
  }

  Widget _renderSingleIcon(String icon) {
    if (orderStatus != null && orderStatus!.isNotEmpty) {
      return Container(
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          border: Border.all(color: R.colors.mainBrandColor, width: 1),
        ),
        child: CommonAvatar(
          path: icon,
          size: 52,
          shape: BoxShape.circle,
        ),
      );
    }
    return CommonAvatar(
      path: icon,
      size: 52,
      shape: BoxShape.circle,
    );
  }

  Widget _renderSingleIconWithClick(String icon) {
    if (widget.config != null && widget.config!.room != null && widget.config!.room! > 0 && !Util.isSleeplessPlanetVerify) {
      String? name = widget.config!.roomTypeName;
      return StatusAvatar(
        roomName: name,
        userAvatar: icon,
        roomIcon: widget.config!.acuteIcon,
        colors: widget.config!.bgColors,
        radius: 26,
        avatarRadius: 23,
        uid: Util.parseInt(widget.conv.targetId),
        rid: widget.config!.room,
        refer: '${widget.refer}',
        frame: UserImageCacheHelper.instance().fullFramePath(_frame),
      );
    } else {
      return InkWell(
        onTap: () {
          Tracker.instance.track(TrackEvent.dingdong, properties: {
            'person_click': _isPLayReserve(widget.conv) ? 'game' : 'greet',
          });

          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, Util.parseInt(widget.conv.targetId), refer: widget.refer);

          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'message_item_${widget.refer}_user_icon',
          });
        },
        child: _renderSingleIcon(icon),
      );
    }
  }

  Widget renderIcon() {
    if (widget.conv.type == ConversationType.Hi) {
      return _renderLocalIcon('hi');
    } else if (widget.conv.type == ConversationType.Accost) {
      return _renderLocalIcon('accost');
    } else if (widget.conv.type == ConversationTypeExt.Fate) {
      return _renderLocalIcon('system'); // 临时先使用系统通知，后期上缘分的时候再替换
    } else if (widget.conv.type == ConversationType.Private) {
      int uid = Util.parseInt(widget.conv.targetId);
      if (ChatUtil.isChatBirthdayNotify(uid)) {
        return _renderLocalIcon('birthday');
      } else if (ChatUtil.isSystemNotice(uid)) {
        return _renderLocalIcon('system');
      } else if (ChatUtil.isMomentMsgId(uid)) {
        return _renderLocalIcon('moment');
      } else if (ChatUtil.isCustomerService(uid) || ChatUtil.isCustomerService(uid)) {
        return _renderLocalIcon('service');
      } else if (ChatUtil.isAnchorTaskNotice(uid)) {
        return _renderAnchorTaskIcon(); // 主播任务平台助手
      } else if (ChatUtil.isMatchFriendsId(uid)) {
        return _renderSingleIcon(_icon);
      } else if (_icon.isNotEmpty && _icon != "null") {
        return _renderSingleIconWithClick(_icon);
      }
    } else if (widget.conv.type == ConversationType.Group) {
      if (_icon.isNotEmpty) {
        return _renderSingleIcon(_icon);
      } else if (_membersIcon.isNotEmpty) {
        return GroupIconCircle(icons: _membersIcon);
      }
    } else if (widget.conv.type == ConversationType.TempGroup) {
      return _renderLocalIcon('tempgroup');
    } else {
      Log.d("renderIcon: ${widget.conv.type}");
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: R.img(
        "user_icon_default.png",
        width: 52,
        height: 52,
        package: ComponentManager.MANAGER_BASE_CORE,
      ),
    );
  }

  /// 主播任务平台助手单独处理
  Widget _renderAnchorTaskIcon() {
    return InkWell(
      onTap: () {
        Tracker.instance.track(TrackEvent.dingdong, properties: {
          'person_click': _isPLayReserve(widget.conv) ? 'game' : 'greet',
        });

        IProfileManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
        manager.openAnchorTaskScreen(context, isAide: true, isFullScreen: !widget.fromRoomPanel);
        Im.clearMessagesUnreadStatus(ConversationType.Private, widget.conv.targetId);
        Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'gsPlatformIMEntrance'});
      },
      child: _renderLocalIcon('task'),
    );
  }

  Widget _renderLocalIcon(String icon) {
    return ClipOval(child: Rext.autoStyleImg('chat_$icon.webp', width: 66, height: 66, package: ComponentManager.MANAGER_MESSAGE));
  }

  /// app继承
  onLongTap() async {
    if (widget.onLongTap != null) {
      widget.onLongTap!();
      return;
    }

    List<SheetItem> res = [];
    if (widget.conv.type != ConversationType.Hi && widget.conv.type != ConversationType.TempGroup) {
      if (widget.conv.isTop) {
        res.add(SheetItem(R.string('cancel_set_top'), "untop"));
      } else {
        res.add(SheetItem(R.string('set_top'), "top"));
      }
    }

    ///如果需要设置消息会话免打扰模式,那么需要转换自定义的ConversationType.Hi类型为融云对应的类型,否则报错
    res.add(SheetItem(R.string('delete'), "remove"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'remove') {
      if (widget.conv.type == ConversationType.Hi || widget.conv.type == ConversationType.TempGroup) {
        ///删除打招呼，需要消息(会话)列表遍历遍历打招呼列表中item，并删除会话后，更新消息(会话)列表
        if (widget.onRemoveHiList != null) {
          await widget.onRemoveHiList?.call(widget.conv.type);
        }
      } else {
        bool ok = await Im.removeConversation(widget.conv.type, widget.conv.targetId);

        ///删除操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
        if (ok) {
          widget.onChanged?.call(ConversationOperateType.Delete, widget.conv.type, widget.conv.targetId);

          // HiList、AccostList、GroupList 等二级页面 删除时 通知当前页面移除Item
          widget.onDeleteByInner?.call(widget.conv);
        }
      }
//      this.widget.onChanged();
    } else if (result.value?.key == 'top' || result.value?.key == 'untop') {
      bool ok = await Im.setConversationToTop(widget.conv.type, widget.conv.targetId, result.value?.key == 'top');

      ///置顶操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
      if (ok) {
        if (result.value?.key == 'top') {
          widget.onChanged?.call(ConversationOperateType.Top, widget.conv.type, widget.conv.targetId);
        }
        if (result.value?.key == 'untop') {
          widget.onChanged?.call(ConversationOperateType.UnTop, widget.conv.type, widget.conv.targetId);
        }
      }
//      this.widget.onChanged();
    }
  }

  bool shouldRenderLocalIcon() {
    int uid = Util.parseInt(widget.conv.targetId);
    return (widget.conv.type == ConversationType.Private &&
            (ChatUtil.isCustomerService(uid) ||
                ChatUtil.isCustomerService(uid) ||
                ChatUtil.isSystemNotice(uid) ||
                ChatUtil.isChatBirthdayNotify(uid))) ||
        widget.conv.type == ConversationTypeExt.Fate ||
        widget.conv.type == ConversationType.Accost ||
        widget.conv.type == ConversationType.Hi ||
        widget.conv.type == ConversationType.TempGroup;
  }

  bool shouldShowOfficeTag() {
    return ((ChatUtil.isSystemUser(Util.parseInt(widget.conv.targetId)) && widget.conv.type == ConversationType.Private) ||
        widget.conv.type == ConversationType.Accost ||
        widget.conv.type == ConversationTypeExt.Fate ||
        widget.conv.type == ConversationType.Hi ||
        official == 1);
  }

  Widget _renderItem(BuildContext context) {
    List<Widget> contents = [];

    if (shouldShowOfficeTag()) {
      /// 官方标识
      contents.add(
        Container(
          height: 14,
          constraints: const BoxConstraints(minWidth: 24),
          margin: const EdgeInsetsDirectional.only(end: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: R.colors.mainBrandColor, width: 1.0),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 1.0),
            child: Text(
              R.string('office'),
              style: TextStyle(
                fontSize: 9,
                color: R.colors.mainBrandColor,
                height: 1,
              ),
            ),
          ),
        ),
      );
    }

    Map? extra = widget.conv.lastMessage?.extra;

    String text = '';
    if (widget.conv.lastMessage != null) {
      if (widget.conv.lastMessage!.isSupport()) {
        text = widget.conv.lastMessage!.content.replaceAll("\n", "").replaceAll(" ", "");
        if (widget.conv.lastMessage!.extra['type'] == 'cp.house.invite' &&
            Util.parseInt(widget.conv.lastMessage!.user?.id) == Session.uid) {
          /// CP小屋邀请发送方则特殊展示，接收方统一使用content字段的内容
          text = K.msg_invite_ta_create_cp_house;
        }
        if (widget.conv.lastMessage!.type == 'info' && widget.conv.lastMessage!.extra['type'] == 'fate_tips') {
          if (Util.parseInt(widget.conv.lastMessage!.user?.id) == Session.uid) {
            /// 今日缘分，发送者
            text = K.msg_fate_msg_text_send;
          } else {
            /// 今日缘分，接收者
            text = K.msg_fate_msg_text_receive;
          }
        }
      } else {
        text = K.msg_type_not_supprt;
      }
    }

    if (widget.conv.atCount > 0) {
      contents.add(Text(
        K.msg_some_one_at_me,
        style: TextStyle(color: R.colors.thirdBrightColor, fontSize: 13),
      ));
    }

    contents.add(Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: R.colors.thirdTextColor,
            fontSize: 13,
          ),
        ),
      ),
    ));

    int unreadCount = widget.conv.unreadCount;
    if (unreadCount > 0) {
      contents.add(
        RedDot(
          width: 22,
          height: 22,
          showBorder: false,
          bgColor: _isMute ? (darkMode ? const Color(0x1AFFFFFF) : const Color(0x1A000000)) : null,
          textColor: _isMute ? R.colors.tipsTextColor : null,
          num: widget.conv.unreadCount,
        ),
      );
    } else if (Session.joinBroker == true &&
        (widget.conv.lastMessage?.user?.id ?? '') == Session.uid.toString() &&
        (extra?['is_auto_chat'] ?? false) != true) {
      /// 如果当前这个人是工会成员（即GS） && 最后一条消息是自己回的，则展示"已回" && 不是系统自动回复的消息
      contents.add(Container(
        width: 36,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: R.colors.moduleBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          K.message_has_replied,
          style: TextStyle(color: R.colors.secondTextColor, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ));
    }

    bool inRoom = widget.config != null && widget.config!.room != null && widget.config!.room! > 0;

    /// 如果在房，优先显示在房
    bool online = widget.config != null && widget.config!.online == 1 && !inRoom;

    bool isPlayReserve = _isPLayReserve(widget.conv);
    return InkWell(
      onTap: onItemTap,
      onLongPress: onLongTap,
      child: Rext.themeCardContainer(
        height: MessageItem.ITEM_EXTENT,
        alignment: AlignmentDirectional.centerStart,
        padding: widget.padding == null ? null : EdgeInsetsDirectional.only(start: widget.padding! - 10, end: widget.padding!),
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
        cornerRadius: 16,
        darkBgColors: R.colors.listItemBgWithTransparent,
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  alignment: AlignmentDirectional.center,
                  child: renderIcon(),
                ),
                if (online)
                  const PositionedDirectional(
                    end: 13,
                    bottom: 13,
                    child: OnlineDot(padding: 0),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: _buildName(_name, _titleNew),
                            ),
                            if (_showAccost)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: GradientBorder(
                                  borderGradient: const LinearGradient(
                                    begin: AlignmentDirectional.centerStart,
                                    end: AlignmentDirectional.centerEnd,
                                    colors: [Color(0xFF62C7D4), Color(0xFF42B1C2)],
                                  ),
                                  borderRadius: 36,
                                  borderWidth: 0.5,
                                  child: Container(
                                    width: 44,
                                    height: 16,
                                    alignment: Alignment.center,
                                    child: Text(
                                      K.msg_auto_accost,
                                      style: const TextStyle(color: Color(0xFF43B2C3), fontSize: 9),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 2),
                            if (widget.userTagMap?.containsKey(_uid) ?? false)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(end: 2),
                                child: CachedNetworkImage(
                                  imageUrl: Util.parseIcon(widget.userTagMap?[_uid]),
                                  height: 22,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            if (_titleNew > 0 && widget.conv.type == ConversationType.Private)
                              NobilityCornerMarker(titleNew: _titleNew, height: 26, padding: const EdgeInsetsDirectional.only(end: 3.0)),
                            if (_titleNew > 0 && widget.conv.type == ConversationType.Private) const SizedBox(width: 2),
                            if (_starVerifyTag != null && (_starVerifyTag == 1 || _starVerifyTag == 2 || _starVerifyTag == 3))
                              UserStarVerifyWidget(starVerifyTag: _starVerifyTag),
                            if (_showDaka || _showJiaren) // 大咖外显 | 佳人外显
                              ...[
                              const SizedBox(width: 4),
                              _showDaka ? dakaWidget() : jiarenWidget(), // 优先显示大咖
                            ],

                            /// 小纸条标识
                            if (_shouldShowLittleTipType)
                              Container(
                                width: 52,
                                height: 15,
                                margin: const EdgeInsetsDirectional.only(start: 4.0, bottom: 4.0),
                                child: R.img('ic_killer_little_page_tag.webp', package: ComponentManager.MANAGER_MESSAGE),
                              ),
                            if (isPlayReserve && widget.inHiList)
                              Container(
                                margin: const EdgeInsetsDirectional.only(start: 3),
                                padding: const EdgeInsetsDirectional.only(start: 5, end: 7, bottom: 2),
                                decoration: BoxDecoration(
                                  color: R.colors.fourthBgColor,
                                  borderRadius: const BorderRadiusDirectional.only(
                                      topStart: Radius.circular(8), topEnd: Radius.circular(8), bottomEnd: Radius.circular(8)),
                                ),
                                child: Text(
                                  R.string('want_to_be_invited'),
                                  style: TextStyle(
                                    color: R.colors.secondaryBrandColor,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            if (_userMachine.isNotEmpty)
                              Container(
                                margin: const EdgeInsetsDirectional.only(start: 4),
                                child: CachedNetworkImage(
                                  imageUrl: Util.getRemoteImgUrl(_userMachine),
                                  width: 26,
                                  height: 14,
                                ),
                              ),
                            if (Util.validStr(_levelIcon))
                              CachedNetworkImage(
                                imageUrl: Util.getRemoteImgUrl(_levelIcon),
                                fit: BoxFit.fitHeight,
                                height: 16,
                              ),
                          ],
                        ),
                      ),
                      // 时间
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 5.0),
                        child: Text(
                          (widget.conv.sentTime <= 0) ? '' : Utility.getDateDiff(widget.conv.sentTime ~/ 1000),
                          maxLines: 1,
                          style: TextStyle(
                            color: R.colors.thirdTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: contents,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName(String? name, int titleNew) {
    FontWeight fontWeight = FontWeight.w400;
    return Text(
      name ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, fontWeight: fontWeight, height: 1.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderItem(context);
  }

  bool _isPLayReserve(Conversation conv) {
    ConversationLastMessage? lastMessage = conv.lastMessage;
    Map? extra = lastMessage?.extra;
    if (extra != null) {
      String? type = extra['type'];
      if (type == 'play_reserve') {
        return true;
      }
    }
    return false;
  }
}
