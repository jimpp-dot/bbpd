import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';

/// 2023国庆节活动房间飘屏
class NationalActMessage extends StatelessWidget {
  final GlobalMessage data;

  const NationalActMessage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.jumpPath.isNotEmpty) {
          BaseWebviewScreen.show(context, url: data.jumpPath);
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          R.img(RoomAssets.chat_room$activity_bg_national_act_webp,
              width: Util.width, fit: BoxFit.fitWidth),
          PositionedDirectional(
            start: 118.dp,
            top: 0,
            bottom: 0,
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: data.desc,
                      style: TextStyle(
                          color: const Color(0xFFFFF01F),
                          fontSize: 13.dp,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: '地标已开启，快去参与吧',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.dp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
