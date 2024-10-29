import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:flutter/material.dart';

/// 恋爱旅行礼物赠送解锁弹窗
class ConfessV2GiftSendTipDialog extends StatelessWidget {
  final String name;
  final int giftId;
  final VoidCallback onTapSend;

  const ConfessV2GiftSendTipDialog(
      {super.key,
      required this.name,
      required this.giftId,
      required this.onTapSend});

  static Future show(
      BuildContext context, String name, int giftId, VoidCallback onTapSend) {
    return showDialog(
      context: context,
      builder: (context) {
        return ConfessV2GiftSendTipDialog(
            name: name, giftId: giftId, onTapSend: onTapSend);
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
          height: 374.dp,
          padding: EdgeInsetsDirectional.only(top: 110.dp),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    RoomAssets.chat_room$confess_v2_bg_dialog_long_webp),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 28.dp, end: 28.dp),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: '请先赠送'),
                      TextSpan(
                        text: '「$name」',
                        style: const TextStyle(
                          color: Color(0xFF804CEF),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '才有机会解锁哟'),
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
              SizedBox(height: 24.dp),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onTapSend();
                },
                child: R.img(RoomAssets.chat_room$confess_v2_btn_gift_send_webp,
                    width: 212.dp, height: 50.dp),
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
