import 'dart:math' as math;
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/page/hours/rank_hours_controller.dart';

/// 荣耀房间
///
class RankHoursHonourPage extends GetView<RankHoursDialogController> {
  static const double memberHeight = 60;

  const RankHoursHonourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankHoursDialogController>(
      id: HoursDataRefreshKey,
      builder: (controller) {
        return SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 208,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: R.img(Assets.rank_hours_honour_top_bg_webp,
                          package: ComponentManager.MANAGER_RANK,
                          fit: BoxFit.fill),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) {
                          if (controller.hoursDataList.first == null) {
                            return const SizedBox.shrink();
                          }
                          if (index >=
                              controller.hoursDataList.first!.data.gloryRoom
                                  .top1.length) {
                            return const SizedBox.shrink();
                          }

                          GloryHourRoomRankGiftTop gift = controller
                              .hoursDataList.first!.data.gloryRoom.top1[index];
                          String giftIcon = Util.giftImgUrl(gift.giftId) +
                              Util.getGiftUrlSuffix();
                          return Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                    imageUrl: giftIcon, width: 90, height: 90),
                                Container(
                                  width: 86,
                                  height: 86,
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 14),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: R.img(
                                          Assets.rank_hours_crown_webp,
                                          width: 52,
                                          height: 49,
                                          package:
                                              ComponentManager.MANAGER_RANK,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 58,
                                              height: 58,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFFFAD961),
                                                    Color(0xFFF7B01C)
                                                  ],
                                                  begin: AlignmentDirectional
                                                      .topStart,
                                                  end: AlignmentDirectional
                                                      .bottomEnd,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(29),
                                              ),
                                            ),
                                            if (!Util.isNullOrEmpty(
                                                gift.topRoom.icon)) ...[
                                              GestureDetector(
                                                onTap: () {
                                                  if (gift.topRoom.online) {
                                                    IRoomManager manager =
                                                        ComponentManager
                                                            .instance
                                                            .getManager(
                                                                ComponentManager
                                                                    .MANAGER_BASE_ROOM);
                                                    manager
                                                        .openChatRoomScreenShow(
                                                            context,
                                                            gift.topRoom.id,
                                                            refer:
                                                                'rank_hours');
                                                  }
                                                },
                                                child: Stack(
                                                  children: [
                                                    CommonAvatar(
                                                        path: gift.topRoom.icon,
                                                        size: 54,
                                                        shape: BoxShape.circle),
                                                    if (gift.topRoom.online)
                                                      PositionedDirectional(
                                                        bottom: 0,
                                                        end: 2,
                                                        child: Container(
                                                          width: 16.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            color: R.color
                                                                .mainBrandColor,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              RepaintBoundary(
                                                            child: R.img(
                                                              BaseAssets
                                                                  .living_small_webp,
                                                              package:
                                                                  ComponentManager
                                                                      .MANAGER_BASE_CORE,
                                                              width: 14.0,
                                                              height: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ] else ...[
                                              Container(
                                                width: 54,
                                                height: 54,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF4B35C9),
                                                  borderRadius:
                                                      BorderRadius.circular(27),
                                                ),
                                                child: R.img(
                                                  Assets
                                                      .rank_hours_avatar_placeholder_webp,
                                                  width: 30,
                                                  height: 30,
                                                  package: ComponentManager
                                                      .MANAGER_RANK,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  gift.topRoom.name,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildSubTab(),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xFFE2E486)),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.elliptical(12, 12)),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6373FF), Color(0xFF7855FF)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: _buildRank(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      height: 1,
                      color: const Color(0xFF6373FF),
                    ),
                  )
                ],
              ),
              SizedBox(height: Util.bottomMargin)
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubTab() {
    return SizedBox(
      height: 50,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(top: Radius.elliptical(12, 12)),
              color: Color(0xFF7855FF),
            ),
          ),
          R.img(
            Assets.rank_hours_tabs_x_webp(controller.hoursTabController.index),
            package: ComponentManager.MANAGER_RANK,
            width: Util.width - 32,
            fit: BoxFit.fill,
          ),
          Row(
            children: List.generate(
              math.min(
                  3,
                  controller.hoursDataList.first?.data.gloryRoom.top1.length ??
                      0),
              (index) {
                GloryHourRoomRankGiftTop? gift =
                    controller.hoursDataList.first?.data.gloryRoom.top1[index];
                if (gift == null) {
                  return const SizedBox.shrink();
                }

                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => controller.hoursTabController.index = index,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        gift.giftName,
                        style: TextStyle(
                          fontSize: 14,
                          color: controller.hoursTabController.index == index
                              ? const Color(0xFFEEEFAB)
                              : Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRank(BuildContext context) {
    int index = controller.hoursTabController.index;
    ResGloryHourRoomRank? data = controller.hoursDataList[index];

    if (data == null) {
      return const Loading();
    } else if (!data.success) {
      return ErrorData(
        error: data.msg,
        onTap: () {
          controller.loadHoursData(index);
        },
      );
    } else if (data.data.gloryRoom.members.isEmpty) {
      return const EmptyWidget(paddingBottom: 0);
    } else {
      return Column(
        children: [
          ...List.generate(
            data.data.gloryRoom.members.length,
            (index) {
              GloryHourRoomRankMember item = data.data.gloryRoom.members[index];
              return _buildRow(item, context);
            },
          )
        ],
      );
    }
  }

  Widget _buildRow(GloryHourRoomRankMember item, BuildContext context) {
    return SizedBox(
      height: memberHeight,
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
          GestureDetector(
            onTap: () {
              if (item.room.online) {
                IRoomManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                manager.openChatRoomScreenShow(context, item.room.id,
                    refer: 'rank_hours');
              }
            },
            child: Stack(
              children: [
                CommonAvatar(
                  path: item.room.icon,
                  size: 40,
                  shape: BoxShape.circle,
                ),
                Visibility(
                  visible: item.room.online,
                  child: PositionedDirectional(
                    bottom: 0,
                    end: 2,
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: R.color.mainBrandColor,
                      ),
                      alignment: Alignment.center,
                      child: RepaintBoundary(
                        child: R.img(
                          BaseAssets.living_small_webp,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          width: 14.0,
                          height: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.room.name,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          Text(
            item.score.toString(),
            style: TextStyle(
                fontSize: 15,
                color: const Color(0xFFFFFFFF).withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
