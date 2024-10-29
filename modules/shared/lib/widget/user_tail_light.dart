import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 礼物之王车尾灯
class UserTailLightWidget extends StatelessWidget {
  final String? tailLight;

  const UserTailLightWidget({super.key, this.tailLight});

  @override
  Widget build(BuildContext context) {
    if (tailLight == null || tailLight!.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      height: 22,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath('gift_king_tail_bg.webp',
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            top: 1,
            child: R.img('gift_king_tail_top.webp',
                width: 12,
                height: 5,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
          PositionedDirectional(
            bottom: 1,
            child: R.img('gift_king_tail_bottom.webp',
                width: 8,
                height: 5,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
          YouSheText(
            tailLight!,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0XFFFFE989),
            ),
          ),
        ],
      ),
    );
  }
}
