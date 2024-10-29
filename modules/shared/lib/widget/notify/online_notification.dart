import 'package:flutter/material.dart';
import 'package:shared/model/online_notify_model.dart';
import 'package:shared/shared.dart';

typedef LeaveChannelCallBack = Function(bool needLeavel);

class OnlineNotification extends StatefulWidget {
  final Map? mapContent;
  final LeaveChannelCallBack? dismissCallBack;

  const OnlineNotification({super.key, this.mapContent, this.dismissCallBack});

  @override
  _OnlineNotificationState createState() => _OnlineNotificationState();
}

class _OnlineNotificationState extends State<OnlineNotification> {
  OnlineNotificationData? _data;

  static const _REFER = "OnlineNotification";

  @override
  void initState() {
    super.initState();

    if (widget.mapContent != null && widget.mapContent!.isNotEmpty) {
      _data = OnlineNotificationData.fromJson(widget.mapContent as Map<String, dynamic>);
    }

    eventCenter.addListener(Im.EventCmd, _onCmd);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //处理语音通话 B在后台 A呼叫B A取消 发送leavel cmd后 B进入前台 弹出被呼叫界面 B不知道A已取消
      if (widget.mapContent != null &&
          widget.mapContent!['channelName'] != null &&
          widget.mapContent!['channelName'] is String &&
          Config.getBool(widget.mapContent!['channelName'], false)) {
        if (widget.dismissCallBack != null) {
          await Xhr.postJson("${System.domain}agora/leavel", {'channelName': widget.mapContent!['channelName'], 'reason': '1'});
          widget.dismissCallBack!(false);
        }
      }
    });
  }

  @override
  void dispose() {
    eventCenter.removeListener(Im.EventCmd, _onCmd);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // test for UI
    // _data = OnlineNotificationData('party_invite', '', 1, 3, '名字', '内容内容内容内容内容内容内容内容内容内容', '按钮');

    if (_data == null || _data!.getType() == NotificationType.Unknown) {
      return Container();
    }

    Widget widget = _buildBasicInfo(true);

    return ClipRRect(
      child: GestureDetector(
        onTap: () {
          _onBtnClick(false);
        },
        child: Container(
          width: Util.width - 16.0,
          margin: EdgeInsetsDirectional.only(top: MediaQuery.of(context).padding.top + 8.0, start: 8.0, end: 8.0, bottom: 16.0),
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: R.colors.mainBgColor,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), offset: const Offset(0, 2), blurRadius: 12)],
          ),
          child: widget,
        ),
      ),
    );
  }

  Row _buildBasicInfo(bool showBtn) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getIcon(),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _data!.userName ?? '',
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _data!.content ?? '',
                style: TextStyle(color: R.colors.secondTextColor, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        const SizedBox(width: 42),
        if (!Util.isStringEmpty(_data!.btnText) && showBtn)
          GestureDetector(
              onTap: () {
                _onBtnClick(true);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 14, end: 14, top: 5, bottom: 5),
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient: LinearGradient(
                    colors: R.colors.secondBrandGradientColors,
                  ),
                ),
                child: Text(
                  _data!.btnText!,
                  style: TextStyle(color: R.colors.mainBgColor, fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ))
      ],
    );
  }

  Widget _getIcon() {
    if (_data!.getType() == NotificationType.IM) {
      int uid = _data!.uid;
      if (ChatUtil.isSystemNotice(uid)) {
        return _renderLocalIcon('system');
      } else if (ChatUtil.isCustomerService(uid) || ChatUtil.isCustomerService(uid)) {
        return _renderLocalIcon('service');
      } else {
        return CommonAvatar(
          path: _data!.icon,
          size: 52,
          shape: BoxShape.circle,
        );
      }
    } else {
      return CommonAvatar(
        path: _data!.icon,
        size: 52,
        shape: BoxShape.circle,
      );
    }
  }

  Widget _renderLocalIcon(String icon) {
    return ClipOval(child: Rext.autoStyleImg('chat_$icon.webp', width: 52, height: 52, package: ComponentManager.MANAGER_MESSAGE));
  }

  _onCmd(String event, dynamic value) async {
    Map res = value;
    String name = Util.notNullStr(res['name']);
    Map data = res['data'] is Map && res['data'].isNotEmpty ? res['data'] : {};

    if (name == 'leavel') {
      Log.d('leavel ------ onlinenotification');
      //通话被呼叫弹框展示时未接听也未拒听 对方挂断 弹框消失
      if (widget.mapContent == null || widget.mapContent!['channelName'] == null) return;

      if (data['channelName'] != null && data['channelName'] == widget.mapContent!['channelName']) {
        // int reason = Util.parseInt(data['reason']);
        if (widget.dismissCallBack != null) {
          widget.dismissCallBack!(true);
        }
      }
    }
  }

  _onBtnClick(bool fromBtn) {
    if (widget.dismissCallBack != null) {
      widget.dismissCallBack!(true);
    }

    switch (_data!.getType()) {
      case NotificationType.PartyInvite:
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, _data!.rid,
            from: RoomFrom.online_notification, refer: 'party_invitation', uid: _data!.uid);
        break;

      case NotificationType.FriendApply:
        IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        if (fromBtn) {
          manager.acceptMatchRequest(_data!.uid);
        } else {
          manager.openMatchRequestListPage(context, 0);
        }
        break;
      case NotificationType.BeFriend:
        IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(
          context,
          type: ConversationType.Private,
          targetId: _data!.uid,
          refer: _REFER,
        );
        break;

      case NotificationType.IM:
        if (ChatUtil.isMomentMsgId(_data!.uid)) {
          IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
          manager.openMomentImMsgListScreen(context);
          return;
        }

        if (ChatUtil.isMatchFriendsId(_data!.uid)) {
          IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
          manager.openMatchRequestListPage(context, 0);
          return;
        }

        // 生日管家
        if (ChatUtil.isChatBirthdayNotify(_data!.uid)) {
          final IRoomManager roomManager0 = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager0.openBirthdayListPage(context);
          Im.clearMessagesUnreadStatus(ConversationType.Private, _data!.uid.toString());
          Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'click_birthdaypage'});
          return;
        }

        // 主播任务平台助手
        if (ChatUtil.isAnchorTaskNotice(_data!.uid)) {
          IProfileManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
          manager.openAnchorTaskScreen(context, isAide: true);
          Im.clearMessagesUnreadStatus(ConversationType.Private, _data!.uid.toString());
          Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'gsPlatformIMEntrance'});
          return;
        }

        // 打赏消息（陌生人）
        if (ChatUtil.isRewardNotice(_data!.uid)) {
          IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
          messageManager.openRewardStrangerScreen(context);
          Im.clearMessagesUnreadStatus(ConversationType.Private, _data!.uid.toString());
          Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'click_rewards_news'});
          return;
        }

        IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(
          context,
          type: ConversationType.Private,
          targetId: _data!.uid,
          refer: _REFER,
        );

        break;

      default:
        break;
    }
  }
}
