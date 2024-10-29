import 'package:shared/shared.dart';
import 'package:shared/k.dart' as coreK;
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'my_house_room_bg.dart';
import 'my_house_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:math' as math;

import 'my_house_room_decorate_list_sheet.dart';
import 'my_house_room_dialogs.dart';

/// 大哥房 —— 服务端关键词brother_room，客户端my_house_room
class MyHouseRoomWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback onSettingClick;

  const MyHouseRoomWidget(
      {super.key, required this.room, required this.onSettingClick});

  @override
  State<StatefulWidget> createState() => _MyHouseRoomState();
}

class _MyHouseRoomState extends State<MyHouseRoomWidget>
    with
        RoomTemplateMixin<MyHouseRoomWidget>,
        RoomFloatingBannerMixin<MyHouseRoomWidget>,
        RoomSettingMixin<MyHouseRoomWidget> {
  MyHouseController get controller => Get.find<MyHouseController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHouseController>(
      id: RoomMyHouseUpdate.all,
      init: MyHouseController(widget.room,
          levelUpAlertFunc: (text) => MyHouseLevelUpDialog.show(context, text)),
      builder: (controller) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            const Positioned.fill(child: MyHouseRoomBg()),
            controller.myHouseRes != null && !controller.myHouseRes!.success
                ? ErrorData(
                    error: controller.myHouseRes!.message,
                    onTap: controller.loadData,
                  )
                : Positioned.fill(
                    child: Column(
                      children: [
                        _buildRoomHeader(),
                        renderTopActivityRow(context, widget.room),
                        SizedBox(height: 152 / 844 * Util.height),
                        _buildBody(controller),
                        const SizedBox(height: 65),
                        Expanded(
                          child: TransparentPointer(
                            child: Column(
                              children: [
                                renderMessageList(widget.room),
                              ],
                            ),
                          ),
                        ),
                        renderController(widget.room),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
                      ],
                    ),
                  ),
            _buildFloatMenu(),
            _buildGuide(controller),

            /// 房间右下角活动Banner
            PositionedDirectional(
              end: 0,
              bottom: preMadeRecruitBottom,
              child: buildFloatingBanner(widget.room),
            ),
            ...renderExtra(context, widget.room),
          ].toList() as List<Widget>,
        );
      },
    );
  }

  RoomPosition? position(int index) {
    if (index >= controller.room.positions.length) {
      return null;
    }

    return controller.room.positions[index];
  }

  Widget _buildRoomHeader() {
    String levelStr = '?';
    String expTitleStr = '';
    String expStr = '';
    double expRate = 0;
    if (controller.myHouseInfo != null) {
      levelStr = 'Lv.${controller.myHouseInfo!.level}';
      if (controller.myHouseInfo!.nextLevelGap == 0) {
        expTitleStr = K.room_talent_current + K.room_exp;
        expStr = controller.myHouseInfo!.exp.toString();
        expRate = 1;
      } else {
        expTitleStr = K.room_distance_next_level;
        expStr = controller.myHouseInfo!.nextLevelGap.toString();
        expRate = controller.myHouseInfo!.exp /
            (controller.myHouseInfo!.exp +
                controller.myHouseInfo!.nextLevelGap);
      }
    }

    return Container(
      height: 44,
      margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).padding.top + 4, end: 4, bottom: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: R.img(RoomAssets.chat_room$back_svg,
                  width: 24.0, height: 24.0),
            ),
          ),
          GestureDetector(
            onTap: () => MyHouseLevelInfoDialog.show(
                context, widget.room, controller.myHouseRes!.data),
            child: Container(
              constraints: const BoxConstraints(minWidth: 92),
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x33000000),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              levelStr,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '・',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            Text(
                              controller.room.config?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: const Color(0x1FFFFFFF),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: FractionallySizedBox(
                                    widthFactor: math.max(0.001, expRate),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFFF8198),
                                            Color(0xFFFF5F7D)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        expTitleStr,
                                        style: const TextStyle(
                                            fontSize: 8, color: Colors.white),
                                      ),
                                      Text(
                                        expStr,
                                        style: const TextStyle(
                                          fontSize: 8,
                                          color: Color(0xFFFFE5A4),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          GetBuilder<MyHouseController>(
            id: RoomMyHouseUpdate.menu,
            builder: (controller) {
              return IconButton(
                iconSize: 36,
                padding: const EdgeInsets.all(2),
                color: Colors.white,
                icon: Icon(controller.headerMenuFold
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onPressed: () =>
                    controller.foldMenu(!controller.headerMenuFold),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildFloatMenu() {
    Widget animateChild = Column(
      children: [
        if (controller.room.isCreator) ...[
          GestureDetector(
            onTap: () => MyHouseDecorateListSheet.show(context),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: R.img(
                      RoomAssets.chat_room$my_house_room_mh_menu_decorate_webp),
                ),
                Container(
                  width: 40,
                  height: 12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    K.room_mh_decorate,
                    style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF7C532D),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        GestureDetector(
          onTap: () => onSettingClick(widget.room),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: R.img(
                    RoomAssets.chat_room$my_house_room_mh_menu_setting_webp),
              ),
              Container(
                width: 40,
                height: 12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  K.room_common_setting,
                  style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF7C532D),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ],
    );

    return GetBuilder<MyHouseController>(
      id: RoomMyHouseUpdate.menu,
      builder: (controller) {
        return PositionedDirectional(
          top: MediaQuery.of(context).padding.top + 47,
          end: 8,
          child: SizedBox(
            width: 40,
            child: controller.headerMenuFold
                ? FadeOut(
                    animate: true,
                    duration: const Duration(milliseconds: 150),
                    child: animateChild)
                : FadeIn(
                    animate: true,
                    duration: const Duration(milliseconds: 150),
                    child: animateChild),
          ),
        );
      },
    );
  }

  Widget _buildBody(MyHouseController controller) {
    if (controller.needShowFirstGuide) {
      return const SizedBox(height: 175);
    }

    double padding = 35;
    double width = 40;
    double separator = (Util.width - 40 * 6 - padding * 2) / 5;

    return TransparentPointer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 80 + 78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _getUserIcon(0, 80),
                        const SizedBox(height: 8),
                        Text(
                          position(0)?.name ?? '',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF521D00),
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80 + 78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _getUserIcon(1, 80),
                        const SizedBox(height: 8),
                        Text(
                          position(1)?.name ?? '',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF521D00),
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: R.img(
                  RoomAssets.chat_room$my_house_room_mh_position_center_webp,
                  width: 78,
                  height: 42,
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Container(
            height: width,
            alignment: Alignment.center,
            child: Wrap(
              spacing: separator,
              children: List.generate(
                math.max(0, controller.room.positions.length - 2),
                (index) => _getUserIcon(index + 2, width),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getUserIcon(int index, double size) {
    RoomPosition? item = position(index);
    if (item == null) {
      return const SizedBox.shrink();
    }

    return UserIcon(
      room: controller.room,
      position: item,
      size: size,
      border: const BorderSide(color: Colors.white, width: 0.5),
      whiteIcon: true,
    );
  }

  Widget? _buildGuide(MyHouseController controller) {
    if (!controller.needShowFirstGuide) {
      return null;
    }

    int index = controller.firstGuideIndex;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
            top: [
          if (index == 0)
            MediaQuery.of(context).padding.top + 200
          else if (index == 1)
            MediaQuery.of(context).padding.top + 240
          else
            MediaQuery.of(context).padding.top + 84
        ][0]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 0) ...[
              Container(
                width: 96,
                height: 96,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(
                      color: const Color(0xFFFDA57B).withOpacity(0.6),
                      width: 4),
                ),
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    border:
                        Border.all(color: const Color(0xFFFDA57B), width: 4),
                  ),
                  child: CommonAvatar(
                    path: Session.icon,
                    shape: BoxShape.circle,
                    size: 80,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                K.room_mh_guide_0,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF521D00),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
            ] else if (index == 1) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 20, end: 26),
                    child: R.img(
                      RoomAssets.chat_room$my_house_room_mh_arrow_left_webp,
                      width: 38,
                      height: 32,
                    ),
                  ),
                  R.img(
                    RoomAssets.chat_room$my_house_room_mh_hand_left_webp,
                    width: 67,
                    height: 83,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 26),
                    child: R.img(
                      RoomAssets.chat_room$my_house_room_mh_arrow_right_webp,
                      width: 38,
                      height: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                K.room_mh_guide_1,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF521D00),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
            ] else ...[
              Container(
                alignment: AlignmentDirectional.topEnd,
                width: Util.width - 60 * 2,
                child: R.img(
                  RoomAssets.chat_room$my_house_room_mh_hand_right_webp,
                  width: 68,
                  height: 83,
                ),
              ),
              const SizedBox(height: 84),
              Text(
                K.room_mh_guide_2,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF521D00),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
            ],
            Material(
              color: Colors.transparent,
              child: Ink(
                width: 86,
                height: 34,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9669), Color(0xFFFFC977)],
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  ),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(17),
                  onTap: () => controller.guideNext(),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      index == 2 ? coreK.K.finish : coreK.K.base_next_step,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
