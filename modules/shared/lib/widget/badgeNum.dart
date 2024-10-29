import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class BadgeNum extends StatelessWidget {
  final int num;

  const BadgeNum({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 16.0,
      constraints: const BoxConstraints(minWidth: 24.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Text(num > 99 ? "99+" : num.toString(),
          textScaleFactor: 1.0,
          softWrap: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            height: 1.0,
          )),
    );
  }
}

// 房间底部工具栏红点样式
class RoomBadgeNum extends StatelessWidget {
  final int num;

  const RoomBadgeNum({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 19.0,
      height: 16.0,
      decoration: BoxDecoration(
        color: R.color.thirdBrightColor,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Text(
        num > 99 ? '99+' : num.toString(),
        style: const TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
