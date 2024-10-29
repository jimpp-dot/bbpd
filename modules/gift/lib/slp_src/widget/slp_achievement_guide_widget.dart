import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

/// 打赏全麦上的好友可解锁新成就引导

class SlpAchievementGuideWidget extends StatelessWidget {
  final String tips;

  const SlpAchievementGuideWidget({Key? key, required this.tips})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      child: GradientBorderBox(
        gradientColors: const [Color(0xFF93866D), Color(0xFF90725F)],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        borderWidth: 1,
        borderRadius: 12,
        child: Container(
          height: 40,
          padding: const EdgeInsetsDirectional.only(start: 7, end: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFF372B2E), Color(0xFF271F21)],
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 6),
              R.img(
                Assets.ic_achievement_guide_webp,
                width: 40,
                height: 40,
                package: ComponentManager.MANAGER_GIFT,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  tips,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 11, color: Color(0xFFF5D3B9)),
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
