import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:flutter/material.dart';

class SweetAlbumPageGiftItem extends StatelessWidget {
  final SweetAlbumGiftItem gift;
  final bool unlocked;
  final VoidCallback onTap;

  const SweetAlbumPageGiftItem(
      {super.key,
      required this.gift,
      required this.unlocked,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 70.dp,
            height: 86.dp,
            margin: EdgeInsets.symmetric(horizontal: 1.5.dp, vertical: 2.dp),
            padding: EdgeInsetsDirectional.all(1.dp),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.dp),
              gradient: const LinearGradient(
                colors: [Color(0xFFF5A7F5), Color(0xFFF5C9F5)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.dp),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFCE3FC), Color(0xFFFCF2FC)],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 9.dp),
                  CachedNetworkImage(
                    imageUrl: gift.giftIcon,
                    width: 40.dp,
                    height: 40.dp,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    width: 50.dp,
                    height: 1.dp,
                    margin:
                        EdgeInsetsDirectional.only(top: 11.dp, bottom: 4.dp),
                    decoration: const ShapeDecoration(
                        shape: StadiumBorder(), color: Color(0xFFF5BBF5)),
                  ),
                  Text(
                    unlocked
                        ? (gift.light > 0
                            ? K.room_light_x(['${gift.light}'])
                            : K.room_need_light)
                        : K.room_ununlocked,
                    style: TextStyle(
                        fontSize: 12.dp,
                        color: const Color(0xFF8F6899),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          if (!unlocked)
            Container(
              width: 70.dp,
              height: 86.dp,
              margin: EdgeInsets.symmetric(horizontal: 1.5.dp, vertical: 2.dp),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.dp),
                color: Colors.black.withOpacity(0.7),
              ),
              child: R.img(
                RoomAssets.chat_room$sweet_album_ic_lock_webp,
                width: 21.dp,
                height: 21.dp,
              ),
            ),
          R.img(
            RoomAssets.chat_room$sweet_album_gift_column_border_webp,
            width: 73.dp,
            height: 90.dp,
          ),
        ],
      ),
    );
  }
}
