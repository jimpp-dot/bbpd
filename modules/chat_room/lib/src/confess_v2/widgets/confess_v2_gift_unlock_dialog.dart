import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:flutter/material.dart';

/// 恋爱旅行礼物解锁弹窗
class ConfessV2GiftUnlockDialog extends StatelessWidget {
  final String name;
  final int giftId;

  const ConfessV2GiftUnlockDialog(
      {super.key, required this.name, required this.giftId});

  static Future show(BuildContext context, String name, int giftId) {
    return showDialog(
      context: context,
      builder: (context) {
        return ConfessV2GiftUnlockDialog(name: name, giftId: giftId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 78.dp),
        Container(
          width: 280.dp,
          height: 300.dp,
          padding: EdgeInsetsDirectional.only(top: 112.dp),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage(RoomAssets.chat_room$confess_v2_bg_dialog_webp),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 28.dp, end: 28.dp),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: '恭喜您解锁了'),
                      TextSpan(
                        text: '「$name」',
                        style: const TextStyle(
                          color: Color(0xFF804CEF),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '礼物的赠送资格'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 24.dp),
              CachedNetworkImage(
                imageUrl: Util.imageFullUrl(
                    '${ConfessV2Util.giftUrl(giftId)}?x-oss-process=image/resize,w_${100.dp.toInt()},h_${100.dp.toInt()}'),
                width: 100.dp,
                height: 100.dp,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        SizedBox(height: 30.dp),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: R.img(RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
              width: 48.dp, height: 48.dp),
        ),
      ],
    );
  }
}
