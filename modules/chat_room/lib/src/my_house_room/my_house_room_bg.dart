import '../../k.dart';
import 'dart:math';

import 'package:chat_room/src/base/widget/room_loading_page.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/protobuf/generated/brother_room.pb.dart';
import 'my_house_room_controller.dart';

/// 大哥房可滑动背景视图
class MyHouseRoomBg extends StatefulWidget {
  const MyHouseRoomBg({super.key});

  @override
  State<MyHouseRoomBg> createState() => _MyHouseRoomBgState();
}

class _MyHouseRoomBgState extends State<MyHouseRoomBg> {
  final ScrollController scrollCtrl = ScrollController();

  double rate = 1.0;
  double width = Util.width;
  String imageUrl = '';
  bool imageDidDisplay = false;
  CachedNetworkImage? cacheImgWidget;
  bool showInitialScrollOffset = true;

  @override
  void dispose() {
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHouseController>(
      id: RoomMyHouseUpdate.background,
      builder: (controller) {
        double initOffset = 0;
        if (controller.myHouseInfo != null) {
          if (controller.myHouseInfo!.background.url.isNotEmpty &&
              imageUrl != controller.myHouseInfo!.background.url) {
            imageUrl = controller.myHouseInfo!.background.url;
            imageDidDisplay = false;
          }

          rate = Util.height /
              (controller.myHouseInfo!.background.height <= 0
                  ? Util.height
                  : controller.myHouseInfo!.background.height);
          width = controller.myHouseInfo!.background.width <= 0
              ? Util.width
              : controller.myHouseInfo!.background.width * rate;
          initOffset = min(
            width - Util.width,
            max(
                0,
                controller.myHouseInfo!.initViewOffset * rate -
                    Util.width / 2.0),
          );
        }
        if (scrollCtrl.hasClients && showInitialScrollOffset) {
          scrollCtrl.jumpTo(initOffset);
          showInitialScrollOffset = false;
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              controller: scrollCtrl,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                  width: width,
                  height: Util.height,
                  child: Stack(
                    children: [
                      if (imageUrl.isNotEmpty)
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fill,
                          cachedWidth: width.toInt(),
                          cachedHeight: Util.height.toInt(),
                          displayComplete: () {
                            imageDidDisplay = true;
                            Future(() => null).then((_) => refresh());
                          },
                        ),
                      if (controller.layouts != null)
                        ...List.generate(
                          controller.layouts!.length,
                          (index) {
                            return _buildCommonDecorate(
                                controller.layouts![index], controller);
                          },
                        )
                    ],
                  )),
            ),
            Visibility(
              visible: imageUrl.isEmpty || !imageDidDisplay,
              child: const RoomLoadingPage(hideContent: true),
            )
          ],
        );
      },
    );
  }

  Widget _buildCommonDecorate(
      BrotherDecorateLayoutItem item, MyHouseController controller) {
    BrotherDecorateExtra extra = item.extra;
    if (extra.hasCalender()) {
      BrotherDecorateCalenderExtra calender = extra.calender;
      int nextBirthdayDays = calender.nextBirthdayDays;
      if (nextBirthdayDays >= 0) {
        return PositionedDirectional(
          start: item.x * rate,
          top: item.y * rate,
          child: Stack(
            children: [
              CachedNetworkImage(
                  imageUrl: item.url,
                  width: item.width * rate,
                  height: item.height * rate),
              SizedBox(
                width: item.width * rate,
                height: item.height * rate,
                child: Stack(
                  children: [
                    PositionedDirectional(
                      top: calender.y * rate,
                      start: calender.x * rate,
                      child: Container(
                        alignment: Alignment.center,
                        width: calender.w * rate,
                        height: calender.h * rate,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (nextBirthdayDays > 0)
                                  Text(
                                    K.room_mh_birthday_left,
                                    style: const TextStyle(
                                        fontSize: 11, color: Color(0xB3FFFFFF)),
                                  ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 60),
                                  child: Text(
                                    controller.ownerInfo?.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 11, color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (nextBirthdayDays == 0)
                                  Text(
                                    K.room_of,
                                    style: const TextStyle(
                                        fontSize: 11, color: Color(0xB3FFFFFF)),
                                  ),
                                Text(
                                  K.room_mh_birthday_title,
                                  style: const TextStyle(
                                      fontSize: 11, color: Color(0xB3FFFFFF)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (nextBirthdayDays > 0) ...[
                                  Text(
                                    nextBirthdayDays.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    K.room_day,
                                    style: const TextStyle(
                                        fontSize: 11, color: Color(0xB3FFFFFF)),
                                  ),
                                ] else
                                  Text(
                                    K.room_today,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    }

    return PositionedDirectional(
      start: item.x * rate,
      top: item.y * rate,
      child: CachedNetworkImage(
        imageUrl: item.url,
        width: item.width * rate,
        height: item.height * rate,
      ),
    );
  }
}
