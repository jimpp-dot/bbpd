import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

class MarkRoleItemWidget extends StatelessWidget {
  final WolfRole? wolfRole;
  final double? size;

  const MarkRoleItemWidget({super.key, this.wolfRole, this.size});

  String get roleIcon {
    switch (wolfRole) {
      case WolfRole.Werewolf:
        return 'wolfv2/user_icon/ic_mark_role_wolf.webp';
      case WolfRole.Seer:
        return 'wolfv2/user_icon/ic_mark_role_seer.webp';
      case WolfRole.Witch:
        return 'wolfv2/user_icon/ic_mark_role_witch.webp';
      case WolfRole.Guard:
        return 'wolfv2/user_icon/ic_mark_role_guard.webp';
      case WolfRole.Hunter:
        return 'wolfv2/user_icon/ic_mark_role_hunter.webp';
      case WolfRole.Popular:
        return 'wolfv2/user_icon/ic_mark_role_popular.webp';
      default:
        return 'wolfv2/user_icon/ic_mark_role_popular.webp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return R.img(roleIcon,
        package: ComponentManager.MANAGER_WERE_WOLF, height: size, width: size);
  }
}
