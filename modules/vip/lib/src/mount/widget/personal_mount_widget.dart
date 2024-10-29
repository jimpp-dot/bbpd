import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/mount/page/my_mount_page.dart';

class PersonalMountWidget extends StatelessWidget {
  final int uid;
  final List<MountSerialProfile> mountSerialData;

  const PersonalMountWidget(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          MyMountPage.show(context, uid,
              serialId: serial.serialId, refer: '个人主页');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.vip_mount_series,
                    style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Rext.themeCardContainer(
              height: 100,
              cornerRadius: 16,
              child: ListView.separated(
                padding: const EdgeInsetsDirectional.only(
                    start: 12, end: 12, top: 10),
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
                      CachedNetworkImage(imageUrl: icon, width: 64, height: 64);
                  return Column(
                    children: [
                      light
                          ? mount
                          : ColorFiltered(colorFilter: greyscale, child: mount),
                      Text(text,
                          style: const TextStyle(
                              fontSize: 10, color: Color(0xFF7A7A7A))),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: list.length + 1,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// 灰阶函数
const ColorFilter greyscale = ColorFilter.matrix(<double>[
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
