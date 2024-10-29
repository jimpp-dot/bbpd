import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

///
///
class WolfGuideBaseButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double width;
  final double height;
  final String? image;
  final VoidCallback? onTap;

  const WolfGuideBaseButton(
      {super.key,
      this.text,
      this.child,
      this.width = 113,
      this.height = 37,
      this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: (image != null && image!.isNotEmpty)
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath(
                      '$image',
                      package: ComponentManager.MANAGER_WERE_WOLF,
                    ),
                  ),
                ),
              )
            : null,
        child: (child != null)
            ? child
            : Text(
                '$text',
                style: R.textStyle.caption
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
