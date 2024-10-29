import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/auction/auction_util.dart';

/// 拍卖关系标签
class AuctionRelationTag extends StatelessWidget {
  final String name; // 关系名字
  final int level; // 关系等级
  final double width;
  final double height;

  const AuctionRelationTag(
      {Key? key,
      required this.name,
      required this.level,
      this.width = 60,
      this.height = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(
          AuctionUtil.getRelationIcon(level),
          width: width,
          height: height,
          fit: BoxFit.contain,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: width - 12,
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFFFEFEFE),
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
