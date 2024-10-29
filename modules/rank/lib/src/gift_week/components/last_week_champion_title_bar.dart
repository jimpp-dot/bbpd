import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:rank/assets.dart';

class LastWeekChampionTitleBar extends StatelessWidget {
  final int rankType;

  const LastWeekChampionTitleBar({super.key, this.rankType = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 286,
      height: 58,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _bgStar,
          PositionedDirectional(
            start: 0,
            bottom: 13,
            child: _leftBottomDiamond,
          ),
          PositionedDirectional(
            top: 7,
            end: 0,
            child: _rightBottomDiamond,
          ),
          PositionedDirectional(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'S T',
                  style: R.textStyle.regular10
                      .copyWith(color: const Color(0xFF85000B)),
                ),
                const SizedBox(
                  width: 8,
                ),
                if (rankType == 1)
                  R.img(Assets.gift_week_last_week_champion_webp,
                      height: 20, package: ComponentManager.MANAGER_RANK),
                if (rankType == 2)
                  R.img(Assets.gift_week_last_week_platform_star_webp,
                      height: 20, package: ComponentManager.MANAGER_RANK),
                if (rankType == 3)
                  R.img(Assets.gift_week_last_week_big_man_webp,
                      height: 20, package: ComponentManager.MANAGER_RANK),
                const SizedBox(width: 8),
                Text(
                  'A R',
                  style: R.textStyle.regular10
                      .copyWith(color: const Color(0xFF85000B)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _bgStar {
    return R.img(Assets.gift_week_champion_bg_star_webp,
        width: 58, height: 58, package: ComponentManager.MANAGER_RANK);
  }

  Widget get _leftBottomDiamond {
    return R.img(Assets.gift_week_last_week_left_bottom_diamond_webp,
        width: 6, height: 6, package: ComponentManager.MANAGER_RANK);
  }

  Widget get _rightBottomDiamond {
    return R.img(Assets.gift_week_last_week_right_top_diamond_webp,
        width: 6, height: 6, package: ComponentManager.MANAGER_RANK);
  }
}
