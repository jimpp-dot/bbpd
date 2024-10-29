import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:message/message.dart';

import '../../k.dart';

class MessageEmptyWidget extends StatelessWidget {
  final String? desc;
  final VoidCallback? onTap;
  final double? paddingBottom;
  final double? horizontalSpace;

  final Color? textColor;

  final TextAlign? textAlign;
  final double size;

  const MessageEmptyWidget({
    super.key,
    this.desc,
    this.onTap,
    this.paddingBottom,
    this.textColor,
    this.textAlign,
    this.size = 180,
    this.horizontalSpace,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            R.img(
              BaseAssets.shared$bb_null_webp,
              width: size,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 12.0,
                bottom: Util.isLocale ? 24 : paddingBottom ?? 20,
                start: horizontalSpace ?? 0,
                end: horizontalSpace ?? 0,
              ),
              child: Text(
                desc ?? BaseK.K.empty_result,
                style: TextStyle(
                    fontSize: 16,
                    color: textColor ?? R.colors.mainTextColor,
                    fontFamily: Util.fontFamily),
                textAlign: textAlign,
              ),
            ),
            InkWell(
              onTap: () {
                FriendAddScreen.show(context);
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                        colors: R.colors.mainBrandGradientColors)),
                child: Text(
                  K.msg_invite_friend,
                  style: R.textStyle.medium14.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
