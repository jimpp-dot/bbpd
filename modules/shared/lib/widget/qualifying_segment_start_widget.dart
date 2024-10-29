import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class QualifyingSegmentStarWidget extends StatelessWidget {
  final int cur;
  final int total;

  const QualifyingSegmentStarWidget(this.cur, this.total, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (total == 0) {
      // 最高段位 => 显示 *5
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img('ic_cross_pk_star_s_l.webp',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE),
          Text('・$cur',
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ],
      );
    }
    List<Widget> children = [];
    for (int i = 0; i < total; i++) {
      children.add(R.img(
          i < cur ? 'ic_cross_pk_star_s_l.webp' : 'ic_cross_pk_star_s.webp',
          width: 16,
          height: 16,
          package: ComponentManager.MANAGER_BASE_CORE));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children
          .expand(
              (_) => (_ == children.last) ? [_] : [_, const SizedBox(width: 8)])
          .toList(),
    );
  }
}

class QualifyingSegmentStarBigWidget extends StatelessWidget {
  final int cur;
  final int total;
  final double height;
  final double fontSize;

  const QualifyingSegmentStarBigWidget(this.cur, this.total,
      {Key? key, this.height = 36, this.fontSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (total == 0) {
      // 最高段位 => 显示 *5
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img('ic_cross_pk_star_l.webp',
              width: height,
              height: height,
              package: ComponentManager.MANAGER_BASE_CORE),
          const SizedBox(width: 6),
          Container(
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Text('・$cur',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold))),
        ],
      );
    }
    List<Widget> children = [];
    for (int i = 0; i < total; i++) {
      children.add(R.img(
          i < cur ? 'ic_cross_pk_star_l.webp' : 'ic_cross_pk_star.webp',
          width: height,
          height: height,
          package: ComponentManager.MANAGER_BASE_CORE));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children
          .expand((_) =>
              (_ == children.last) ? [_] : [_, const SizedBox(width: 12)])
          .toList(),
    );
  }
}
