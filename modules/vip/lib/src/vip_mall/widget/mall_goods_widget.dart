import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 皮队友首页厅列表装扮
///
class RoomListDecorate extends StatelessWidget {
  final double width;

  /// 厅背景图
  final String bg;

  /// 装扮图
  final String image;

  const RoomListDecorate(this.bg, this.image, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 328 / 108,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CachedNetworkImage(
              imageUrl: bg,
              width: width,
              cachedWidth: width.px,
              fit: BoxFit.fitWidth,
            ),
            RepaintBoundary(
              child: CachedNetworkImage(
                imageUrl: image,
                width: width,
                cachedWidth: width.px,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 头像框
///
class HeaderFrameWidget extends StatelessWidget {
  final double size;

  /// 厅背景图
  final String avatar;

  /// 装扮图
  final String image;
  final int? commodityLiveOnly;
  final String? commodityLiveLabel;

  const HeaderFrameWidget(
    this.avatar,
    this.image,
    this.size, {
    Key? key,
    this.commodityLiveOnly,
    this.commodityLiveLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CommonAvatar(
            path: avatar,
            shape: BoxShape.circle,
            size: 0.9 * size,
          ),
          UserIconFrame(
            size: size,
            frameUrl: image,
          ),
          if (commodityLiveOnly != null && commodityLiveOnly == 1 && !Util.isStringEmpty(commodityLiveLabel))
            UserLiveLabelWidget(commodityLiveLabel, UserLiveLabelType.frame, bgHeight: size),
        ],
      ),
    );
  }
}

/// 麦上光圈
class MicEffectWidget extends StatelessWidget {
  final double size; // 光圈大小
  final String avatar;
  final String image;

  const MicEffectWidget(this.avatar, this.image, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          UserIconFrame(
            size: size,
            frameUrl: image,
          ),
          CommonAvatar(
            path: avatar,
            shape: BoxShape.circle,
            size: size / 1.6,
          ),
        ],
      ),
    );
  }
}
