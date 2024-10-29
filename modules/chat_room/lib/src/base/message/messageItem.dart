import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/room_message_extra.dart';
import 'package:chat_room/src/base/widget/fansLabel.dart';
import 'package:chat_room/src/biz_plugin/accompany_tacit/accompany_tacit_message_item_widget.dart';
import 'package:chat_room/src/biz_plugin/box_gift/box_gift_message_item.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_msg_item_widget.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;

import '../../protobuf/json_key/generated/system.screen.message.pb.dart';
import '../model/message_content_display_type_ext.dart';
import 'widget/welcome_target_to_me.dart';

// 公屏消息列表铭牌高度
const double kNameplateHeight = 22;

typedef LongPressCallback = void Function(int index, int msgId);

/// 房间消息
class MessageItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData? room;
  final bool msgHide;
  final bool? canTap;
  final int index;
  final LongPressCallback? longPressCallback;

  const MessageItem(
      {super.key, required this.message, this.room, this.msgHide = false, this.canTap = true, this.longPressCallback, this.index = 0});

  Color _getMessageColor({Color? defaultColor}) {
    if (message.user?.messageColor != null && message.user!.messageColor.isNotEmpty) {
      return HexColor(message.user!.messageColor);
    }
    return defaultColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return renderBody(context, true, renderMessageText(context, message), background: !message.customBackground);
  }

  Widget renderBody(BuildContext context, bool canShowBackImage, Widget contentWidget, {bool background = true}) {
    bool showBackImage = false;
    if (message.user?.background != null && message.user!.background.isNotEmpty && canShowBackImage) {
      showBackImage = true;
    }
    String backImageUrl = RoomPosition.fullChatMessageBackPath(message.user?.background);

    Log.d('backImageUrl:$backImageUrl');

    //海龟汤游戏消息不显示图片背景(气泡)
    if (message.type == MessageType.PushRoom || message.type == MessageType.Puzzle || message.type == MessageType.AccompanyTacit) {
      showBackImage = false;
    }

    //主播专属 头像框和气泡上的 粉丝牌名
    String headerLiveLabel = Util.notNullStr(message.extra?['live_label_header']);
    String bubbleLiveLabel = Util.notNullStr(message.extra?['live_label_bubble']);

    BoxDecoration boxDecoration = bodyBoxDecoration();
    Log.d('showBackImage:$showBackImage');
    Log.d('background:$background');
    if (message.user == null) {
      return const Text("-----------");
    } else {
      Widget childWidget;
      if (message.type != MessageType.Puzzle && message.type != MessageType.AccompanyTruth && message.type != MessageType.AccompanyTacit) {
        if (background) {
          if (showBackImage) {
            childWidget = Container(
              margin: const EdgeInsetsDirectional.fromSTEB(27, 13, 27, 13),
              child: contentWidget,
            );
          } else {
            childWidget = Container(
              margin: const EdgeInsetsDirectional.fromSTEB(8, 2, 0, 16),
              padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 8, 6),
              decoration: boxDecoration,
              child: contentWidget,
            );
            // Log.d('childWidget: is Container 2');
          }
        } else {
          childWidget = contentWidget;
        }
      } else {
        // Log.d('childWidget: is contentWidget');
        childWidget = contentWidget;
      }
      return InkWell(
        onTap: () {
          if (canTap ?? true) {
            goToImageScreenDialog(context, message.user?.uid ?? 0, room);
          }
        },
        onLongPress: () {
          if (message.type == MessageType.Message) {
            if (longPressCallback != null) {
              longPressCallback!(index, message.messageId);
            }
          } else {
            Clipboard.setData(ClipboardData(text: msgHide ? '**' : message.message ?? ''));
            Fluttertoast.showToast(msg: K.room_msg_copied, gravity: ToastGravity.CENTER);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: [
                CommonAvatar(
                  path: message.user?.icon ?? '',
                  size: 32,
                  suffix: '!head100',
                  shape: BoxShape.circle,
                ),
                // 头像框
                if (message.user?.headFrame != null && message.user!.headFrame.isNotEmpty)
                  PositionedDirectional(
                    start: -2.5,
                    top: -2.5,
                    child: UserIconFrame(
                      size: 37,
                      frameUrl: message.user!.headFrame,
                    ),
                  ),
                if (headerLiveLabel.isNotEmpty)
                  UserLiveLabelWidget(
                    headerLiveLabel,
                    UserLiveLabelType.frame,
                    bgHeight: 37,
                    frameBottomOverflow: -2.5,
                  ),
              ],
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: _buildMessageExtra(),
                    ),
                  ),
                  showBackImage
                      ? Container(
                          margin: const EdgeInsetsDirectional.only(end: 0, bottom: 8),
                          constraints: const BoxConstraints(minHeight: 48, minWidth: 66),
                          child: Stack(
                            children: <Widget>[
                              PositionedDirectional(
                                start: 0,
                                top: 0,
                                end: 0,
                                bottom: 0,
                                child: CachedNetworkImage(
                                  imageUrl: backImageUrl,
                                  centerSlice: const Rect.fromLTWH(32, 23, 2, 2),
                                  scale: 3,
                                  errorWidget: Container(
                                    margin: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                                    decoration: boxDecoration,
                                  ),
                                  placeholder: Container(
                                    margin: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                                    decoration: boxDecoration,
                                  ),
                                ),
                              ),
                              if (bubbleLiveLabel.isNotEmpty) UserLiveLabelWidget(bubbleLiveLabel, UserLiveLabelType.bubble),
                              childWidget,
                            ],
                          ),
                        )
                      : childWidget,
                  if (Util.validStr(Util.parseStr(message.extra?['system_txt'])))
                    _buildSystemTip(Util.notNullStr(message.extra?['system_txt']), Util.parseColor(message.extra?['system_color'])),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  /// 系统合规提示
  Widget _buildSystemTip(String tip, Color? color) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 16),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 8, 6),
      decoration: bodyBoxDecoration(),
      child: Text(
        tip,
        style: messageTextStyle.copyWith(
          color: color ?? Colors.white,
          fontFamily: Util.fontFamily,
        ),
      ),
    );
  }

  BoxDecoration bodyBoxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadiusDirectional.only(
        topStart: Radius.circular(4),
        topEnd: Radius.circular(14),
        bottomStart: Radius.circular(14),
        bottomEnd: Radius.circular(14),
      ),
      color: Colors.white.withOpacity(0.12),
    );
  }

  List<Widget> _buildMessageExtra() {
    RoomMessageExtra extra = RoomMessageExtra.fromJson(message.extra ?? {});
    List<Widget> widgets = [
      if (ChatRoomUtil.isPuzzleRoom(room?.config) && message.user?.uid == room?.createor?.uid)
        Container(
          padding: const EdgeInsetsDirectional.only(start: 3.0, end: 3.0),
          height: 12.0,
          margin: const EdgeInsetsDirectional.only(end: 2.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0XFFFC5897),
                Color(0XFFFF6AFD),
              ],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img('ic_room_owner.webp', width: 8, height: 8, package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 2),
              Column(
                children: [
                  const SizedBox(height: 1),
                  Text(
                    K.room_owner,
                    style: const TextStyle(
                      inherit: false,
                      fontSize: 9.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      _renderPosition(extra.position, room),
      ...messageCommonExtraLabel(message, room),
      _renderUserName(message)
    ];

    /// Log.d('isCanShowJukeboxLabel, extra.isCanShowJukeboxLabel: ${extra.isCanShowJukeboxLabel}');
    return widgets;
  }

  Widget _renderUserName(MessageContent message) {
    int vip = 0;
    int popular = 0;
    // 公屏彩色昵称逻辑调整
    if (message.extra?['icongray'] != true) {
      // vip未过期时，才根据vip等级显示彩色昵称
      vip = Util.parseInt(message.extra?['vip_new']);
    }
    popular = message.user?.popularityLevel ?? 0; // 普通消息的人气等级在user中

    int level = 0;

    /// 活动奖励炫彩昵称
    if (message.commonTags.isNotEmpty) {
      CommonTagData? data = message.commonTags.firstWhereOrNull((element) => element.isColorfulName);
      if (data != null) {
        level = 61;
      }
    }
    level = max(level, max(vip, popular));

    return ColorfulNickName(
      level: level,
      colors: message.user?.colorfulName,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Container(
          /// 12:leftMargin,80:rightMargin,37:avatar,8:leftPadding(rightPadding),90:人气/VIP两个控件宽度（绝大多数数这俩标）
          constraints: BoxConstraints(maxWidth: Util.width - 12 - 80 - 37 - 8 - 90),
          child: Text(
            message.user?.name ?? '',
            key: key,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: show ? null : Color(getLevelColor(level)),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              foreground: show ? paint : null,
            ),
          ),
        );
      },
    );
  }

  Widget? renderEmote(MessageContent message) {
    IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    Map extra = message.extra ?? {};
    Log.d('extra:$extra');
    String? riveUrl = Util.parseStr(extra['effect_url']);
    double riveValue = Util.parseDouble(extra['fvalue'], -1);
    bool isRive = Util.validStr(riveUrl) && riveValue > 0;
    if (extra.containsKey("emote")) {
      Log.d('extra lowDeviceSpecialEffect:${Session.lowDeviceSpecialEffect}');
      Log.d('extra emote:${EmoteUtil.emoteImgUrl(extra['emote'])}');
      // if (Session.lowDeviceSpecialEffect == 1) {
      /// 关闭特效，展示一张静态图片
      return CachedNetworkImage(
        imageUrl: EmoteUtil.emoteImgUrl(extra['emote']),
        width: 26,
        height: 26,
      );
      // }

      //TODO  表情符
      Log.d('extra riveUrl:${Util.getRemoteImgUrl(riveUrl)}');
      Log.d('extra isRive:$isRive');
      return SizedBox(
        width: 30.0,
        height: 30.0,
        child: RepaintBoundary(
          child: isRive
              ? BbStateRive.network(
                  path: Util.getRemoteImgUrl(riveUrl),
                  riveValue: riveValue,
                  loop: true,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                )
              : chatManager.getGifRemote(
                  uri: EmoteUtil.emoteEffectUrl(extra['emote'], Util.parseInt(extra['img_format'])),
                  loop: true,
                  useCache: true,
                ),
        ),
      );
    }
    return null;
  }

  Widget renderMessageText(BuildContext context, MessageContent message) {
    if (message.type == MessageType.Package) {
      return _renderPackage(context, message);
    } else if (message.type == MessageType.Box) {
      return _renderBox(context, message);
    } else if (message.type == MessageType.SendDecorate) {
      return _renderSendDecorate(context, message);
    } else if (message.type == MessageType.PushRoom) {
      return _renderPushRoomMessage(context);
    } else if (message.type == MessageType.AccompanyTruth) {
      return TrueWordMsgItemWidget(msg: message, rid: room!.rid);
    } else if (message.type == MessageType.AccompanyTacit) {
      return AccompanyTacitMessageItemWidget(message: message, room: room!);
    } else if (message.displayType == RoomMessageDisplayType.welcomeTargetToMe) {
      return WelcomeTargetToMe(room: room!, message: message, bodyDecoration: bodyBoxDecoration());
    }

    return renderEmote(message) ?? renderTextAndImage();
  }

  Widget renderTextAndImage() {
    RoomMessageExtra extra = RoomMessageExtra.fromJson(message.extra ?? {});
    bool hasImage = Util.validList(extra.bubbleTails);
    if (msgHide || !hasImage) {
      return renderText();
    }

    List<ImageSpan> widgets = [];
    for (ScreenMessage_Extra_WarpUserBubbleTail tail in extra.bubbleTails) {
      widgets.add(ImageSpan(
        ResizeImage(
          NetworkImage(
            Util.getRemoteImgUrl('static/bubble_tail/${tail.cid}.webp'),
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
        text: message.message,
        style: messageTextStyle.copyWith(color: _getMessageColor(), fontFamily: Util.fontFamily),
        children: widgets,
      ),
      softWrap: true,
      maxLines: 5,
    );
  }

  Widget renderText() {
    return Text(
      msgHide ? '**' : (message.message ?? ''),
      style: messageTextStyle.copyWith(color: _getMessageColor(), fontFamily: Util.fontFamily),
      softWrap: true,
      maxLines: 5,
    );
  }

  Widget _renderPushRoomMessage(BuildContext context) {
    RoomMessageExtra extra = RoomMessageExtra.fromJson(message.extra ?? {});

    return GestureDetector(
      onTap: () {
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, extra.rid, refer: 'gs_public_screen_recommend');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.room_has_push_room,
            style: messageTextStyle.copyWith(color: const Color(0x99FFFFFF)),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0x14000000),
            ),
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IgnorePointer(
                  child: StatusAvatar(
                    rid: extra.rid,
                    userAvatar: extra.icon,
                    roomName: extra.showName,
                    roomIcon: extra.acuteIcon,
                    colors: extra.bg,
                    radius: 26,
                    avatarRadius: 22,
                    online: false,
                    fillColor: Colors.transparent,
                    roomTagBorderColor: const Color(0xB2000000),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        extra.roomName,
                        style: messageTextStyle.copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        K.room_click_join,
                        style: messageTextStyle.copyWith(color: const Color(0x99FFFFFF)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 礼物消息，包括打赏、赠箱子、开守护等。
  Widget _renderPackage(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};

    if (extra.isEmpty) {
      return const Text('');
    }

    if (extra['from_outstanding_box'] == 1) {
      // 甄选礼盒消息
      return BoxGiftMessageItem(message: message);
    }

    // Killer 带礼物的欢迎消息 "purpose": "welcom e_newer",
    if (extra["purpose"] == "welcome_newer") {
      return _renderWelcomeWithGift(context, message);
    }

    if (Util.parseBool(extra['join_fans_group'])) {
      return _renderPackageFansGroup(context, message);
    }

    int defendLevel = Util.parseInt(extra['defend']);

    if (defendLevel > 3) {
      return _renderPackageKnight(context, message);
    } else if (defendLevel > 0) {
      return _renderPackageDefend(context, message, defendLevel);
    } else {
      return _renderPackageGift(context, message);
    }
  }

  // 礼物、箱子礼物等
  Widget _renderPackageGift(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    Map? gift = extra['gift'];
    int price = 0;
    if (gift != null) {
      price = Util.parseInt(gift['price'], 0);
    }
    bool isBoxGift = extra.containsKey('box-gift') && Util.parseInt(extra['box-gift']) > 0;
    bool isTarot = extra.containsKey('tarot_gift') && Util.parseInt(extra['tarot_gift']) > 0; // 塔罗牌
    List<TextSpan> spans;
    int maxLine = 1;
    if (isBoxGift) {
      spans = [
        if (price >= 99)
          TextSpan(
            text: ' ${K.room_true_love}',
            style: messageTextStyle.copyWith(
              color: _getMessageColor(defaultColor: const Color(0xFFFF81CE)),
              fontFamily: Util.fontFamily,
            ),
          ),
        TextSpan(
          text: price >= 99 ? '，' : ' ',
          style: messageTextStyle.copyWith(
            color: _getMessageColor(defaultColor: Colors.white),
            fontFamily: Util.fontFamily,
          ),
        ),
        TextSpan(
          text: K.room_open_box_for_who([Util.removeUnsupportedCharacters(extra['to']) ?? '']),
          style: messageTextStyle.copyWith(
            color: _getMessageColor(defaultColor: Colors.white),
            fontFamily: Util.fontFamily,
          ),
        ),
      ];
    } else if (isTarot) {
      maxLine = 2;
      spans = [
        TextSpan(
          text: '${K.room_congratulations} ',
          style: messageTextStyle.copyWith(color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontWeight: FontWeight.w500),
        ),
        TextSpan(
          text: (Util.removeUnsupportedCharacters(message.user?.name) ?? '').cut(12, suffix: '...'),
          style: messageTextStyle.copyWith(color: _getMessageColor(), fontWeight: FontWeight.w500),
        ),
        TextSpan(
          text: ' 为 ',
          style: messageTextStyle.copyWith(color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontWeight: FontWeight.w500),
        ),
        TextSpan(
          text: (Util.removeUnsupportedCharacters(extra['to']) ?? '').cut(12, suffix: '...'),
          style: messageTextStyle.copyWith(color: _getMessageColor(), fontFamily: Util.fontFamily),
        ),
        TextSpan(
          text: ' 开出了 ',
          style: messageTextStyle.copyWith(color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontWeight: FontWeight.w500),
        ),
      ];
    } else {
      bool isBoxGift = gift?.containsKey('box-gift') == true && Util.parseInt(gift!['box-gift']) > 0;
      String sendPrex = isBoxGift ? ' ${K.room_bidding_send_gift} ' : ' ${K.room_tab_item_package} ';
      spans = [
        TextSpan(
          text: sendPrex,
          style: messageTextStyle.copyWith(color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontWeight: FontWeight.w500),
        ),
        TextSpan(
          text: Util.removeUnsupportedCharacters(extra['to']),
          style: messageTextStyle.copyWith(color: _getMessageColor(), fontFamily: Util.fontFamily),
        )
      ];
    }

    return InkWell(
      onTap: () {
        if (canTap ?? true) goToImageScreenDialog(context, message.extra?['uid'] ?? 0, room);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: RichText(
              softWrap: true,
              maxLines: maxLine,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: spans,
              ),
            ),
          ),
          _renderPackageIcon(context, message),
          _renderPackageNum(context, message),
        ],
      ),
    );
  }

  //
  Widget _renderWelcomeWithGift(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    String giftIcon = Util.giftImgUrl(93);

    List<InlineSpan> spans = [
      TextSpan(
        text: K.welcome,
        style: messageTextStyle.copyWith(color: _getMessageColor(), fontSize: 13, fontWeight: FontWeight.w400, fontFamily: Util.fontFamily),
      ),
      WidgetSpan(
          child: GestureDetector(
        onTap: () {
          if (canTap ?? true) goToImageScreenDialog(context, extra['to_uid'], room);
        },
        child: Text(
          ' @${extra['to']} ',
          style: messageTextStyle.copyWith(
              color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontSize: 13, fontWeight: FontWeight.w400),
        ),
      )),
      TextSpan(
        text: K.room_in,
        style: messageTextStyle.copyWith(color: _getMessageColor(), fontSize: 13, fontWeight: FontWeight.w400, fontFamily: Util.fontFamily),
      ),
      WidgetSpan(
          child: CachedNetworkImage(
        placeholder: const CupertinoActivityIndicator(),
        imageUrl: giftIcon,
        width: 34,
        height: 34,
        fit: BoxFit.contain,
        fadeInDuration: const Duration(microseconds: 0),
        fadeOutDuration: const Duration(microseconds: 0),
      )),
      TextSpan(
        text: 'x1',
        style: messageTextStyle.copyWith(color: _getMessageColor(), fontSize: 13, fontWeight: FontWeight.w400, fontFamily: Util.fontFamily),
      ),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: RichText(
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: spans,
            ),
          ),
        ),
      ],
    );
  }

  // 赠送装扮
  Widget _renderSendDecorate(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    String toName = Util.notNullStr(extra['to']);
    String decorateIcon = '';
    int num = 1;
    Map? decorate = extra['decorate'];
    if (decorate != null) {
      decorateIcon = decorate['image'] ?? '';
      num = decorate['num'] ?? 1;
    }

    List<TextSpan> spans;
    spans = [
      TextSpan(
        text: ' ${K.room_send_gift} ',
        style: messageTextStyle.copyWith(color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)), fontWeight: FontWeight.w500),
      ),
      TextSpan(
        text: "${Util.removeUnsupportedCharacters(toName)} ",
        style: messageTextStyle.copyWith(color: _getMessageColor(), fontFamily: Util.fontFamily),
      )
    ];

    return InkWell(
      onTap: () {
        if (canTap ?? true) goToImageScreenDialog(context, Util.parseInt(extra['uid']), room);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: RichText(
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: spans,
              ),
            ),
          ),
          CachedNetworkImage(
            imageUrl: decorateIcon,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          Text(
            ' x $num',
            style: messageTextStyle.copyWith(
              color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }

  // 开通电台守护
  Widget _renderPackageDefend(BuildContext context, MessageContent message, int defendLevel) {
    Map extra = message.extra ?? {};
    return InkWell(
      onTap: () {
        goToImageScreenDialog(context, Util.parseInt(extra['uid']), room);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: RichText(
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: K.room_open_defend_for([Util.removeUnsupportedCharacters(extra['to']) ?? '', getDefendName(defendLevel)]),
                    style: messageTextStyle.copyWith(
                      color: Colors.white,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
          R.img(
            'radio_buy_icon_$defendLevel.png',
            fit: BoxFit.contain,
            width: 30,
            height: 30,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ],
      ),
    );
  }

  //开通骑士守护
  Widget _renderPackageKnight(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    return InkWell(
      onTap: () {
        goToImageScreenDialog(context, extra['uid'], room);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              K.room_for([Util.removeUnsupportedCharacters(extra['to']) ?? '']),
              style: messageTextStyle.copyWith(color: Colors.white, fontFamily: Util.fontFamily),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Text(
            K.room_has_open_buy([extra['knight_name'] ?? '']),
            style: messageTextStyle.copyWith(color: Colors.white, fontFamily: Util.fontFamily),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  //开通粉丝团
  Widget _renderPackageFansGroup(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    return InkWell(
      onTap: () {
        goToImageScreenDialog(context, extra['uid'], room);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            K.room_vehicle_join,
            style: messageTextStyle.copyWith(color: Colors.white, fontFamily: Util.fontFamily),
            maxLines: 1,
          ),
          Flexible(
            child: Text(
              ' ${Util.removeUnsupportedCharacters(extra['to'])} ',
              style: messageTextStyle.copyWith(color: Colors.white, fontFamily: Util.fontFamily),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            K.room_fans_group_str,
            style: messageTextStyle.copyWith(color: Colors.white, fontFamily: Util.fontFamily),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _renderPackageIcon(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    if (extra.containsKey('gift') && extra['gift'] != null) {
      Map gift = extra['gift'];
      String packageImage = Util.giftImgUrl(Util.parseInt(gift['id']));
      if (gift.containsKey('image') && (gift['image']).toString().isNotEmpty) {
        packageImage = System.imageDomain + gift['image'];
      }
      return CachedNetworkImage(
        imageUrl: Util.squareResize(packageImage, 100),
        width: 30,
        height: 30,
        cachedWidth: 90,
        cachedHeight: 90,
      );
    } else {
      return R.img(
        'package.gif',
        width: 30,
        height: 30,
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
    }
  }

  Widget _renderPackageNum(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    String messageNum;
    String giftName = '';
    if (extra.containsKey('gift') && extra['gift'] != null) {
      Map gift = extra['gift'];
      messageNum = "x ${gift['_num']}";
      giftName = Util.notNullStr(gift['name']);
    } else {
      messageNum = "x ${extra['price']}";
    }
    Widget numText = Text(
      messageNum,
      style: messageTextStyle.copyWith(
        color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
    return giftName.isEmpty
        ? numText
        : Row(
            children: [
              Text(
                '$giftName ',
                style: TextStyle(
                  fontSize: 12,
                  color: _getMessageColor(defaultColor: const Color(0xFFFCE78D)),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              numText,
            ],
          );
  }

  // 自己开箱子
  Widget _renderBox(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    Map gift = extra['gift'] ?? {};
    int price = gift['price'] != null && Util.parseInt(gift['price']) > 0 ? Util.parseInt(gift['price']) : 0;
    return InkWell(
      onTap: () {
        if (canTap ?? true) goToImageScreenDialog(context, extra['uid'], room);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: RichText(
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: Util.removeUnsupportedCharacters(extra['from']),
                style: messageTextStyle.copyWith(fontFamily: Util.fontFamily),
                children: <TextSpan>[
                  if (price >= 9900)
                    TextSpan(
                      text: K.room_much_popular,
                      style: messageTextStyle.copyWith(
                        color: const Color(0xFFFFFC53),
                        fontFamily: Util.fontFamily,
                      ),
                    ),
                  TextSpan(
                    text: price >= 9900 ? '，' : ' ',
                    style: messageTextStyle.copyWith(
                      color: Colors.white,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                  TextSpan(
                    text: K.room_receive,
                    style: messageTextStyle.copyWith(
                      color: Colors.white,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _renderPackageIcon(context, message),
          _renderPackageNum(context, message),
        ],
      ),
    );
  }

  Widget _renderPosition(int? position, ChatRoomData? roomData) {
    if (position == null || position < 0 || roomData?.config?.game == Games.None) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 2.0),
      child: R.img('message/${position + 1}.webp',
          height: kNameplateHeight, fit: BoxFit.fitHeight, package: ComponentManager.MANAGER_BASE_ROOM),
    );
  }
}

Widget renderBeautifulMark(String mark) {
  if (!Util.isStringEmpty(mark) && ChatRoomData.exists()) {
    bool isCreator = ChatRoomData.getInstance()?.createor?.uid == Session.uid;

    if (isCreator || Session.joinBroker) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
        child: Text(
          mark,
          style: const TextStyle(color: Color(0xFFFCE78D), fontSize: 12, fontWeight: FontWeight.w600),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  } else {
    return const SizedBox.shrink();
  }
}

/// 电台守护
Widget renderRadioDefend(int defend) {
  if (defend == 0) {
    return const SizedBox.shrink();
  } else {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 2.0),
      child: R.img(
        'radio_badge_$defend.png',
        width: 18,
        height: 18,
        package: ComponentManager.MANAGER_BASE_ROOM,
      ),
    );
  }
}

Widget renderFansLabel(String label, int level, bool newLabel) {
  String icon = FansLabel.getLevelIcon(level, newLabel);
  List<String> colorsList = FansLabel.getLabelColors(level);
  List<Color> colors = Util.parseColors(colorsList);

  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 2),
    child: FansLabel(label, icon, colors),
  );
}

/// 萌新或者新贵 互斥 [isNewer] 是否萌新 24小时之内注册的用户 [isNewNoble] 是否新贵
Widget renderNewer({bool isNewer = false, bool isNewNoble = false}) {
  if (isNewNoble) {
    return const NewNobleWidget(height: kNameplateHeight, padding: EdgeInsetsDirectional.only(end: 2.0));
  }

  if (isNewer) {
    return const NewerWidget(height: kNameplateHeight, padding: EdgeInsetsDirectional.only(end: 2.0));
  }

  return const SizedBox.shrink();
}

/// vip等级
Widget renderUserVip(int? vip, bool iconGray) {
  if (vip != null && vip > 0) {
    return UserVipWidget(vip: vip, isGrey: iconGray, height: kNameplateHeight, padding: const EdgeInsetsDirectional.only(end: 2.0));
  }

  return const SizedBox.shrink();
}

/// 爵位
Widget renderUserTitle(int title, int titleNew) {
  return UserNobilityWidget(titleNew: titleNew, height: kNameplateHeight, padding: const EdgeInsetsDirectional.only(end: 2.0));
}

String getDefendName(int level) {
  switch (level) {
    case 1:
      return K.room_defend_gold;
    case 2:
      return K.room_defend_silver;
    case 3:
      return K.room_defend_bronze;
    default:
      return K.room_defend_bronze;
  }
}

//以弹层的方式调起个人资料
goToImageScreenDialog(BuildContext context, int uid, ChatRoomData? room) {
  //模拟厅不弹资料页
  if (room?.config?.property != RoomProperty.virtual || room?.createor?.uid == uid) {
    RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(context, uid, room!, 1);
  }
}

List<Widget> messageCommonExtraLabel(MessageContent content, ChatRoomData? roomData) {
  RoomMessageExtra extra = RoomMessageExtra.fromJson(content.extra ?? {});
  bool hasSevenNew = Session.joinBroker && (extra.sevenNew + extra.payLevel) > 0;
  bool hasFansLabel = (roomData?.isLiveRoom ?? false) && extra.hasFansLabel();
  int popularityLevel = 0;
  // // 普通消息在user中下发
  if (content.type == MessageType.Message || content.type == MessageType.Puzzle) {
    //海龟汤公屏消息
    popularityLevel = content.user?.popularityLevel ?? 0;
  } else {
    // 打赏消息在extra中下发
    popularityLevel = extra.popularityLevel;
  }

  // Log.d('extra====:${extra}');
  // Log.d('popularityLevel:${popularityLevel}');
  // Log.d('extra.knightLevel:${extra.knightLevel}');
  // Log.d('popularityLevel:${content.user?.popularityLevel ?? 0}');

  List<Widget> widgets = [
    ...messageGeneralTagList(content, true),
    renderBeautifulMark(extra.beautifulRemark),
    if (extra.isRecall)
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: TextLabelWidget.highQualityLabel,
      ),
    if (extra.isCanShowReflowLabel)
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: TextLabelWidget.reflowLabel(extra.reflowLabel),
      ),
    if (hasSevenNew)
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: UserNewTransferWidget(sevenNew: extra.sevenNew, payLevel: extra.payLevel),
      ),
    renderRadioDefend(extra.defends),
    renderUserTitle(extra.title, extra.titleNew),
    if (hasFansLabel)
      renderFansLabel(extra.fansLabel!.label!, extra.fansLabel!.level, Util.parseBool(roomData?.config?.liveDataV3?.newLabel)),
    if (popularityLevel > 0)
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: UserPopularity(popularityLevel: popularityLevel, height: kNameplateHeight),
      ),
    renderNewer(isNewer: Util.parseBool(extra.isNewer), isNewNoble: Util.parseBool(extra.isNewNoble)),
    renderUserVip(extra.vipNew, Util.parseBool(extra.iconGray)),
    if (Util.validStr(extra.achieveIcon))
      ActivityBadgeWidget(icon: extra.achieveIcon, padding: const EdgeInsetsDirectional.only(start: 2, end: 2)),
    if (Util.validStr(extra.tailLight))
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: UserTailLightWidget(tailLight: extra.tailLight),
      ),
    if (extra.knightLevel > 0)
      UserKnightWidget(
        knightLevel: extra.knightLevel,
        padding: const EdgeInsetsDirectional.only(end: 3),
      ),
    if (extra.showConsumeLabel) Padding(padding: const EdgeInsetsDirectional.only(end: 3), child: TextLabelWidget.consumeLabel),
    if (extra.showRechargeLabel) Padding(padding: const EdgeInsetsDirectional.only(end: 3), child: TextLabelWidget.rechargeLabel),
    if (extra.isCanShowAlarmLabel)
      Padding(padding: const EdgeInsetsDirectional.only(end: 3), child: TextLabelWidget.smallAlarmLabel(extra.alarmLabel)),
    if (extra.isCanShowJukeboxLabel)
      Padding(padding: const EdgeInsetsDirectional.only(end: 3), child: TextLabelWidget.smallAlarmLabel(extra.jukeboxLabel)),
    if (extra.starSinger > 0)
      Padding(padding: const EdgeInsetsDirectional.only(end: 3), child: UserStarSingerWidget(level: extra.starSinger)),

    if ((extra.starVerifyTagV1 == 1 || extra.starVerifyTagV1 == 2 || extra.starVerifyTagV1 == 3))
      Padding(
          padding: const EdgeInsetsDirectional.only(end: 3), child: UserStarVerifyWidget(height: 18, starVerifyTag: extra.starVerifyTagV1)),
    NameplateWidget(icon: extra.nameplate, height: kNameplateHeight, padding: const EdgeInsetsDirectional.only(end: 2.0)),
    if (extra.showKaTag) const Padding(padding: EdgeInsetsDirectional.only(end: 3), child: KaTagWidget()),
    RewardTitleWidget(name: extra.awardTitle, level: extra.awardTitleLv),
    NameplateWidget(icon: extra.officialTag, padding: const EdgeInsetsDirectional.only(end: 2.0)),

    /// 公会成员才显示该标签
    if (Session.joinBroker) NameplateWidget(icon: extra.appPlatform, padding: const EdgeInsetsDirectional.only(end: 2.0)),
    if (extra.ktvLevelUrl.isNotEmpty) NameplateWidget(icon: extra.ktvLevelUrl, padding: const EdgeInsetsDirectional.only(end: 2.0)),
    if (extra.sevenLoveTag > 0) SevenLoveWidget(rank: extra.sevenLoveTag, padding: const EdgeInsetsDirectional.only(end: 3)),
    if (Util.validStr(extra.badgeIconInUse))
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: ActivityBadgeWidget(height: 22, icon: Util.parseStr(extra.badgeIconInUse)),
      ),
    ...messageGeneralTagList(content, false),
    if (Util.validStr(extra.newStarIcon))
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3),
        child: CachedNetworkImage(imageUrl: Util.resizeUrl(extra.newStarIcon, rh: 68), height: 22, fit: BoxFit.fitHeight),
      ),
  ];

  return widgets;
}

List<Widget> messageGeneralTagList(MessageContent content, bool front) {
  List<Widget> widgets = [];
  if (content.commonTags.isNotEmpty) {
    // Log.d(tag: "generalTag", "message:${content.messageId},total length:${content.commonTags.length}");
    for (int i = 0; i < content.commonTags.length; i++) {
      if (front && content.commonTags[i].location == 0) {
        // Log.d(tag: "generalTag", "message:${content.messageId},add to front:${content.commonTags[i].toString()}");
        widgets.add(CommonTagWidget(data: content.commonTags[i], inProfilePage: false));
      } else if (!front && content.commonTags[i].location == 1) {
        // Log.d(tag: "generalTag", "message:${content.messageId},add to end:${content.commonTags[i].toString()}");
        widgets.add(CommonTagWidget(data: content.commonTags[i], inProfilePage: false));
      } else {}
    }
  }
  return widgets;
}
