import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import '../model/gpk_model.dart';

/// 贡献榜榜首弹窗赠送应援票
class BestSenderDialog extends StatelessWidget {
  final Prop prop;

  const BestSenderDialog({super.key, required this.prop});

  static Future show({
    Key? key,
    required BuildContext context,
    required Prop prop,
  }) {
    return DialogQueue.root.enqueue(
      context: context,
      builder: (_) {
        return BestSenderDialog(key: key, prop: prop);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          R.img(
            RoomAssets.chat_room$gpk_best_sender_dialog_bg_webp,
            width: 296.dp,
            height: 462.dp,
            fit: BoxFit.contain,
          ),
          PositionedDirectional(
            top: 171.dp,
            child: Text(
              K.room_gpk_best_sender_title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PositionedDirectional(
            top: 205.dp,
            start: 32.dp,
            end: 32.dp,
            child: Text(
              K.room_gpk_best_sender_desc([prop.cardName]),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PositionedDirectional(
            bottom: 100.dp,
            child: Container(
              width: 100.dp,
              height: 100.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(prop.cardIcon),
                width: 90.dp,
                height: 90.dp,
                fit: BoxFit.contain,
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 12.dp,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).maybePop();
              },
              child: Container(
                width: 257.dp,
                height: 72.dp,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$gpk_best_sender_dialog_btn_webp),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.room_confirm,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
