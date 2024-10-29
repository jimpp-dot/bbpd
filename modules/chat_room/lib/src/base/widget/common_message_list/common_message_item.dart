import 'dart:math';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/src/base/message/widget/common_notify_item_widget.dart';
import 'package:chat_room/src/base/message/widget/constellation_clap_message_item.dart';
import 'package:chat_room/src/base/message/widget/relationship_card_item.dart';
import 'package:chat_room/src/base/message/widget/relationship_message_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_room/k.dart';
import '../../../chatRoomData.dart';
import '../../../chatRoomUtil.dart';
import '../../../protobuf/json_key/generated/system.screen.message.pb.dart';
import '../../config.dart';
import '../../message/messageItem.dart';
import '../../message/widget/end_mic_item.dart';
import '../../message/widget/knight_expire_item.dart';
import '../../message/widget/local_message_item.dart';
import '../../message/widget/match_message_item.dart';
import '../../message/widget/risk_wheel_item.dart';
import '../../message/widget/send_gift_item.dart';
import '../../message/widget/system_message_item.dart';
import '../../model/roomConstant.dart';
import '../../model/roomRepository.dart';
import '../../model/room_message_extra.dart';
import '../gift_media_widget.dart';
import 'common_message_list_normal.dart';
import 'invite_user_list_logic.dart';

typedef OnMsgLongPress = void Function(LongPressMsgData data);

/// 房间公屏消息item
class CommonMessageItem extends StatefulWidget {
  final ChatRoomData room;
  final MessageContent message;
  final int index;
  final VoidCallback? loadWelcomeMessage;
  final OnMsgLongPress? onMsgLongPress;
  final bool isMainRoom;

  /// 是否为主房间，支持主房间/关联房间公屏多Tab展示

  const CommonMessageItem({
    Key? key,
    required this.room,
    required this.message,
    required this.index,
    this.loadWelcomeMessage,
    this.onMsgLongPress,
    this.isMainRoom = true,
  }) : super(key: key);

  @override
  CommonMessageItemState createState() {
    return CommonMessageItemState();
  }
}

