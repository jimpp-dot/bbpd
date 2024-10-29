import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';

/// 星雨心愿
class StarWishMessage extends StatelessWidget {
  final GlobalMessage data;

  const StarWishMessage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(RoomAssets.chat_room$room_star_wish_global_message_bg_webp,
            width: Util.width, fit: BoxFit.fitWidth),
        PositionedDirectional(
          start: 30.dp,
          end: 30.dp,
          top: 0,
          bottom: 0,
          child: Row(
            children: [
              Container(
                width: 48.dp,
                height: 48.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF482DA8), Color(0xFF856CDB)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(24.dp),
                ),
                child: CommonAvatar(
                  path: data.uIcon,
                  size: 45.dp,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 5.dp),
              Expanded(
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: K.room_congratulations,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: data.uName,
                        style: const TextStyle(
                            color: Color(0xFFFFF01F),
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: K.room_god_in,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: '【${data.rName}】',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      const TextSpan(
                        text: '的星座幸运宝库获得',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: '【${data.giftName}】',
                        style: const TextStyle(
                            color: Color(0xFFFFF01F),
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.dp),
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(data.giftImage),
                width: 60.dp,
                height: 60.dp,
              ),
            ],
          ),
        )
      ],
    );
  }
}
