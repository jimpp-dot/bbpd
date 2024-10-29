import 'dart:convert';
import 'dart:io';

import 'package:chat/k.dart';
import 'package:chat/src/model/chat_topic_model.dart';
import 'package:chat/src/msg/config.dart';
import 'package:chat/src/msg/displayAutoChat.dart';
import 'package:chat/src/msg/displayGiftMessage.dart';
import 'package:chat/src/msg/displayGreet.dart';
import 'package:chat/src/msg/displayGreetNew.dart';
import 'package:chat/src/msg/displayGroupApply.dart';
import 'package:chat/src/msg/displayGroupInvite.dart';
import 'package:chat/src/msg/displayInviteRoom.dart';
import 'package:chat/src/msg/displayMagicMsg.dart';
import 'package:chat/src/msg/displayPackageMessage.dart';
import 'package:chat/src/msg/displayPlayGameWish.dart';
import 'package:chat/src/msg/displaySendGiftTips.dart';
import 'package:chat/src/msg/displayServiceVote.dart';
import 'package:chat/src/msg/displayShareMoment.dart';
import 'package:chat/src/msg/displayToFollowTips.dart';
import 'package:chat/src/msg/displayTrueWordMessage.dart';
import 'package:chat/src/msg/display_accompany_house_build_invite.dart';
import 'package:chat/src/msg/display_intimate_card.dart';
import 'package:chat/src/msg/display_service_feedback.dart';
import 'package:chat/src/msg/display_service_mutireply.dart';
import 'package:chat/src/msg/topic_msg_item.dart';
import 'package:chat/src/msg/url_msg_item.dart';
import 'package:chat/src/util/chat_msg_util.dart';
import 'package:chat/src/widget/gif.dart';
import 'package:date_format/date_format.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:fluwx/fluwx.dart' as FlutterWx;
import 'package:shared/shared.dart';

import '../../assets.dart';
import '../model/share_moment_data.dart';
import 'builder/message_pk_invite.dart';
import 'builder/message_widget_builder.dart';
import 'displayIntimateGift.dart';
import 'displayIntimatePhoto.dart';
import 'displayInviteGame.dart';
import 'displayRcordVoiceGiftInvite.dart';
import 'displayReceiveGift.dart';
import 'displaySwindleTips.dart';
import 'display_birthday_tips.dart';
import 'display_cp_house_invite.dart';
import 'display_defend_break.dart';
import 'display_fate_im.dart';
import 'display_fate_tips.dart';
import 'display_gift_sign_message.dart';
import 'display_tacit.dart';
import 'display_tacit_tips.dart';
import 'voice_message_widget.dart';

part 'message_item.part.dart';

/// 聊天item
class MessageItem extends StatefulWidget {
  final MessageContent message;
  final MessageItemClick onChangeModifyMode;
  final MessageItemClick onSelectChanged;
  final bool modify;
  final bool isSelected; // 是否选中
  final PageRefer? refer;
  final String? userIcon;
  final String? targetIcon;
  final String? targetName;
  final String targetUid;
  final bool isLastMsg;
  final bool isKAUser;

  const MessageItem({
    super.key,
    required this.message,
    required this.onChangeModifyMode,
    required this.onSelectChanged,
    required this.modify,
    this.isSelected = false,
    this.refer,
    this.userIcon,
    this.targetIcon,
    this.targetName,
    required this.targetUid,
    this.isLastMsg = false,
    this.isKAUser = false,
  });

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  String? _icon;

  bool _isGroup = false;

  /// 陪伴小屋邀请消息
  bool _isAccompanyHouseBuildInvite = false;

  /// 针对收到的群红包消息做特殊处理：imsdk对接收到的群红包消息的sender信息做了处理，导致收到的群红包头像展示成自己了
  /// 暂时先在业务层针对群红包类型，做特殊处理
  /// 目前只有嗨歌在歌友群开启了群红包功能
  bool _isGroupPackage = false;

  /// 群红包消息对应的发送者
  SendUser? _groupPackageSendUser;

  Color get leftBgColor => darkMode ? const Color(0xFF2D3141) : Colors.white;

  Color get rightBgColor => darkMode ? const Color(0xFF312D41) : const Color(0xFF312D41).withOpacity(0.1);

  @override
  void initState() {
    super.initState();

    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    _isAccompanyHouseBuildInvite = extra != null && extra['type'] == "accompany_house_invite.build";
    _isGroupPackage = extra != null && extra['type'] == "group-package";
    if (widget.message.user != null) {
      SendUser user = widget.message.user!;
      _icon = widget.userIcon ?? user.portraitUri;
    }
    if (_isGroupPackage && widget.message.messageDirection == MessageDirection.Receive) {
      _icon = extra?['from_icon'];
      _groupPackageSendUser = SendUser(extra?['from_uid'].toString(), extra?['from'], extra?['from_icon']);
    }

    _isGroup = widget.message.conversationType == ConversationType.Group;
  }

  Widget _renderLocalIcon(String icon) {
    return Rext.autoStyleImg("chat_$icon.webp", package: ComponentManager.MANAGER_MESSAGE);
  }

