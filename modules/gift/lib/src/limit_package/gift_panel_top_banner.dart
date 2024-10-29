import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import 'model/gift_panel_banner.dart';

/// 礼物面板顶部专属礼物提示条
class GiftPanelTopBanner extends StatelessWidget {
  final ExclusiveGift? banner;

  const GiftPanelTopBanner({Key? key, this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int remain =
        (banner?.deadline ?? 0) - DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (remain < 0) {
      remain = 0;
    }
    int day = remain ~/ (24 * 3600);
    int hour = (remain % (24 * 3600)) ~/ 3600;
    int minute = (remain % 3600) ~/ 60;

    Widget content = Container(
      width: Util.width - 16,
      height: 48,
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4346CC), Color(0xFF6523BA)],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            start: 0,
            child: R.img(
              Assets.limit_package_git_panel_banner_left_png,
              width: 133,
              height: 48,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          PositionedDirectional(
            end: 0,
            child: R.img(
              Assets.limit_package_git_panel_banner_right_png,
              width: 129,
              height: 46,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 0.5),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: CommonAvatar(
                  path: banner?.icon ?? '',
                  size: 40,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                K.gift_will_get_exclusive_gift,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          PositionedDirectional(
            start: 137,
            child: SizedBox(
              width: Util.width - 137 - 8 * 2,
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Util.width - 137 - 8 * 2,
                          height: 20,
                          padding: const EdgeInsetsDirectional.only(
                            start: 4,
                          ),
                          child: MarqueeContinuous(
                            child: Row(
                              children: [
                                Text(
                                  K.gift_week_achievement_list_top,
                                  style: const TextStyle(
                                      fontSize: 13, color: Color(0xFFFDA252)),
                                ),
                                Text(
                                  K.gift_can_get_exclusive_gift_qualification,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            R.img(
                              Assets.limit_package_git_panel_banner_clock_png,
                              width: 12,
                              height: 12,
                              package: ComponentManager.MANAGER_GIFT,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              K.gift_count_down_day_hour_minute(
                                  ['$day', '$hour', '$minute']),
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  R.img(
                    Assets.limit_package_git_panel_banner_more_png,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_GIFT,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: 117,
            top: -6,
            child: R.img(
              Assets.limit_package_git_panel_banner_crown_png,
              width: 22,
              height: 20,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      child: content,
      onTap: () {
        IRankManager rankManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        rankManager.showRank(context, 'achieve', subTabIndex: 1);
      },
    );
  }
}
