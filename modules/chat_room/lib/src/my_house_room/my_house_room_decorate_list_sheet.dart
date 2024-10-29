import '../../k.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'my_house_room_controller.dart';
import 'package:chat_room/src/protobuf/generated/brother_room.pb.dart';

/// 大哥房背景装饰列表视图
class MyHouseDecorateListSheet extends GetView<MyHouseController> {
  const MyHouseDecorateListSheet({super.key});

  static Future show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      builder: (_) => GestureDetector(child: const MyHouseDecorateListSheet()),
      maxHeightRatio: 633 / 845,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHouseController>(
      id: RoomMyHouseUpdate.decorate,
      builder: (controller) {
        Widget? infoWidget;
        if (controller.decorateRes == null) {
          infoWidget = const Loading();
        } else if (controller.decorateRes!.success == false) {
          infoWidget = ErrorData(error: controller.decorateRes!.message);
        } else if (controller.decorates!.isEmpty) {
          infoWidget = const EmptyWidget();
        }

        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16)),
            color: Colors.white,
          ),
          child: infoWidget ??
              Column(
                children: [
                  SizedBox(
                    height: 62,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: Text(
                            K.room_mh_decorate_title,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF202020),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        PositionedDirectional(
                          start: 10,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).maybePop(),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.close, size: 24),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F7FC),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: Center(
                        child: Text(
                          controller.decorateRes!.data.annotation,
                          style: const TextStyle(
                              fontSize: 13, color: Color(0x80000000)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 33),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 14,
                        childAspectRatio: 168 / 242,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        BrotherDecorateItem item = controller.decorates![index];
                        return _buildItem(item);
                      },
                      itemCount: controller.decorates!.length,
                    ),
                  )
                ],
              ),
        );
      },
    );
  }

  Widget _buildItem(BrotherDecorateItem item) {
    Widget btn;
    if (item.power != 1) {
      btn = Container(
        width: 96,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFE5EFFF),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          K.room_mh_unlock_level([item.baseLevel.toString()]),
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      );
    } else if (item.display != 1) {
      btn = Material(
        color: Colors.transparent,
        child: Ink(
          width: 96,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFE5EFFF),
            borderRadius: BorderRadius.circular(22),
          ),
          child: InkWell(
            onTapUp: (details) => controller.setDecorate(item.elementId, true),
            borderRadius: BorderRadius.circular(17),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                K.room_mh_decorate_show,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202020),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else {
      btn = Material(
        color: Colors.transparent,
        child: Ink(
          width: 96,
          height: 44,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF9669), Color(0xFFFFC977)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: InkWell(
            onTapUp: (details) => controller.setDecorate(item.elementId, false),
            borderRadius: BorderRadius.circular(17),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                K.room_mh_decorate_hide,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF4F7FC)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child:
                CachedNetworkImage(imageUrl: item.url, width: 120, height: 120),
          ),
          const SizedBox(height: 8),
          Text(
            item.name,
            style: const TextStyle(fontSize: 16, color: Color(0xFF000000)),
          ),
          const SizedBox(height: 12),
          btn
        ],
      ),
    );
  }
}
