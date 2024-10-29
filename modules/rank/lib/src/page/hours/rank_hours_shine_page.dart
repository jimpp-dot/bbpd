import 'package:rank/assets.dart';

import '../../../k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank/src/page/hours/rank_hours_controller.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';

/// 高光之星
class RankHoursShinePage extends GetView<RankHoursDialogController> {
  const RankHoursShinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankHoursDialogController>(
      id: ShineDataRefreshKey,
      builder: (controller) {
        if (controller.shinedata == null) {
          return const Loading();
        } else if (!controller.shinedata!.success) {
          return ErrorData(
            error: controller.shinedata!.msg,
            onTap: () {
              controller.loadShineData();
            },
          );
        } else if (controller.shinedata!.data.gloryStar.members.isEmpty) {
          return const EmptyWidget();
        }

        GloryHourStarRankData? data = controller.shinedata!.data.gloryStar;

        return SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 156,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: R.img(Assets.rank_hours_shine_top_bg_webp,
                          package: ComponentManager.MANAGER_RANK,
                          fit: BoxFit.fill),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 88,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: 62,
                                    height: 62,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(31),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFAD961),
                                          Color(0xFFF7B01C)
                                        ],
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                      ),
                                    ),
                                    child: CommonAvatar(
                                      path: data.members.first.left.icon,
                                      size: 58,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data.members.first.left.name,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFEEEFAB),
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 62 + 5),
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                '&',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFEEEFAB),
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              width: 68,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: 62,
                                    height: 62,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(31),
                                        color: Colors.white),
                                    child: CommonAvatar(
                                      path: data.members.first.right.icon,
                                      size: 58,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data.members.first.right.name,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFEEEFAB),
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6373FF), Color(0xFF7855FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: const Color(0xFFE2E486), width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 38,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const SizedBox(width: 52),
                          Text(
                            K.rank_user,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                            K.rank_achieve_score,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                          height: 0.5, color: Colors.white.withOpacity(0.2)),
                    ),
                    ...List.generate(
                      data.members.length,
                      (index) {
                        GloryHourStarRankMember item = data.members[index];
                        return _buildRow(item);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Util.bottomMargin)
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(GloryHourStarRankMember item) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 48,
            alignment: Alignment.center,
            child: item.rank <= 3
                ? R.img(Assets.gift_week_rankx_webp(item.rank),
                    package: ComponentManager.MANAGER_RANK,
                    fit: BoxFit.fill,
                    width: 26,
                    height: 24)
                : Text(
                    '${item.rank}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
          ),
          SizedBox(
            width: 76,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white),
                    child: CommonAvatar(
                      path: item.left.icon,
                      size: 40,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white),
                    child: CommonAvatar(
                      path: item.right.icon,
                      size: 40,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    item.left.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Text(
                  '&',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                Flexible(
                  child: Text(
                    item.right.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${item.score}',
            style: TextStyle(
              fontSize: 15,
              color: const Color(0xFFFFFFFF).withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
