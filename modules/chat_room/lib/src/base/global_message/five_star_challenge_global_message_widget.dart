import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';
import 'package:chat_room/k.dart';

/*
事件名称：room.live.challenge.fly
触发飘屏：http://192.168.11.46/test/liveChallengeFly?uid=131564927&rid=200055579
im消息数据：{type: complete.challenge, uname: 玫瑰小镇, uicon: 202203/03/131564927_6220604c8f0996.36797321.jpg, uvip: 17, rid: 200055579, rname: 玫瑰小镇, level: 7}
 */

/// 直播频道【五星挑战】触发飘屏
class FiveStarChallengeGlobalMessageWidget extends StatelessWidget {
  final GlobalMessage data;

  const FiveStarChallengeGlobalMessageWidget({super.key, required this.data});

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.safeSubstring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
        gradient: const LinearGradient(
            colors: [Color(0xFFFF436B), Color(0xFFEC933B)]),
        image: const DecorationImage(
          image: AssetImage(RoomAssets
              .chat_room$room_five_star_challenge_global_message_bg_webp),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 2),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 2),
            ),
            child: CommonAvatar(
              path: Util.getRemoteImgUrl(data.uIcon),
              size: 36,
              shape: BoxShape.circle,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UserVipWidget(vip: data.uVip, isGrey: false, height: 24),
                    const SizedBox(width: 5),
                    if (!Util.isStringEmpty(data.uName))
                      Text(
                        data.uName,
                        style: const TextStyle(
                            color: Color(0xFFF4FF00),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                  ],
                ),
                Row(
                  children: [
                    R.img(RoomAssets.chat_room$ic_bless_msg_png,
                        width: 16, height: 16, color: Colors.white),
                    const SizedBox(width: 3),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          if (!Util.isStringEmpty(data.rName))
                            TextSpan(
                              text: truncateWithEllipsis(11, data.rName),
                              style: const TextStyle(
                                color: Color(0xFFF7FF00),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          TextSpan(
                            text: K.room_chellange_message_content,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                          if (data.level > 0 && data.level <= 10)
                            TextSpan(
                              text: K.room_how_star_challenge(
                                  [challengeLevelParams[data.level]!]),
                              style: const TextStyle(
                                  color: Color(0xFFF7FF00),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                          const TextSpan(
                            text: '!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Map<int, String> get challengeLevelParams => {
        1: '一',
        2: '二',
        3: '三',
        4: '四',
        5: '五',
        6: '六',
        7: '七',
        8: '八',
        9: '九',
        10: '十'
      };
}
