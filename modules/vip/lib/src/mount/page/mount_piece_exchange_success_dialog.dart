import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';

/// 座驾碎片兑换成功
class MountPieceExchangeSuccessDialog extends StatelessWidget {
  final String icon;
  final String tip;

  const MountPieceExchangeSuccessDialog(
      {super.key, required this.icon, required this.tip});

  static Future show(BuildContext context, String icon, String tip) async {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return MountPieceExchangeSuccessDialog(icon: icon, tip: tip);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: Util.width,
        height: Util.height,
        padding: EdgeInsetsDirectional.only(bottom: 150.dp),
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            R.img(Assets.vip$mount_bg_exchange_success_png,
                width: 318.dp, height: 318.dp),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 32.dp),
                CachedNetworkImage(
                  imageUrl: icon,
                  width: 200.dp,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 20.dp),
                RichText(
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: tip,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.dp,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: ' 兑换成功!',
                        style: TextStyle(
                            color: const Color(0xFFFCF3A0),
                            fontSize: 20.dp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
