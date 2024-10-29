import 'dart:ui';
import 'package:flutter/material.dart';

class ImageBlurWidget extends StatelessWidget {
  final Widget? child;
  final Widget? frontWidget;
  final double blur;
  final Color? color;
  final double? width;
  final double? height;
  final double borderRadius;

  const ImageBlurWidget(
      {super.key,
      this.child,
      this.frontWidget,
      this.blur = 3,
      this.color = Colors.white,
      this.width,
      this.height,
      this.borderRadius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Stack(
        children: [
          if (child != null) child!,
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              width: width,
              height: height,
              color: (color ?? Colors.white).withOpacity(0.1),
            ),
          ),
          if (frontWidget != null) frontWidget!,
        ],
      ),
    );
  }
}
