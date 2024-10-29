import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 动态预览
class MomentPreviewWidget extends StatelessWidget {
  final List<CirclePicItem>? photos;
  final int momentCount;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double start;
  final double end;
  final bool suppDark;

  const MomentPreviewWidget(
      {super.key,
      this.photos,
      required this.momentCount,
      this.onPressed,
      this.padding,
      this.start = 0,
      this.end = 0,
      this.suppDark = false});

  Widget buildIcon(CirclePicItem photo, {double iconSize = 52.0}) {
    return CommonAvatar(
      path: Util.splitPx(photo.url),
      size: iconSize,
      borderRadius: BorderRadius.circular(12),
      suffix: '!head100',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (photos == null || photos!.isEmpty) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.only(start: start),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${K.base_msg_source_dynamic} $momentCount',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: R.colors.mainTextColor),
                    ),
                  ),
                  R.img(
                    'ic_next.svg',
                    width: 16,
                    height: 16,
                    color: R.colors.thirdTextColor,
                    package: ComponentManager.MANAGER_PROFILE,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: SizedBox(
                height: 52,
                child: ListView.separated(
                  key: const PageStorageKey<String>('MomentPreviewWidget'),
                  padding: EdgeInsetsDirectional.only(start: start, end: end),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: photos!.length,
                  itemBuilder: (context, index) {
                    return buildIcon(photos![index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
