import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';
import 'package:chat_room/k.dart';

/*
礼物猜猜乐 触发飘屏
事件名称：room.screen.fly.guess.gift
im消息数据：{"type": "guess_gift", "rid":200022466,"role1":{"uid":193187037,"name":"daicy","icon":"201708\/25\/59a03e188066b7.72746248.jpg"},"role2":{"uid":131542116,"name":"\u5c0f\u53f7-QQ","icon":"static\/home\/ic_game.png"},"tacit":195500}
 */
class GuessGiftGlobalMessageWidget extends StatelessWidget {
  final GlobalMessage data;

  const GuessGiftGlobalMessageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            colors: [Color(0xFF99B0FF), Color(0xFFC366FF)]),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFEB0FF), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          _buildAvatars(data.role1?.icon ?? '', data.role2?.icon ?? ''),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNames(data.role1?.name ?? '', data.role2?.name ?? ''),
                const SizedBox(height: 1),
                Text(
                  K.room_guess_gift_global_message_tip +
                      Util.numberToWString(data.tacit),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          R.img(RoomAssets.chat_room$guess_gift_ic_guess_gift_icon_webp,
              width: 47, height: 40),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildNames(String name1, String name2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60),
          child: Text(
            name1,
            style: const TextStyle(
                color: Color(0xFFFFF056),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Text('&',
            style: TextStyle(
                color: Color(0xFFFFF056),
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60),
          child: Text(
            name2,
            style: const TextStyle(
                color: Color(0xFFFFF056),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatars(String icon1, String icon2) {
    return SizedBox(
      width: 60,
      height: 32,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: AlignmentDirectional.center,
            foregroundDecoration: const ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 0.5)),
              color: Colors.transparent,
            ),
            child: CommonAvatar(path: icon1, size: 32, shape: BoxShape.circle),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              width: 32,
              height: 32,
              alignment: AlignmentDirectional.center,
              foregroundDecoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 0.5)),
                color: Colors.transparent,
              ),
              child:
                  CommonAvatar(path: icon2, size: 32, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
