import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 话题用户头像列表
class UserListWidget extends StatelessWidget {
  final List<String>? avatarUrls;
  final int maxLength;
  final EdgeInsetsGeometry? margin;

  const UserListWidget(this.avatarUrls,
      {super.key, this.maxLength = 4, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (avatarUrls == null || avatarUrls!.isEmpty || maxLength <= 0) {
      return Container();
    }
    int destLength = min(avatarUrls!.length, maxLength);
    List<Widget> avatarList = [];
    for (int i = 0; i < destLength; i++) {
      avatarList.add(PositionedDirectional(
        start: 14.0 * i,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 1),
          ),
          alignment: Alignment.center,
          child: CommonAvatar(
            path: avatarUrls![i],
            size: 14,
            shape: BoxShape.circle,
          ),
        ),
      ));
    }
    return Container(
      width: 14.0 * avatarList.length + 2,
      height: 16,
      margin: margin ?? EdgeInsets.zero,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: avatarList,
      ),
    );
  }
}
