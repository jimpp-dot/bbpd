import 'package:chat_room/src/vindicate/widgets/components/vindicate_small_heart.dart';
import 'package:flutter/material.dart';

class VindicateCardBox extends StatelessWidget {
  double? width;

  double? height;

  final Widget? child;

  Color? backgroundColor;

  VindicateCardBox({
    Key? key,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  /// 礼物的盒子
  VindicateCardBox.giftBox({Key? key, this.child, this.backgroundColor})
      : super(key: key) {
    width = 93;
    height = 125;
  }

  /// 表白广场表白记录盒子
  VindicateCardBox.squareBox(
      {Key? key, this.child, this.width, this.height, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsetsDirectional.all(4.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(12.0)),
        color: backgroundColor ?? Colors.white,
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(5.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(9.0)),
          border: Border.all(
              width: 0.5, color: const Color(0xFFF754B9).withOpacity(0.4)),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(
              top: 0,
              start: 0,
              child: VindicateSmallHeart.pink(
                alignment: AlignmentDirectional.topStart,
              ),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: VindicateSmallHeart.pink(
                alignment: AlignmentDirectional.topEnd,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              child: VindicateSmallHeart.pink(
                alignment: AlignmentDirectional.bottomStart,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              end: 0,
              child: VindicateSmallHeart.pink(
                alignment: AlignmentDirectional.bottomEnd,
              ),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
