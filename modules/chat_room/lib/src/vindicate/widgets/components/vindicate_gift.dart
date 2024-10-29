import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 表白活动专属礼物
class VindicateGift extends StatelessWidget {
  final GlobalKey? iconGlobalKey;

  final String url;

  final double width;

  final double height;

  double bgWidth;

  double bgHeight;

  /// 是否展示背景心型线条模板,默认不显示
  final bool showBgMask;

  /// 礼物相对于礼物背景的偏移量
  final EdgeInsetsDirectional giftMargin;

  final bool isLocked;

  VindicateGift({
    Key? key,
    this.iconGlobalKey,
    required this.url,
    this.width = 96,
    this.height = 96,
    this.showBgMask = true,
    this.giftMargin = EdgeInsetsDirectional.zero,
    this.bgWidth = 279,
    this.bgHeight = 223,
    this.isLocked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giftUrl = Util.imageFullUrl(
        '$url?x-oss-process=image/resize,w_${width.toInt()},h_${height.toInt()}');
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        if (showBgMask)
          PositionedDirectional(
            child: R.img(
                RoomAssets.chat_room$vindicate_vindicate_gift_bg_mask_webp,
                width: bgWidth,
                height: bgHeight,
                fit: BoxFit.cover),
          ),
        Container(
          key: iconGlobalKey,
          width: width,
          height: height,
          margin: giftMargin,
          child: CachedNetworkImage(
            imageUrl: giftUrl,
            color: Color.fromRGBO(255, 255, 255, isLocked ? 0.3 : 1.0),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
