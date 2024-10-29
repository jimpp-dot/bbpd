import 'package:flutter/material.dart';

import '../component/cachedNetworkImage.dart';
import '../src/extensions.dart';
import '../src/rive/bb_rive.dart';
import '../src/util.dart';

/// 头像框/麦圈：支持rive和webp两种
class UserIconFrame extends StatelessWidget {
  final double size;
  final String frameUrl;

  const UserIconFrame({Key? key, required this.size, required this.frameUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.validStr(frameUrl) && size > 0) {
      if (frameUrl.endsWith('.riv')) {
        /// rive格式
        return RepaintBoundary(
          child: SizedBox(
            width: size,
            height: size,
            child: BBRive.network(
              ValueKey('user-icon-frame-$frameUrl'),
              Util.getRemoteImgUrl(frameUrl),
            ),
          ),
        );
      }
      return RepaintBoundary(
        child: CachedNetworkImage(
          imageUrl: '${Util.getRemoteImgUrl(frameUrl)}?x-oss-process=image/resize,m_fill,w_${size.px},h_${size.px},limit_1',
          width: size,
          height: size,
          cachedWidth: size.px,
          cachedHeight: size.px,
          key: ObjectKey('user-icon-frame-$frameUrl'),
          errorWidget: const SizedBox.shrink(),
          fit: BoxFit.fill,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
