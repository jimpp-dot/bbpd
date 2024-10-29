import 'package:rank/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 直播中的标识
class RankingUserIconLive extends StatelessWidget {
  final double size;
  final Color color;
  final bool showCircle;

  const RankingUserIconLive({
    super.key,
    required this.size,
    required this.color,
    this.showCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.dp, color: color),
              ),
            ),
            PositionedDirectional(
              bottom: -5.dp,
              child: Container(
                height: 17.dp,
                padding: EdgeInsets.symmetric(horizontal: 4.dp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4.dp),
                ),
                child: Text(
                  K.rank_live,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.dp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
