import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

///活动弹窗
class UserActivityPackage extends Dialog {
  final BuildContext context;
  final double width;
  final double height;
  final VoidCallback? onPress;
  final String imgUrl;

  static Future openActivityDialog(BuildContext context, String imgUrl,
      {double width = 312, double height = 500, VoidCallback? onPress}) {
    return DialogQueue.root.enqueue(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return UserActivityPackage(
          context: context,
          width: width,
          height: height,
          onPress: onPress,
          imgUrl: imgUrl,
        );
      },
    );
  }

  const UserActivityPackage({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
    required this.onPress,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageW = min(Util.width - 20, width * Util.ratio);
    double imageH = height / width * imageW;
    return ScaleAnimationWidget(
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              PositionedDirectional(
                child: GestureDetector(
                  onTap: onPress,
                  child: Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 48),
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      width: imageW,
                      height: imageH,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: R.img('box/pop_circle_close.webp',
                      width: 28,
                      height: 28,
                      package: ComponentManager.MANAGER_BASE_CORE),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
