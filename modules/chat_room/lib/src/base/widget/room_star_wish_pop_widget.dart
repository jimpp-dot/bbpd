import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

class RoomStarWishPopWidget extends StatelessWidget {
  final String? icon;
  final String? desc;
  final String? name;
  const RoomStarWishPopWidget({Key? key, this.icon, this.desc, this.name})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {String? icon, String? desc, String? name}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          RoomStarWishPopWidget(icon: icon, desc: desc, name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              R.img(RoomAssets.chat_room$room_star_wish_pop_bg_webp,
                  width: Util.width - 11, fit: BoxFit.fitWidth),
              Positioned.fill(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    R.img(
                        RoomAssets.chat_room$room_star_wish_congratulation_webp,
                        width: 210,
                        fit: BoxFit.fitWidth),
                    const SizedBox(
                      height: 12,
                    ),
                    GradientText(
                      desc ?? '',
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Color(0xffFFB375)]),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(icon ?? ''),
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(name ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          R.img(
                              RoomAssets
                                  .chat_room$room_star_wish_pop_button_webp,
                              width: 180,
                              fit: BoxFit.fitWidth),
                          const Text('确定',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              child: R.img('dialog_bottom_close.png',
                  package: ComponentManager.MANAGER_CHAT,
                  width: 30,
                  height: 30),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
