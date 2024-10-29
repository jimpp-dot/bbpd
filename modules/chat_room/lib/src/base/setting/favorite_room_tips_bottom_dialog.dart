import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

/// 收藏房间提示框
class FavoriteRoomTipsBottomDialog extends StatelessWidget {
  const FavoriteRoomTipsBottomDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.75,
      builder: (context) => const FavoriteRoomTipsBottomDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        ),
        color: R.color.mainBgColor,
      ),
      padding: EdgeInsetsDirectional.only(
        top: 13,
        bottom: Util.isIphoneX ? Util.iphoneXBottom : 20,
        start: 16,
        end: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.room_favorite_room_tips_title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.1,
              color: R.color.mainTextColor,
            ),
          ),
          Container(
            width: Util.width - 32,
            height: 1,
            margin: const EdgeInsetsDirectional.only(top: 13, bottom: 20),
            color: R.color.secondTextColor.withOpacity(0.1),
          ),
          Text(
            K.room_favorite_room_tips_subtitle,
            style: TextStyle(
                fontSize: 13, color: R.color.secondTextColor, height: 1.1),
          ),
          const SizedBox(height: 16),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(
                'static/room/settings/favorite_room_tips.webp'),
            width: Util.width - 32,
            height: (Util.width - 32) * 542 / 680,
            cachedWidth: (Util.width - 32).px,
            cachedHeight: ((Util.width - 32) * 542 / 680).px,
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Navigator.maybePop(context, true),
            child: Container(
              width: Util.width - 32,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(26),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.sure,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
