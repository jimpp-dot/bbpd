import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../model/pb/slp_gift_extension.dart';

/// 装扮物品显示
class SlpDecorateIcon extends StatelessWidget {
  final BbGiftPanelDecorates? item;

  const SlpDecorateIcon({Key? key, this.item}) : super(key: key);

  ShopMailCommodityType? get type => item?.getDecorateType;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ShopMailCommodityType.Decorate:
      case ShopMailCommodityType.Mounts:
        return CachedNetworkImage(
          imageUrl: item?.image ?? '',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        );
      case ShopMailCommodityType.Bubble:
        return _ChatBubbleWidget(
          image: item?.image ?? '',
          color: item?.getTextColor() ?? Colors.white,
          text: item?.bubbleDesc ?? '',
        );
      case ShopMailCommodityType.EnterEffect:
        return CachedNetworkImage(
          imageUrl: item?.image ?? '',
          height: 20,
          width: 60,
          fit: BoxFit.contain,
        );
      case ShopMailCommodityType.MicrophoneEffect:
        return MicrophoneEffect(
          size: const Size(52, 52),
          path: item?.image ?? '',
        );
      case ShopMailCommodityType.Frame:
        return HeaderFrame(
          size: const Size(52, 52),
          path: item?.image ?? '',
        );
      default:
        return CachedNetworkImage(
          imageUrl: item?.image ?? '',
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        );
    }
  }
}

/// 麦上光圈
class MicrophoneEffect extends StatelessWidget {
  final Size size;
  final String? path;
  final String? header;

  const MicrophoneEffect(
      {Key? key, this.size = const Size(60, 60), this.path, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          UserIconFrame(
            size: size.width,
            frameUrl: path ?? '',
          ),
          CommonAvatar(
            path: header ?? Session.icon,
            shape: BoxShape.circle,
            size: (size / 1.6).width,
          ),
        ],
      ),
    );
  }
}

/// 头像框
class HeaderFrame extends StatelessWidget {
  final Size size;
  final String? path;
  final String? header;

  const HeaderFrame(
      {Key? key, this.size = const Size(60, 60), this.path, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          CommonAvatar(
            path: header ?? Session.icon,
            shape: BoxShape.circle,
            size: (size / 1.1).width,
          ),
          UserIconFrame(
            size: size.width,
            frameUrl: path ?? '',
          ),
        ],
      ),
    );
  }
}

/// 聊天气泡
class _ChatBubbleWidget extends StatelessWidget {
  final String? image;
  final String? text;
  final Color? color;

  const _ChatBubbleWidget({Key? key, this.image, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double scale = 0.9;
    return Container(
      height: 48 * scale,
      width: 66 * scale,
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4 * scale),
      // constraints: BoxConstraints(minHeight: 48 * scale, minWidth: 66 * scale),
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            bottom: 0,
            child: CachedNetworkImageStretch(
              imageUrl: image,
              centerSlice: const Rect.fromLTWH(
                  32 * scale, 23 * scale, 2 * scale, 2 * scale),
              scale: 3 * scale,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsetsDirectional.fromSTEB(
                20 * scale, 15 * scale, 20 * scale, 13 * scale),
            child: Text(
              text ?? '', // 部分使用的地方控件太小，显示文字就越界
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: 11 * scale,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
