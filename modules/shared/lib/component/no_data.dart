import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../k.dart';

class EmptyWidget extends StatelessWidget {
  final String? desc;
  final VoidCallback? onTap;
  final double? paddingBottom;

  final Color? textColor;
  final double? textSize;
  final TextAlign? textAlign;
  final double? size;
  final String? imgPath;

  const EmptyWidget({
    super.key,
    this.desc,
    this.onTap,
    this.paddingBottom,
    this.textColor,
    this.textAlign,
    this.textSize = 16,
    this.size = 180,
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 200,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              R.img(
                !Util.isStringEmpty(imgPath) ? imgPath : BaseAssets.error_data_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: size,
                height: size,
                fit: BoxFit.fill,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 12.0, bottom: paddingBottom ?? 120),
                child: Text(
                  desc ?? K.no_data,
                  style: TextStyle(
                    fontSize: textSize,
                    color: textColor ?? R.color.mainTextColor,
                    fontFamily: Util.fontFamily,
                  ),
                  textAlign: textAlign,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 上面是图片，图片下方是文本的EmptyWidget
class ImageEmptyWidget extends StatelessWidget {
  final String path;
  final String text;
  final Color? textColor;

  const ImageEmptyWidget(this.path,
      {super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        R.img(
          path,
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: textColor ?? R.color.mainTextColor,
              fontFamily: Util.fontFamily),
        )
      ],
    );
  }
}
