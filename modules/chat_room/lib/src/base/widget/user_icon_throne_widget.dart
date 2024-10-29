import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class UserIconThroneWidget extends StatelessWidget {
  final RoomPosition position;
  final double size;

  const UserIconThroneWidget(this.position,
      {super.key, this.size = IconSize.normal});

  @override
  Widget build(BuildContext context) {
    /// 皇帝贵族宝座
    /// 显示麦位大小的2倍
    double realSize = size * 2;
    double padding = (size - realSize) / 2;
    String throneImgSuffix =
        '${Util.getRemoteImgUrl(position.throneImg)}?x-oss-process=image/resize,m_fill,w_${realSize.px},h_${realSize.px},limit_1';

    return PositionedDirectional(
      top: padding,
      start: padding,
      child: IgnorePointer(
        child: SizedBox(
          width: realSize,
          height: realSize,
          child: CachedNetworkImage(
            imageUrl: throneImgSuffix,
            width: realSize,
            height: realSize,
            cachedWidth: realSize.px,
            cachedHeight: realSize.px,
            fit: BoxFit.fill,
            // key: ObjectKey('user-icon-throne-$throneImgSuffix'),
            errorWidget: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