  Widget _renderIcon() {
    int uid = Util.parseInt(widget.message.targetId);

    if (_icon == null || _icon!.isEmpty || _icon == 'null') {
      if (ChatUtil.isSystemNotice(uid)) {
        return _renderLocalIcon('system');
      } else if (ChatUtil.isCustomerService(uid) || ChatUtil.isVipCustomerService(uid)) {
        return _renderLocalIcon('service');
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: R.colors.secondBgColor,
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          int uid = Util.parseInt(widget.message.senderId);
          if (_groupPackageSendUser != null) {
            uid = Util.parseInt(_groupPackageSendUser?.id);
          }
          if (uid > 0) {
            IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, uid, refer: widget.refer);
          }
        },
        child: CommonAvatarWithFrame(
          framePath: UserImageCacheHelper.instance().getItemFrame(Util.parseInt(widget.message.senderId)),
          overflow: -3.0,
          childWidget: CommonAvatar(
            path: _icon,
            suffix: '!head100',
            borderRadius: BorderRadius.circular(20),
            size: 40,
          ),
        ),
      );
    }
  }

  Widget _renderInfo(BuildContext context) {
    return _renderNotifyMessage(widget.message.content);
  }

  /// 通知消息、消息撤回item
  Widget _renderNotifyMessage(String text, [bool wrapText = true]) {
    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    if (extra != null && extra['type'] == 'gift' && Util.parseInt(extra['gift_id']) > 0) {
      return _renderGiftInfo(extra);
    }

    if (extra != null && extra['type'] == 'gift_tips' && Util.parseInt(extra['gift_id']) > 0) {
      return DisplaySendGiftTips(message: widget.message);
    }

    if (extra != null && extra['type'] == 'follow_tips' && Util.parseInt(extra['to_uid']) != 0) {
      return DisplayToFollowTips(message: widget.message, uid: Util.parseInt(extra['to_uid']));
    }

    if (extra != null && extra['type'] == 'wechat.forbid') {
      return _buildSensitiveTip(text, extra['user_conduct_title'], extra['user_conduct_url']);
    }

    if (extra != null && extra['type'] == 'swindle_tips') {
      return DisplaySwindleTips(message: widget.message);
    }

    if (extra != null && extra['type'] == 'birthday_tips') {
      return DisplayBirthdayTips(message: widget.message);
    }

    if (extra != null && extra['type'] == 'group_welcome') {
      text = extra['content'] ?? text;
    }

    // 活动页面（标题+文本+图片+链接）
    if (extra != null && extra['type'] == 'tag') {
      try {
        ChatTopicModel topic = ChatTopicModel.fromJson(extra['card']);
        return Container(
          padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0, top: 6.0, bottom: 6.0),
          constraints: const BoxConstraints(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 40.0,
                height: 40.0,
                child: _renderIcon(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: TopicMsgItem(
                  topic: topic,
                  width: Util.width - 40 - 18 - 12 - 8,
                ),
              ),
            ],
          ),
        );
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
      return Container();
    }

    /// 默契问答tips
    if (extra != null && extra['type'] == 'tacit_tips' && !Session.isUserAdmin(Util.parseInt(widget.targetUid))) {
      return DisplayTacitTips(
        targetUid: widget.targetUid,
      );
    }

    /// 今日缘分tips
    if (extra != null && extra['type'] == 'fate_tips') {
      return DisplayFateTips(
        message: widget.message,
        isLastMsg: widget.isLastMsg,
        targetUid: widget.targetUid,
      );
    }

    return InkWell(
      onTap: () {
        widget.onSelectChanged(widget.message.messageId); //变化通知，收键盘
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Container(
              margin: const EdgeInsetsDirectional.only(top: 4.0, bottom: 4.0, start: 16, end: 16),
              padding: const EdgeInsetsDirectional.only(top: 2.0, bottom: 2.0, start: 12.0, end: 12.0),
              decoration: BoxDecoration(
                color: wrapText ? R.colors.secondBgColor : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                text,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.0, color: R.colors.thirdTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 敏感词提示
  Widget _buildSensitiveTip(String text, String title, String url) {
    bool isSender = !Util.isStringEmpty(title) && !Util.isStringEmpty(url);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 2, bottom: 16),
      child: isSender
          ? RichText(
              text: TextSpan(
                text: text,
                children: [
                  TextSpan(
                    text: '《$title》',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: R.colors.highlightColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => BaseWebviewScreen.show(context, url: url, title: title),
                  ),
                ],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: R.colors.tipsTextColor,
                ),
              ),
              textAlign: TextAlign.center,
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: R.colors.tipsTextColor,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }

  Widget _renderTipsMsg(String text) {
    return Center(
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 2, bottom: 2, start: 8, end: 8),
        child: Text(
          text,
          style: TextStyle(color: R.colors.thirdTextColor, fontSize: 11),
        ),
      ),
    );
  }

  /// 普通消息
  Widget _renderNormalMessageWrap(BuildContext context) {
    if (widget.message.messageDirection == 'RECEIVE') {
      String hiSourceStr = getHiMsgSource();
      if (widget.message.displayTime != null || !Util.isStringEmpty(hiSourceStr)) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.message.displayTime != null) _SendTimeWidget(Utility.getMessageDiff(widget.message.sentTime ~/ 1000)),
            if (!Util.isStringEmpty(hiSourceStr)) _renderTipsMsg(hiSourceStr),
            _renderNormalMessageWrapReceive(context)
          ],
        );
      } else {
        return _renderNormalMessageWrapReceive(context);
      }
    } else {
      if (widget.message.displayTime != null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _SendTimeWidget(Utility.getMessageDiff(widget.message.sentTime ~/ 1000)),
            _renderNormalMessageWrapSent(context)
          ],
        );
      } else {
        return _renderNormalMessageWrapSent(context);
      }
    }
  }

  /// 发送消息
  Widget _renderNormalMessageWrapSent(BuildContext context) {
    String sentText = K.chat_message_sent_succ;
    if (widget.message.sentStatus == MessageStatus.Failed) {
      sentText = K.chat_message_sent_fail;
    } else if (widget.message.sentStatus == MessageStatus.Read) {
      sentText = K.chat_message_has_read;
    } else if (widget.message.sentStatus == MessageStatus.Sending) {
      sentText = K.chat_message_sending;
    }

    bool magicMsg = false;
    Map? extra = _parseExtra();
    if (extra != null && extra['type'] == 'magic_msg') {
      magicMsg = true;
    }

    if (extra?['type'] == 'intimate_card_handle') {
      return DisplayIntimateCard(
        message: widget.message,
        extra: extra!,
        direction: MessageDisplayDirection.Right,
        sentText: sentText,
        targetName: widget.targetName,
      );
    }

    return Container(
      alignment: AlignmentDirectional.topEnd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
                start: magicMsg ? 0 : 12, end: magicMsg ? 4 : 12, top: magicMsg ? 2 : 6, bottom: magicMsg ? 2 : 6),
            constraints: const BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _renderNormalMessageWrapRight(context),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 6.0, end: magicMsg ? 8 : 0, top: 2),
                  child: Text(
                    sentText,
                    style: TextStyle(color: darkMode ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.3), fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderNormalMessageWrapReceive(BuildContext context) {
    Map? extra = _parseExtra();
    if (extra != null && extra['type'] == 'order_reserve_accept') {
      return DisplayPlayGameWish(
        message: widget.message,
        extra: extra,
        iconView: _renderIcon(),
      );
    } else if (extra?['type'] == 'intimate_card_handle') {
      return DisplayIntimateCard(
        message: widget.message,
        extra: extra!,
        direction: MessageDisplayDirection.Left,
        iconView: _renderIcon(),
        targetName: widget.targetName,
      );
    }

    bool isGreetCard = _isNewGreet();

    bool magicMsg = false;
    if (extra != null && extra['type'] == 'magic_msg') {
      magicMsg = true;
    }

    return Container(
      padding: EdgeInsetsDirectional.only(start: 12, end: magicMsg ? 2 : 12, top: magicMsg ? 2 : 6, bottom: magicMsg ? 2 : 6),
      constraints: const BoxConstraints(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: isGreetCard ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          if (!isGreetCard)
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: _renderIcon(),
            ),
          _getRenderNormalMessageWrapLeft()
        ],
      ),
    );
  }

  Widget _getRenderNormalMessageWrapLeft() {
    if (_isGroup) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: _buildTitle(widget.message.user),
          ),
          const SizedBox(
            height: 4,
          ),
          _renderNormalMessageWrapLeft(context)
        ],
      );
    } else {
      return _renderNormalMessageWrapLeft(context);
    }
  }

  Widget _buildTitle(SendUser? user) {
    if (_groupPackageSendUser != null) {
      user = _groupPackageSendUser!;
    }

    return Text(
      user?.name ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: R.colors.mainTextColor, fontSize: 13, fontFamily: Util.fontFamily),
    );
  }

  bool _isLinkMsgWithTitle(Map? extra) {
    if (extra == null) return false;

    String? linkMsgTitle = extra['title'];
    return !Util.isNullOrEmpty(linkMsgTitle);
  }

  bool _isNewGreet() {
    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    bool isGreetCard = extra != null && extra['type'] == 'greet' && Util.parseInt(extra['version']) > 0;
    return isGreetCard;
  }

  bool _hasJumpLink(Map? extra) {
    if (extra == null) return false;

    return !Util.isNullOrEmpty(extra['url']) || !Util.isNullOrEmpty(extra['schemeUrl']) || _hasWechatAppletLink(extra, false);
  }

  bool _hasWechatAppletLink(Map? extra, bool jump) {
    // 有小程序跳转链接，优先跳转小程序
    if (extra == null) return false;

    Map? appletInfo = extra['wechat_applet'];
    if (appletInfo != null) {
      String path = appletInfo['program_path'];
      String name = appletInfo['program_name'];
      if (!Util.isNullOrEmpty(path) && !Util.isNullOrEmpty(name)) {
        // if (jump) {
        //   FlutterWx.launchWeChatMiniProgram(username: name, path: path);
        // }
        return true;
      }
    }
    return false;
  }

  Map? _parseExtra() {
    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    return extra;
  }

  String getHiMsgSource() {
    bool isPrivate = widget.message.conversationType == ConversationType.Private;

    if (!isPrivate) {
      return "";
    }

    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    // 是否发的第一条
    bool first = extra != null && Util.parseBool(extra['first_sent']);

    if (!first) {
      return "";
    }

    String hiSourceStr = MessageFrom.getMessageFromByMap(extra);
    if (Util.isStringEmpty(hiSourceStr)) {
      return "";
    }

    return K.chat_msg_hi_source([hiSourceStr]);
  }

  Widget _renderNormalMessageWrapLeft(BuildContext context) {
    Radius radius;
    Map? extra = _parseExtra();

    if (widget.message.type == 'voice') {
      radius = const Radius.circular(20.0);
    } else {
      radius = const Radius.circular(15.0);
    }

    double maxWidth = Util.width - 40 - 18 - 12 - 60;
    if (_isNewGreet()) {
      maxWidth = Util.width;
    } else if (_isLinkMsgWithTitle(extra)) {
      maxWidth = Util.width - 40 - 18 - 12;
    }

    if (extra != null &&
        (extra['type'] == 'deco.present' ||
            extra['type'] == 'magic_business_card' ||
            extra['type'] == 'quick.propose' ||
            _isAccompanyHouseBuildInvite)) {
      maxWidth = Util.width;
    }

    Color bgColor = leftBgColor;
    bool magicMsg = extra != null && extra['type'] == 'magic_msg';
    if (magicMsg) {
      bgColor = Colors.transparent;
      maxWidth += 8;
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Container(
        padding: _getWrapPadding(widget.message, MessageDisplayDirection.Left),
        margin: EdgeInsetsDirectional.only(
          start: _isNewGreet() || magicMsg ? 0 : 8.0,
        ),
        decoration: (extra != null && extra['type'] == 'fate_im')
            ? null
            : BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(radius),
              ),
        child: _renderNormalMessage(context, MessageDisplayDirection.Left, maxWidth),
      ),
    );
  }

  Widget _renderNormalMessageWrapRight(BuildContext context) {
    Color newBgColor = rightBgColor;
    double maxWidth = Util.width - 18 - 60;
    Color bgColor = newBgColor;
    String? extraJson = widget.message.extra;

    if (widget.message.type == 'voice' || (widget.message.type == 'text' && extraJson == null)) {
      bgColor = newBgColor;
    }

    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}
    if (extra != null &&
        (extra['type'] == 'deco.present' ||
            extra['type'] == 'magic_business_card' ||
            extra['type'] == 'quick.propose' ||
            extra['type'] == 'room.invite.wbk' ||
            _isAccompanyHouseBuildInvite)) {
      maxWidth = Util.width;
    }
    if (extra != null && extra['type'] == 'magic_msg') {
      bgColor = Colors.transparent;
      maxWidth += 18;
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Container(
        padding: _getWrapPadding(widget.message, MessageDisplayDirection.Right),
        margin: const EdgeInsetsDirectional.only(
          start: 12.0,
        ),
        decoration: BoxDecoration(
            color: widget.isKAUser ? (darkMode ? const Color(0xB3221B5B) : const Color(0xFF8D6BF7)) : bgColor,
            borderRadius: BorderRadius.circular(15.0)),
        child: _renderNormalMessage(context, MessageDisplayDirection.Right, maxWidth),
      ),
    );
  }

  Widget _renderNormalMessage(BuildContext context, MessageDisplayDirection direction, double maxWidth) {
    if (!widget.message.isSupport()) {
      return _renderNormalMessageText(context, direction, maxWidth);
    } else if (widget.message.type == 'text' || widget.message.type == MessageType.Mention) {
      return _renderNormalMessageText(context, direction, maxWidth);
    } else if (widget.message.type == 'image') {
      return _renderNormalMessageImage(context, direction);
    } else if (widget.message.type == 'voice') {
      return VoiceMessageWidget(widget.modify, direction, widget.message);
    } else if (widget.message.type == 'map') {
      return _renderNormalMessageMap(direction);
    } else {
      return Container();
    }
  }

  EdgeInsetsGeometry _getWrapPadding(MessageContent message, MessageDisplayDirection direction) {
    if (!message.isSupport()) {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    }

    String? extraJson = message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    if (extra != null &&
        (extra['type'] == 'package' ||
            extra['type'] == 'group-package' ||
            extra['type'] == 'greet' ||
            extra['type'] == 'custom' ||
            extra['type'] == 'game' ||
            extra['type'] == 'auto-chat-vote' ||
            extra['type'] == 'auto-chat' ||
            extra['type'] == 'auto-chat-answer' ||
            extra['type'] == 'magic_business_card' ||
            extra['type'] == 'record_voice_gift' ||
            extra['type'] == 'gs_accompany_gift' ||
            extra['type'] == 'gs_accompany_photo' ||
            extra['type'] == 'defend' ||
            extra['type'] == 'share_moment' ||
            extra['type'] == 'tacit' ||
            extra['type'] == 'heartflip' ||
            extra['type'] == 'share_singer_friend_club_act' ||
            extra['type'] == 'cp.house.invite' ||
            (extra['type'] == 'fate_im' && direction == MessageDisplayDirection.Left) ||
            extra['type'] == 'magic_msg' ||
            _isAccompanyHouseBuildInvite)) {
      return const EdgeInsets.all(0.0);
    }

    if ((extra != null && extra['type'] == 'play_reserve') || (extra != null && extra['type'] == 'deco.present')) {
      return const EdgeInsets.all(0.0);
    }

    if (direction == MessageDisplayDirection.Left) {
      if (widget.message.type == 'text' || widget.message.type == MessageType.Mention) {
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      }
    } else {
      if (message.type != 'image' && message.type != 'voice') {
        return const EdgeInsets.all(12.0);
      }
    }
    return const EdgeInsets.all(0.0);
  }

  String _formatDuration(int duration) {
    int m = duration ~/ 60;
    int s = duration % 60;
    return (m > 0 ? '$m${K.chat_minute}' : '') + (s > 0 ? '$s${K.chat_sencond}' : '');
  }

  Widget _renderNormalMessageText(BuildContext context, MessageDisplayDirection direction, double maxWidth) {
    /// 低版本不支持显示
    if (!widget.message.isSupport()) {
      return Text(
        K.chat_msg_not_support_update,
        maxLines: 100,
        softWrap: true,
        style: R.textStyle.body1.copyWith(fontSize: 16, color: R.colors.mainTextColor),
      );
    }

    Map extra = widget.message.getExtraMap();

    if (builders.containsKey(extra['type'])) {
      return builders[extra['type']]?.buildMsg(context, widget.message, direction: direction) ?? const SizedBox.shrink();
    }

    bool isEmoji = extra.containsKey('icon') &&
        extra.containsKey('type') &&
        (extra['type'] == 'emoji' ||
            extra['type'] == 'magic' ||
            extra['type'] == 'yellow' ||
            extra['type'] == 'gif' ||
            extra['type'] == 'dan' ||
            extra['type'] == 'custom' ||
            extra['type'] == 'remote');
    if (isEmoji) {
      if (extra['type'] == 'remote') {
        return CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(extra['remote']),
          width: 50,
          height: 50,
        );
      } else {
        String prefix = '${System.imageDomain}static/xs/emote/';
        List<String> res = Util.notNullStr(extra['icon']).split(".");
        String ext = '';
        String name = '';
        if (res.length > 1) {
          ext = res.removeLast();
          name = res.removeLast();
        }

        int width = extra.containsKey('width') ? Util.parseInt(extra['width']) : 50;
        double height = extra.containsKey('height') ? Util.parseInt(extra['height']).toDouble() : 0;
        if (extra['icon'].toString().startsWith("magic.")) {
          return InkWell(
            onTap: () {
              eventCenter.emit("UserChat.PlayEmoji", extra['icon']);
            },
            child: _renderImageEmote('$prefix${res.join('/')}/$name.$ext', ext, width, height),
          );
        } else {
          if (extra['type'] == 'custom') {
            return CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(extra['icon']),
              width: Util.width / 2,
            );
          } else {
            return _renderImageEmote('$prefix${res.join('/')}/$name.$ext', ext, width, height);
          }
        }
      }
    } else if (extra['type'] == 'gift') {
      return DisplayGiftMessage(
        message: widget.message,
        extra: extra,
      );
    } else if ((extra['type'] == 'package' || extra['type'] == 'group-package')) {
      return DisplayPackageMessage(
        message: widget.message,
        extra: extra,
        refer: widget.refer,
      );
    } else if ((extra['type'] == 'true_word_answer' ||
        extra['type'] == 'true_word_private_invite' ||
        extra['type'] == 'true_word_private' ||
        extra['type'] == 'true_word_normal' ||
        extra['type'] == 'true_word_answer' ||
        extra['type'] == 'true_word_open')) {
      return DisplayTrueWord.render(message: widget.message, extra: extra, direction: direction, maxWidth: maxWidth);
    } else if (extra['type'] == 'greet') {
      if (Util.parseInt(extra['version']) > 0) {
        return DisplayGreetNew(
          message: widget.message,
          extra: extra,
          refer: widget.refer,
        );
      } else {
        return DisplayGreet(
          message: widget.message,
          extra: extra,
          refer: widget.refer,
        );
      }
    } else if (extra['type'] == 'record_voice_gift') {
      return DisplayRecordVoiceGiftInvite(message: widget.message, extra: extra);
    } else if (extra['type'] == 'gs_accompany_gift') {
      return DisplayIntimateGift(message: widget.message, extra: extra, direction: direction);
    } else if (extra['type'] == 'gs_accompany_photo') {
      return DisplayIntimatePhoto(message: widget.message, extra: extra, direction: direction);
    } else if (extra['type'] == 'invite_room') {
      return DisplayInviteRoom(
        message: widget.message,
        extra: extra,
      );
    } else if (extra['type'] == 'deco.present') {
      return DisplayReceiveGift(
        message: widget.message,
        extra: extra,
        direction: direction,
      );
    } else if ((extra['type'] == 'auto-chat' || extra['type'] == 'auto-chat-answer')) {
      return DisplayAutoChat(
        message: widget.message,
        extra: extra,
      );
    } else if (extra['type'] == 'auto-chat-user-service') {
      return DisplayAutoChatUserService(
        message: widget.message,
        extra: extra,
      );
    } else if (extra['type'] == 'auto-chat-vote') {
      return DisplayServiceVote(
        message: widget.message,
        extra: extra,
      );
    } else if (extra['type'] == 'auto-chat-vote-no') {
      return DisplayServiceFeedback(
        message: widget.message,
        extra: extra,
      );
    } else if ((extra['type'] == 'auto-chat-category' || extra['type'] == 'auto-chat-category-question')) {
      return DisplayServiceMultireply(
        message: widget.message,
        extra: extra,
      );
    } else if ((extra['type'] == 'live' || extra['type'] == 'phone')) {
      Widget icon = extra['type'] == 'live'
          ? R.img(
              Assets.chat$video_small_png,
              width: 20.0,
              height: 11.5,
              package: ComponentManager.MANAGER_CHAT,
            )
          : R.img(
              Assets.chat$phone_small_png,
              width: 26.0,
              height: 11.5,
              package: ComponentManager.MANAGER_CHAT,
            );
      String? inlineExtra = widget.message.inlineExtra;
      String message = K.chat_call;
      if (inlineExtra != null && inlineExtra.isNotEmpty) {
        try {
          Map? tmp = json.decode(inlineExtra);
          if (tmp is Map) {
            if (tmp.containsKey('ok') && Util.parseInt(tmp['ok']) > 0) {
              String time = _formatDuration(Util.parseInt(tmp['duration']));
              message = "${K.chat_call} $time";
            }
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            child: Text(
              message,
              style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
            ),
          ),
          icon,
        ],
      );
    } else if (extra['type'] == 'highlight_notice') {
      Map<String, dynamic> msg = {};
      msg['content'] = widget.message.content;
      msg['extra'] = extra;
      try {
        UrlMsgItem msgItem = UrlMsgItem.fromJson(msg);
        return UrlMsgItemWidget(msgItem: msgItem);
      } catch (e) {}
    } else if (extra['type'] == 'defend') {
      /// 守护关系强制解除/解除申请
      return DisplayDefendBreak(message: widget.message, extra: extra);
    } else if (extra['type'] == 'cp.house.invite') {
      /// CP小屋邀请
      return DisplayCpHouseInvite(message: widget.message, extra: extra);
    } else if (extra['type'] == 'gift_sign') {
      /// 礼物签到通知
      Log.d('DisplayGiftSignMessage: $extra');
      return DisplayGiftSignMessage(message: widget.message, extra: extra);
    }

    if (_isLinkMsgWithTitle(extra) && _hasJumpLink(extra)) {
      String linkMsgTitle = extra['title'];
      String btnText = Util.isNullOrEmpty(extra['bottom_info']) ? K.chat_check_detail : extra['bottom_info'];
      tap() {
        // 有小程序跳转链接，优先跳转小程序
        if (_hasWechatAppletLink(extra, true)) {
          return;
        }

        if (extra.containsKey('schemeUrl')) {
          SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, extra['schemeUrl']);
          try {
            Uri uri = Uri.parse(extra['schemeUrl']);
            Map<String, String> qps = uri.queryParameters;
            String? page = qps['page'];
            Tracker.instance.track(TrackEvent.im_click, properties: {
              'goto_page': page,
            });
          } catch (e) {}
        } else {
          PageViewParams params = Utility.parseReactNative(extra['url']);
          String? url = params.url;
          if (url != null) {
            String page = params.page;
            Map<String, String> args = params.args;
            Utility.navigateToUrl(context, page, args);
          }
        }
      }

      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: tap,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 4),
                  child: Text(linkMsgTitle, style: R.textStyle.subtitle.copyWith(color: R.colors.mainTextColor), softWrap: true),
                ),
                Text(
                  widget.message.content,
                  maxLines: 100,
                  softWrap: true,
                  style: R.textStyle.subCaption.copyWith(color: R.colors.thirdTextColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1 / Util.devicePixelRatio,
                  color: R.colors.dividerColor,
                ),
                SizedBox(
                  height: 32,
                  child: Row(
                    children: [
                      Text(
                        btnText,
                        style: TextStyle(color: R.colors.highlightColor, fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: R.colors.highlightColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    } else if (_hasJumpLink(extra)) {
      return GestureDetector(
        onTap: () {
          // 有小程序跳转链接，优先跳转小程序
          if (_hasWechatAppletLink(extra, true)) {
            return;
          }

          if (extra.containsKey('schemeUrl')) {
            SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, extra['schemeUrl']);
          } else {
            PageViewParams params = Utility.parseReactNative(extra['url']);
            String? url = params.url;
            if (url != null) {
              String page = params.page;
              Map<String, String> args = params.args;
              Utility.navigateToUrl(context, page, args);
            }
          }
        },
        child: Text(
          widget.message.content,
          maxLines: 100,
          softWrap: true,
          style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
        ),
      );
    } else if (extra['type'] == 'play_reserve') {
      return DisplayInviteGame(
        uid: Util.parseInt(widget.message.targetId),
        message: widget.message,
        extra: extra,
        direction: direction,
        maxWidth: maxWidth,
      );
    } else if (extra['type'] == 'invite_join_group') {
      return DisplayGroupInvite(message: widget.message, extra: extra);
    } else if (extra['type'] == 'apply_join_group') {
      return DisplayGroupApply(message: widget.message, extra: extra);
    } else if (extra['type'] == 'share_moment') {
      // 动态分享
      return DisplayShareMoment(message: widget.message, data: ShareMomentData.fromJson(extra as Map<String, dynamic>));
    } else if (_isAccompanyHouseBuildInvite) {
      return DisplayAccompanyHouseBuildInvite(
        message: widget.message,
      );
    } else if (extra['type'] == 'tacit') {
      /// 默契问答
      return DisplayTacit(
        message: widget.message,
        extra: extra,
        direction: direction,
        maxWidth: maxWidth,
        targetIcon: widget.targetIcon ?? '',
        targetUid: widget.targetUid,
      );
    } else if (extra['type'] == 'fate_im' && direction == MessageDisplayDirection.Left) {
      /// 今日缘分系统代发开场白消息
      return DisplayFateIm(
        message: widget.message,
        maxWidth: maxWidth,
        isLastMsg: widget.isLastMsg,
        targetUid: widget.targetUid,
      );
    } else if (extra['type'] == 'magic_msg') {
      return DisplayMagicMsg(message: widget.message, extra: extra, direction: direction);
    }

    return _renderTextAndTails(extra);
  }

  Widget _renderTextAndTails(Map extra) {
    if (!Util.validList(extra['bubble_tail'])) {
      return _renderText();
    }

    List<ImageSpan> widgets = [];
    for (int bubble in extra['bubble_tail']) {
      widgets.add(ImageSpan(
        ResizeImage(
          NetworkImage(
            Util.getRemoteImgUrl('static/bubble_tail/$bubble.webp'),
          ),
          width: Util.getCommonCacheSize(24),
          height: Util.getCommonCacheSize(24),
        ),
        imageWidth: 24,
        imageHeight: 24,
        margin: const EdgeInsets.only(left: 4),
      ));
    }

    return ExtendedText.rich(
      TextSpan(
        text: widget.message.content,
        style: R.textStyle.body1.copyWith(fontSize: 16, color: R.colors.mainTextColor),
        children: widgets,
      ),
      softWrap: true,
      maxLines: 100,
    );
  }

  Widget _renderText() {
    return Text(
      widget.message.content,
      maxLines: 100,
      softWrap: true,
      style: R.textStyle.body1.copyWith(
          fontSize: 16,
          color: widget.message.messageDirection == 'SEND' && widget.isKAUser ? const Color(0xE6FFFFFF) : R.colors.mainTextColor),
    );
  }

  Widget _renderImageEmote(String url, String ext, int width, double height) {
    if (ext.toLowerCase() == 'gif') {
      if (url.contains(".aliyuncs.com")) {
        url = '$url?x-oss-process=image/resize,m_fixed,w_150,h_150';
      }
      return SizedBox(
        width: width.toDouble() / 2,
        height: height / 2,
        child: GifRemote(
          uri: url,
          loop: true,
          onComplete: () {},
        ),
      );
    } else {
      return CachedNetworkImage(imageUrl: url, width: width.toDouble(), height: height);
    }
  }

  Widget _renderNormalMessageMap(MessageDisplayDirection direction) {
    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    int size = 200;

    /// 高德
    // String markerURI = System.domain + 'public/static/icon/map_loc.png'; // markers=-1,${markerURI},0
    // String uri =
    //     "http://restapi.amap.com/v3/staticmap?markers=-1,$markerURI,0:${extra['lng']},${extra['lat']}&size=$size*$size&key=${Constant.amapKEY}&zoom=14";
    // String detailUri =
    //     "https://m.amap.com/navi/?dest=${extra['lng']},${extra['lat']}&destName=${Uri.encodeComponent(title)}&hideRouteIcon=1&key=${Constant.amapKEY}";

    /// 百度
    /// 静态图，im私聊窗口展示
    String uri = 'http://api.map.baidu.com/staticimage?width=$size&height=$size&center=${extra?['lng']},${extra?['lat']}&zoom=16';

    /// 全屏展示poi位置标注
    String? title = extra?['poi'];
    String detailUri =
        'http://api.map.baidu.com/marker?location=${extra?['lat']},${extra?['lng']}&title=${Uri.encodeComponent(title ?? '')}&content=${Uri.encodeComponent(title ?? '')}&zoom=10&output=html&src=com.ly.bbpd.android';

//    Log.d(uri);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: () {
          BaseWebviewScreen.show(context, url: detailUri, title: title, backPressToWebFirst: false);
        },
        child: CachedNetworkImage(
          width: 200.0,
          height: 200.0,
          imageUrl: uri,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _renderNormalMessageImage(BuildContext context, MessageDisplayDirection direction) {
    bool isRemoteImg = !Util.isStringEmpty(widget.message.thumb) && widget.message.thumb!.startsWith("http");

    File? file = isRemoteImg ? null : File(widget.message.thumb!.replaceFirst("file://", ""));
    try {
      bool validRemoteImg = false;
      bool validLocaleImg = false;
      if (widget.message.imageUrl!.startsWith('http')) {
        Uri imageUri = Uri.parse(widget.message.imageUrl!);
        String imageHostConfig = AppConfig.getConfig(AppConfig.image_domain);
        validRemoteImg = (jsonDecode(imageHostConfig) as List).contains(imageUri.host);
      } else {
        validLocaleImg = widget.message.imageUrl != null && widget.message.imageUrl!.isNotEmpty;
      }

      //只显示指定域名或者本地的图片
      if (!validRemoteImg && !validLocaleImg) {
        return SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: BoxDecoration(color: R.colors.secondBgColor, borderRadius: BorderRadius.circular(15.0)),
          ),
        );
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    String? extraJson = widget.message.extra;
    Size size = ChatMsgUtil.getImageMsgSize(extraJson);

    double width = size.width;
    double height = size.height;

    if (width > 0 && height > 0) {
      height = 120 * height / width;
    }
    String? heroTag = Util.md5Encryption('${isRemoteImg ? widget.message.thumb : file?.path}_${widget.message.messageId}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: () {
          String? image = widget.message.imageUrl;
          if (image == null || image.isEmpty) {
            image = isRemoteImg ? widget.message.thumb : file?.path;
          }
          if (image != null && image.startsWith("file://")) {
            image = image.replaceFirst("file://", "");
          }
          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageViewScreen(context, image: image ?? '', heroTag: heroTag);
        },
        child: Hero(
          tag: heroTag,
          child: isRemoteImg
              ? CachedNetworkImage(
                  imageUrl: widget.message.thumb,
                  width: 120,
                  height: height > 0 ? height : null,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  file!,
                  width: 120,
                  height: height,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  // 礼物
  Widget _renderGiftInfo(Map extra) {
    if (Util.parseInt(extra['from_uid']) == Session.uid) {
      return _renderGiftInfoFromSelf(extra);
    } else {
      return _renderGiftInfoFromOther(extra);
    }
  }

  Widget _renderGiftInfoFromOther(Map extra) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 6.0, bottom: 6),
      alignment: AlignmentDirectional.topStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 12.0,
              end: 12.0,
              top: 6.0,
            ),
            child: CommonAvatarWithFrame(
              uid: Util.parseInt(extra['from_uid']),
              overflow: -3.0,
              childWidget: CommonAvatar(
                path: extra['from_icon'],
                suffix: '!head100',
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                size: 40,
                onTap: () {
                  bool showFloatScreen = _isGroup;
                  IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageFloatScreenDisplayModalBottomSheet(
                      context, Util.parseInt(extra['from_uid']), null, showFloatScreen ? 4 : 0,
                      useEmptyRoom: true, chatGroupId: Util.parseInt(widget.message.targetId));
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0, top: 6.0, bottom: 6.0),
            decoration: BoxDecoration(
              color: leftBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 64 * 2 - 80),
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: K.chat_send_to,
                        children: [
                          TextSpan(
                              text: ' ${extra['to_name']}  ',
                              style: TextStyle(
                                color: R.colors.mainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                        style: TextStyle(
                          fontSize: 16,
                          color: R.colors.mainTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: Util.fontFamily,
                        ),
                      ),
                    ),
                  ),
                ),
                _renderPackageIcon(extra),
                _renderPackageNum(extra),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderGiftInfoFromSelf(Map extra) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 6.0, bottom: 6),
      alignment: AlignmentDirectional.topEnd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0, top: 6.0, bottom: 6.0),
            decoration: BoxDecoration(
              color: rightBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 64 * 2 - 80),
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: K.chat_send_to,
                        children: [
                          TextSpan(
                              text: ' ${extra['to_name']}  ', //.chat_send_gift,
                              style: TextStyle(
                                color: R.colors.mainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                        style: TextStyle(
                          fontSize: 16,
                          color: R.colors.mainTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: Util.fontFamily,
                        ),
                      ),
                    ),
                  ),
                ),
                _renderPackageIcon(extra),
                _renderPackageNum(extra),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 12.0, left: 8.0, right: 12),
            child: CommonAvatarWithFrame(
              uid: Session.uid,
              overflow: -3.0,
              childWidget: CommonAvatar(
                path: Session.icon,
                suffix: '!head100',
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                size: 40,
                onTap: () {
                  IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
                  manager.openImageScreen(context, Session.uid, refer: widget.refer);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderPackageIcon(Map extra) {
    if (extra.containsKey('gift_id') && extra['gift_id'] != null) {
      String packageImage = '${System.imageDomain}static/$giftSubDir/${extra['gift_id']}.png';

      return CachedNetworkImage(
        imageUrl: packageImage,
        width: 42,
        height: 42,
      );
    } else {
      return Container(
        child: R.img(
          'package.gif',
          width: 42,
          height: 42,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
      );
    }
  }

  Widget _renderPackageNum(Map extra) {
    String messageNum;
    if (extra.containsKey('gift_num') && extra['gift_num'] != null) {
      messageNum = "x ${extra['gift_num']}";
    } else {
      messageNum = "x ${extra['gift_num']}";
    }

    return Text(
      messageNum,
      style: const TextStyle(color: Color(0xFFFCE78D), fontSize: 12, fontWeight: FontWeight.w400),
    );
  }

  /////////////

  /// 时间
  Widget _buildTimeContainer(int time) {
    return Container(
      padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
      child: Text(
        formatDate(
          DateTime.fromMillisecondsSinceEpoch(time),
          [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn],
        ),
        style: TextStyle(color: R.colors.thirdTextColor, fontSize: 12.0),
      ),
    );
  }

  Widget _build(BuildContext context) {
    if (!widget.message.isSupport()) {
      return _renderNormalMessageWrap(context);
    }
    switch (widget.message.type) {
      case MessageType.Info:
        if (widget.message.displayTime != null && widget.message.sentTime > 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _SendTimeWidget(Utility.getMessageDiff(widget.message.sentTime ~/ 1000)),
              _renderInfo(context),
            ],
          );
        } else {
          return _renderInfo(context);
        }

      /// 消息撤回
      case MessageType.RcCall:

        /// 这个逻辑比较绕，因为，对单聊来说，targetId（收到消息的时候，将targetId,转换成了对方） 始终是对方的id，而senderId,如果也是对方，那就是对方，否则就是自己
        /// 这个判断条件换成更简单的方式，是用message.senderId 和当前session.uid进行比较，如果相等表示自己发的，否则表示别人发给自己的
        bool isSelf = widget.message.senderId == Session.uid.toString();
        bool isPrivate = widget.message.conversationType == ConversationType.Private;
        String text;
        if (isSelf) {
          text = K.chat_recall_a_msg([(K.chat_yourself)]);
        } else {
          if (isPrivate) {
            text = K.chat_recall_a_msg([(K.chat_adversary)]);
          } else {
            String? name = widget.message.user?.name;
            text = K.chat_recall_a_msg([(name ?? '')]);
          }
        }
        if (widget.message.displayTime != null && widget.message.sentTime > 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _SendTimeWidget(Utility.getMessageDiff(widget.message.sentTime ~/ 1000)),
              _renderNotifyMessage(text),
            ],
          );
        } else {
          return _renderNotifyMessage(text);
        }
      case MessageType.Image:
      case MessageType.Voice:
      case MessageType.Text:
      case MessageType.Location:
      case MessageType.Mention:
        return _renderNormalMessageWrap(context);
      case 'pacakge':
        return Container(color: Colors.red, child: const Text("Gift"));

      default:
        return _renderNotifyMessage(widget.message.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.modify) {
      return InkWell(
        onTap: () {
          widget.onSelectChanged(widget.message.messageId);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              width: 16.0,
              height: 16.0,
              alignment: Alignment.center,
              child: widget.isSelected
                  ? const CheckBoxChecked(
                      suppDark: true,
                    )
                  : const CheckBoxUnchecked(
                      suppDark: true,
                    ),
            ),
            Expanded(
              child: _build(context),
            )
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          widget.onSelectChanged(widget.message.messageId);
        },
        onLongPress: () {
          widget.onChangeModifyMode(widget.message.messageId);
        },
        child: Container(
          child: _build(context),
        ),
      );
    }
  }
}
