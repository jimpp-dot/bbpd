import 'package:shared/shared.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../../chat_room.dart';

class CpLinkUserIcon extends StatelessWidget {
  final double iconSize;
  final ChatRoomData room;
  final RoomPosition roomPosition;
  final double _borderWidth = 2;
  final bool isAnimating;
  final bool isScene;
  final bool displayEmote;

  /// 助力开关
  final bool assist;

  /// 送欧气 开关
  final bool luck;

  const CpLinkUserIcon({
    Key? key,
    required this.iconSize,
    required this.room,
    required this.roomPosition,
    this.isAnimating = false,
    this.isScene = false,
    this.assist = true,
    this.luck = false,
    this.displayEmote = true,
  }) : super(key: key);

  Color get bgColor => const Color(0xFF6617A5);

  Gradient get borderGradient {
    int position = roomPosition.position;
    List<Color> colors;
    if (position == 0) {
      colors = [const Color(0xFFFF7BBE), const Color(0xFFF863D3)];
    } else if (position == 7) {
      colors = [const Color(0xFFBF8EFF), const Color(0xFF6EB8FE)];
    } else if (position > 3) {
      colors = [const Color(0xFFD159B4), const Color(0xFFD15BB5)];
    } else {
      colors = [const Color(0xFF6689DA), const Color(0xFF5E86DD)];
    }
    if (isScene) {
      if (position == 0) {
        colors = [const Color(0xFF6689DA), const Color(0xFF5E86DD)];
      } else {
        colors = [const Color(0xFFD159B4), const Color(0xFFD15BB5)];
      }
    }
    return LinearGradient(colors: colors);
  }

  Gradient get positionGradient {
    int position = roomPosition.position;
    List<Color> colors;
    if (position == 0 || position == 7) {
      colors = [const Color(0xFFFF7BBE), const Color(0xFFF863D3)];
    } else if (position > 3) {
      colors = [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)];
    } else {
      colors = [const Color(0xFF75DFFF), const Color(0xFF2ECEFE)];
    }