class CommonMessageItemState extends State<CommonMessageItem> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isMainRoom) {
      /// 关联房间，消息不可点击
      return IgnorePointer(
        child: _renderMsg(),
      );
    }

    return _renderMsg();
  }

  Widget _renderMsg() {
    /// 创建车队消息，付费车队和免费车队
    if (widget.message.type == MessageType.VehicleFeeTeam ||
        widget.message.type == MessageType.VehicleTeam) {
      return const SizedBox.shrink();
    }

    if (widget.message.type == MessageType.Message ||
        widget.message.type == MessageType.Package ||
        widget.message.type == MessageType.GiftMedia ||
        widget.message.type == MessageType.Box ||
        widget.message.type == MessageType.SendDecorate ||
        widget.message.type == MessageType.Puzzle ||
        widget.message.type == MessageType.RiskWheel ||
        widget.message.op == 'on.user.level.upgrade' ||
        widget.message.op == 'on.user.level.upgrade.new' ||
        widget.message.type == MessageType.PushRoom ||
        widget.message.type == MessageType.DiceShow ||
        widget.message.type == MessageType.AccompanyTacit ||
        widget.message.type == MessageType.CpLink) {
      return Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 80),
        child: _renderBody(context, widget.message, widget.index),
      );
    }

    RoomMessageExtra extra =
        RoomMessageExtra.fromJson(widget.message.extra ?? {});

    bool showWelcomeNewer = Util.parseBool(extra.isNewer) &&
        widget.message.type == MessageType.Notify;
    if (showWelcomeNewer) {
      return Wrap(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 8.0, end: 8.0, top: 4, bottom: 4),
            margin: const EdgeInsetsDirectional.only(
                start: 12.0, end: 80, top: 0, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              color: Colors.white.withOpacity(0.12),
            ),
            child: _renderBody(context, widget.message, widget.index),
          ),
        ],
      );
    }
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 8.0, end: 8.0, top: 4, bottom: 4),
        margin: const EdgeInsetsDirectional.only(
            start: 12.0, end: 80.0, top: 0, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
          color: Colors.white.withOpacity(0.12),
        ),
        child: _renderBody(context, widget.message, widget.index),
      ),
    );
  }

  Widget _renderBody(BuildContext context, MessageContent message, int index) {
    switch (message.type) {
      case MessageType.Message:
      case MessageType.Package:
      case MessageType.Box:
      case MessageType.SendDecorate:
      case MessageType.Puzzle:
      case MessageType.PushRoom:
      case MessageType.AccompanyTruth:
      case MessageType.AccompanyTacit:
        return _renderMessage(context, message, index);
      case MessageType.Notify:
        return _renderNotify(context, message);

      case MessageType.endOnMic:
        return EndMicItem(message, widget.room);

      case MessageType.System:
        return SystemMessageItem(message, widget.room);

      case MessageType.Local:
        return LocalMessageItem(message, widget.room);

      case MessageType.CloseNotify:
        return _renderCloseNotifyMessage(context, message);

      case MessageType.Guess:
        IDrawGuessManager drawGuessManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_DRAW_GUESS);
        return drawGuessManager.getGuessMsgWidget(message);

      case MessageType.Wolf:
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        return wereWolfManager.getWolfMsgWidget(message);

      case MessageType.Match:
        return MatchMessageItem(message: message);

      case MessageType.Piece:
        return PieceMessageItem(message: message, room: widget.room);
      case MessageType.GiftMedia:
        return GiftMediaMessageItemWidget(room: widget.room, message: message);
      case MessageType.RedPackage:
        return Text(message.message ?? '',
            style: messageTextStyle.copyWith(color: Colors.white));
      case MessageType.SendGift:
        return SendGiftItem(message, widget.room);
      case MessageType.KnightExpire:
        return KnightExpireItem(message);
      case MessageType.RiskWheel:
        return RiskWheelItem(message);
      case MessageType.CpLink:
        return RelationshipCardItem(message: message);
      case MessageType.CplinkMsg:
        return RelationshipMessageItem(message);
      case MessageType.CommonNotify:
        return CommonNotifyItemWidget(message);
      case MessageType.ZodiacMsg:
        return ConstellationClapMessageItem(message);
      default:
        Log.d("unknown message");
        Log.d("${message.extra}");
        break;
    }

    return Text(K.room_message_not_support, style: messageTextStyle);
  }

  Widget _renderMessage(
      BuildContext context, MessageContent message, int index) {
    return MessageItem(
      key: ValueKey(message.messageId),
      message: message,
      room: widget.room,
      msgHide: false,
      index: index,
      longPressCallback: (int index, int msgId) {
        if (widget.onMsgLongPress != null) {
          LongPressMsgData longPressMsgData = LongPressMsgData(
            showCopyAndComplainEntry: true,
            longPressItemIndex: index,
            longPressItemMsgId: msgId,
          );
          widget.onMsgLongPress!(longPressMsgData);
        }
      },
    );
  }

  /// 欢迎消息  欢迎 xxx
  Widget _renderNotify(BuildContext context, MessageContent message) {
    RoomMessageExtra extra = RoomMessageExtra.fromJson(message.extra ?? {});

    int defends = extra.defends;
    int title = extra.title;
    int vip = extra.vipNew;
    int popular = extra.popularityLevel;

    bool hasDefend = defends != 0;
    bool hasMounts = message.mounts?['id'] != null;
    bool hasTitle = !(title <= 0 || title > 5);
    int uid = message.user?.uid ?? 0;
    bool isGSRecommend = message.extra?['msg_action'] != null &&
        message.extra?['msg_action'] == K.room_join_party_by_recommend;

    int level = 0;

    /// 活动奖励炫彩昵称
    if (message.commonTags.isNotEmpty) {
      CommonTagData? data = message.commonTags
          .firstWhereOrNull((element) => element.isColorfulName);
      if (data != null) {
        level = 61;
      }
    }
    // 根据vip/人气等级中最高的显示
    level = max(level, max(vip, popular));

    //房主、管理员、或麦上GS，并且不是自己才显示特殊欢迎文案
    Purview purview = widget.room.purview;
    bool onMicGS = ChatRoomUtil.isMic && Session.joinBroker;
    bool isWelcomeSelf = message.user?.uid == Session.uid;
    bool showSpecialMsg = !isWelcomeSelf &&
        (purview == Purview.Createor || purview == Purview.Admin || onMicGS);
    String text = (message.extra?['gs_msg_action'] != null &&
            message.extra!['gs_msg_action'].length > 0 &&
            showSpecialMsg)
        ? message.extra!['gs_msg_action']
        : (message.extra?['msg_action'] ?? K.join_partying);

    return InkWell(
      onTap: () {
        Tracker.instance.track(TrackEvent.welcome_private_click);
        goToImageScreenDialog(context, extra.uid, widget.room);
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (Util.validStr(extra.sendOrderInvite))
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 4),
              child: Text(extra.sendOrderInvite,
                  style: R.textStyle.medium12
                      .copyWith(color: const Color(0xFFFFF01F))),
            ),
          _renderMounts(message),
          if (extra.isGrowUser)
            const GrowUserWidget(padding: EdgeInsetsDirectional.only(end: 4)),
          ...messageCommonExtraLabel(message, widget.room),
          if (extra.defendLabel != null &&
              !Util.isStringEmpty(extra.defendLabel?.name ?? ''))
            KADefendWidget(
                name: extra.defendLabel?.name ?? '',
                relation: extra.defendLabel?.relation ?? '',
                padding: const EdgeInsetsDirectional.only(end: 4)),
          ColorfulNickName(
            level: level,
            colors: Util.parseColorJson(
                message.extra?['color_name']), // 入房提醒的彩色昵称不在user里
            textBuild: (bool show, {Key? key, Paint? paint}) {
              return Container(
                /// 12:leftMargin,80:rightMargin,8:leftPadding(rightPadding),120:后面两个控件宽度
                constraints: BoxConstraints(
                    maxWidth: Util.width -
                        12 -
                        80 -
                        8 -
                        8 -
                        (isGSRecommend ? 144 : 124)),
                child: Text(
                  _getDisplayText(message,
                      (hasDefend && hasMounts && hasTitle && level > 0)),
                  key: key,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: show ? null : Color(getLevelColor(level)),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      foreground: show ? paint : null),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: isGSRecommend
                ? messageTextStyle.copyWith(
                    fontSize: 12, color: const Color(0xFFFFC900))
                : messageTextStyle.copyWith(fontSize: 12),
          ),
          ..._renderBubbleTails(extra),
          //模拟厅不邀请假人上麦
          if (widget.room.config?.property != RoomProperty.virtual)
            invitationToMic(context, uid, showSpecialMsg),
        ],
      ),
    );
  }

  // 座驾
  Widget _renderMounts(MessageContent message) {
    if (message.mounts != null &&
        message.mounts is Map &&
        message.mounts?['id'] != null) {
      String mountImageUrl =
          '${System.imageDomain}static/$giftSubDir/${message.mounts!['id']}.png';
      return Container(
        margin: const EdgeInsetsDirectional.only(end: 2.0),
        constraints: const BoxConstraints(maxWidth: 30),
        child: CachedNetworkImage(
          imageUrl: mountImageUrl,
          height: 25,
          cachedHeight: 25.px,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _getDisplayText(MessageContent message, bool useSub) {
    String? name = message.extra?['name'];
    if (name != null) {
      if (useSub && name.toString().length > 5) {
        name = name.toString().safeSubstring(0, 5);
      }
    } else {
      name = '';
    }
    return name;
  }

  List<Widget> _renderBubbleTails(RoomMessageExtra extra) {
    List<Widget> widgets = [];
    if (Util.validList(extra.bubbleTails)) {
      for (ScreenMessage_Extra_WarpUserBubbleTail tail in extra.bubbleTails) {
        widgets.add(
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4),
            child: CachedNetworkImage(
              imageUrl:
                  Util.squareResize('static/bubble_tail/${tail.cid}.webp', 75),
              width: 24,
              height: 24,
              cachedHeight: Util.getCommonCacheSize(24),
              cachedWidth: Util.getCommonCacheSize(24),
            ),
          ),
        );
      }
    }
    return widgets;
  }

  //btnType: 1、上麦；2、欢迎、3、私信
  Widget getBtnWidget(int btnType, int uid) {
    String btnText;
    switch (btnType) {
      case 1:
        btnText = K.invate_join_mic;
        break;
      case 2:
        btnText = K.welcome;
        break;
      default:
        btnText = K.room_welcome_btn_send_msg;
        break;
    }

    return GestureDetector(
      onTap: () {
        InviteUserListLogic? inviteLogic;
        if (Get.isRegistered<InviteUserListLogic>()) {
          inviteLogic = Get.find<InviteUserListLogic>();
        }

        if (btnType == 1) {
          Tracker.instance
              .track(TrackEvent.room_public_guide_click, properties: {
            'type': 'invate_on_mic',
          });
          inviteLogic?.addInvite(uid);
          // 邀请上麦
          RoomRepository.joinMic(widget.room.rid, -1,
              uid: uid, needCertify: false);
        } else if (btnType == 2) {
          // 欢迎
          Tracker.instance
              .track(TrackEvent.room_public_guide_click, properties: {
            'type': 'welcome_button',
          });
          inviteLogic?.addWelcome(uid);
          if (widget.loadWelcomeMessage != null) {
            widget.loadWelcomeMessage!();
          }
        } else if (btnType == 3) {
          // 私信对方
          IChatManager chatManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(context,
              type: 'private',
              targetId: uid,
              refer: 'room_greet',
              fromRoomPanel: true);
        }
      },
      child: Container(
        height: 17,
        margin: const EdgeInsetsDirectional.only(start: 4),
        padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
        //R.color.mainBrandColor
        decoration: BoxDecoration(
          color: const Color(0xFFE3FF42).withOpacity(0.2),
          borderRadius: BorderRadius.circular(17 / 2),
        ),
        child: Column(
          children: [
            const SizedBox(height: 1),
            Text(
              btnText,
              style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFFD4FF68),
                  height: 1.35,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// 邀请上麦/欢迎
  Widget invitationToMic(BuildContext context, int uid, bool showSpecialMsg) {
    if (widget.isMainRoom == false) {
      /// 关联房间，不展示邀请上麦/欢迎
      return const SizedBox.shrink();
    }

    //如果是自己就不显示
    if (uid == Session.uid) {
      return const SizedBox.shrink();
    }
    if (widget.room.screenShowModel == null) {
      return const SizedBox.shrink();
    }
    //仅房主或者管理员 显示邀请上麦  其他人显示欢迎
    Purview purview = widget.room.purview;
    bool isCreateorOrAdmin =
        (purview == Purview.Createor || purview == Purview.Admin);
    bool showOnMic =
        (isCreateorOrAdmin && widget.room.screenShowModel?.onMic == true);
    bool isRegistered = Get.isRegistered<InviteUserListLogic>();
    if (isRegistered) {
      return GetBuilder<InviteUserListLogic>(builder: ((logic) {
        if (showOnMic) {
          //邀请上麦
          if (!logic.inviteList.contains(uid)) {
            return getBtnWidget(1, uid);
          }
        } else if (showSpecialMsg) {
          return getBtnWidget(3, uid);
        } else if (!(logic.welcomeList.contains(uid) ||
            widget.room.screenShowModel?.welcome == false)) {
          return getBtnWidget(2, uid);
        }
        return const SizedBox.shrink();
      }));
    }

    return const SizedBox.shrink();
  }

  Widget _renderCloseNotifyMessage(
      BuildContext context, MessageContent message) {
    String content = '';
    int min = Util.parseInt(message.extra?['seconds']); // ~/ 60
    Map extra = {
      'type': 'local',
      'nav-type': 'inviteFriend',
      'nav-text1': K.room_will_close_few_mins(['$min']),
      'nav-text2': ' ${K.room_invite_friend} ',
      'nav-text3': K.room_sit_down,
    };
    MessageContent msg = MessageContent.from(content, extra, null, null);
    return LocalMessageItem(msg, widget.room);
  }
}
