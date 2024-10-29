import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

class WolfRoleLabel extends StatelessWidget {
  final WolfRole? role;

  const WolfRoleLabel({super.key, this.role});

  String get iconPath {
    switch (role) {
      case WolfRole.Werewolf:
        return 'wolfv2/user_icon/ic_role_label_wolf.webp';
      case WolfRole.Witch:
        return 'wolfv2/user_icon/ic_role_label_witch.webp';
      case WolfRole.Seer:
        return 'wolfv2/user_icon/ic_role_label_seer.webp';
      case WolfRole.Hunter:
        return 'wolfv2/user_icon/ic_role_label_hunter.webp';
      case WolfRole.Guard:
        return 'wolfv2/user_icon/ic_role_label_guard.webp';
      case WolfRole.Popular:
        return 'wolfv2/user_icon/ic_role_label_popular.webp';
      default:
        return 'wolfv2/user_icon/ic_role_label_popular.webp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: R.img(iconPath,
          width: 22, height: 12, package: ComponentManager.MANAGER_WERE_WOLF),
    );
  }
}