    if (isScene) {
      if (position == 0) {
        colors = [const Color(0xFF75DFFF), const Color(0xFF2ECEFE)];
      } else {
        colors = [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)];
      }
    }
    return LinearGradient(colors: colors);
  }

  Color get emptyBorderColor => Colors.white24;

  bool get isLinkPosition =>
      roomPosition.position > 0 && roomPosition.position < 7;

  Widget _buildIcon() {
    String iconName;
    if (room.config?.mode == RoomMode.Lock) {
      if (ChatRoomUtil.isBossChair(roomPosition)) {
        iconName = RoomAssets.chat_room$boss_svg;
      } else {
        iconName = RoomAssets.chat_room$wait_svg;
      }
    } else {
      if (roomPosition.lock &&
          room.config != null &&
          room.config?.property != RoomProperty.Private) {
        iconName = RoomAssets.chat_room$empty_close_svg;
      } else {
        iconName = RoomAssets.chat_room$empty_join_svg;
      }
    }

    bool isEmpty = roomPosition.uid <= 0;
    if (isLinkPosition) {
      return Stack(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color(0x33FFFFFF), width: _borderWidth),
            ),
            child: isEmpty || isAnimating
                ? Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: isAnimating
                          ? R.img(iconName, width: 24, height: 24)
                          : UserIcon(
                              size: iconSize - 2 * _borderWidth,
                              room: room,
                              position: roomPosition),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          if (!isEmpty && !isAnimating)
            Positioned.fill(
              child: Center(
                child: UserIcon(
                  size: iconSize - 2 * _borderWidth + 2,
                  room: room,
                  position: roomPosition,
                ),
              ),
            ),
        ],
      );
    } else {
      return Container(
        width: iconSize,
        height: iconSize,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: CustomPaint(
          painter: _GradientBorderPainter(
              strokeWidth: _borderWidth,
              gradient: borderGradient,
              radius: iconSize / 2),
          child: UserIcon(
              size: iconSize - _borderWidth,
              room: room,
              position: roomPosition),
        ),
      );
    }
  }

  //皇冠
  Widget _buildCrown() {
    return R.img(
      roomPosition.position == 2
          ? RoomAssets.chat_room$cplink_cplink_crown_left_webp
          : RoomAssets.chat_room$cplink_cplink_crown_right_webp,
      width: 56,
      height: 33,
    );
  }

  /// 助力
  Widget _buildPromote(BuildContext context, double width) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Log.d(
            'In CpLinkUserIcon._buildPromote, uid: ${roomPosition.uid}, name: ${roomPosition.name}');
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(context,
            room: room, uid: roomPosition.uid, isCpLinkPromote: true);
      },
      child: Column(
        children: [
          R.img(RoomAssets.chat_room$cplink_cplink_icon_arrow_webp,
              width: 4, height: 4),
          Container(
            width: 30,
            height: 13,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              gradient: LinearGradient(
                  colors: [Color(0xFFFF67A8), Color(0xFFFFAB8F)]),
            ),
            child: Text(
              K.room_cplink_promote,
              style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 9),
            ),
          ),
          SizedBox(width: width, height: 4),
        ],
      ),
    );
  }

  bool get hasHartValue {
    if (room.config != null &&
        room.config?.configExpendData != null &&
        room.config?.configExpendData is CpLinkConfigData) {
      CpLinkConfigData cpLinkConfigData =
          room.config?.configExpendData as CpLinkConfigData;
      int index = roomPosition.position % 3;
      if (index == 1) {
        return cpLinkConfigData.heartValue.length >= 2 &&
            cpLinkConfigData.heartValue[1] > 0;
      } else if (index == 2) {
        return cpLinkConfigData.heartValue.isNotEmpty &&
            cpLinkConfigData.heartValue[0] > 0;
      } else if (index == 0) {
        return cpLinkConfigData.heartValue.length >= 3 &&
            cpLinkConfigData.heartValue[2] > 0;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool showPromote = false;
    bool showCrown = false;
    bool showLuck = false;
    RoomPosition? luckTargetPosition;

    if (room.config != null &&
        room.config?.configExpendData != null &&
        room.config?.configExpendData is CpLinkConfigData) {
      RoomPosition leftPosition = room.positions[2];
      RoomPosition rightPosition = room.positions[5];
      bool isLeft = roomPosition.uid == leftPosition.uid;
      bool isRight = roomPosition.uid == rightPosition.uid;

      CpLinkConfigData cpLinkConfigData =
          room.config?.configExpendData as CpLinkConfigData;
      CpLinkState cpLinkState = cpLinkConfigData.state;
      showCrown = roomPosition.uid > 0 &&
          (roomPosition.position == 2 || roomPosition.position == 5) &&
          (cpLinkState == CpLinkState.heart ||
              cpLinkState == CpLinkState.hand) &&
          (room.config?.configExpendData as CpLinkConfigData)
              .heartValue
              .isNotEmpty;
      showPromote = isLinkPosition &&
          (cpLinkState == CpLinkState.heart ||
              cpLinkState == CpLinkState.hand) &&
          roomPosition.uid != Session.uid &&
          hasHartValue &&
          assist;
      showLuck = ((isLeft && Session.uid == rightPosition.uid) ||
              (isRight && Session.uid == leftPosition.uid)) &&
          cpLinkState == CpLinkState.hand;
      luckTargetPosition = isLeft
          ? leftPosition
          : isRight
              ? rightPosition
              : null;
    }

    double iconTop = showCrown ? 24 : 0;
    double labelTop = iconTop + iconSize + 6 - 16;
    double promoteTop = labelTop + 16 + 2;
    double luckTop = labelTop + 16 + 2;
    double iconHeight = iconSize + iconTop + 3;

    if (luck && showLuck) {
      iconHeight += 30;
    } else if (showPromote) {
      iconHeight += 18;
    }
    String tagIcon = GodTagUtil.getGodTagByUid(roomPosition.uid);

    return SizedBox(
      width: iconSize,
      height: iconHeight + 2,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(top: iconTop, child: _buildIcon()),
          PackageAtMic(position: roomPosition, room: room),
          PositionedDirectional(
            top: labelTop,
            end: _showGodTag && tagIcon.isNotEmpty ? (iconSize - 64) / 2 : null,
            child: Row(
              children: [
                if (_showGodTag && tagIcon.isNotEmpty)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 3),
                    child: R.img(tagIcon, height: 12, fit: BoxFit.fitHeight),
                  ),
                CpLinkUserLabel(roomPosition, isScene: isScene),
              ],
            ),
          ),
          if (showCrown) PositionedDirectional(top: 4, child: _buildCrown()),
          luck && showLuck
              ? PositionedDirectional(
                  top: luckTop,
                  child: _buildLuck(context, luckTargetPosition),
                )
              : showPromote
                  ? PositionedDirectional(
                      top: promoteTop, child: _buildPromote(context, iconSize))
                  : const SizedBox()
        ],
      ),
    );
  }

  bool get _showGodTag =>
      !isScene && roomPosition.position != 0 && roomPosition.position != 7;

  Widget _buildLuck(BuildContext context, RoomPosition? position) {
    return GestureDetector(
      onTap: () {
        if (position == null || position.uid == 0) return;
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomAuctionBlessGiftPanel(
          context,
          rid: room.realRid,
          uid: position.uid,
          name: position.name,
          icon: position.icon,
        );
      },
      child: Container(
        width: 90,
        height: 28,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                RoomAssets.chat_room$auction_auction_defend_bless_btn_webp),
            fit: BoxFit.contain,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          K.room_send_bless,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientBorderPainter(
      {required this.strokeWidth,
      required this.radius,
      required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(
      strokeWidth,
      strokeWidth,
      size.width - strokeWidth * 2,
      size.height - strokeWidth * 2,
    );
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect,
        textDirection: Directionality.of(System.context));

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class CpLinkUserLabel extends StatelessWidget {
  final RoomPosition roomPosition;
  final bool isScene;
  final double? width;

  const CpLinkUserLabel(this.roomPosition,
      {Key? key, this.isScene = false, this.width})
      : super(key: key);

  Gradient get positionGradient {
    int position = roomPosition.position;
    List<Color> colors;
    if (position == 0 || position == 7) {
      colors = [const Color(0xFFFF7BBE), const Color(0xFFF863D3)];
    } else if (position > 3) {
      colors = [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)];
    } else {
      colors = [const Color(0xFF75DFFF), const Color(0xFF2ECEFE)];
    }
    return LinearGradient(colors: colors);
  }

  Widget _buildLabel() {
    double fontSize = 10.0;

    if (isScene) {
      return Container(
          height: 16,
          width: width ?? 54,
          padding: const EdgeInsetsDirectional.only(start: 3),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
                side: BorderSide(color: Color(0xFFFF94A9), width: 0.5)),
            color: Color(0xFF313131),
          ),
          alignment: Alignment.center,
          child: Text(
            roomPosition.uid > 0
                ? roomPosition.name
                : K.room_cplink_user_label_empty,
            maxLines: 1,
            style:
                TextStyle(color: const Color(0xFFFEFEFE), fontSize: fontSize),
          ));
    }

    if (roomPosition.position == 0) {
      return Container(
        width: width,
        padding: const EdgeInsetsDirectional.only(
            start: 4, end: 4, top: 1, bottom: 1),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFF86AFF), Color(0xFFFE62A5)]),
        ),
        child: Text(
          K.room_cplink_user_label_creator,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      );
    } else if (roomPosition.position == 7) {
      return Container(
        width: width,
        padding: const EdgeInsetsDirectional.only(
            start: 4, end: 4, top: 1, bottom: 1),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFF6EB6FF), Color(0xFF7BFEE9)]),
        ),
        child: Text(
          K.room_cplink_user_label_boss,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      );
    } else {
      bool isForbidden = roomPosition.forbidden && roomPosition.uid > 0;
      return Container(
        width: width ?? 64,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(
            start: 3, end: 3, top: 0.5, bottom: 1),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(
              side: BorderSide(color: Color(0x80C988FF), width: 0.5)),
          color: Color(0xCC472C5F),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                gradient: positionGradient,
              ),
              child: Text(
                '${roomPosition.position}',
                maxLines: 1,
                style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 9.5),
              ),
            ),
            Flexible(
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
                child: Text(
                  roomPosition.uid > 0
                      ? (roomPosition.name)
                      : K.room_cplink_user_label_empty,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: const Color(0xFFFEFEFE), fontSize: fontSize),
                ),
              ),
            ),
            if (isForbidden)
              R.img(RoomAssets.chat_room$ic_forbidden_mic_svg,
                  width: 13, height: 13),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildLabel();
  }
}
