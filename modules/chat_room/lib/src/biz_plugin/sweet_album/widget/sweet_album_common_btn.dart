import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

class SweetAlbumCommonBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SweetAlbumCommonBtn({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.dp,
        height: 44.dp,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage(RoomAssets.chat_room$sweet_album_bg_btn_webp))),
        child: Text(text,
            style: Util.youSheBiaoTiYuan
                .copyWith(fontSize: 20.dp, color: Colors.white)),
      ),
    );
  }
}
