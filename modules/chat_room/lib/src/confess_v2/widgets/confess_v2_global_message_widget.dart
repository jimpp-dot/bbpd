import 'package:chat_room/assets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import '../../base/widget/gobalRoomMessage.dart';
import 'package:shared/shared.dart';

///恋爱旅行横幅
/// [GlobalMessage] 横幅消息data
/// flutter: room event name = confess.together.fly and data
/// {uicon: 202203/03/131564927_6220604c8f0996.36797321.jpg, uname: 玫瑰小镇, desc: 恭喜玫瑰小镇与777成功在一起, giftId: 775, back_img: static/commodity/h22011715482799.webp, type: confess.together, toicon: 202112/28/131554629_61caea0a4350c1.02313785.jpg, toname: 777, rid: 200055579, rname: 玫瑰小镇}
class ConfessV2GlobalMessageWidget extends StatelessWidget {
  final GlobalMessage data;

  const ConfessV2GlobalMessageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.dp,
                  height: 40.dp,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF4E83),
                    borderRadius: BorderRadius.circular(20.dp),
                  ),
                  child: CommonAvatar(
                    path: data.uIcon,
                    size: 38.dp,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 40.dp,
                  height: 40.dp,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF4E83),
                    borderRadius: BorderRadius.circular(20.dp),
                  ),
                  child: CommonAvatar(
                    path: data.toIcon,
                    size: 38.dp,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            R.img(RoomAssets.chat_room$confess_v2_ic_love_webp,
                width: 28.dp, height: 28.dp),
          ],
        ),
        SizedBox(width: 6.dp),
        Expanded(child: _buildDesc()),
      ],
    );
  }

  Widget _buildDesc() {
    EasyRichTextPattern richTextPattern(String text) {
      return EasyRichTextPattern(
        hasSpecialCharacters: true,
        targetString: text,
        style: R.textStyle.medium12
            .copyWith(fontSize: 12, color: const Color(0xFFFFF01F)),
      );
    }

    return EasyRichText(
      data.desc,
      defaultStyle:
          R.textStyle.regular12.copyWith(fontSize: 12, color: Colors.white),
      patternList: [
        richTextPattern(data.uName),
        richTextPattern(data.toName),
      ],
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
