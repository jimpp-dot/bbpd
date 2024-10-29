/*
 *
 *  Created by yao.qi on 2022/5/10 下午3:48
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/5/10 下午3:48
 *
 */

import 'package:flutter/material.dart';
import '../../base/widget/gobalRoomMessage.dart';
import 'package:shared/shared.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

///表白活动横幅
/// [GlobalMessage] 横幅消息data
/// flutter: room event name = confess.together.fly and data
/// {uicon: 202203/03/131564927_6220604c8f0996.36797321.jpg, uname: 玫瑰小镇, desc: 恭喜玫瑰小镇与777成功在一起, giftId: 775, back_img: static/commodity/h22011715482799.webp, type: confess.together, toicon: 202112/28/131554629_61caea0a4350c1.02313785.jpg, toname: 777, rid: 200055579, rname: 玫瑰小镇}
class CommonVindicateGlobalMessageWidget extends StatelessWidget {
  final GlobalMessage data;
  const CommonVindicateGlobalMessageWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 4),
        _renderUserIcon(),
        const SizedBox(width: 8),
        Expanded(
          child: _renderCenter(),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _renderUserIcon() {
    return SizedBox(
      height: 32,
      width: 58,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PositionedDirectional(
            start: 0.0,
            child: _AvatarWidget(
              data.uIcon,
              size: 30,
              gradientColors: const [Color(0xFFFF78E5), Color(0xFFDAB0FF)],
            ),
          ),
          PositionedDirectional(
            start: 26.0,
            child: _AvatarWidget(
              data.toIcon,
              size: 30,
              gradientColors: const [Color(0xFFDAB0FF), Color(0xFFFEB0FF)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderCenter() {
    EasyRichTextPattern richTextPattern(String text) {
      return EasyRichTextPattern(
        hasSpecialCharacters: true,
        targetString: text,
        style: R.textStyle.medium16.copyWith(
            fontSize: 13,
            color: const Color(0xFFFFF056),
            fontWeight: FontWeight.bold),
      );
    }

    return EasyRichText(
      data.desc,
      defaultStyle: R.textStyle.medium16.copyWith(
          fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
      patternList: [
        richTextPattern(data.uName),
        richTextPattern(data.toName),
      ],
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  final String url;
  final bool showGradient;
  final List<Color>? gradientColors;
  final double size;
  final VoidCallback? onTap; // 点击事件回调

  const _AvatarWidget(this.url,
      {Key? key,
      this.gradientColors,
      this.size = 44,
      this.onTap,
      this.showGradient = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color>? colors = gradientColors;
    if (colors == null || colors.isEmpty) {
      colors = [const Color(0xFFA08AFF), const Color(0xFF3EFFE2)];
    }

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size + 2) / 2),
        gradient: showGradient == false
            ? null
            : LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: colors,
              ),
      ),
      child: CommonAvatar(
          path: url, size: size, shape: BoxShape.circle, onTap: onTap),
    );
  }
}
