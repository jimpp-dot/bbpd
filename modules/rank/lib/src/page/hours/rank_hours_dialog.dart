import 'package:rank/assets.dart';

import '../../../k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rank/src/page/hours/rank_hours_controller.dart';
import 'package:rank/src/page/hours/rank_hours_honour_page.dart';
import 'package:rank/src/page/hours/rank_hours_shine_page.dart';

///  荣耀时刻 dialog
///
class RankHoursDialog extends GetView<RankHoursDialogController> {
  final int rid;

  const RankHoursDialog({super.key, required this.rid});

  static Future show(BuildContext context, int rid) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.8,
      defineBarrierColor: Colors.transparent,
      disableTapDismissible: true,
      builder: (context) {
        return RankHoursDialog(rid: rid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankHoursDialogController>(
      id: HoursDataRefreshKey,
      init: RankHoursDialogController(rid),
      builder: (controller) {
        return Stack(
          fit: StackFit.expand,
          children: [
            R.img(
              Assets.rank_hours_dialog_bg_webp,
              width: Util.width,
              package: ComponentManager.MANAGER_RANK,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  R.img(Assets.rank_hours_title_webp,
                      package: ComponentManager.MANAGER_RANK,
                      width: 97,
                      height: 25),
                  const SizedBox(height: 13),
                  Container(
                    width: 180,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(.1),
                    ),
                    child: CommonTabBar(
                      tabs: [
                        Text(K.rank_hour_title_glory,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(K.rank_hour_title_shine,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                      isScrollable: false,
                      controller: controller.tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.zero,
                      labelColor: const Color(0xFF313131),
                      unselectedLabelColor:
                          const Color(0xFFFFFFFF).withOpacity(0.5),
                      indicator: BoxDecoration(
                          color: const Color(0xFFEEEFAB),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon((Icons.access_time),
                          color: Colors.white, size: 12),
                      Text(
                        K.rank_hour_time_end + controller.endTimeStr,
                        style: TextStyle(
                            fontSize: 11, color: Colors.white.withOpacity(0.8)),
                      ),
                      const SizedBox(width: 24),
                      const Icon((Icons.access_time),
                          color: Colors.white, size: 12),
                      GetBuilder<RankHoursDialogController>(
                        id: TicktockKey,
                        builder: (controller) {
                          return Text(
                            K.rank_hour_time_countdown +
                                controller.countdownStr,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withOpacity(0.8),
                              fontFeatures: const [
                                FontFeature.tabularFigures()
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ExtendedTabBarView(
                      controller: controller.tabController,
                      children: const [
                        RankHoursHonourPage(),
                        RankHoursShinePage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildTopRightWidget(),
          ],
        );
      },
    );
  }

  Widget _buildTopRightWidget() {
    return PositionedDirectional(
      top: 36,
      end: 0,
      child: Column(
        children: [
          SizedBox(
            width: 48,
            height: 28,
            child: GestureDetector(
              onTap: () => BaseWebviewScreen.show(System.context,
                  url: Util.getHelpUrlWithQStr('k164')),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  R.img(Assets.rank_hours_link_bg_webp,
                      package: ComponentManager.MANAGER_RANK),
                  Text(K.rank_rule,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF412CD7),
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 48,
            height: 28,
            child: GestureDetector(
              onTap: () {
                BaseWebviewScreen.show(System.context,
                    url: Util.getWebUrl(_url,
                        params: {'clientScreenMode': '1'}));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  R.img(Assets.rank_hours_link_bg_webp,
                      package: ComponentManager.MANAGER_RANK),
                  Text(
                    K.rank_reward_short,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF412CD7),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 荣耀榜奖励 说明链接
  static const String _url = 'rules/glorytime';
}
