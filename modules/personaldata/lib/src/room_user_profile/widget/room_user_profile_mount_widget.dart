import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 座驾系列
class RoomUserProfileMountWidget extends StatelessWidget {
  final int uid;
  final List<MountSerialProfile> mountSerialData;

  const RoomUserProfileMountWidget(
      {super.key, required this.uid, required this.mountSerialData});

  @override
  Widget build(BuildContext context) {
    MountSerialProfile serial = mountSerialData[0];
    List<MountSerialProfileItem> list = serial.items;
    bool serialLight = serial.inUse;
    int totalCount = list.length;
    int ownCount = 0;
    for (var element in list) {
      if (element.unlock) {
        ownCount++;
      }
    }
    return GestureDetector(
      onTap: () {
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.openMyMountPage(
          context,
          uid,
          serialId: serial.serialId,
        );
      },
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF6F7F9),
        ),
        child: ListView.separated(
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 6),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String icon;
            bool light;
            String text;
            if (index == 0) {
              icon = serial.icon;
              light = serialLight;
              text = '${serial.title} $ownCount/$totalCount';
            } else {
              MountSerialProfileItem item = list[index - 1];
              icon = item.icon;
              light = serialLight && item.unlock;
              text = item.name;
            }
            Widget mount =
                CachedNetworkImage(imageUrl: icon, width: 54, height: 54);
            return Column(
              children: [
                light
                    ? mount
                    : ColorFiltered(colorFilter: _greyscale, child: mount),
                const SizedBox(height: 2),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7A7A7A),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: list.length + 1,
        ),
      ),
    );
  }
}

/// 灰阶函数
const ColorFilter _greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
