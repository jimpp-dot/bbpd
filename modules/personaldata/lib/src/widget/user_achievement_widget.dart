import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 个人页成就标签
///
class UserAchievementWidget extends StatelessWidget {
  final List<String>? list;

  const UserAchievementWidget({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(list)) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: list!
          .map((e) => _buildAchievement(e))
          .where((element) => element != null)
          .toList(),
    );
  }

  Widget _buildAchievement(String icon) {
    if (Util.isStringEmpty(icon)) return const SizedBox.shrink();
    return CachedNetworkImage(
      imageUrl: Util.parseIcon(icon),
      height: 26,
      fit: BoxFit.fitWidth,
    );
  }
}
