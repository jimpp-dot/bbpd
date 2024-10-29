import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 朋友标签
class UserFriendRelation extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const UserFriendRelation({
    super.key,
    this.width = 32,
    this.height = 14,
    this.padding,
  }) : assert(width > 0 && height > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          R.img(
            'ic_user_friend_relation.svg',
            package: ComponentManager.MANAGER_BASE_CORE,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
          Text(
            K.base_friend,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
