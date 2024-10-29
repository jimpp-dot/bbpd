import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// 用户资料卡-信息左边名称
class RoomUserProfileInfoTitle extends StatelessWidget {
  final String title;

  const RoomUserProfileInfoTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: AutoSizeText(
        title,
        minFontSize: 6,
        maxFontSize: 12,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}

class RoomUserProfileInfoContainer extends StatelessWidget {
  final String? title;
  final Widget child;

  const RoomUserProfileInfoContainer(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null && title!.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: RoomUserProfileInfoTitle(title: title!),
            ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
