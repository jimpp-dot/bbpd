import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';

/// 2023中秋活动房间飘屏
class AutumnActMessage extends StatelessWidget {
  final GlobalMessage data;

  const AutumnActMessage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        R.img(RoomAssets.chat_room$activity_bg_autumn_act_webp,
            width: Util.width, fit: BoxFit.fitWidth),
        PositionedDirectional(
          start: 35.dp,
          end: 135.dp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48.dp,
                height: 48.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFCE7AD), Color(0xFFF1B355)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(24.dp),
                ),
                child: CommonAvatar(
                  path: data.uIcon,
                  size: 45.dp,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 16.dp),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: K.room_congratulations,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: data.uName,
                              style: TextStyle(
                                  color: const Color(0xFFFDEB67),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '，点亮月饼，',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.dp),
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: '获得',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '【${data.giftName}】',
                              style: TextStyle(
                                  color: const Color(0xFFFDEB67),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '礼物*${data.num}',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
