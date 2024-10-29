import 'package:flutter/material.dart';

import '../shared.dart';

/// 新人标签
class UserNewTransferWidget extends StatelessWidget {
  final int? sevenNew;
  final int? payLevel;
  final EdgeInsetsGeometry? padding;

  const UserNewTransferWidget({super.key, this.sevenNew, this.payLevel, this.padding});

  @override
  Widget build(BuildContext context) {
    if (sevenNew == null || payLevel == null) return const SizedBox.shrink();

    double iconWidth = 26.0;
    double iconHeight = 22.0;

    if (payLevel! > 0) {
      if (sevenNew == 1) {
        //有消费 注册7日内
        if (payLevel! <= 5) {
          return R.img('L$payLevel.webp', height: 22, fit: BoxFit.fitHeight, package: ComponentManager.MANAGER_BASE_CORE);
        }
        
        return Container(
          padding: padding ?? EdgeInsetsDirectional.zero,
          child: Container(
            width: iconWidth,
            height: iconHeight,
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsetsDirectional.only(end: 1),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  R.imagePath('user_new_transfer_n.webp', package: ComponentManager.MANAGER_BASE_CORE),
                ),
              ),
            ),
            child: YouSheText(
              'L$payLevel',
              style: const TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        );
      } else {
        //有消费 注册非7日内
        return Container(
          padding: padding ?? EdgeInsetsDirectional.zero,
          child: Container(
            width: iconWidth,
            height: iconHeight,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  R.imagePath('user_new_transfer_l.webp', package: ComponentManager.MANAGER_BASE_CORE),
                ),
              ),
            ),
            child: YouSheText(
              'L$payLevel',
              style: const TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        );
      }
    }

    return const SizedBox.shrink();
  }
}
