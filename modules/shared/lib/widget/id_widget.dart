import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// id 控件，高度固定、宽度自适应
class IDWidget extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final bool needShadows;
  final double? iDFontSize;
  final double? fontSize;
  final Color? fontColor;
  final Color? iDFontColor;
  final FontWeight? fontWeight;
  final GestureTapCallback? onTap;
  final bool dark;

  const IDWidget({
    super.key,
    required this.uid,
    this.width,
    this.height,
    this.imagePath,
    this.needShadows = false,
    this.fontSize,
    this.iDFontSize,
    this.fontColor,
    this.iDFontColor,
    this.fontWeight,
    this.onTap,
    this.dark = false,
  });

  final int? uid;

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          // Rext.autoStyleImg(
          //   imagePath ?? BaseAssets.shared$ic_id_webp,
          //   dark: dark,
          //   height: height ?? 16,
          //   package: ComponentManager.MANAGER_BASE_CORE,
          //   fit: BoxFit.fitHeight,
          // ),
          Text(
            'ID:',
            style: TextStyle(
              fontSize: iDFontSize ?? 11,
              color: iDFontColor ?? R.colors.secondTextColor,
              height: 1,
            ),
          ),
          const SizedBox(width: 3),
          NumText(
            Utility.uidToString(uid.toString()),
            maxLines: 1,
            textScaleFactor: 1.0,
            style: TextStyle(
              shadows: needShadows
                  ? <Shadow>[
                      const Shadow(
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0,
                          color: Colors.black26),
                    ]
                  : null,
              fontSize: fontSize,
              color: fontColor,
              fontWeight: fontWeight,
              fontFamily: Util.numFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
