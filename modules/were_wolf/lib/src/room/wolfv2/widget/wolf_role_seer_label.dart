import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

///预言家查杀身份标记
class WolfRoleSeerLabel extends StatelessWidget {
  final int flag;

  const WolfRoleSeerLabel({super.key, this.flag = -1});

  @override
  Widget build(BuildContext context) {
    if (flag == 1) {
      return IgnorePointer(
        child: R.img('wolfv2/user_icon/ic_role_label_wolf.webp',
            width: 22, height: 12, package: ComponentManager.MANAGER_WERE_WOLF),
      );
    }
    if (flag == 2) {
      return IgnorePointer(
        child: R.img('wolfv2/user_icon/ic_role_label_good.webp',
            width: 20, height: 20, package: ComponentManager.MANAGER_WERE_WOLF),
      );
    }
    return const SizedBox.shrink();
  }
}
