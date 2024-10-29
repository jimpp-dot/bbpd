import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:flutter/material.dart';

class SweetAlbumPanelGiftItem extends StatelessWidget {
  final SweetAlbumGiftItem gift;
  final bool unlocked;
  final bool select;
  final VoidCallback onTap;

  const SweetAlbumPanelGiftItem(
      {super.key,
      required this.gift,
      required this.unlocked,
      required this.select,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          R.img(
            select
                ? RoomAssets.chat_room$sweet_album_bg_gift_column_sel_webp
                : RoomAssets.chat_room$sweet_album_bg_gift_column_webp,
            width: 107.5.dp,
            height: 132.dp,
          ),
          SizedBox(
            width: 107.5.dp,
            height: 132.dp,
            child: Column(
              children: [
                SizedBox(height: 12.dp),
                CachedNetworkImage(
                  imageUrl: gift.giftIcon,
                  width: 60.dp,
                  height: 60.dp,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10.dp),
                SizedBox(
                  width: 96.dp,
                  child: Text(
                    gift.giftName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.dp,
                      color: select
                          ? const Color(0xFFBC5B11)
                          : const Color(0xFF8F6899),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 2.dp),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 2.5.dp),
                      child: R.img(MoneyConfig.moneyIcon,
                          width: 10, height: 10, wholePath: true),
                    ),
                    NumText(
                      '${gift.price}',
                      style: TextStyle(
                        fontSize: 14.dp,
                        color: select
                            ? const Color(0xFFBC5B11)
                            : const Color(0xFF8F6899),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!unlocked)
            Container(
              width: 107.5.dp,
              height: 132.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.dp),
                color: Colors.black.withOpacity(0.7),
                border: Border.all(color: Colors.white.withOpacity(0.7)),
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                RoomAssets.chat_room$sweet_album_ic_lock_webp,
                width: 24.dp,
                height: 24.dp,
              ),
            ),
          if (unlocked)
            Container(
              padding: const EdgeInsetsDirectional.only(start: 3, end: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(7.dp),
                    bottomEnd: Radius.circular(7.dp)),
                gradient: const LinearGradient(
                  colors: [Color(0xFF6B52FF), Color(0xFFDE96FF)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
              ),
              child: Text(
                gift.light > 0
                    ? K.room_light_num_x(['${gift.light}'])
                    : K.room_need_light,
                style: TextStyle(
                  fontSize: 10.dp,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        offset: const Offset(0.0, 0.5),
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.6))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
